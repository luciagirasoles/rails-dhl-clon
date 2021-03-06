class Deposit::ShipmentController < ApplicationController

  before_action :authorization_deposit

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
  end

  def show
    @shipment = Shipment.find(tracking_id: params[:tracking_id])
  end

  def search
    if Shipment.exists?(tracking_id: params[:tracking_id])
      redirect_to deposit_path(params[:tracking_id])
    else
      flash[:alert] = "Shipment with tracking number #{params[:tracking_id]} not found. Try again"
      redirect_back(fallback_location: root_path)
    end
  end

  def check_in
    params[:tracking_id]
    shipment_id = Shipment.find_by(tracking_id: params[:tracking_id]).id
    reception_date = DateTime.now
    country = current_user.country
    city = current_user.city
    ShipmentLocation.create(shipment_id: shipment_id, reception_date: reception_date, country: country, city: city)
    flash[:notice] = "Shipment checked in"
    redirect_to deposit_path(params[:tracking_id])
  end
  
  def record_not_found
    flash[:alert] = "Record not found. Try again"
    redirect_back(fallback_location: root_path)
  end

  def authorization_deposit
    authorize User, :new?, policy_class: ShipmentPolicy
  end
end
