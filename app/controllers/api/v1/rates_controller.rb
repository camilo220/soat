class Api::V1::RatesController < Api::BaseController
  
  
  
  def index
    render json: Rate.all
  end 
  
  def show
    rate = Rate.find(params[:id])
    render json: rate
  end

  def create
    rate = Rate.new(rate_params)
  
    if rate.save
      render json: rate, status: 200
    else 
      render status: 400, json: rate.errors.full_messages.to_json
    end
  end


  def update 
    rate = Rate.update(params[:id], rate_params)
    if rate.errors.empty?
      render json: Rate.find(params[:id]), status: 200
    else 
      render status: 400, json: rate.errors.full_messages.to_json
    end
  end 

  def destroy 
    rate = Rate.find(params[:id])
    rate.destroy
    render json: {ok: "Rate Delete su"}, status: 200

    
  end

  private

  def rate_params
    params.require(:rate).permit(:code, :category, :sub_category, :unit_of_measurement, :minimum_unit, :maximum_unit, :minimum_age, :maximum_age, :bonus)
  end
end 