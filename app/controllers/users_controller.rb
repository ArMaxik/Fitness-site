# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show exercises]
  def show; end

  def exercises
    @exercises = @user.exercises
  end

  def saves
    @exercises = current_user.exercises_save
  end

  def save_exercise
    if current_user.exercises_save.exists?(params[:post_id].to_i)
      current_user.exercises_save.destroy current_user.exercises_save.find params[:post_id].to_i
      state = 'unsaved'
      translate = t(:Save)
    else
      current_user.exercises_save << Exercise.find_by(id: params[:post_id].to_i)
      state = 'saved'
      translate = t(:Saved)
    end
    respond_to do |format|
      format.json { render json: { state: state, translate: translate } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
