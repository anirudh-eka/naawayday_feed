# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'webmock/rspec'

# require File.expand_path('../config/application', __FILE__)

WebMock.disable_net_connect!(allow_localhost: true)  # WebMock.disable_net_connect!({:allow_localhost => true}) 

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:each) do 
    auth_response = {"access_token"=>"AAAAAAAAAAAAAAAAAAAAAHfMXgAAAAAAqjpb4OtAUv4B1pjCzS7nZ%2FTzgqo%3D473OZ91sDRgjEGKlEnCl9NSnfkNSs524yvxFjPrAAX6lQsuHUV",
     "token_type"=>"bearer"}.to_json
     
    stub_request(:post, /https:\/\/\w+:\w+@api.twitter.com\/oauth2\/token/).
      with(headers: {"content-type"=>"application/x-www-form-urlencoded;charset=UTF-8"},
        body: {"grant_type"=>"client_credentials"}).
      to_return({status: 200, body: auth_response, headers: {'content-type' => 'application/json'} }) 


    stub_request(:get, 'https://api.twitter.com/1.1/search/tweets.json?q=%23NAAwayDay').
      with(headers: {"Authorization"=>/Bearer .+/}).
      to_return( {:status => 200, :body => @@tweet_response.to_json, :headers => {'content-type' => 'application/json'} },
        {:status => 200, :body => @@second_tweet_response.to_json, :headers => {'content-type' => 'application/json'} })
  end
end
