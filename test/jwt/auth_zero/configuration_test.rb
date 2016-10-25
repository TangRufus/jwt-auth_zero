# frozen_string_literal: true

require 'test_helper'

module JWT
  module AuthZero
    class ConfigurationTest < MiniTest::Spec
      subject { JWT::AuthZero }

      it 'ables to set new client_secret value' do
        subject.configure do |config|
          config.client_secret = 'my_client_secret'
        end

        subject.client_secret.must_equal 'my_client_secret'
      end

      it 'raises RuntimeError if client_secret not set' do
        err = proc { subject.client_secret }.must_raise RuntimeError
        err.message.must_equal 'Missing "client_secret" for JWT::AuthZero'
      end

      it 'composes decode_options' do
        subject.configure do |config|
          config.client_id = 'my_client_id'
          config.client_domain = 'my_client_domain'
        end

        subject.decode_options.must_equal valid_decode_options
      end

      it 'raises RuntimeError if client_domain not set' do
        subject.configure do |config|
          config.client_id = 'my_client_id'
        end

        err = proc { subject.decode_options }.must_raise RuntimeError
        err.message.must_equal 'Missing "client_domain" for JWT::AuthZero'
      end

      it 'raises RuntimeError if client_id not set' do
        subject.configure do |config|
          config.client_domain = 'my_client_domain'
        end

        err = proc { subject.decode_options }.must_raise RuntimeError
        err.message.must_equal 'Missing "client_id" for JWT::AuthZero'
      end

      it 'raises RuntimeError if both client_id and client_domain not set' do
        err = proc { subject.decode_options }.must_raise RuntimeError
        err.message.must_equal 'Missing "client_domain" and "client_id" for JWT::AuthZero'
      end

      private

      def valid_decode_options
        {
          iss: 'my_client_domain',
          aud: 'my_client_id',
          verify_iss: true,
          verify_aud: true,
          verify_iat: true,
          algorithm: 'HS256'
        }
      end
    end
  end
end
