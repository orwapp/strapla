class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :request
  belongs_to :feature
end
