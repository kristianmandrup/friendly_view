source :rubygems

gem 'rails', '~> 3.2'

gem 'fabrication'
gem 'gmaps4rails', path: '/Users/kmandrup/private/repos/Google-Maps-for-Rails'

gem 'world-flags',        '~> 0.6.3'
gem 'pictos-icons',       '>= 0.2.0'
gem 'social_icons',       '~> 0.3.0'
gem 'credit_card_icons',  '~> 0.1.0'

gem 'easy_as_pie',        '>= 0.1.0'

gem 'rails-gallery',      '~> 0.2.0'

gem 'partializer',        '~> 0.1.0'

gem 'cells', path: '/Users/kmandrup/private/repos/cells'
gem 'apotomo', '~> 1.2.3', path: '/Users/kmandrup/private/repos/apotomo' #  git: 'git://github.com/kristianmandrup/apotomo.git' 

gem "social-buttons",     '~> 0.3.0', require: 'social_buttons'

gem 'lorem_ipsum'

gem "jquery-rails"

gem 'gmaps-autocomplete-rails', '~> 0.1.1', git: 'git://github.com/kristianmandrup/gmaps-autocomplete-rails.git'

gem 'rails3-jquery-autocomplete', git: 'git://github.com/kristianmandrup/rails3-jquery-autocomplete.git'

# gem 'jquery_ui_rails_helpers'

gem 'jquery-ui-bootstrap-rails', git: 'git://github.com/kristianmandrup/jquery-ui-bootstrap-rails.git'

gem 'flexlayout-rails', '~> 0.1.4'
gem 'modernizr-rails', git: 'git://github.com/bmccoelho/modernizr-rails.git'

gem 'twitter_bootstrap-kaminari-views'
gem 'bootstrap-wysihtml5-rails'
gem 'bootstrap-addons-rails'

gem 'semantic-sass-bootstrap', '~> 0.1.1', path: '/Users/kmandrup/private/repos/semantic-sass-bootstrap'

# Microdata lib with HAML helpers etc. :)
gem 'green_monkey', git: 'git://github.com/kristianmandrup/green_monkey.git'

gem "haml", ">= 3.0.0"
gem "haml-rails"

gem 'masonry-rails', '~> 0.1'

gem 'tabulous'
gem 'client_side_validations'

# gem 'formtastic', '>= 2.1.0'
gem 'formtastic-bootstrap', '~> 2.0.0'
# gem 'fancy-buttons'

# Utils
gem 'json_pure'
gem 'draper'
# rails generate decorator article

gem 'mongoid', '~> 3'

gem 'places' # Google Places API :)

gem 'pry'

gem 'picturefill-rails'

# Also see 'picturefill-rails'
gem 'clear_eyes' # For Retina images
# = r_image_tag('my_awesome_image@2x.jpg')
# This assumes that my_awesome_image@2x.jpg is sized properly for retina images. Remember, Retina images are double the pixel density of standard images.

# Running this: rake clear_eyes:convert will convert create non-retina images from the images in app/assets/images. It's even take care of the file names! Pretty cool right? So, my_awesome_image@2x.jpg will automatically be copied, downsized and named my_awesome_image.jpg.

require File.dirname(__FILE__) + '/lib/gem_butler'

butler = GemButler.new File.dirname(__FILE__) + '/gemfiles'
butler.include_only :names => [:assets, :test]
butler.print_gemfile_names

butler.filtered.each do |gemfile|
  eval(IO.read(gemfile), binding)
end

