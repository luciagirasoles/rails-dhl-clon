Class ShipmentMailerPreview < ShipmentMailer::Preview
  def shipment_notification
    ShipmentMailer.with(shipment: Shipment.last).shipment_notification
  end
end