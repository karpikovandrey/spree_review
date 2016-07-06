Deface::Override.new(:virtual_path => 'spree/layouts/admin',
                     :name => 'add_link_to_admin_main_menu',
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :partial => "spree/admin/reviews/main_menu")