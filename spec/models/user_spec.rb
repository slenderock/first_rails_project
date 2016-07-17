# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = create(:user)
  end

  it 'valid example with Factories' do
    expect(@user).to be_valid
  end

  it 'if too small' do
    @user.birthday = Faker::Date.between(16.year.ago, Date.today)
    expect(@user).to_not be_valid
  end

  it 'nested attributes check' do
    expect(@user.images).to_not be_empty
  end
end
