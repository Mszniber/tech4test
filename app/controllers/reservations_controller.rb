class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.includes(:client, {tickets: [performance: [:show]]}, :imported_file).where('imported_files.user_id' => current_user.id)
  end
end
