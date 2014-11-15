class ExDocumentProvisionerJob < ActiveJob::Base
  queue_as :ex_document_builder

  def perform(hkt_released_at, stock_code, stock_name, tags, title, link)
    ExDocument.provision_from_hkexnews(hkt_released_at, stock_code, stock_name, tags, title, link)
  end
end
