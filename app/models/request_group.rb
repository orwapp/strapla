class RequestGroup < ActiveRecord::Base
  require 'string'

  has_many :requests
  validates_presence_of :title
  #validates_uniqueness_of :title
  has_and_belongs_to_many :users

  def image_url
    self.title.gsub!(/[^0-9a-z ]/i, '')
    self.title.downcase.normalize + ".png"
  end

end
