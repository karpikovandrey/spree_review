class CreateReviews < ActiveRecord::Migration
  def change
    create_table :spree_reviews do |t|
      t.references  :product
      t.integer     :rating
      t.string      :title
      t.text        :description
      t.boolean     :approved, default: false
      t.timestamps null: false
    end
    add_index :spree_reviews, [:product_id],         :name => 'index_spree_reviews_on_product_id'
  end
end
