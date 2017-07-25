# frozen_string_literal: true
# Each chunk can have many rates by collaborators
class Rate < ApplicationRecord
  belongs_to :rater, class_name: 'User'
  belongs_to :translation

  validates :rater, presence: true
  validates :translation, presence: true
  validates :value, presence: true
end
