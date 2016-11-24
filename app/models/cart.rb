class Cart < ActiveRecord::Base
  has_many :reservations
end
