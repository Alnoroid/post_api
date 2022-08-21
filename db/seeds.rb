start = Time.now

# Clean database
DatabaseCleaner.clean_with(:truncation)

# create posts and users
uri = "#{ENV['ROOT_URL']}posts/create"
RestClient.post(uri, {test:1}, headers={})

# req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
# req.body = {param1: 'some value', param2: 'some other value'}.to_json
# res = Net::HTTP.start(uri.hostname, uri.port) do |http|
#   http.request(req)
# end

# rate posts

finish = Time.now
diff = finish - start
puts "Completed in: #{diff}"