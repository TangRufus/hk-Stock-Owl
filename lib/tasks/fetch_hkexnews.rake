namespace :hkstockowl do

  desc 'Fetch Ex Documents from hkexnews.hk [main|growth|warrant|others,today|week]'
  task :fetch_hkexnews, [:board, :time] => :environment do |_task, args|
    HkExNewsFetcherJob.perform_later(args.board, args.time)
  end

  desc 'For Heroku: Queue all fetch tasks'
  task schedule_all_fetch_hkexnews: :environment do
    HkExNewsFetcherJob.perform_later('main')
    HkExNewsFetcherJob.perform_later('growth')
    HkExNewsFetcherJob.perform_later('warrant')
    HkExNewsFetcherJob.perform_later('others')
  end
end
