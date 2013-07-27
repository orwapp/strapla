class UserMailer < ActionMailer::Base
  default from: "post@CodeRunner.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_price_quote.subject
  #
  def send_price_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email 
  end

  def inform_about_accepted_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email, cc: @price_quote.user.email 
  end
end
