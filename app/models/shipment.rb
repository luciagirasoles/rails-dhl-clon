class Shipment < ApplicationRecord
  has_many :shipmentLocations, dependent: :destroy
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender
  validates :tracking_id, uniqueness: true
  validates :weight, :freight_value, numericality: { greater_than: 0 }

  after_create :welcome

  def self.search(search_track)
    Shipment.find_by(tracking_id: search_track)
  end

  def welcome
    ShipmentMailer.with(
      user: self
    ).shipment_welcome.deliver_later
  end


end
