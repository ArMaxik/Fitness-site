require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(email: 'faawe@mark.duo', username: 'imir', password: 'lfsdmsdf')
    @exer = Exercise.create(title: 'hello', description: 'qwerty', user_id: 1)
  end

  it 'ensures user_id presence' do
    comm = Comment.new(comment: 'hello', user_id: 1, exercise_id: 1)
    expect(comm.save).to eq(true)
  end

  it 'ensures user_id presence' do
    comm = Comment.new(comment: 'qwerty', exercise_id: 1)
    expect(comm.save).to eq(false)
  end

  it 'ensures exercise_id presence' do
    comm = Comment.new(comment: 'qwerty', user_id: 1)
    expect(comm.save).to eq(false)
  end

  it 'ensures comment presence' do
    comm = Comment.new(user_id: 2)
    expect(comm.save).to eq(false)
  end
end
