class HkExNewsMailer < AsyncMailer
  default from: 'notification@hkstockowl.com'

  def new_ex_document_notification(to_email, title, link, released_at, stock_name, stock_code)

    @title = title
    @link = link
    @released_at = released_at
    @stock_name = stock_name
    @stock_code = stock_code

    mail(to: to_email, subject: "hkStockOwl: #{stock_name} Latest Information")
  end
end
