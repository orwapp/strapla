class Job
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :user

  #belongs_to :user
	validates_presence_of :title, :company_name, :summary
end
