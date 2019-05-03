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

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      redirect_to admin_shipment_path(@shipment), notice: 'Shipment was successfully created.'
    else
      render :new
    end
  end

  def sales
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
    @shipments = OrderCountryQuery.new.top_5_countries_senders
  end

  def top_5_countries_recipients
    @shipments = OrderCountryQuery.new.top_5_countries_recipients
  end

  private

  def search_param
    params.permit(:search_tracking_id)
  end

  def shipment_params
    params.require(:shipment).permit(:tracking_id, :origin_address, :destination_address, :weight, :reception_date, :estimated_delivery_date, :freight_value, :recipient_id, :sender_id)
  end

end