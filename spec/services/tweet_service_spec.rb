require 'spec_helper'

describe TweetService do
  it 'returns Tweets' do
    expected_tweets = double("tweets")
    allow(TweetFactory).to receive(:make_tweets).with(@@tweet_response).and_return(expected_tweets)
    service_tweets = TweetService.get_tweets_by_hashtag("NAAwayDay")
    expect(service_tweets).to eq(expected_tweets)
  end
end