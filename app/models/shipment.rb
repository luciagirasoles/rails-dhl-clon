class Shipment < ApplicationRecord
  has_many :shipmentLocations, dependent: :destroy
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender
  validates :tracking_id, uniqueness: true
  validates :weight, :freight_value, numericality: { greater_than: 0 }

  after_create :notification

  def self.search(search_track)
    Shipment.find_by(tracking_id: search_track)
  end

  def notification
    ShipmentMailer.with(
      user: recipient
    ).shipment_notification.deliver_later
  end


end
