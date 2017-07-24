# frozen_string_literal: true

# Default Material json serializer
class MaterialSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :original_link,
    :caption_original,
    :caption_translated,
    :annotation_original,
    :annotation_translated,
    :original_language,
    :translation_language
  )

  belongs_to :rightholder
  belongs_to :owner
  belongs_to :state
  belongs_to :license

  has_many :chunks
  has_many :tags
end
