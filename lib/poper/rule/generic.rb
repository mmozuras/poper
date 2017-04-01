module Poper
  module Rule
    class Generic < Rule
      def check(message)
        words = message.scan(/[\w-]+/).compact
        error_message if words.all? { |word| generic?(word) }
      end

      def enabled?
        @config.disallow_generic_enabled.to_s == 'true'
      end

      private

      def generic?(word)
        disallowed_words.include?(word.downcase)
      end

      def disallowed_words
        if @config.disallow_generic_words.is_a? Array
          @config.disallow_generic_words
        else
          @config.disallow_generic_words.split(',').map(&:strip)
        end
      end

      def error_message
        'Consider writing a more detailed, not as generic, commit message'
      end
    end
  end
end
