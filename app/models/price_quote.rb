class PriceQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  validates_presence_of :user, :hours_estimated, :request_id, :price

  def notify_owner_about_new_quote
    UserMailer.send_price_quote(self).deliver
  end

  def accepted?
    status == 'accepted'
  end

end
