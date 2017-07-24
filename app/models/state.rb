# frozen_string_literal: true

# Material state
class State < ApplicationRecord
  has_many :materials

  validates :name, presence: true
  validates :display_name, presence: true
end
