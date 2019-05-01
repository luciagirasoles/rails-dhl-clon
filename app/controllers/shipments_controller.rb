class ShipmentsController < ApplicationController
  def index
  end
  
  def show
    @shipment = Shipment.find(params[:id])
  end

  def search
    if params[:tracking_id]

      @shipment = Shipment.find_by(tracking_id: '3nomeuer3h')
      redirect_to shipment_path(@shipment)
    else
      redirect_to "/error"
    end
  end
end
