class Feature < ActiveRecord::Base
  attr_accessor :form_id
  attr_accessor :return_to_page


  belongs_to :request
  belongs_to :price_quote
  validates_presence_of :title
  has_many :estimated_hours, dependent: :destroy
  has_many :attachments


end
