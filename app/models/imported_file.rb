class ImportedFile < ActiveRecord::Base
    belongs_to :user
    has_many :reservations
end
