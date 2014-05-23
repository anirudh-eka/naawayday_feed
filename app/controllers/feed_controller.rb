class FeedController < ApplicationController

	def index
    # authorization_key = Base64.encode64(ENV["TWITTER_BEARER_CREDENTIALS"]).sub("\n","")
    # resp = HTTParty.post('https://api.twitter.com/oauth2/token',
    #   :headers => { "Authorization" => "Basic #{authorization_key}",
    #     "User-Agent" => "#NAAwayDay Feed v1.0",
    #     "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"},
    #   body: { "grant_type" => "client_credentials"}
    #   )
    # bearer = resp.parsed_response["access_token"]

    # resp = HTTParty.get("https://api.twitter.com/1.1/search/tweets.json?q=%23happy", 
    #   :headers => { "Authorization" => "Bearer #{bearer}",
    #     "User-Agent" => "#NAAwayDay Feed v1.0"},)

    # p resp
    # resp["statuses"].each do |tweet|
      # p tweet["text"]
    # end

    @tweets = TweetService.get_tweets_by_hashtag "NAAwayDay"

	end

end