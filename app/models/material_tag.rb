class MaterialTag < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :body, presence: true
end
