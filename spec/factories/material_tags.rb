# frozen_string_literal: true
FactoryGirl.define do
  factory :material_tag do
    name { Faker::Hipster.word }
    display_name { Faker::Hipster.word }
    body { Faker::ChuckNorris.fact }
  end
end
