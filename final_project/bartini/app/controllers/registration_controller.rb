class RegistrationController < ApplicationController

	def create_user
    UserAccount.create(first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email],
                       user_name: params[:user_name],
                       password: params[:password])
    redirect_to landing_path
	end

end