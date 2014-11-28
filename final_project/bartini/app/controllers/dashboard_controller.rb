class DashboardController < ApplicationController

	def index
    @user = UserAccount.find(params[:id])
		@list_of_drinks = Drink.all
	end

  def sign_in
    user_name = params[:user_name]
    password = params[:password]

    authentication = UserAccount.where("user_name = ? AND password = ?", user_name, password)

    if authentication.present?
      user_id = authentication.first.id
      redirect_to "/index/#{user_id}"
    else
      redirect_to landing_path
    end
  end

end