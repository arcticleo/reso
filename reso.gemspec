
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reso/version"

Gem::Specification.new do |spec|
  spec.name          = "reso"
  spec.version       = RESO::VERSION
  spec.authors       = ["Michael Edlund"]
  spec.email         = ["medlund@mac.com"]

  spec.summary       = %q{Implementation of the RESO Data Dictionary'.}
  spec.description   = %q{Implementation of the Real Estate Standard Organization's Data Dictionary}
  spec.homepage      = "https://github.com/arcticleo/reso"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.required_ruby_version = '>= 3.1.1'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.3.15"
  spec.add_development_dependency "rake", ">= 13.0.6"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.5.4"
  spec.add_dependency "activerecord", "~> 7.0.4"
  spec.add_dependency "nokogiri", ">= 1.13.9"
end
