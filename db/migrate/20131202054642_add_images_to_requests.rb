class AddImagesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :image, :string
  end
end
