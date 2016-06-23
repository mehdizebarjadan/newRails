class LikesController < ApplicationController

  before_action :require_login

  def create
  	@like = Like.new(secret_id:params[:secret_id],user_id:session[:user_id])
  	if @like.save
  		redirect_to '/secrets'
  	else 
  		flash[:errors] = @like.errors.full_messages
  		redirect_to '/secrets'
  	end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    redirect_to '/secrets'
  end
  
end
