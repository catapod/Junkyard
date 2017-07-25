# frozen_string_literal: true
# Materials can have many tags for purposes of searching and clustering
class MaterialTag < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :body, presence: true

  has_and_belongs_to_many :materials
end
