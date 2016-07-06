class AddRatingToProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :rating, :float, default: 0
  end
end
