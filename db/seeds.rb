start = Time.now

# Clean database
DatabaseCleaner.clean_with(:truncation)

# create posts and users
create_post_uri = "#{ENV['ROOT_URL']}posts"
create_rating_uri = "#{ENV['ROOT_URL']}ratings"
ip = Faker::Internet.ip_v4_address
100.times do |index|
  # generate user
  login = Faker::Internet.username

  if index.odd?
    ip = Faker::Internet.ip_v4_address
  end

  2.times do
    # create posts and users
    RestClient.post(create_post_uri, {post:{title:'testpost',body:'LoremIpsum',user_attributes:{login: login,ip: ip}}})

    if Faker::Number.between(from: 1, to: 4) <= 3 && index >= 1
      RestClient.post(create_rating_uri, {rating:{user_id: User.offset(rand(User.count)).first.id, post_id: Post.offset(rand(Post.count)).first.id, value: Faker::Number.between(from: 1, to: 5)}})
    end

  end
end

finish = Time.now
diff = finish - start
puts "Completed in: #{diff}"