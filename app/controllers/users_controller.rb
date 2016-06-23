class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def new	
  end

  def show
  	 @user = User.find(session[:user_id])
     @secrets = @user.secrets
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end
  
  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
		 @user = User.find(params[:id])
     @user.email = user_params[:email]
     @user.name = user_params[:name]

	    if @user.save
         redirect_to '/users/' + params[:id]
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to '/users/' + params[:id] + '/edit'
      end
	end

	def destroy
    session.clear
		@user = User.find(params[:id]).destroy		
		redirect_to '/sessions/new'
	end

  private

  	def user_params
  	  params.require(:user).permit(:name, :email, :password)
  	end

end