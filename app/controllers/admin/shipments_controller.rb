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

  def sales
  end

  def new
  end

  def edit
  end

  def update
  #update shipment
  end

  def top_senders_by_freight_value
    @senders = OrderSendersQuery.new.top_senders_total_freight_value
  end

  def top_senders_by_packages_sent
    @senders = OrderSendersQuery.new.top_senders_packages_sent
  end

  def top_5_countries_senders
    @senders = OrderCountryQuery.new.top_5_countries_senders
  end

  def top_5_countries_recipients
    @users = OrderCountryQuery.new.top_5_countries_recipients
  end

  private
  def search_param
    params.permit(:search_tracking_id, :utf8)
  end

end