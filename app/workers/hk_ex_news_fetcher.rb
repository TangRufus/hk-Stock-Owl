require 'open-uri'

class HkExNewsFetcher
  @queue = :hk_ex_news_fetcher

  def self.perform board = 'main', time = 'today'

    url = build_source_url board, time

    count = 0
    start_time = Time.now
    puts start_time
    puts 'Order receved: ' + board + ' & ' + time
    puts "Start fetching Ex Documents from #{url} ..."

    html = Nokogiri::HTML(open(url))
    html.css('.row0, .row1').each do |row|
      hkt_released_at = row.css('td').first.text
      stock_code = row.css('td:nth-child(2)').text
      stock_name = row.css('td:nth-child(3)').text
      headline_categories = row.css('td:nth-child(4) #hdLine').text
      title = row.css('td:nth-child(4) .news').text
      link = 'http://www.hkexnews.hk' + row.css('td:nth-child(4) .news').attribute('href')

      if stock_code.length <= 5
        Resque.enqueue(ExDocumentBuilder, hkt_released_at, stock_code, stock_name, headline_categories, title, link)
        count += 1
      else
        # <td class="arial12black">06210<br>06230</td>
        stock_codes = []
        row.css('td:nth-child(2)').children.each do |code|
          stock_codes.push code.text if code.text.match(/\A\d+\Z/)
        end

        # <td><nobr>SWIRE PACIFIC A<br>SWIRE PACIFIC B</nobr></td>
        stock_names = []
        row.css('td:nth-child(3)').children.children.each do |name|
          stock_names.push name.text unless name.text.empty?
        end

        Hash[stock_codes.zip stock_names].each do |stock_code, stock_name|
          Resque.enqueue(ExDocumentBuilder, hkt_released_at, stock_code, stock_name, headline_categories, title, link)
          count += 1
        end
      end
    end

    puts 'Queued News: ' + count.to_s
    time_spent = Time.now - start_time
    puts 'Time spent: ' + time_spent.to_s + ' seconds'
    puts 'Fetch finished!'
  end

  private
  def self.build_source_url board, time
    index = 'mainindex'
    index = 'gemindex' if board == 'growth'

    case board
    when 'growth'
      board = 'GEM_LISTEDCO'
    when 'warrant'
      board = 'SEHK_DW'
    when 'others'
      board = 'SEHK_OTHERS'
    else
      board = 'SEHK_LISTEDCO'
    end

    case time
    when 'week'
      time = 'SEVEN'
    else
      time = 'TODAY'
    end

    'http://www.hkexnews.hk/listedco/listconews/' + index.downcase + '/' + board.upcase + '_DATETIME_' + time.upcase + '.HTM'
  end
end
