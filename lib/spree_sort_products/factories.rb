FactoryGirl.define do
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_sort_products/factories'

  sequence :name do |n|
    "Taxon #{n}"
  end

  factory :products_with_taxon, :class => Spree::Taxonomy do
    name
    after(:create) do |taxonomy|
      taxon = taxonomy.root
      1.upto(10).each do |i|
        product = FactoryGirl.create(:product)
        taxon.products << product unless taxon.products.include? product
      end
    end
  end
end
