FactoryGirl.define do
  factory :media_file do
    link { Faker::Internet.url }
    media_type { %w(photo gif video).sample }
  end
end