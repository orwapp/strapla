class AddCommentToPriceQuotes < ActiveRecord::Migration
  def change
    add_column :price_quotes, :comment, :text
  end
end
