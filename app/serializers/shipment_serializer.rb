class ShipmentSerializer < ActiveModel::Serializer
  attributes :id, :tracking_id, :origin_address, :destination_address, :reception_date
end
