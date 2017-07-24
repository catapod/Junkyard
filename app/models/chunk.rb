# frozen_string_literal: true

# All materials before translation are split on original chunks
# and translates after it.
class Chunk < ApplicationRecord
  belongs_to :material
  belongs_to :type, class_name: 'ChunkType', foreign_key: 'chunk_type_id'
  has_many :comments
  has_many :translations

  validates :material, presence: true
  validates :type, presence: true
  validates :material_position, presence: true
  validates :translatable, presence: true
  validates :body, presence: true
end
