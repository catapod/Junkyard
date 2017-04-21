class Chunk < ApplicationRecord
  belongs_to :material
  belongs_to :chunk_type
  has_many :comments
  has_many :translations

  validates :material, presence: true
  validates :chunk_type, presence: true
  validates :material_position, presence: true
  validates :translatable, presence: true
  validates :body, presence: true
end
