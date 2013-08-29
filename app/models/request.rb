class Request < ActiveRecord::Base
  belongs_to :request_group
  belongs_to :user
  has_many :price_quotes
  has_many :features
  has_one :elevator_pitch
  has_one :background_information

  validates_presence_of :title, :goal, :request_group,  :description
  
  attr_accessor :repository_url

  scope :unassigned, -> { where delegated_to_user_id: nil }

  def contractor
    return unless self.contractor_id
    User.find(self.contractor_id)
  end

  def contractor=(contractor)
    self.update_attribute(:contractor_id, contractor.id)
  end

end
