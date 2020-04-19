class UsersController < ApplicationController
    
  def new
    @user = User.new
    
  end
 
  def create
    @user = User.new(user_params)
    #binding.pry
      if @user.save
         session[:user_id] = @user.id
        flash.now[:succes] = "Welcome to the sample app"
        redirect_to "/login"
      else
        render :new
      end

  end
  private
  def user_params
      params.require(:user).permit(:email,:name,:password)
  end
end
