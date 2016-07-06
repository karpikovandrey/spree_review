Deface::Override.new(:virtual_path => 'spree/products/show',
                     :name => 'add_reviews_to_product_show',
                     :insert_after => "[data-hook='cart_form']",
                     :partial => "spree/reviews/index")

Deface::Override.new(:virtual_path => 'spree/products/show',
                     :name => 'add_fast_review_to_product_show',
                     :insert_before => "[data-hook='description']",
                     :partial => "spree/reviews/fast_review")