class Tweet
  attr_reader :text, :screen_name, :created_at

  def initialize(text, screen_name, created_at)
    @text = text
    @screen_name = screen_name
    @created_at = created_at
  end

  def ==(tweet)
    text == tweet.text && screen_name == tweet.screen_name && created_at == tweet.created_at
  end
end