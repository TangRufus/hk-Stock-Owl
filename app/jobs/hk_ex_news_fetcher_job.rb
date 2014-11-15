require 'open-uri'

class HkExNewsFetcherJob < ActiveJob::Base
  queue_as :hk_ex_news_fetcher

  def perform(target = 'main', time = 'today')
    html = Nokogiri::HTML(open(@url))
    html.css('.row0, .row1').reverse_each do |row|
      hkt_released_at = row.css('td').first.text
      tags = row.css('td:nth-child(4) #hdLine').text
      title = row.css('td:nth-child(4) .news').text
      link = 'http://www.hkexnews.hk' + row.css('td:nth-child(4) .news').attribute('href')

      stock_codes = []
      row.css('td:nth-child(2)').children.each do |code|
        stock_codes.push code.text if code.text.match(/\A\d+\Z/)
      end

      stock_names = []
      row.css('td:nth-child(3)').children.children.each do |name|
        stock_names.push name.text unless name.text.empty?
      end

      Hash[stock_codes.zip stock_names].each do |s_code, s_name|
        ExDocumentProvisionerJob.perform_later(hkt_released_at, s_code, s_name, tags, title, link)
        @count += 1
      end
    end
  end

  around_perform do |job, block|
    set_source_url(job.arguments.first, job.arguments[1])
    @count = 0
    @start_time = Time.now
    puts 'Order receved: ' + @board + ' & ' + @range
    puts "Start fetching Ex Documents from #{@url} ..."

    block.call

    puts 'Queued documents: ' + @count.to_s
    @time_spent = Time.now - @start_time
    puts 'Time spent: ' + @time_spent.to_s + ' seconds'
    puts 'Fetch finished!'
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

    @url = 'http://www.hkexnews.hk/listedco/listconews/' + index.downcase + '/' + @board.upcase + '_DATETIME_' + @range.upcase + '.HTM'
  end
end
