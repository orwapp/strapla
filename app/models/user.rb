class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  include Mongoid::Slug
  slug :name
  validates :name, :uniqueness => true
  
  

  embeds_many :jobs,   validate: false
  embeds_many :skills, validate: false
  embeds_many :certifications, validate: false
  has_many :requests, validate: false

  field :name
  field :email
  field :image_url
  field :phone
  field :bio
  field :developer, type: Boolean
  field :describe_your_dream_project
  field :linkedin_url
  field :github_username
  field :company_name
  field :title

  ## Database authenticatable
  field :email,              :type => String#, :null => false
  field :encrypted_password, :type => String#, :null => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  # field :authentication_token, :type => String

  ## Invitable
  # field :invitation_token, :type => String




  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #
  #attr_reader :skill_tokens
  

  #  validates_presence_of :name, :email
  #  has_many :requests, dependent: :destroy
  #  has_many :price_quotes, dependent: :destroy
  #  has_many :comments, dependent: :destroy
  #  #has_many :estimated_hours, dependent: :destroy
  #  has_many :jobs, dependent: :destroy
  #  has_many :certifications, dependent: :destroy
  #  has_and_belongs_to_many :skills
  #  has_and_belongs_to_many :request_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  #def self.skill_tokens=(tokens)
  #  self.skill_ids = Skill.ids_from_tokens 
  #  self.save
  #end

  def developer?
    self.developer
  end

  def employer?
    self.employer
  end
 
  def average_price
    0
  end

  def profile
  end

  def delegated_requests
    Request.where(delegated_to_user_id: self.id).all
  end

  def delegated_requests_not_responded_to
    all = Request.where(delegated_to_user_id: self.id).to_a
    all - requests_sent_quote_on
  end

  def requests_sent_quote_on
    self.price_quotes.collect(&:request)
  end

  def delegated_and_accepted_requests
    Request.where(delegated_to_user_id: self.id, contractor_id: self.id).all
  end

  def pending_quotes
    Request.pending_quotes(self)
  end

  def requests_with_price_quotes
    Request.with_price_quotes(self).to_a - self.requests_with_accepted_quotes
  end

  def requests_with_accepted_quotes
    Request.where(status: 'accepted').to_a
  end


  #def skill_tokens=(ids)
  #  self.skill_ids = Skill.ids_from_tokens(ids)
  #  #self.skill_ids = Skill.ids_from_tokens(tokens)
  #end



end
