class TicketsController < ApplicationController
  before_action :get_tickets

  def index
  end

  def export_tickets
    respond_to do |format|
      format.csv {
        send_data @tickets.to_csv,
        :filename => "Export-tickets-#{DateTime.now.strftime("%d-%m-%y-%H-%M-%S")}.csv"}
      format.html {render 'index'}
    end
  end

  private
  def get_tickets
    @tickets = Ticket.includes([{performance: [:show]}, reservation: [:imported_file, :client]])
  end
end
