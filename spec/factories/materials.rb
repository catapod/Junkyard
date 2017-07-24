# frozen_string_literal: true

FactoryGirl.define do
  factory :material do
    rightholder
    association :owner, factory: :user
    original_link { Faker::StarWars.character }
    caption_original { Faker::StarWars.character }
    caption_translated { Faker::StarWars.character }
    annotation_original { Faker::StarWars.quote }
    annotation_translated { Faker::StarWars.quote }
    state
    license
    original_language { Faker::Hipster.word }
    translation_language { Faker::Hipster.word }
  end
end
