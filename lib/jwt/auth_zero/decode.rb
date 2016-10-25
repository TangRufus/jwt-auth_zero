# frozen_string_literal: true

module JWT
  module AuthZero
    class << self
      def decode(token:)
        JWT.decode(token, client_secret, true, decode_options)
      end
    end
  end
end
