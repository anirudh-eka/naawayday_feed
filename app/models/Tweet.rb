class Tweet
  attr_reader :text, :screen_name, :created_at, :profile_image_url

  def initialize(text, screen_name, created_at, profile_image_url)
    @text = text
    @screen_name = screen_name
    @created_at = created_at
    @profile_image_url = profile_image_url
  end

  def ==(tweet)
    text == tweet.text && screen_name == tweet.screen_name && created_at == tweet.created_at
  end
end