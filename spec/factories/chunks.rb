FactoryGirl.define do
  factory :chunk do
    material_id 1
    material_position { Faker::Number.between(1, 5) }
    chunk_type_id 2
    translatable true
    body { Faker::ChuckNorris.fact }
  end
end