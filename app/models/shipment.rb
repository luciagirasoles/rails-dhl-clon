class Shipment < ApplicationRecord
  has_many :shipmentlocations, dependent: :destroy
  belongs_to :user, class_name: 'User'
  belongs_to :sender
  validates :tracking_id, uniqueness: true
  validates :weight, :freight_value, numericality: { greater_than: 0 }

end
