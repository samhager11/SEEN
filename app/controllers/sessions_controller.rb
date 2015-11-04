class SessionsController < ApplicationController

   def new
   end

   def create
    user = User.find_by_phone_number(params[:phone_number])
    if user && user.authenticate(params[:password])
      redirect_to root_path, notice: "logged in!"
      session[:user_id]=user.id
    else
     flash.now.alert = "Incorrect login - Try Again!"
     render "new"
    end
   end

   def destroy
     session.delete(:user_id)
     redirect_to '/login'
   end

  end
