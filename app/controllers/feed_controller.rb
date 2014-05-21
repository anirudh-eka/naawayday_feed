class FeedController < ApplicationController

	def index
    authorization_key = Base64.encode64(ENV["TWITTER_BEARER_CREDENTIALS"]).sub("\n","")
    resp = HTTParty.post('https://api.twitter.com/oauth2/token',
      :headers => { "Authorization" => "Basic #{authorization_key}",
        "User-Agent" => "#NAAwayDay Feed v1.0",
        "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"},
      body: { "grant_type" => "client_credentials"}
      )
    p resp
	end

end