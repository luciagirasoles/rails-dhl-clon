class ShipmentMailer < ApplicationMailer
  default from: 'notifications@dhl-no-reply.com'

  def shipment_notification
    @shipment = params[:shipment]
    @recipient = @shipment.recipient
    @sender = @shipment.sender
    mail(to: [@recipient.email, @sender.email], subject: 'Shipment is delivered')
  end
end 
