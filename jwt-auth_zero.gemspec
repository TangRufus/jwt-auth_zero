# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'jwt/auth_zero/identity'

Gem::Specification.new do |spec|
  spec.name = JWT::AuthZero::Identity.name
  spec.version = JWT::AuthZero::Identity.version
  spec.platform = Gem::Platform::RUBY
  spec.authors = ['Tang Rufus']
  spec.email = ['tangrufus@gmail.com']
  spec.homepage = 'https://github.com/tangrufus/jwt-auth_zero'
  spec.summary = 'Seamless JWT decoding for Auth0'
  spec.description = 'JWT::AuthZero is a lightweight wrapper for the JWT gem that decodes Auth0 tokens for you.'
  spec.license = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  if ENV['RUBY_GEM_SECURITY'] == 'enabled'
    spec.signing_key = File.expand_path('~/.ssh/gem-private.pem')
    spec.cert_chain = File.expand_path('certs/tangrufus.pem')
  end

  spec.add_dependency 'jwt', '>= 1.3.0', '< 2'

  spec.add_development_dependency 'appraisal', '~> 2.1.0'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'gemsmith', '~> 7.7'
  spec.add_development_dependency 'rubocop', '~> 0.40'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.6.0'
  spec.add_development_dependency 'minitest', '~> 5.9', '>= 5.9.1'

  spec.files = Dir['lib/**/*', 'vendor/**/*']
  spec.extra_rdoc_files = Dir['README*', 'LICENSE*']
  spec.require_paths = ['lib']
end
