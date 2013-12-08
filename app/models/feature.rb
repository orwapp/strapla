class Feature
  include Mongoid::Document
  field :title
  field :description

  #belongs_to :request
  #belongs_to :price_quote
  #validates_presence_of :title
  #has_many :estimated_hours, dependent: :destroy

  belongs_to :request

  attr_accessor :form_id
end
