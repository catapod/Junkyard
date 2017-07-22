# frozen_string_literal: true
# Default Chunk json serializer
class ChunkSerializer < ActiveModel::Serializer
  attributes :id, :material_position, :translatable, :body, :created_at, :updated_at

  belongs_to :type

  has_many :comments
  has_many :translations

  def comments
    {
      "data": object.comments.page(1).map { |comment| CommentSerializer.new(comment) }
    }
  end

  def translations
    {
      "data": object.translations.page(1).map { |translation| TranslationSerializer.new(translation) }
    }
  end
end
