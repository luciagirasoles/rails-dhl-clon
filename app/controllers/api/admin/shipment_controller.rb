class Api::Admin::ShipmentController < Apicontroller
  # before_action :set_shipment, only: [:show, :update, :destroy]

  def index
    render json: Shipment.find(params[:tracking_id])
  end
  
  def show
    render json: @shipment
  end
  
  def create
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
