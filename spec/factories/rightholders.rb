FactoryGirl.define do
  factory :rightholder do
    caption_original { Faker::Educator.university }
    short_original { Faker::Educator.campus }
  end
end