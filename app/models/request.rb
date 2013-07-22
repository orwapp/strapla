class Request < ActiveRecord::Base
  belongs_to :request_group
  belongs_to :user
  validates_presence_of :subject, :goal, :request_group
  attr_accessor :repository_url

  scope :unassigned, -> { where user_id: nil }

end
