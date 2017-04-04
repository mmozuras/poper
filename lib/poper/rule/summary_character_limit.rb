module Poper
  module Rule
    class SummaryCharacterLimit < Rule
      def check(message)
        error_message if message.lines.first.chomp.length > character_limit
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
    end
  end
end
