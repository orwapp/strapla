class Feature# < ActiveRecord::Base
  #belongs_to :request
  #belongs_to :price_quote
  #validates_presence_of :title
  #has_many :estimated_hours, dependent: :destroy

  attr_accessor :form_id
end
