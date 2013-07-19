class RequestGroup < ActiveRecord::Base
  has_many :requests
  validates_presence_of :title
end
