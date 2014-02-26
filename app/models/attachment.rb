class Attachment < ActiveRecord::Base
  belongs_to :request
  validates :request_id, :presence => true

  attr_accessor :return_to_page

  mount_uploader :image, ImageUploader
end
