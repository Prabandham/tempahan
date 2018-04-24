class ReservationsController < ApplicationController
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
end
