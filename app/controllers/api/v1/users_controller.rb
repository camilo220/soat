class Api::V1::UsersController < Api::BaseController
   
  def index
    render json: User.all
  end 
  
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
  
    if user.save
      render json: user, status: 200
    else 
      render status: 400, json: user.errors.full_messages.to_json
    end
  end


  def update 
    user = User.update(params[:id], user_params)
    if user.errors.empty?
      render json: User.find(params[:id]), status: 200
    else 
      render status: 400, json: user.errors.full_messages.to_json
    end
  end 

  def destroy 
    user = User.find(params[:id])
    user.destroy
    render json: {ok: "User Delete succes"}.to_json, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :document_type, :document, :phone, :password, :password_confirmation)
  end
end 

