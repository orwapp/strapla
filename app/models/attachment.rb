class Attachment < ActiveRecord::Base
  belongs_to :request
  belongs_to :feature

  attr_accessor :return_to_page

  mount_uploader :image, ImageUploader
end
