class Ticket < ActiveRecord::Base
  belongs_to :performance
  has_one :reservation
end
