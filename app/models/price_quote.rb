class PriceQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  validates_presence_of :user_id, :hours_estimated, :request_id, :price
  #accepts_nested_attributes_for :request
end
