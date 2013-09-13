require 'spec_helper'

describe 'Taxon' do
  stub_authorization!
  
  context 'admin should be able sort products within a taxon' do
    it 'goes in a taxon and sort products' do
      create_list(:products_with_taxon, 4)

      visit spree.admin_path

      click_link "Configuration"

      click_link "Taxonomies"

      # sleep(10)
      # need to write drag and drop and expected result check here

    end
  end
end
