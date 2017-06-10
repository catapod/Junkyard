# frozen_string_literal: true
FactoryGirl.define do
  factory :chunk do
    material
    material_position { Faker::Number.between(1, 5) }
    chunk_type
    translatable true
    body { Faker::ChuckNorris.fact }
  end
end
