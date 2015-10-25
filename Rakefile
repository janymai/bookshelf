require 'rake'
require 'rake/testtask'
require 'lotus/environment'
require Lotus::Environment.new.env_config

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do
  task :seed do
    load 'db/seed.rb'
  end
end
