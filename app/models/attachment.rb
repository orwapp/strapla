class Attachment < ActiveRecord::Base
  belongs_to :request
  belongs_to :feature
  validates :image, :presence => true unless Rails.env.test?

  attr_accessor :return_to_page

  mount_uploader :image, ImageUploader
end
