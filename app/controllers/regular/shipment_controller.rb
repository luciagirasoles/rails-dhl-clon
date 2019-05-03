class ShipmentController < ApplicationController
  def index
  end
  
  def show
    @shipment = Shipment.find(params[:id])
  end

  def search
    search_track = Shipment.search(search_param[:search_tracking_id])
    if search_track
      @shipment = search_track
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
