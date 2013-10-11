class RenamePriceQuotesCommentsToDescription < ActiveRecord::Migration
  def change
		rename_column(:price_quotes, :comment, :description)
  end
end
