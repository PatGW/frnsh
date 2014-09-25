class AddDimensionsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :width, :decimal
    add_column :listings, :depth, :decimal
    add_column :listings, :height, :decimal
  end
end
