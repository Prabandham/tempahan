class NotifyRestaurantOnReservationMailer < ApplicationMailer
  default from: 'notifications@tempahan.com'

  def confirmation_message
    @reservation = Reservation.find(params[:reservation])
    @guest = @reservation.guest
    mail(to: @reservation.restaurant.email, subject: "Reservation made by #{@guest.name}")
  end

  def confirmation_update_message
    @previous_slot = params[:previous_slot]
    @reservation = Reservation.find(params[:reservation])
    @guest = @reservation.guest
    mail(to: @reservation.restaurant.email, subject: "Reservation made by #{@guest.name} has been updated")
  end
end
