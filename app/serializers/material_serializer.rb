class MaterialSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :original_link,
    :caption_original,
    :caption_translated,
    :annotation_original,
    :annotation_translated,
    :original_language,
    :translation_language,
    :tags
  )

  belongs_to :rightholder
  belongs_to :owner
  belongs_to :state
  belongs_to :license

  has_many :chunks
end
