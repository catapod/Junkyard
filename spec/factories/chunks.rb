FactoryGirl.define do
  factory :chunk do
    material_position { Faker::Number.between(1, 5) }
    chunk_type_id 2
    translatable true
    body { Faker::ChuckNorris.fact }
    factory :chunk_with_comments_and_translations do
      transient do
        comments_count 5
      end

      after :create do |chunk, evaluator|
        create_list(:comment, evaluator.comments_count, chunk: chunk)
        create_list(:translation, evaluator.comments_count, chunk: chunk)
      end
    end
  end
end