class Feature < ActiveRecord::Base
  belongs_to :request
  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :request_id

  attr_accessor :form_id
end
