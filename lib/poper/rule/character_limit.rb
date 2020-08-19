require 'poper/rule/ignore/matching_pattern'

module Poper
  module Rule
    class CharacterLimit < Rule
      include Ignore::MatchingPattern

      def check(message)
        return if should_ignore?(message, ignore_pattern: ignore_message_pattern)

        error_message if message.lines.any? do |line|
          line.chomp.length > character_limit
        end
      end

      def enabled?
        @config.character_limit_enabled.to_s == 'true'
      end

      private

      def character_limit
        @config.character_limit_number.to_i
      end

      def error_message
        "Every line of git commit message should be #{character_limit} chars or less"
      end

      def ignore_message_pattern
        @config.character_limit_ignore_if_message_matches
      end
    end
  end
end
