class ShipmentSerializer < ActiveModel::Serializer
  attributes  :id,
              :tracking_id,
              :origin_address,
              :destination_address,
              :weight,
              :estimated_delivery_date
  attribute   :reception_date, if: :reception_date_exists?
  attribute   :delivered_date, if: :delivered_date_exists?
  attribute   :sender, if: :belongs_to_recipient?
  attribute   :recipient, if: :belongs_to_recipient?


  def reception_date_exists?
    object.reception_date != nil
  end

  def delivered_date_exists?
    object.delivered_date != nil
  end

  def sender
    obj_sender = Hash.new
    obj_sender[:store_name] = object.sender.store_name
    obj_sender[:order_id] = object.sender.order_id
    obj_sender[:freight_value] = object.freight_value
    obj_sender[:email] = object.sender.email
    obj_sender
  end

  def recipient
    obj_recipient = Hash.new
    obj_recipient[:username] = object.user.username
    obj_recipient[:email] = object.user.email
    obj_recipient[:address] = object.user.address
    obj_recipient
  end

  def belongs_to_recipient?
    object.recipient.email == current_user.email
  end
end
