class PriceQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  validates_presence_of :user, :hours_estimated, :request_id, :price

  def send_quote_to_owner
    UserMailer.send_price_quote(self).deliver
  end

  def accepted?
    status == 'accepted'
  end


end
