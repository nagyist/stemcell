# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'stemcell/version'

Gem::Specification.new do |s|
  s.name          = "stemcell"
  s.version       = Stemcell::VERSION
  s.authors       = ["Martin Rhoads", "Igor Serebryany", "Nelson Gauthier", "Patrick Viet"]
  s.email         = ["igor.serebryany@airbnb.com"]
  s.description   = %q{A tool for launching and bootstrapping EC2 instances}
  s.summary       = %q{no summary}
  s.homepage      = "https://github.com/airbnb/stemcell"
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # pins several aws sdk transitive dependencies to maintain compatibility with Ruby < 2.3
  s.add_runtime_dependency 'aws-sdk-core',    '~> 3.130.2'
  s.add_runtime_dependency 'aws-eventstream', '~> 1.1.1'
  s.add_runtime_dependency 'aws-sdk-ec2',     '~> 1'
  s.add_runtime_dependency 'aws-sigv4',       '~> 1.2.4'
  s.add_runtime_dependency 'net-ssh',         '~> 7.1'
  if RUBY_VERSION >= '2.0'
    s.add_runtime_dependency 'chef',     '>= 11.4.0'
  else
    s.add_runtime_dependency 'chef',     ['>= 11.4.0', '< 19.0.0']
  end

  s.add_runtime_dependency 'nokogiri', '~> 1.16.0'
  s.add_runtime_dependency 'ffi-yajl', '< 2.3.1'

  s.add_runtime_dependency 'trollop',    '~> 2.1'
  s.add_runtime_dependency 'aws-creds',  '~> 0.2.3'
  s.add_runtime_dependency 'colored',    '~> 1.2'
  s.add_runtime_dependency 'json',       '>= 1.8.2'
end
