 # ligne très importante qui appelle la gem.
require 'twitter'

# n'oublie pas les lignes pour Dotenv ici…
require 'dotenv'
Dotenv.load('.env') 

require 'pry'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

client2 = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end


def like_follow_stream(client, client2)
client2.filter(track: "#bonjour_monde") { |object|
  client.favorite(object)
  client.follow(object.user.screen_name) if object.user.screen_name != " N_Titah"
}
end

like__follow_stream(client, client2)