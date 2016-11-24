class Client < ActiveRecord::Base
  has_many :reservations
end
