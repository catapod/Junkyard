class ChunkSerializer < ActiveModel::Serializer
  attributes :id, :material_position, :translatable, :body

  belongs_to :chunk_type
  belongs_to :material

  has_many :comments
  has_many :translations
end
