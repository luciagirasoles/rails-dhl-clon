class Admin::ShipmentsController < ApplicationController
  def index
  end

  def show
    @shipment = Shipment.find(params[:id])
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

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy
    redirect_to search_and_edit_admin_shipments_path, notice: "Track ID deleted correctly."
  end

  def sales
  end

  def search_and_edit

  end

  def search_shipment
    search_track = Shipment.search(search_param[:search_tracking])
    if search_track
      @shipment = search_track
      redirect_to edit_admin_shipment_path(@shipment)
    else
      redirect_to search_and_edit_admin_shipments_path, notice: "Track ID is not found. Please, try again"
    end
  end
  
  def edit
    @shipment = Shipment.find(params[:id])
  end

  def update
    @shipment = Shipment.find(params[:id])
    if @shipment.update(shipment_params)
      redirect_to search_and_edit_admin_shipments_path(@shipment), notice: "The Shipment #{@shipment.tracking_id} was successfully updated"
    else
      render :edit
    end
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
    params.permit(:search_tracking_id, :search_tracking, :utf8)
  end

  def shipment_params
    params.require(:shipment).permit(:origin_address, :destination_address, :weight, :reception_date, :estimated_delivery_date, :freight_value, :recipient_id, :sender_id)
  end

end