class UserAccountsController < ApplicationController

  def new
    @user = UserAccount.new
  end

  def create
    @user = UserAccount.new(user_accounts_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private

  def user_accounts_params
    params.require(:user_account).permit(:first_name, :last_name, :email, :user_name, :password)
  end
end