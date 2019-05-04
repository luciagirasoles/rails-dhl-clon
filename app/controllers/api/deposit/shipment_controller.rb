class Api::Deposit::ShipmentController < ApiController

  def show
    shipment = Shipment.find_by_tracking_id(params[:tracking_id])
    render json: shipment
  end


  def search
    if @shipment = Shipment.find_by(tracking_id: params[:tracking_id])
      render json: @shipment
    else
      render json: {error: "It doesn't exists a shipment with that tracking id"}
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
