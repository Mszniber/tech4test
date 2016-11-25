class Reservation < ActiveRecord::Base
  belongs_to :imported_file
  has_many :tickets
  belongs_to :client
end
