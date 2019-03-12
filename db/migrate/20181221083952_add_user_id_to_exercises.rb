# frozen_string_literal: true

class AddUserIdToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :user_id, :integer
  end
end
