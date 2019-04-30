module Api
  class ShipmentController < ApplicationController
    def index
      @shipment = Shipment.all
      render json: @shipment, status: :ok
    end
    def show
      @shipment = Shipment.find(params[:id])
    end
    def search
      if params[:tracking_id].present?
        @shipment = Shipment.where(name: params[:tracking_id])
      else
        render json: {error: "It doesn't exist a shipment with that tracking id"}
      end
    end
  end
end