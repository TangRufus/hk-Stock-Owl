class ExDocumentBuilder
  @queue = :hk_ex_news_fetcher

  def self.perform(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
    ExDocument.find_or_create_from_hkexnews(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
  end
end
