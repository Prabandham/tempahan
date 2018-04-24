class NotifyGuestOnReservationMailer < ApplicationMailer
  default from: 'notifications@tempahan.com'

  def confirmation_message
    @reservation = Reservation.find(params[:reservation])
    @guest = @reservation.guest
    mail(to: @guest.email, subject: "Reservation confirmed for #{@reservation.restaurant.name}")
  end

  def confirmation_update_message
    @reservation = Reservation.find(params[:reservation])
    @guest = @reservation.guest
    mail(to: @guest.email, subject: "Reservation updated for #{@reservation.restaurant.name}")
  end
end
