class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @comment = @exercise.comments.create(params[:comment].permit(:name, :comment))
    redirect_to exercise_path(@exercise)
  end
end
