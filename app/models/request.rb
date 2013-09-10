class Request < ActiveRecord::Base
  belongs_to :request_group
  belongs_to :user
  has_many :price_quotes, dependent: :destroy
  has_many :features

  validates_presence_of :title, :request_group, :description
  
  attr_accessor :repository_url

  scope :published,  -> { where published: true }
  scope :published_and_unassigned, -> { published.where(:contractor_id => nil) }
  scope :unassigned, -> { where contractor_id: nil }
  scope :in_process, -> { where( "contractor_id <> 0" ) }

  def contractor
    return unless self.contractor_id
    User.find(self.contractor_id)
  end

  def contractor=(contractor)
    self.update_attribute(:contractor_id, contractor.id)
  end

end
