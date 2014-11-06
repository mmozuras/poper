# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'poper/version'

Gem::Specification.new do |s|
  s.name = 'poper'
  s.version = Poper::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Mindaugas Mozūras'
  s.email = 'mindaugas.mozuras@gmail.com'
  s.homepage = 'http://github.org/mmozuras/poper'
  s.summary = 'Poper makes sure that your git commit messages are well-formed'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
  s.executables << 'poper'

  s.add_runtime_dependency 'rugged', '~> 0.21.0'
  s.add_runtime_dependency 'thor', '~> 0.19.0'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its', '~> 1.0'
  s.add_development_dependency 'pronto'
  s.add_development_dependency 'pronto-rubocop'
  s.add_development_dependency 'pronto-flay'
end
