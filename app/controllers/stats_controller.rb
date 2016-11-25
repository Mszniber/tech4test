class StatsController < ApplicationController
  include StatsHelper
  def index
    @clients = Client.includes([reservations: [:tickets, :imported_file]]).where('imported_files.user_id' => current_user.id)
    @shows = Show.includes([performances: [tickets: [reservation: [:imported_file]]]]).where('imported_files.user_id' => current_user.id)
    @carts = Cart.includes([reservations: [:tickets, :imported_file]]).where('imported_files.user_id' => current_user.id)
  end
end
