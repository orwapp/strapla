class Feature < ActiveRecord::Base
  belongs_to :request
  belongs_to :price_quote
  validates_presence_of :title

  attr_accessor :form_id
end
