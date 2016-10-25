# frozen_string_literal: true

require 'test_helper'

module JWT
  module AuthZero
    # Gem identity information.
    class IdentityTest < MiniTest::Spec
      subject { Identity }

      it 'is named jwt/auth_zero' do
        assert_equal 'jwt-auth_zero', subject.name
      end

      it 'has a version number' do
        refute_nil subject.version
      end
    end
  end
end
