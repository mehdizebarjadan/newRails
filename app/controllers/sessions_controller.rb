class SessionsController < ApplicationController
  
  def new
  end
  
  def create
		@user = User.find_by_email(params[:email])  

		if @user 	&& @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to "/users/#{session[:user_id]}"
		else
			flash[:errors] = ["Invalid"]
			redirect_to "/sessions/new"
		end
  end

  def edit
  	
  end

	def destroy
		# session.clear
		session[:user_id] = false
	  redirect_to '/sessions/new'	
	end

end
