Deface::Override.new( :name => "add_sort_products_link",
                      :virtual_path => "spree/admin/taxonomies/edit",
                      :insert_after => "fieldset",
                      :text => "<%= render 'spree/admin/taxonomies/sort_products_js' %>")