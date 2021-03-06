# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_grid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bruno"]
  gem.email         = ["email@provider.com"]
  gem.description   = %q{This gem uses jQuery Data Tables to generate grids in Ruby on Rails applications}
  gem.summary       = %q{jquery datatables for rails apps}
  gem.homepage      = "https://github.com/brunfb/simple_grid"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple_grid"
  gem.require_paths = ["lib"]
  gem.version       = SimpleGrid::VERSION
  gem.add_dependency "rails", ">= 3.1.3"
end
