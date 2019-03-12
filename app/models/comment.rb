# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :exercise
  belongs_to :user
end
