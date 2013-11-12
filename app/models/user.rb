class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #
  attr_reader :skill_tokens
  attr_reader :developer
  attr_reader :employer
  
  

  validates_presence_of :name, :email
  has_many :requests, dependent: :destroy
  has_many :price_quotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :estimated_hours, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :request_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  scope :developer,  -> { where developer: true }
  scope :employer,  -> { where employer: true }

  def self.skill_tokens=(tokens)
    self.skill_ids = Skill.ids_from_tokens 
    self.save
  end

  def developer?
    !!(self.role.match 'developer') rescue nil
  end

  def employer?
    !!(self.role.match 'employer') rescue nil
  end
 
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

  def skill_tokens=(ids)
    self.skill_ids = Skill.ids_from_tokens(ids)
    #self.skill_ids = Skill.ids_from_tokens(tokens)
  end

end
