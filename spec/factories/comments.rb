# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    chunk
    association :commentator, factory: :user
    body { Faker::ChuckNorris.fact }
  end
end
