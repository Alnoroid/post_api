# Clean database
DatabaseCleaner.clean_with(:truncation)

# create posts and users
create_post_uri = "#{ENV.fetch('ROOT_URL', nil)}posts"
create_rating_uri = "#{ENV.fetch('ROOT_URL', nil)}ratings"
ip = Faker::Internet.ip_v4_address
100.times do |index|
  # generate user
  login = Faker::Internet.username

  ip = Faker::Internet.ip_v4_address if index.odd?

  2000.times do
    # create posts and users
    title = Faker::Lorem.word
    body = Faker::Lorem.paragraph
    RestClient.post(create_post_uri,
                    { post: { title: title, body: body, user_attributes: { login:, ip: } } })
  end
end

# create ratings
200000.times do
  next unless Faker::Number.between(from: 1, to: 4) <= 3

  RestClient.post(create_rating_uri,
                  { rating:
                      { user_id: User.offset(rand(User.count)).first.id,
                        post_id: Post.offset(rand(Post.count)).first.id,
                        value: Faker::Number.between(from: 1, to: 5) } })
end
