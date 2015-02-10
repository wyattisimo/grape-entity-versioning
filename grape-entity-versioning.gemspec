Gem::Specification.new do |s|
  s.name     = "grape-entity-versioning"
  s.version  = "0.1"
  s.platform = Gem::Platform::RUBY
  s.homepage = "http://github.com/wyattisimo/grape-entity-versioning"
  s.summary  = "Provides a simple DSL for managing multiple versions of grape entities."
  s.author   = "Jared Wyatt"
  s.email    = "j@wyatt.co"
  s.license  = "MIT"

  s.files        = Dir.glob("lib/*") + %w(LICENSE README.md)
  s.require_path = "lib"
end
