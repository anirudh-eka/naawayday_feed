require 'spec_helper'

describe FeedController do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_success
    end
  end
end