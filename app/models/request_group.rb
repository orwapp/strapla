class RequestGroup < ActiveRecord::Base
  require 'String'

  has_many :requests
  validates_presence_of :title
  has_and_belongs_to_many :users

  def image_url
    self.title.gsub(/[^0-9a-z ]/i, '')
    self.title.gsub(/ /, '_')
    self.title.downcase.normalize + ".png"
  end


end
