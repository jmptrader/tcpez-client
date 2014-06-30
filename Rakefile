# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "tcpez-client"
  gem.homepage = "http://github.com/paperlesspost/tcpez-client"
  gem.license = "MIT"
  gem.summary = %Q{tcpez-client is a basic ruby client for the tcpez protocol}
  gem.description = %Q{tcpez-client provides the basic building blocks for implementing a ruby client for a server that speaks the tcpez protocol}
  gem.email = "aaron@quirkey.com"
  gem.authors = ["Aaron Quint"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
