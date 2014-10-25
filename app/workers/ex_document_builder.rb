class ExDocumentBuilder
  @queue = :ex_document_builder

  def self.perform(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
    ExDocument.find_or_create_from_hkexnews(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
  end
end
