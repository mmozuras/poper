module Poper
  module Rule
    class SingleWord < Rule
      def check(message)
        error_message if message.split.count < 2
      end

      def enabled?
        @config.disallow_single_word_enabled.to_s == 'true'
      end

      private

      def error_message
        'Git commit message should consist of more than a single word'
      end
    end
  end
end
