class UserMailer < ActionMailer::Base
  default from: "robot@CodeRunner.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_price_quote.subject
  #
  def send_price_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email, subject: 'New price quote on CodeRunner'
  end

  def accepted_price_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.user.email, subject: 'Your price quote was accepted'
  end

  def inform_about_rejected_quote(price_quote)
    @price_quote = price_quote
    mail to: @price_quote.request.user.email, cc: @price_quote.user.email 
  end

  def new_comment(comment, receiver)
    @comment = comment
    @sender = comment.user
    @receiver = receiver
    mail to: @receiver.email, from: @sender.email
  end

end
