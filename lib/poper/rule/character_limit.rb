module Poper
  module Rule
    class CharacterLimit < Rule
      def check(message)
        error_message if message.lines.any? do |line|
          line.length > character_limit
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
    end
  end
end
