$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'mechanize_store/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'mechanize_store'
  s.version     = MechanizeStore::VERSION
  s.authors     = ['Wilbert Ribeiro']
  s.email       = ['wkelyson@gmail.com']
  s.licenses    = ['MIT']
  s.homepage    = 'http://www.github.com/wilbert/mechanize-store'
  s.summary     = 'Mechanize store is a couple of models that allows you create a simple products store with rails.'
  s.description = 'With mechanize store you will have Product, ProductPhoto, ProductCategory, Order, OrderStatus, Payment, PaymentStatus, OrderItem and ProductItem'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'simple_form', '3.0.1'
  s.add_dependency 'ransack', '1.1.0'
  s.add_dependency 'will_paginate', '3.0.5'
  s.add_dependency 'bootstrap-will_paginate', '0.0.10'
  s.add_dependency 'font-awesome-rails', '4.1.0.0'
  s.add_dependency 'paperclip', '3.5.3'
  s.add_dependency 'jquery-rails', '~>3.1'
  s.add_dependency 'jquery-turbolinks', '~>2.0'
  s.add_dependency 'turbolinks', '~>2.2'
  s.add_dependency 'sass-rails', '~> 4.0'
  s.add_dependency 'bootstrap-sass', '~> 3.1'
  s.add_dependency 'jbuilder', '~> 1.2'
  s.add_dependency 'jbuilder', '~> 1.2'
  s.add_dependency 'common_helpers'
  
  s.add_development_dependency 'sqlite3', '1.3.9'
  s.add_development_dependency 'guard-livereload'
  s.add_development_dependency 'rack-livereload'
end
