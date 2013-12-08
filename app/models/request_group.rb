class RequestGroup
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  require 'String'

  #has_many :requests
  #validates_presence_of :title
  #has_and_belongs_to_many :users


end
