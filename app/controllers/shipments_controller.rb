class ShipmentsController < ApplicationController
  def index
  end
  
  def show
    @shipment = Shipment.find(params[:id])
  end

  def search
    if params[:search_tracking_id]
      @shipment = Shipment.find_by(tracking_id: search_param[:search_tracking_id])
      redirect_to shipment_path(@shipment)
    else
      redirect_to "/error", notice: "Track ID is not found. Please, try again"
    end
  end

  private
  def search_param
    params.permit(:search_tracking_id, :utf8)
  end

end
