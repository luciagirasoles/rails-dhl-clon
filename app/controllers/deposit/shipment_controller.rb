class Deposit::ShipmentController < ApplicationController
  def index
    
  end
  def search
    if params[:tracking_id]
      @shipment = Shipment.find_by(tracking_id: params[:tracking_id])
      redirect_to shipment_search_path(@shipment)
    else
      redirect_to "/"
    end
  end
end