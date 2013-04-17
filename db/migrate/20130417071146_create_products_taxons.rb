class CreateProductsTaxons < ActiveRecord::Migration
  def change
    add_column :spree_products_taxons, :id, :primary_key
    add_column :spree_products_taxons, :position, :integer, :default => 0
  end
end
