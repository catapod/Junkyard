# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    nickname { Faker::Name.first_name }
  end
end
