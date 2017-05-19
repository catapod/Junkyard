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

  has_many :slices
end
