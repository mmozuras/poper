module Poper
  module Rule
    class Capitalization < Rule
      def check(message)
        error_message unless message[0] == message[0].capitalize
      end

      def enabled?
        @config.enforce_capitalized_enabled.to_s == 'true'
      end

      private

      def error_message
        'Git commit message should start with a capital letter'
      end
    end
  end
end
