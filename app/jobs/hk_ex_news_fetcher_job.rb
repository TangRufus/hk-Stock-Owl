require 'open-uri'

class HkExNewsFetcherJob < ActiveJob::Base
  queue_as :hk_ex_news_fetcher

  def perform(target = 'main', time = 'today')
    html = Nokogiri::HTML(open(@url))
    html.css('.row1, .row0').each do |row|
      FetchHkExNewsService.new(row).call
    end
  end

  around_perform do |job, block|
    set_source_url(job.arguments.first, job.arguments[1])
    @start_time = Time.now
    puts 'Start fetching Ex Documents (' + @board + ' & ' + @range + ") from #{@url} ..."

    block.call

    @time_spent = Time.now - @start_time
    puts 'Fetch finished! *** Time spent: ' + @time_spent.to_s + ' seconds'
  end

  private
  def set_source_url(target, time)
    index = (target == 'growth') ? 'gemindex' : 'mainindex'

    case target
    when 'growth'
      @board = 'GEM_LISTEDCO'
    when 'warrant'
      @board = 'SEHK_DW'
    when 'others'
      @board = 'SEHK_OTHERS'
    else # main
      @board = 'SEHK_LISTEDCO'
    end

    @range = (time == 'week') ? 'SEVEN' : 'TODAY'

    @url = 'http://www.hkexnews.hk/listedco/listconews/' + index.downcase + '/' + @board.upcase + '_DATETIME_' + @range.upcase + '_C.HTM'
  end
end
