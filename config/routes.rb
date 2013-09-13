Spree::Core::Engine.routes.draw do
  # Add extension routes here
  get '/admin/taxonomies/:taxonomy_id/taxons/:id/sort_products' => 'admin/taxons#sort_products', :as => :sort_products_taxons
  post '/admin/taxonomies/:taxonomy_id/taxons/:id/update_products' => 'admin/taxons#update_products', :as => :update_products_admin_taxonomy_taxon

end
