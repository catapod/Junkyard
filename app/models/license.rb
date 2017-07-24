# frozen_string_literal: true

# Each material must have license, at least opensource.
class License < ApplicationRecord
  has_many :materials

  validates :name, presence: true
  validates :content, presence: true
end
