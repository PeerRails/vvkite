Fabricator(:tweet) do
  tweet_id { Faker::Number.number(4) }
  twitter_id { Faker::Number.number(4) }
  link { Faker::Internet.url }
  text { Faker::Lorem.characters(80) }
  media_type { %w(photo gif video).sample }
  user
end
