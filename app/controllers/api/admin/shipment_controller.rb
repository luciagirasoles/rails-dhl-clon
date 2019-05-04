class Api::Admin::ShipmentController < Apicontroller
  # before_action :set_shipment, only: [:show, :update, :destroy]

  def index
    @shipment = Shipment.all
    render json: @shipment, status: :ok
  end
  
  def show
    @shipment = Shipment.find_by(tracking_id: params[:tracking_id])
    render json: @shipment
  end

  def search
    if params[:tracking_id]
      shipment = Shipment.find_by(tracking_id: params[:tracking_id])
        if shipment
          render json: shipment
        else
          render json: {error: "It doesn't exists a shipment with that tracking id"}, status: 404
        end
    else
      render json: {error: "You have to pass the argument 'tracking_id'"}, status: 400
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

end
