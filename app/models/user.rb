class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook github google_oauth2]
  has_many :shipments, dependent: :destroy
  has_many :providers
  
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :country, :city, :address, :reception_date, presence: true

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
    provider = Provider.find_or_create_by(name: auth.provider, uid: auth.uid, user_id: user.id)
    user
  end

  def role?(expected_role)
    role == expected_role
  end  

end
