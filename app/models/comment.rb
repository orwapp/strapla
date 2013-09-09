class Comment < ActiveRecord::Base
  belongs_to :price_quote
  belongs_to :user
  validates_presence_of :price_quote
  validates_presence_of :user
end
