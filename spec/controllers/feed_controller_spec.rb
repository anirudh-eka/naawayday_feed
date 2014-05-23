require 'spec_helper'

describe FeedController do
  describe 'GET #index' do
    let(:tweets) { double("tweets") }

    before(:each) do
      allow(TweetService).to receive(:get_tweets_by_hashtag).with("NAAwayDay").and_return(tweets)
    end

    it 'returns a successful response' do
      get :index
      expect(response).to be_success
    end

    it 'returns Tweets by #NAAwayDay' do
      get :index
      expect(assigns(:tweets)).to eq(tweets)
    end
  end
end