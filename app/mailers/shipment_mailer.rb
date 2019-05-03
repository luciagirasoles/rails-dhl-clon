class ShipmentMailer < ApplicationMailer
  default from: 'notifications@myblog.com'

  def shipment_welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to DHL')
  end
end
