# frozen_string_literal: true

FactoryGirl.define do
  factory :rate do
    association :rater, factory: :user
    translation
    value { [-1, 1].sample }
  end
end
