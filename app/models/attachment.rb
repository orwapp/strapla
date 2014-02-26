class Attachment < ActiveRecord::Base
  belongs_to :request
  validates :request_id, :presence => true
end
