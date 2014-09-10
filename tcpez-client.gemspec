# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: tcpez-client 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "tcpez-client"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Quint"]
  s.date = "2014-09-10"
  s.description = "tcpez-client provides the basic building blocks for implementing a ruby client for a server that speaks the tcpez protocol"
  s.email = "aaron@quirkey.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/tcpez-client.rb",
    "lib/tcpez/client.rb",
    "lib/tcpez/connection.rb",
    "lib/tcpez/pipeline.rb",
    "tcpez-client.gemspec",
    "test/helper.rb",
    "test/test_tcpez.rb"
  ]
  s.homepage = "http://github.com/paperlesspost/tcpez-client"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.1"
  s.summary = "tcpez-client is a basic ruby client for the tcpez protocol"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<innertube>, ["~> 1.1"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<innertube>, ["~> 1.1"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.7"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<innertube>, ["~> 1.1"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.7"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
  end
end

