class Api::V1::VehiclesController < Api::BaseController
   
  def index
    render json: Vehicle.all
  end 
  
  def show
    vehicle = Vehicle.find(params[:id])
    render json: vehicle
  end

  def create
    vehicle = Vehicle.new(vehicle_params)
  
    if vehicle.save
      render json: vehicle, status: 200
    else 
      render status: 400, json: vehicle.errors.full_messages.to_json
    end
  end


  def update 
    vehicle = Vehicle.update(params[:id], vehicle_params)
    if vehicle.errors.empty?
      render json: Vehicle.find(params[:id]), status: 200
    else 
      render status: 400, json: vehicle.errors.full_messages.to_json
    end
  end 

  def destroy 
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    render json: {ok: "Vehicle Delete succes"}.to_json, status: 200
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license, :category, :sub_category, :unit_of_measurement, :unit_value, :year)
  end
end 
