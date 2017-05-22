class TranslationSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :translator
  belongs_to :chunk

  has_many :rates
end
