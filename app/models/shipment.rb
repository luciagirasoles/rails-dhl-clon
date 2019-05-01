class Shipment < ApplicationRecord
  has_many :shipmentlocations, dependent: :destroy
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender
  validates :tracking_id, uniqueness: true
  validates :weight, :freight_value, numericality: { greater_than: 0 }

  def self.search(search_track)
    Shipment.find_by(tracking_id: search_track)
  end

end
