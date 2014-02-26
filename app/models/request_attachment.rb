class RequestAttachment < ActiveRecord::Base
  belongs_to :request
  validates :request, :presence => true
  validates :image,   :presence => true
  validates :title,   :presence => true

  mount_uploader :image, ImageUploader
end
