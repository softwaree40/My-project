class SessionsController < ApplicationController
    def new
        @user = User.new
      end
      def welcome
        
      end
     
      def create
         #binding.pry
         if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id
            redirect_to categories_path
         else
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id
           redirect_to categories_path
        else
           render :new
        end
         end
      end
       def destroy
         reset_session
        #session[:user_id] = nil     
        redirect_to '/login' 
       end
end
