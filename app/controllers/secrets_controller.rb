class SecretsController < ApplicationController

  before_action :require_login, only: [:index, :create, :destroy]

  def index
  	@secrets = Secret.all
    @likes = Like.all
  end

  def create
  	@secret = Secret.new(secret_params)
  	if @secret.save
  		redirect_to '/users/' + secret_params[:user_id].to_s
  	else
  		flash['errors'] = @secret.errors.full_messages
  		redirect_to '/users/' + secret_params[:user_id].to_s
  	end
  end

  def destroy
  	secret = Secret.find(params[:id])
  	secret.destroy if secret.user == current_user
  	redirect_to '/users/' + session[:user_id].to_s
  end

  private

    def secret_params
      params.require(:secret).permit(:content, :user_id)
    end

end
