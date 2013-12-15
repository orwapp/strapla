class Certification < ActiveRecord::Base
  belongs_to :user
	validates :user, :presence => true
	validates :date, :presence => true
	validates :title, :presence => true
end
