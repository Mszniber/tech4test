class Performance < ActiveRecord::Base
  belongs_to :show
  has_many :tickets
end
