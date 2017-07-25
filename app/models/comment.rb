# frozen_string_literal: true
# Users can leave comments on original chunks
class Comment < ApplicationRecord
  belongs_to :commentator, class_name: 'User'
  belongs_to :chunk

  validates :commentator, presence: true
  validates :body, presence: true
  validates :chunk, presence: true
end
