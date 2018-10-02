# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 't1k/version'

Gem::Specification.new do |spec|
  spec.name          = "t1k"
  spec.version       = T1k::VERSION
  spec.authors       = ["Rodrigo Maia", "Felipe Aquino", "Fernando Martinez"]
  spec.email         = ["rodrigomb@gmail.com", "aquinofb@gmail.com", "fernando.xps@gmail.com"]

  spec.homepage    = "https://github.com/fortesinformatica/t1k"
  spec.summary     = "T1K - Automated Git and Trello Workflow"
  spec.description = "Use those scripts to create automatically branchs associated with issues and tracked commits."
  spec.license     = "MIT"

  spec.files         = Dir["./**/*", "resources/**/*", "Rakefile", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["t1k"]
  spec.require_paths = ["lib", "resources"]

  spec.add_development_dependency 'bundler'   , '~> 1.9'
  spec.add_development_dependency 'rake'      , '~> 10.0'
  spec.add_development_dependency 'simplecov' , '~>0.11.2'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'ruby-trello'  , '~> 2.1'
  spec.add_dependency 'github_api'   , '~> 0.18'
  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'clive'        , '~> 1.2.1'
  spec.add_dependency 'bitbucket_rest_api'
end
