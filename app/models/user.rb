class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  validates_presence_of :name, :bio, :phone, :email
  has_many :requests, dependent: :destroy
  has_many :price_quotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :request_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def average_price
    0
  end

  def profile
  end

  def delegated_requests
    Request.where(delegated_to_user_id: self.id).load
  end

  def delegated_requests_not_responded_to
    all = Request.where(delegated_to_user_id: self.id).to_a
    all - requests_sent_quote_on
  end

  def requests_sent_quote_on
    self.price_quotes.collect(&:request)
  end

  def delegated_and_accepted_requests
    Request.where(delegated_to_user_id: self.id, contractor_id: self.id).load
  end

  def requests_awaiting_response
    Request.awaiting_response(self)
  end

  def requests_with_price_quotes
    Request.with_price_quotes(self).to_a - self.requests_with_accepted_quotes
  end

  def requests_with_accepted_quotes
    Request.where(status: 'accepted').to_a
  end

end
