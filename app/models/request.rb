class Request < ActiveRecord::Base
  belongs_to :request_group
  belongs_to :user
  has_many :price_quotes, dependent: :destroy
  has_many :features

  validates_presence_of :title, :request_group, :description
  
  attr_accessor :repository_url

  scope :published,  -> { where published: true }
  scope :published_and_unassigned, -> { published.where(delegated_to_user_id: nil).where(contractor_id: nil)}
  scope :unassigned, -> { where contractor_id: nil }
  scope :in_process, -> { where( "contractor_id <> 0" ) }
  scope :assigned_not_accepted, -> { where( "delegated_to_user_id <> 0" ) }
  #scope :mine, :conditions=>'SELECT *
  #                      FROM requests WHERE NOT EXISTS 
  #                      (SELECT price_quotes.request_id 
  #                      FROM price_quotes WHERE price_quotes.request_id = requests.id)'

  def self.awaiting_response(user)
    # Select all requests where we can't find any PriceQuotes with that request_id
    Request.find_by_sql("
                        SELECT *
                        FROM requests WHERE user_id = #{user.id} AND NOT EXISTS 
                        (SELECT price_quotes.request_id 
                        FROM price_quotes WHERE price_quotes.request_id = requests.id );")
  end

  def self.with_price_quotes(user)
    # Select all requests that have a price quote
    Request.find_by_sql("SELECT * FROM price_quotes 
                        INNER JOIN requests ON 
                        price_quotes .request_id = requests.id AND requests.user_id = #{user.id};")
  end

  def contractor
    return unless self.contractor_id
    User.find(self.contractor_id)
  end

  def contractor=(contractor)
    self.update_attribute(:contractor_id, contractor.id)
  end

  def delegated_to
    return unless self.delegated_to_user_id
    User.find(self.delegated_to_user_id)
  end

  def delegated_to=(user)
    self.update_attribute(:delegated_to_user_id, user.id)
  end

end
