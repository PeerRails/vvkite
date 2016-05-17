Fabricator(:media_file) do
  tweet
  link { Faker::Internet.url }
  media_type "photo"
end
