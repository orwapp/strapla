class Request < ActiveRecord::Base
  belongs_to :request_group
  belongs_to :user
  has_many :price_quotes

  validates_presence_of :subject, :goal, :request_group,  :description
  
  attr_accessor :repository_url

  scope :unassigned, -> { where contractor_id: nil }

  def contractor
    return unless self.contractor_id
    User.find(self.contractor_id)
  end

  def contractor=(contractor)
    self.update_attribute(:contractor_id, contractor.id)
  end

end
