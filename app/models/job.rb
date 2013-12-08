class Job
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :company_name
  field :title
  field :from_date
  field :to_date
  field :current
  field :summary

  embedded_in :user

  #belongs_to :user
	validates_presence_of :title, :company_name, :summary
end
