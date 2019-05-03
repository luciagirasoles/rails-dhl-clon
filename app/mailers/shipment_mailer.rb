class ShipmentMailer < ApplicationMailer
  default from: 'notifications@myblog.com'

  def shipment_notification
    @shipment = params[:shipment]
    @sender = params[:sender]
    mail(to: @sender.email, subject: 'Shipment is Delivered')
  end
end
