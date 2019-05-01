class ErrorController < ApplicationController
  def index
    flash[:alert] = "Tracking number is not associated with any shipment"
    redirect_to(root_path)
  end
end
