# MechanizeStore


E-Commerce Rails Engine. Much like Spree, but simpler

This project rocks and uses MIT-LICENSE.

## Usage

Create new rails 4.0 app
	
	rails _4.0.4_ new my_store
	
Add the gem in the Gemfile:

	# Gemfile
	gem 'simple_form'
	gem 'paperclip'
	gem 'ransack'
	gem 'will_paginate'
	gem 'mechanize_store'

	$ bundle install


Copy the migrations and run it:

    $ rake mechanize_store:install:migrations
    
    $ rake db:migrate

So far all the models should be acessable by Console:

	$ rails console
	
	MechanizeStore::Product.count # => 0
	

Mount routes:

	# routes.rb
	mount MechanizeStore::Engine, at: '/'
	
With that all the main CRUD operations are available:

	rake routes
	
Create the default Manager mannualy

	$ rails c
	manager = MechanizeStore::Manager.new
	manager.name = 'Default Manager'
	manager.email = 'manager@mechanize.store'
	manager.password = 'managermanager'
	manager.save


## Models

These project was created to encapsulate a commom models of an MechanizeStore application, these model are:

	MechanizeStore::Flag
	MechanizeStore::Freight
	MechanizeStore::Order
	MechanizeStore::OrderItem
	MechanizeStore::Payment
	MechanizeStore::PaymentType
	MechanizeStore::Product
	MechanizeStore::ProductCategory
	MechanizeStore::ProductPhoto
	MechanizeStore::ProductSection	
	
	
## Checkout Process

Register Products:

	product = MechanizeStore::Product.new
	…
	# TODO: add documentation
	

## Admin Dashboard
	


### To Do

* create taks to add sample data
* add Devise to authentication
* add generator of Admin dashboard
* add default i18n translation

### Old documentation
	
* Flag (For credit cards flag)
	- name
	
* ProductCategory
    - name

* Product
    - name
    - price
    - description
    - short_description
    - weight
    - height
    - length
    - product_category_id

* ProductPhoto
    - file (a paperclip attachment)
    - product_id

* Payment
    - payable (a polymorphic association)
    - value
    - paid_value
    - paid_in
    - flag_id
    - payment_status
    - payment_type

* Order
    - order_status
    - store
    - delivery_date

* Store
    - name
    - url 
    - key


	

= Using custom layouts in default interface

If you want customize laura layout, add this line above to your application.rb in you config.

	config.to_prepare do
        MechanizeStore::ApplicationController.layout "yourlayoutname"
    end

Your layout must have paths with this notation, or it will not works. Ex:

    main_app.root_path

Creates a yield for menu actions called :right. Ex:
    
    <ul>
        <%= yield(:right) %>
    </ul>