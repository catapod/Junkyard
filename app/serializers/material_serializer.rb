class MaterialSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :rightholder_id,
    :owner_id,
    :original_link,
    :caption_original,
    :caption_translated,
    :annotation_original,
    :annotation_translated,
    :state_id,
    :license_id,
    :original_language,
    :translation_language,
    :tags
  )

  has_many :slices
end
