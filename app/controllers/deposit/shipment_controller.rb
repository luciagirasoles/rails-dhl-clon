class Deposit::ShipmentController < ApplicationController
  def index
    @shipment= Shipment.all
    redirect_to "/deposit/index"
  end

  if params[:search].present?
    @shipment = Shipment.where(tracking_id: params[:tracking_number])
  else
    @shipment = Shipment.all
  end

end