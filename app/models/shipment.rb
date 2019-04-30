class Shipment < ApplicationRecord
  has_many :shipmentlocations, dependent: :destroy
  belongs_to :user, class_name: 'User'
  belongs_to :sender
end
