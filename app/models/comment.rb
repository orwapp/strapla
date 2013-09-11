class Comment < ActiveRecord::Base
  belongs_to :price_quote
  belongs_to :user
  validates_presence_of :price_quote
  validates_presence_of :user

  after_save :send_email

  private
  def send_email
    UserMailer.new_comment(self.user, self.price_quote.request.user, self).deliver
    UserMailer.new_comment(self.price_quote.request.user, self.user, self).deliver
  end

end
