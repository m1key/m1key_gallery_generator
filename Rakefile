require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new(:minitest) do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: [:minitest, :spec]
