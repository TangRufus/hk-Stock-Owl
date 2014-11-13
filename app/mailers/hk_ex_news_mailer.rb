class HkExNewsMailer < ActionMailer::Base
  default from: 'notification@hkstockowl.com'

  def new_ex_document_notification(ex_document, subscriber, stock_company)

    @title = ex_document.title
    @link = ex_document.link
    @released_at = ex_document.released_at
    @stock_name = stock_company.name
    @stock_code = stock_company.code

    mail(to: subscriber.email, subject: "hkStockOwl: #{stock_company.name} Latest Information")
  end
end
