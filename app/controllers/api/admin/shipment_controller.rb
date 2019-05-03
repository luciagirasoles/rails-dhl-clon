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
  
  def new
    shipment = Shipment.new(shipment_params)
    if shipment.save
      render json: shipment, status: :created
    else
      render json: { errors: shipment.errors}
    end
  end
  
  def update
    if @shipment.update(shipment_params)
      render json: @shipment, status: :ok
    else
      render json: { errors: @shipment.errors}
    end
  end
  
  def destroy
    @shipment.destroy
    render json: {},status: :no_content
  end
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
  
  private    
  def set_shipment
    @shipment = Shipment.find(params[:tracking_id])
  end

  def shipment_params
    params.permit(:reception_date, :weight, :destination_address, :origin_address, :tracking_id)
  end  
end
