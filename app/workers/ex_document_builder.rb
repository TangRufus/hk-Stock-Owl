class ExDocumentBuilder
  @queue = :ex_document_builder

  def self.perform(hkt_released_at, stock_code, stock_name, tags, title, link)
    ExDocument.provision_from_hkexnews(hkt_released_at, stock_code, stock_name, tags, title, link)
  end
end
