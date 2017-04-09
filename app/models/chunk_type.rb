class ChunkType < ApplicationRecord
  has_many :chunks

  validates :name, presence: true
  validates :display_name, presence: true
end
