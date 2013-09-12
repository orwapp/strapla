class PriceQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  validates_presence_of :user, :hours_estimated, :request_id, :price
  has_many :comments, dependent: :destroy

  after_save :update_request!



  def notify_owner_about_new_quote
    UserMailer.send_price_quote(self).deliver
  end

  def notify_expert_about_accept_price_quote
    UserMailer.accepted_price_quote(self).deliver
  end

  def accepted?
    status == 'accepted'
  end

  def rejected?
    status == 'rejected'
  end

  def unprocessed
    #connection = ActiveRecord::Base.connection
    ActiveRecord::Base.connection.execute(" select * from price_quotes join requests on price_quotes.request_id=requests.id ")
    #PriceQuote.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
  end

  def self.belonging_to_users_requests(user)
    # Foo.includes(:bar).where(Bar.arel_table[:id].not_eq(nil))
    price_quotes = []
    user.requests.each do |request|
      price_quotes << request.price_quotes.to_a
    end
    price_quotes.flatten!
    price_quotes
  end

  def self.accepted_belonging_to_request_owner(user)
    belonging_to_users_requests(user).select {|p| p.status == 'accepted' }
  end

  def self.unprocessed_belonging_to_user(user)
    belonging_to_users_requests(user).select {|p| p.status == nil }
  end

  private
  def update_request!
    self.request.update_attribute(:status, status)    if status == :accepted
  end

end
