class Admin::ShipmentsController < ApplicationController
  def index
  end

  def show
    @shipment = Shipment.find_by!(search_param[:search_tracking_id])
  end

  def search
    search_track = Shipment.search(search_param[:search_tracking_id])
    if search_track
      @shipment = search_track
      redirect_to admin_shipment_path(@shipment)
    else
      redirect_to admin_shipments_path, notice: "Track ID is not found. Please, try again"
    end
  end

  private
  def search_param
    params.permit(:search_tracking_id, :utf8)
  end

end