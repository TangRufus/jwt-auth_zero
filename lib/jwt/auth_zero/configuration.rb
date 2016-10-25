# frozen_string_literal: true

module JWT
  module AuthZero
    class << self
      extend Forwardable

      attr_writer :configuration
      def_delegators :@configuration, :client_secret, :decode_options

      def configuration
        @configuration ||= Configuration.new
      end

      def reset!
        @configuration = Configuration.new
      end

      def configure
        yield(configuration)
      end
    end
  end

  class Configuration
    attr_writer :client_id, :client_domain, :client_secret

    def initialize
      @client_id = nil
      @client_domain = nil
      @client_secret = nil
    end

    def decode_options
      ensure_decode_options_present
      {
        iss: @client_domain,
        aud: @client_id,
        verify_iss: true,
        verify_aud: true,
        verify_iat: true,
        algorithm: 'HS256'
      }
    end

    def client_secret
      raise 'Missing "client_secret" for JWT::AuthZero' if @client_secret.nil?
      @client_secret
    end

    private

    def ensure_decode_options_present
      return unless @client_domain.nil? || @client_id.nil?

      raise 'Missing "client_domain" and "client_id" for JWT::AuthZero' if @client_domain.nil? && @client_id.nil?
      raise 'Missing "client_domain" for JWT::AuthZero' if @client_domain.nil?
      raise 'Missing "client_id" for JWT::AuthZero'
    end
  end
end
