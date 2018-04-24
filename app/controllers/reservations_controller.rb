class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:update]
  def list
    render json: Reservation.where(restaurant_id: list_params['restaurant_id'])
  end

  def create
    reservation = Reservation.new(create_reservation_params)
    if reservation.save
      NotifyGuestOnReservationMailer.with(reservation: reservation.id).confirmation_message.deliver
      NotifyRestaurantOnReservationMailer.with(reservation: reservation.id).confirmation_message.deliver
      render json: reservation and return
    else
      render json: reservation.errors and return
    end
  end

  def update
    previous_slot = @reservation.time_slot
    if @reservation.update(update_reservation_params)
      NotifyGuestOnReservationMailer.with(reservation: @reservation.id).confirmation_update_message.deliver
      NotifyRestaurantOnReservationMailer.with(reservation: @reservation.id, previous_slot: previous_slot).confirmation_update_message.deliver
      render json: @reservation and return
    else
      render json: @reservation.errors and return
    end
  end

  private
  def list_params
    params.require(:restaurant_id)
    params.permit(:restaurant_id)
  end

  def create_reservation_params
    params.require([:restaurant_id, :guest_id, :table_id, :shift_id, :time_slot, :guest_count])
    params.permit(:restaurant_id, :guest_id, :table_id, :shift_id, :time_slot, :guest_count)
  end

  def update_reservation_params
    params.require([:id, :restaurant_id, :guest_id, :table_id, :shift_id, :time_slot, :guest_count])
    params.permit(:restaurant_id, :guest_id, :table_id, :shift_id, :time_slot, :guest_count, :id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
