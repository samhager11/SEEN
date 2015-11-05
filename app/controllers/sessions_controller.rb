class SessionsController < ApplicationController

   def new
   end

   def create
    user = User.find_by_phone_number(params[:phone_number])
    if user && user.authenticate(params[:password])
      redirect_to users_path
      session[:user_id]=user.id
    else
     flash.now.alert = "Incorrect login - Please try again"
     render "new"
    end
   end

   def destroy
     session.delete(:user_id)
     redirect_to '/login'
   end

  end
