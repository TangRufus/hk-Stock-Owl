module HasShortLink
  extend ActiveSupport::Concern

  included do
    auto_strip_attributes :link, :short_link, delete_whitespaces: true

    after_save :enqueue_link_shortener, :if => Proc.new {|a| a.link.present? && a.link_changed?}
  end

  def enqueue_link_shortener
    LinkShortenerJob.perform_later(self)
  end

  def shorten_link
      s_link = Bitly.client.shorten(link).short_url
      update(short_link: s_link) ? s_link : nil
  end

  def very_short_link
    shorten_link if short_links.blank?
    short_link.sub(/^http:\/\//, '').sub(/^https:\/\//, '') unless short_link.blank?
  end
end
