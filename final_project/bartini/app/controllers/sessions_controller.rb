class SessionsController < ApplicationController

  def new
  end

  def create
    user = UserAccount.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to index_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end