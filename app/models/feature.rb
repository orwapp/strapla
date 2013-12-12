class Feature < ActiveRecord::Base
  attr_accessor :form_id

  belongs_to :request
  belongs_to :price_quote
  validates_presence_of :title
  has_many :estimated_hours, dependent: :destroy

  mount_uploader :image, ImageUploader

end
