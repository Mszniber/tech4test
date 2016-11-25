class Client < ActiveRecord::Base
  has_many :reservations
  validates :email, uniqueness: true

  def find_by_email(email)
    User.where(["email = ?", email]).first
  end
end
