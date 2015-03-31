$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "t1k/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "t1k"
  s.version     = T1k::VERSION
  s.authors     = ["Rodrigo Maia"]
  s.email       = ["rodrigomb@gmail.com"]
  s.summary     = "T1K - Automated Git and Trello Workflow"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  
  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "ruby-trello", "1.2.1"
  s.add_dependency "github_api", "~> 0.12.3"
end
