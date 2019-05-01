class Deposit::ShipmentController < ApplicationController
  def index
  end

  def search
    if params[:search].present?
      @shipments = Shipment.where(name: params[:search])
    else
      redirect_to "/error"
    end
  end
end