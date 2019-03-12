# frozen_string_literal: true

class AddExerciseIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_id, :integer
  end
end
