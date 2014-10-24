namespace :hkstockowl do

  desc "Fetch Ex Documents from hkexnews.hk"
  task :fetch_hkexnews => :environment do
    HkExNewsFetcher.perform
  end

end
