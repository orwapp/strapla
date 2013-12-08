class Certification
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :user
  field :title
  field :date

	validates :user, :presence => true
	validates :date, :presence => true
	validates :title, :presence => true
end
