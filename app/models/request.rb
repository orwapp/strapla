class Request < ActiveRecord::Base
  belongs_to :user
  has_many :price_quotes, dependent: :destroy
  has_many :features
  belongs_to :preferred_language
  belongs_to :request_group
	validates_presence_of :user
  validates_presence_of :title, :description
  
  mount_uploader :image, ImageUploader
  
  
  attr_reader :return_to_page

  ########################################################################
  # The states of an request:
  #
  # delegated_to_user_id is set when the submitter delegates the task to an expert, 
  # and the expert has not yet acccepted the request.
  # When the expert accepts then the contractor_id is set
  #
  # If an expert picks a request from the unassigned tasks, 
  # send a price quote which is accepted, then the contractor_id is set.
  #
  ########################################################################

  scope :published,  -> { where published: true }
  scope :unpublished,  -> { where published: nil }
  scope :published_and_unassigned, -> { 
    published.where(delegated_to_user_id: nil).where(contractor_id: nil)}
  scope :no_quotes_received, -> { where price_quotes: nil }
  scope :in_process, -> { where( "contractor_id <> 0" ) }
  scope :assigned_not_accepted, -> { where( "delegated_to_user_id <> 0" ) }

  #scope :mine, :conditions=>'SELECT *
  #                      FROM requests WHERE NOT EXISTS 
  #                      (SELECT price_quotes.request_id 
  #                      FROM price_quotes WHERE price_quotes.request_id = requests.id)'

  def self.pending_quotes(user)
    # Select all requests where we can't find any PriceQuotes with that request_id
    Request.find_by_sql("
      SELECT *
      FROM requests WHERE user_id = #{user.id} AND NOT EXISTS 
      (SELECT price_quotes.request_id 
      FROM price_quotes WHERE price_quotes.request_id = requests.id )
      AND published = true;")
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
