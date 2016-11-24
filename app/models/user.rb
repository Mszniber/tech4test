class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :imported_files
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
