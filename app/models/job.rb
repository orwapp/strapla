class Job < ActiveRecord::Base
  belongs_to :user
	validates_presence_of :title, :company, :summary
end
