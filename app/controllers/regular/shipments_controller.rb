class Regular::ShipmentsController < ApplicationController
  def index

  end
  
  def show
    @shipment = Shipment.find(params[:id])
  end

  def search
    search_track = Shipment.search(search_param[:search_tracking_id])
    if search_track
      @shipment = search_track
      redirect_to regular_shipment_path(@shipment)
    else
     redirect_to regular_shipments_path, notice: "Track ID is not found. Please, try again"
    end
  end

  private
  def search_param
    params.permit(:search_tracking_id, :utf8, :id)
  end

  def authorization_regular
    authorize User, :new?, police_class: ShipmentPolicy
  end

end
