class TweetFactory

  def self.make_tweets(parsed_response)
    tweets = []
    parsed_response["statuses"].each do |tweet|
      text = tweet["text"]
      screen_name = tweet["user"]["screen_name"]
      created_at = tweet["created_at"]
      profile_image_url = tweet["user"]["profile_image_url"]
      tweets << Tweet.new(text, screen_name, created_at, profile_image_url)
    end
    tweets
  end

end