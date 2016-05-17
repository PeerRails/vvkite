Fabricator(:user) do
  email { Faker::Internet.email }
  screen_name { Faker::Internet.user_name }
  twitter_id { Faker::Number.number(4) }
  name { Faker::Name.name }
end
