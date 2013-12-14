class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :image, :presence => true
  belongs_to :request
  belongs_to :feature
end
