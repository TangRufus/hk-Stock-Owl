class HkExNewsFetcher
  @queue = :lhk_ex_news_fetcher

  def self.perform()
    url = 'http://www.hkexnews.hk/listedco/listconews/mainindex/SEHK_LISTEDCO_DATETIME_TODAY.HTM'
    puts "Start fetching Ex Documents from #{url} ..."
    puts Time.now

    html = Nokogiri::HTML(open(url))
    html.css('.row0, .row1').each do |row|
      hkt_released_at = row.css('td').first.text
      stock_code = row.css('td:nth-child(2)').text
      stock_name = row.css('td:nth-child(3)').text
      headline_categories = row.css('td:nth-child(4) #hdLine').text
      title = row.css('td:nth-child(4) .news').text
      link = 'http://www.hkexnews.hk' + row.css('td:nth-child(4) .news').attribute('href')

      ExDocument.find_or_create_from_hkexnews(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
    end

    puts Time.now
    puts html.css('.row0, .row1').count
    puts 'Fetch finished!'
  end
end
