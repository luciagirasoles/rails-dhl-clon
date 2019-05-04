module Api
  class ShipmentController < ApiController

    def show
      shipment = Shipment.find_by_tracking_id(params[:tracking_id])
      render json: shipment
    end
  
  
    def search
      if @shipment = Shipment.search(params[:tracking_id])
        render json: @shipment
      else
        render json: {error: "It doesn't exists a shipment with that tracking id"}
      end
    end
    
  end
end
