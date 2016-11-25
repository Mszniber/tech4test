class TicketsController < ApplicationController
  require 'csv'
  def index
    @tickets = Ticket.includes([{performance: [:show]}, reservation: [:imported_file, :client]])
  end
end
