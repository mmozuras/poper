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
  s.required_ruby_version = '>= 2.0.0'
  s.license = 'MIT'

  s.files = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
  s.executables << 'poper'

  s.add_runtime_dependency('rugged', '~> 0.23')
  s.add_runtime_dependency('thor', '~> 0.19')
  s.add_development_dependency('rake', '~> 12.0')
  s.add_development_dependency('rspec', '~> 3.4')
  s.add_development_dependency('rspec-its', '~> 1.2')
  s.add_development_dependency('bundler', '~> 1.3')
  s.add_development_dependency('simplecov', '~> 0.14')
  s.add_development_dependency('codeclimate-test-reporter', '~> 1.0')
  s.add_development_dependency('pry', '~> 0.10')
end
