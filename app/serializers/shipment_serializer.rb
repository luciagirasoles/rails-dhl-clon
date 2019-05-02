class ShipmentSerializer < ActiveModel::Serializer
  attributes :id, 
  :tracking_id,
  :origin_address,
  :destination_address,
  :weight,
  :reception_date,
  :estimated_delivery_date,
  :delivered_date,
  :freight_value,
  :created_at,
  :updated_at
end
