require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:example) do
    @user = create(:user)
  end

  it 'should get new' do
    get :new
    expect(response).to render_template('new')
  end

  it 'creates a user session' do
    post :create, email: @user.email, password: @user.password
    expect(response.code).to eq('302')
    expect(session[:user_id]).to be == @user.id
  end

  it 'destroys user session' do
    get :destroy, user_id: @user.id
    expect(session[:user_id]).to be_nil
  end
end
