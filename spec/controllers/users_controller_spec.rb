require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'should get new' do
    get :new
    expect(response).to render_template('new')
  end

  it 'ability to create new user' do
    get :new
    expect(assigns(:user)).to be_a_new(User)
  end

  it 'creates a new user' do
    expect do
      post :create, user: FactoryGirl.attributes_for(:user)
    end.to change(User, :count).by(1)
  end

  it 'assigns @users' do
    user = FactoryGirl.create(:user)
    get :index
    expect(:users).eql?([user])
  end
end
