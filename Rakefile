require 'bundler/gem_tasks'
require 'bundler/setup'
require 'rspec/core/rake_task'

require 'racebox/core/version'

RSpec::Core::RakeTask.new('test')

task default: [:release]

task :release do
  version = Racebox::Core::VERSION
  puts "Releasing #{version}, y/n?"
  exit(1) unless STDIN.gets.chomp == 'y'
  sh 'gem build racebox-core.gemspec'
  # sh 'gem build racebox-core.gemspec && ' \
  #    "gem push racebox-core-#{version}.gem && " \
  #    "git tag v#{version} && " \
  #    'git push --tags'
end