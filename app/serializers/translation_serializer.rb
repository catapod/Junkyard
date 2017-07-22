# frozen_string_literal: true
# Default Translation json serializer
class TranslationSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :created_at, :updated_at

  belongs_to :translator

  has_many :rates

  def rates
    {
      "data": object.rates.page(1).map { |rate| RateSerializer.new(rate) }
    }
  end

  def rating
    object.rates.average(:value).to_f || 0
  end
end
