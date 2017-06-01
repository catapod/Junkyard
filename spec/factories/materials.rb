FactoryGirl.define do
  factory :material do
    rightholder
    association :owner, factory: :user
    original_link { Faker::StarWars.character }
    caption_original { Faker::StarWars.character }
    caption_translated { Faker::StarWars.character }
    annotation_original { Faker::StarWars.quote }
    annotation_translated { Faker::StarWars.quote }
    state_id 1
    license
    original_language { Faker::Hipster.word }
    translation_language { Faker::Hipster.word }
    tags { [1, 3, 2] }
    factory :material_with_chunks do
      transient do
        chunks_count 5
      end

      after :create do |material, evaluator|
        create_list(:chunk_with_comments, evaluator.chunks_count, material: material)
      end
    end
  end
end