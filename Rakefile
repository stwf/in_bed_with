require 'bundler'
require "rspec/core/rake_task"

Bundler::GemHelper.install_tasks


desc "Run all unit specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./spec/**/*_spec.rb"
  t.rspec_opts = %w[--color]
end
