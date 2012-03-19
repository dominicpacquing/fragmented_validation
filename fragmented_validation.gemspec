# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fragmented_validation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paul Pacquing"]
  gem.email         = ["dominicpacquing@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fragmented_validation"
  gem.require_paths = ["lib"]
  gem.version       = FragmentedValidation::VERSION

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "activemodel"

end

