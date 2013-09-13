module Spree
  Taxon.class_eval do
    has_many :products, :through => :classifications, :order => 'spree_products_taxons.position'
  end
end