class LinkShortenerJob < ActiveJob::Base
  queue_as :link_shortener

  def perform(record)
    record.shorten_link
  end
end
