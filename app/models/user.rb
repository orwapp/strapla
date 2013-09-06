class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  validates_presence_of :name, :bio, :phone, :email
  has_many :requests
  has_many :price_quotes
  has_and_belongs_to_many :request_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def average_price
    prng = Random.new
    prng.rand(15.0..90.0).round(2)
  end

  def profile
  end

  def delegated_requests
    Request.where(contractor_id: self.id).load
  end

  def delegated_and_accepted_requests
    Request.where(contractor_id: self.id, status: :accepted).load
  end

end
