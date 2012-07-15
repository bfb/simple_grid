# SimpleGrid

SimpleGrid is the most easy way to transform your CRUD in a powerful jQuery Data Table grid.

## Requisites

* Rails 3.1 (asset pipeline) - You can run it in minor versions but you need to add the assets manually (not tested yet).

## Installation

Install the gem:

	$ gem install simple_grid

Add this line to your Rails application Gemfile:

	gem 'simple_grid'

Execute:

	$ bundle install
	$ rails generate simple_grid:install

Include the SimpleGrid helper in your ApplicationHelper:

	module ApplicationHelper
	  include SimpleGrid::Helpers
	end
		
Load the assets in your application.

## Usage

Is very easy to use the SimpleGrid gem, suppose that we have the tables Books and Authors. Each book has an author and an author has many books.

To use the gem in our book index view we need to call the method simple_grid. Like below:
		
	<%= simple_grid(@books) %>
	# The first parameter is our records based on ActiveRecord.
	# In this example it will display a grid with all table columns and the actions show, edit and destroy.

The second parameter can be an options hash, see the examples below:

In this example it will not display the columns present in :exclude_columns array

	<%= simple_grid(@books, :exclude_columns => ["id","description","created_at","updated_at"]) %>

In this example it will not display the columns "id" and "description" but it will display an extra column with the author name based in our relationship.

	<%= simple_grid(@books, :exclude_columns => ["id","description"],
		:extra_columns => {
			:author_name => { :label => "Author", :relationship => "author.name" }
		}) %>
	# The :label key is the column title and the :relationship key is our models relationship.

In this example it will add a new column with label "New column" and the content as html.

	<%= simple_grid(@books, :exclude_columns => ["id","description"],
		:extra_columns => {
			:author_name => { :label => "Author", :relationship => "author.name" },
			:other_column => { :label => "New Column", :content => "<strong>Content</strong>" }
		}) %>

In this example it will display the actions based in the hash options.

	<%= simple_grid(@books, :exclude_columns => ["id","description"],
		:extra_columns => {
			:author_name => { :label => "Author", :relationship => "author.name" }
		},
		:actions => {
			:show => { :label => "View", :html => { :id => "show_info" } },
			:edit => { :route => "my_route" },
			:destroy => { :display => false }
		}) %>
	# The action show will be displayed with label "View" and the id "show_info" in the html element.
	# The action edit will use the route "my_route" (it will interprete as "my_route(record)").
	# The action destroy will not be displayed.

## TODO

* Enhance the jQuery DataTables Api
* Code refactor
* Organize assets
* Tests
* Test and extend to others ORMs
* Add i18n support

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This gem is licensed under the MIT License.
DataTables is dual licensed under the [GPL v2](http://datatables.net/license_gpl2) license or a [BSD (3-point)](http://datatables.net/license_bsd) license.
DataTables designed and created by SpryMedia.