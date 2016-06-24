require 'rspec/core/rake_task'
require 'gem_publisher'

RSpec::Core::RakeTask.new(:spec)

task ci: [:spec]

task default: :ci