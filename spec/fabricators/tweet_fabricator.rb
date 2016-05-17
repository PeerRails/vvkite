Fabricator(:tweet) do
  user
  tweet_id { Faker::Number.number(4) }
  twitter_id { Faker::Number.number(4) }
  link { Faker::Internet.url }
  text { Faker::Lorem.characters(80) }
  media_type "photo"
  media_files(count: 4)
end
