class Deposit::ShipmentController < ApplicationController
  def index
  end

  def search
    if params[:tracking_id].present?
      @shipments = Shipment.where(name: params[:tracking_id])
      redirect_to shipment_path(@shipment)
    else
      redirect_to "/error"
    end
  end
end