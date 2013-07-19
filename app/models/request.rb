class Request < ActiveRecord::Base
  belongs_to :request_group
  validates_presence_of :subject, :goal, :request_group
end
