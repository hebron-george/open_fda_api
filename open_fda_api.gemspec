# frozen_string_literal: true

require_relative "lib/open_fda_api/version"

Gem::Specification.new do |spec|
  spec.name          = "open_fda_api"
  spec.version       = OpenFdaApi::VERSION
  spec.authors       = ["Hebron George"]
  spec.email         = ["hebrontgeorge@gmail.com"]

  spec.summary       = "Ruby wrapper for the openFDA API: https://open.fda.gov/apis/"
  spec.description   = "A Ruby gem for interacting with the openFDA API, providing access to drugs, " \
                       "devices, food, tobacco, animal & veterinary, and other FDA datasets."
  spec.homepage      = "https://github.com/hebron-george/open_fda_api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.1.0")

  spec.metadata["homepage_uri"]        = spec.homepage
  spec.metadata["source_code_uri"]     = spec.homepage
  spec.metadata["changelog_uri"]       = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0"
end
