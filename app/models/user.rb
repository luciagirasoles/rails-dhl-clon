class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipments, dependent: :destroy
  
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :country, presence: true
  # validates :city, presence: true
  # validates :address, presence: :true



end
