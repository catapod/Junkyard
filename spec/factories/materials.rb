FactoryGirl.define do
  factory :material do
    rightholder_id 1
    owner_id 2
    original_link { Faker::StarWars.character }
    caption_original { Faker::StarWars.character }
    caption_translated { Faker::StarWars.character }
    annotation_original { Faker::StarWars.quote }
    annotation_translated { Faker::StarWars.quote }
    state_id 1
    license_id 2
    original_language { Faker::Hipster.word }
    translation_language { Faker::Hipster.word }
    tags { [1, 3, 2] } 
  end
end