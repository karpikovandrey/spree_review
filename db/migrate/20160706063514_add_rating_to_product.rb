class AddRatingToProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :rating, :integer, default: 0
    add_column :spree_products, :count_voters, :integer, default: 0
    add_column :spree_products, :average_rating, :float, default: 0
  end
end
