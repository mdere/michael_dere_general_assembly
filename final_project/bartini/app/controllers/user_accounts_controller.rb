class UserAccountsController < ApplicationController

  def new
    @user = UserAccount.new
  end

  def create
    @user = UserAccount.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end