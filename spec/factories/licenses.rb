# frozen_string_literal: true

FactoryGirl.define do
  factory :license do
    name { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
  end
end
