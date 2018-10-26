class Api::V1::InsurancesController < Api::BaseController
   
  def index
    render json: Insurance.all
  end 
  
  def show
    insurance = Insurance.find(params[:id])
    render json: insurance
  end

  def create
    insurance = Insurance.new(insurance_params)
  
    if insurance.save
      render json: insurance, status: 200
    else 
      render status: 400, json: insurance.errors.full_messages.to_json
    end
  end


  def update 
    insurance = Insurance.update(params[:id], insurance_params)
    if insurance.errors.empty?
      render json: Insurance.find(params[:id]), status: 200
    else 
      render status: 400, json: insurance.errors.full_messages.to_json
    end
  end 

  def destroy 
    insurance = Insurance.find(params[:id])
    insurance.destroy
    render json: {ok: "Insurance Delete succes"}.to_json, status: 200
  end

  private

  def insurance_params
    params.require(:insurance).permit(:payment_reference, :vehicle_id)
  end
end 

