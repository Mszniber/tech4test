class Reservation < ActiveRecord::Base
  belongs_to :imported_file
  belongs_to :cart
  belongs_to :ticket
  belongs_to :client
end
