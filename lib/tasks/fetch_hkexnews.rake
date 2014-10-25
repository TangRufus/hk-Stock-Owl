namespace :hkstockowl do

  desc "Fetch Ex Documents from hkexnews.hk"
  task :fetch_hkexnews, [:board, :time]  => :environment do |task, args|
    HkExNewsFetcher.perform args.board, args.time
  end

end
