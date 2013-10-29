# Welcome to Spree Sort Products

Spree Sort Products extends the ability of a taxon on its products to be sorted from the web interface using the drag and drop behavior.

Here is a quick walk through of sorting products using this extension: [Click here to see the steps](https://github.com/suryart/spree_sort_products/wiki/sort-products)

## Installation

### Inside your rails application with Spree installed include the following line in your Gemfile:
  * Get the latest greatest from github: 
    
      ```ruby
        gem 'jquery-dragsort-rails', '~> 1.0.0'
        gem 'spree_sort_products' , :git => 'git://github.com/suryart/spree_sort_products.git'
      ```

  * Get the 2-0-stable branch for Spree 2.0.x from github: 
    
      ```ruby
        gem 'jquery-dragsort-rails', '~> 1.0.0'
        gem 'spree_sort_products' , :git => 'git://github.com/suryart/spree_sort_products.git', :branch => '2-0-stable'
      ```

  * Or get it from rubygems.org by mentioning the following line in your Gemfile:
    
      ```ruby 
        gem 'jquery-dragsort-rails', '~> 1.0.0'
        gem 'spree_sort_products', '2.0.0'
      ```

### Then run the following commands: 

    $ bundle install
    $ rails g spree_sort_products:install 
    $ rake db:migrate
    $ rails s 
    

Please note that this extension uses [jquery-dragsort-rails](https://github.com/suryart/jquery-dragsort-rails) to achieve 3D sorting.

## Caution

Just make sure that you have **admin/taxon_tree_menu_overrides** and **admin/sort_products** files precompiled. If it's not happening by default then please add/edit this in your **config/environments/production.rb** file:

        Rails.application.config.assets.precompile += %w(admin/taxon_tree_menu_overrides admin/sort_products)

## TODOs

* Write test cases.

## LINKS

* Dependency status: [![Dependency Status](https://gemnasium.com/suryart/spree_sort_products.png)](https://gemnasium.com/suryart/spree_sort_products)
* Code climate: [![Code Climate](https://codeclimate.com/github/suryart/spree_sort_products.png)](https://codeclimate.com/github/suryart/spree_sort_products)
* Issues: [Project issues](https://github.com/suryart/spree_sort_products/issues)

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_sort_products/factories'
```

## Contributing

1. [Fork](https://help.github.com/articles/fork-a-repo) the project
2. Make one or more well commented and clean commits to the repository. You can make a new branch here if you are modifying more than one part or feature.
3. Add tests for it. This is important so I don’t break it in a future version unintentionally.
4. Perform a [pull request](https://help.github.com/articles/using-pull-requests) in github's web interface.

## NOTE

The current version supports Spree 1.3.0 or above. Older versions of Spree are unlikely to work, so attempt at your own risk. Just send pull requests of patches for different versions, I will be happy to release your patch.

## License
Copyright (c) 2013 Surya Tripathi, released under the New BSD License
