class RateSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at, :updated_at

  belongs_to :rater
end
