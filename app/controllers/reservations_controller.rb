class ReservationsController < ApplicationController
  def list
    render json: Reservation.where(restaurant_id: list_params['restaurant_id'])
  end

  def create
  end

  def update
  end

  private
  def list_params
    params.require(:restaurant_id)
    params.permit(:restaurant_id)
  end
end
