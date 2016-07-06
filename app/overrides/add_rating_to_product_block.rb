Deface::Override.new(:virtual_path => 'spree/shared/_products',
                     :name => 'add_rating_to_product_block',
                     :insert_top => ".product-body",
                     :text => "<span class='product_rating'><%= product.rating if product.rating > 0 %></span>")