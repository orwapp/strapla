class RequestGroup
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  require 'String'

  field :image_url
  has_many :requests
  validates_presence_of :title

  #has_and_belongs_to_many :users


end
