class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchases, dependent: :destroy
  has_many :flight_tickets
  # has_many :flight_tickets, through: :purchases, dependent: :destroy
  has_one_attached :photo
  #validates :Fullname, presence: true
end
