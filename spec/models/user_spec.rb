require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'ololo@mark.duo', username: 'ohmy', password: 'qwertyuiop')
  end

  it 'ensures username presence' do
    @user.username = nil
    expect(@user.save).to eq(false)
  end

  it 'ensures email presence' do
    @user.email = nil
    expect(@user.save).to eq(false)
  end

  it 'ensures password presence' do
    @user.password = nil
    expect(@user.save).to eq(false)
  end

  it 'ensures password length >= 6' do
    @user.email = '1'
    expect(@user.save).to eq(false)
  end

  it 'should save successfully' do
    expect(@user.save).to eq(true)
  end

  after(:all) do
    @user.destroy
  end
end
