module Spree  
  class ProductsTaxon < ActiveRecord::Base
    attr_accessible :position
    
    belongs_to :product
    belongs_to :taxon
  end
end
