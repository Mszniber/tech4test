class Ticket < ActiveRecord::Base
  belongs_to :performance
  belongs_to :reservation
end
