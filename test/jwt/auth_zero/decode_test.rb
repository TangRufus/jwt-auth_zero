# frozen_string_literal: true

require 'test_helper'

module JWT
  module AuthZero
    class DecodeTest < MiniTest::Spec
      subject { JWT::AuthZero }

      before do
        subject.configure do |config|
          config.client_id = 'your_client_id'
          config.client_domain = 'your_client_domain'
          config.client_secret = 'your_client_secret'
        end
      end

      it 'decodes valid JWT token' do
        decoded_token = subject.decode token: valid_jwt_token

        decoded_token[0].must_equal valid_jwt_payload
      end

      it 'delegates to JWT.decode' do
        mock = MiniTest::Mock.new
        mock.expect(:call, nil, [valid_jwt_token, subject.client_secret, true, subject.decode_options])

        JWT.stub(:decode, mock) do
          JWT::AuthZero.decode token: valid_jwt_token
        end

        mock.verify
      end

      private

      def valid_jwt_token
        JWT.encode valid_jwt_payload, subject.client_secret, 'HS256'
      end

      def valid_jwt_payload
        {
          'iss' => 'your_client_domain',
          'aud' => 'your_client_id'
        }
      end
    end
  end
end
