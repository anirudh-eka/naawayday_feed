require 'spec_helper'

describe TweetFactory do
  it 'should make tweets from ruby' do
    test_tweets = [Tweet.new("Thee Namaste Nerdz. #NAAwayDay", "bullcityrecords", "Fri Sep 21 23:40:54 +0000 2012", "http://a0.twimg.com/profile_images/447958234/Lichtenstein_normal.jpg"), Tweet.new("Mexican Heaven, Mexican Hell #NAAwayDay", "MonkiesFist", "Fri Sep 21 23:30:20 +0000 2012", "http://a0.twimg.com/profile_images/2219333930/Froggystyle_normal.png")]
    response = @@tweet_response

    factory_tweets = TweetFactory.make_tweets(response)

    expect(factory_tweets).to eq(test_tweets)
    expect(factory_tweets.reverse).to_not eq(test_tweets)
  end
end