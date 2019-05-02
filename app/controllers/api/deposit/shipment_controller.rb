class Api::Deposit::ShipmentController < ApiController

  def index
    @shipment = Shipment.all
    render json: @shipment, status: :ok
  end

  def show
    render json: Shipment.find(params[:id])
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

  def check_in
    params[:tracking_id]
    shipment_id = Shipment.find_by(tracking_id: params[:tracking_id]).id
    reception_date = DateTime.now
    country = current_user.country
    city = current_user.city
    @shipment_location = ShipmentLocation.create(shipment_id: shipment_id, reception_date: reception_date, country: country, city: city)
    render json: @shipment_location
  end

end
