# POST_API

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)
![main](https://github.com/Alnoroid/post_api/actions/workflows/rubyonrails.yml/badge.svg)

## Installation
Just clone, make create .env.development.local files with database user and pass.

## Usage
Contains three models, Users, Posts, and Ratings.

### Users
Have only one method, to get IP of authors.
Example request:
```
curl -X GET http://localhost:3000/users/ips
```

### Posts
Now this is much more interesting, API allows to create posts and users simultaneously.
title and body attributes are necessary, as well as user_attributes
Example request to create user and post:
```
curl -X POST http://localhost:3000/posts -H 'Content-Type: application/json' -d '{"post":{"title":"testpost","body":"LoremIpsum","ip":"127.0.0.1","user_attributes":{"login":"tester"}}}'
```
If no user exists, a new one will be created on this request.
Moreover, if there is some kind of error, API will respond what exactly caused this error.


Another wonderful request is to get top N posts.
```
curl -X GET http://localhost:3000/posts/top/5
```
This request will return top 5 rated posts.

### Ratings
To rate a post, we need to know its id, and user_id. Which is frankly a bit strange, because we cannot get id of user. Nevertheless, example request is:
```
curl -X POST http://localhost:3000/ratings -H 'Content-Type: application/json' -d '{"rating":{"user_id":1,"post_id":1,"value":3}}'
```


## Versions
Ruby 3.1.2
Rails 7.0.3