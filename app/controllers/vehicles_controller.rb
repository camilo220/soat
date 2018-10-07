class VehiclesController < ApplicationController

  before_action :authenticate_user!

  def index
    @vehicles = Vehicle.all
  end

  def new 
    @vehicle = Vehicle.new
  end

  def create 

    binding.pry
    1

    @vehicle = Vehicle.new(vehicle_params.merge({user: current_user}))
    if @vehicle.save 
      redirect_to vehicles_path
    else
      render new 
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license, :category, :sub_category, :unit_of_measurement, :unit_value, :year)
  end
end