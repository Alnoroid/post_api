start = Time.now

# Clean database
DatabaseCleaner.clean_with(:truncation)

# create posts and users
create_post_uri = "#{ENV['ROOT_URL']}posts"

ip = Faker::Internet.ip_v4_address
100.times do |index|
  # generate user
  login = Faker::Internet.username

  if index.odd?
    ip = Faker::Internet.ip_v4_address
  end

  2.times do
    RestClient.post(create_post_uri, {post:{title:'testpost',body:'LoremIpsum',user_attributes:{login: login,ip: ip}}})
  end
end



# req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
# req.body = {param1: 'some value', param2: 'some other value'}.to_json
# res = Net::HTTP.start(uri.hostname, uri.port) do |http|
#   http.request(req)
# end

# rate posts

finish = Time.now
diff = finish - start
puts "Completed in: #{diff}"