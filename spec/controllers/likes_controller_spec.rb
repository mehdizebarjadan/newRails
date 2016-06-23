require 'rails_helper'
RSpec.describe LikesController, type: :controller do


  before do
    @user = create_user
    @wrong_user = create_user 'julius', 'julius@lakers.com'
    @secret = @user.secrets.create(content: "secret")
    @like = Like.create(user: @user, secret: @secret)
  end


  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot like/unlike a secret" do
      post :create
      expect(response).to redirect_to('sessions/new')
      delete :destroy, id: @like
      expect(response).to redirect_to('sessions/new')
    end
  end


  describe "when signed in as the wrong user" do
    before do
      session[:user_id] = @wrong_user.id
    end
    it "cannot like/unlike a secret" do
    	delete :destroy, id: @like
    	expect(Like.find(@like.id)).to eq(@like)
    end
  end 


end