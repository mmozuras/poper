require 'poper/rule/ignore/matching_pattern'

module Poper
  module Rule
    class SummaryCharacterLimit < Rule
      include Ignore::MatchingPattern

      def check(message)
        summary = message.lines.first.chomp
        return if should_ignore?(summary, ignore_pattern: ignore_summary_pattern)

        error_message if summary.length > character_limit
      end

      def enabled?
        @config.summary_character_limit_enabled.to_s == 'true'
      end

      private

      def character_limit
        @config.summary_character_limit_number.to_i
      end

      def error_message
        "Git commit message summary (first line) should be #{character_limit} chars or less"
      end

      def ignore_summary_pattern
        @config.summary_character_limit_ignore_if_summary_matches
      end
    end
  end
end
