desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  puts "*" * 80
  TweetService.get_tweets_by_hashtag "NAAwayDay"
  # NewsFeed.update
  puts "done."
end

task :send_reminders => :environment do
  # User.send_reminders
end