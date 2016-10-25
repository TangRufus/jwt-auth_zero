# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'jwt/auth_zero'
require 'minitest/autorun'
require 'minitest/spec'

module MiniTest
  class Spec
    after { JWT::AuthZero.reset! }
  end
end
