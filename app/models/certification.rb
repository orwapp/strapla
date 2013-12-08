class Certification #< ActiveRecord::Base
  include Mongoid::Document
  #belongs_to :user
	validates :user, :presence => true
	validates :date, :presence => true
	validates :title, :presence => true
end
