class Api::Admin::ShipmentController < ApiController
  def index
    @shipment = Shipment.all
    render json: @shipment, status: :ok
  end
  
  def show
    @shipment = Shipment.search(params[:tracking_id])
    render json: @shipment
  end

  def search
    @shipment = Shipment.find_by!(tracking_id: params[:tracking_id])
    if @shipment
      render json: @shipment
    else
      render json: {message: "It doesn't exists a shipment with that tracking id"}
    end
  end

  def top_senders_by_freight_value
    @senders = OrderSendersQuery.new.top_senders_total_freight_value
    render json: @senders
  end

  def top_senders_by_packages_sent
    @senders = OrderSendersQuery.new.top_senders_packages_sent
    render json: @senders
  end

  def top_5_countries_senders
    @shipments = OrderCountryQuery.new.top_5_countries_senders
    render json: @shipments
  end

  def top_5_countries_recipients
    @shipments = OrderCountryQuery.new.top_5_countries_recipients
    render json: @shipments
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
   
end
