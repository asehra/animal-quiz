require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'

  desc 'run specs'
  RSpec::Core::RakeTask.new(:spec)

  desc 'run features'
  RSpec::Core::RakeTask.new(:features) do |t|
    t.pattern = './spec{,/*/**}/*.feature'
    t.rspec_opts = ['-r turnip/rspec']
  end
rescue LoadError
end

task default: [:spec, :features]