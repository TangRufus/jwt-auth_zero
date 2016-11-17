# frozen_string_literal: true

unless ENV['TRAVIS']
  require 'gemsmith/rake/setup'
  Dir.glob('lib/tasks/*.rake').each { |file| load file }
end

task default: %w(test rubocop)
