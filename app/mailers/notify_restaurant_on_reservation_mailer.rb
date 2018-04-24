class NotifyRestaurantOnReservationMailer < ApplicationMailer
  default from: 'notifications@tempahan.com'

  def confirmation_message
    @reservation = Reservation.find(params[:reservation])
    @guest = @reservation.guest
    mail(to: @reservation.restaurant.email, subject: "Reservation made by #{@guest.name}")
  end
end
