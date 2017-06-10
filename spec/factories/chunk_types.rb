# frozen_string_literal: true
FactoryGirl.define do
  factory :chunk_type do
    name { Faker::Hacker.adjective }
    display_name { Faker::Hacker.verb }
  end
end
