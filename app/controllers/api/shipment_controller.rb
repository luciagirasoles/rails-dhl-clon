module Api
  class ShipmentController < ApplicationController
    def index
      @shipment = Shipment.all
      render json: @shipment, status: :ok
    end

    def search
      if params[:tracking_number]
        shipment = Shipment.find_by(tracking_id: params[:tracking_number])
          if shipment
            render json: shipment
          else
            render json: {error: "It doesn't exists a shipment with that tracking number"}, status: 404
          end
      else
        render json: {error: "You have to pass the argument 'tracking_number'"}, status: 400
      end
    end
  end
end