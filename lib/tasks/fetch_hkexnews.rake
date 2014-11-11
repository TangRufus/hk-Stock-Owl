namespace :hkstockowl do

  desc 'Fetch Ex Documents from hkexnews.hk'
  task :fetch_hkexnews, [:board, :time] => :environment do |_task, args|
    HkExNewsFetcher.perform args.board, args.time
  end

  desc 'For Heroku: Queue all fetch tasks'
  task schedule_all_fetch_hkexnews: :environment do
    Resque.enqueue(HkExNewsFetcher)
    Resque.enqueue(HkExNewsFetcher, 'growth')
    Resque.enqueue(HkExNewsFetcher, 'warrant')
    Resque.enqueue(HkExNewsFetcher, 'others')
  end
end
