class Tweet
  attr_reader :text, :screen_name, :created_at, :profile_image_url, :media_url

  def initialize(args)
    @text = args[:text]
    @screen_name = args[:screen_name]
    @created_at = args[:created_at]
    @profile_image_url = args[:profile_image_url]
    @media_url = args[:media_url]
  end

  def ==(tweet)
    text == tweet.text && screen_name == tweet.screen_name && created_at == tweet.created_at && media_url == tweet.media_url
  end
end