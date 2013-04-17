# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sort_products'
  s.version     = '1.3.3'
  s.summary     = 'Spree Sort Products gives you ability to sort products with in a taxon for spree.'
  s.description = 'Spree Sort Products extends the ability of a taxon on its products to be sorted from the web interface using the drag and drop behavior.'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = 'Surya Tripathi'
  s.email     = 'raj.surya19@gmail.com'
  s.homepage  = 'https://github.com/suryart/spree_sort_products'

  s.files        = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.0'
  s.add_dependency 'jquery-dragsort-rails', '~> 1.0.0'

  s.add_development_dependency 'capybara', '~> 2.0.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.0'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'guard-rspec',  '~> 2.3'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
