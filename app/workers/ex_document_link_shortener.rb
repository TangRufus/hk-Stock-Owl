class ExDocumentLinkShortener
  @queue = :link_shortener

  def self.perform(id)
    ex_document = ExDocument.where(:id => id).first
    ex_document.shorten_link
  end
end
