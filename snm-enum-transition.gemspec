require_relative "lib/snm/enum/transition/version"

Gem::Specification.new do |spec|
  spec.name        = "snm-enum-transition"
  spec.version     = Snm::Enum::Transition::VERSION
  spec.authors     = ["snmmaurya"]
  spec.email       = ["snmspace@gmail.com"]
  spec.homepage    = "https://github.com/snmmaurya/snm-enum-transition"
  spec.summary     = "Summary of Snm::Enum::Transition."
  spec.description = "Description of Snm::Enum::Transition."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/snmmaurya/snm-enum-transition"
  spec.metadata["changelog_uri"] = "https://github.com/snmmaurya/snm-enum-transition"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.8.4"
end
