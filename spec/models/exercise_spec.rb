require 'rails_helper'

RSpec.describe Exercise, type: :model do
  before(:all) do
    @user = User.create(email: 'himark@mark.duo', username: 'vadimi', password: 'qwertyuiop')
  end

  before(:each) do
    @exer = build(:exercise)
  end

  it 'ensures user_id presence' do
    exer =  Exercise.new(title: 'hello', description: 'qwerty', user_id: 2)
    expect(exer.save).to eq(true)
  end

  it 'ensures title presence' do
    exer =  Exercise.new(description: 'qwerty', user_id: 2)
    expect(exer.save).to eq(false)
  end

  it 'ensures description presence' do
    exer =  Exercise.new(title: 'hello', user_id: 2)
    expect(exer.save).to eq(false)
  end

  it 'ensures user_id presence' do
    exer =  Exercise.new(title: 'hello', description: 'qwerty')
    expect(exer.save).to eq(false)
  end

  after(:all) do
    @user.destroy
  end
end
