class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessor :return_to_page

  validates :image, :presence => true if Rails.env.production?
  belongs_to :request
  belongs_to :feature
end
