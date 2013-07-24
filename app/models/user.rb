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
    prng.rand(5.0..9.0).round(2)
  end

  def profile
  end


end