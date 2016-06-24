# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json/schema/data_generator/version'
require 'json/schema/data_generator/generator' # TODO - shouldn't have to do this?

Gem::Specification.new do |spec|
  spec.name          = "json-schema-data_generator"
  spec.version       = JSON::Schema::DataGenerator::VERSION
  spec.authors       = ["Michael Chapman"]
  spec.email         = ["michaelc@hooroo.com"]

  spec.summary       = %q{Generate sample JSON data based on a JSON schema}
  spec.homepage      = "https://github.com/hooroo/json-schema-data_generator"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/).reject{ |f| f =~ /\.(git|rspec|bundle|ruby-version)|docker-compose\.yml|(^config\/)/ }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'byebug'
  spec.add_runtime_dependency 'json-schema', '~> 2.5'
  spec.add_runtime_dependency 'faker', '~> 1.6'
end
