class Shipment < ApplicationRecord
  has_many :shipmentLocations, dependent: :destroy
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender
  validates :tracking_id, uniqueness: true
  validates :weight, :freight_value, numericality: { greater_than: 0 }

end
