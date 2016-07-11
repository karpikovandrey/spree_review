Deface::Override.new(:virtual_path => 'spree/shared/_products',
                     :name => 'add_rating_to_product_block',
                     :insert_top => ".product-body",
                     :text => "<span class='product_rating'><%= product.average_rating if product.average_rating > 0 %></span>")