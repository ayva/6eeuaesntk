require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user){create(:user)}
  before do
    session[:user_id] = user.id 
  end

  describe 'GET #show' do
    it "redirects to user page" do
      get :show, :id => user.id
      expect(response).to redirect_to user_path(user)
      
    end
  end

  describe 'GET #show' do
    it "has user instance" do
      get :show, :id => user.id
      expect(assigns(:user)).to match(user)    
    end
  end
end
