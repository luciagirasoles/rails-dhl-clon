class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[facebook github]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :shipments, dependent: :destroy
=======
  devise :omniauthable, omniauth_providers: %i[facebook github]
  has_many :shipments, dependent: :destroy
  has_many :providers
>>>>>>> 47689d24052bc3754cb43f25474bca9302130d88
  
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :country, :city, :address, :reception_date, presence: true
<<<<<<< HEAD

=======
>>>>>>> 47689d24052bc3754cb43f25474bca9302130d88

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
    provider = Provider.find_or_create_by(name: auth.provider, uid: auth.uid, user_id: user.id)
    user
  end
end
