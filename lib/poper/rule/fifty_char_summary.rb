module Poper
  module Rule
    class FiftyCharSummary < Rule
      MSG = 'Git commit message summary (first line) should be 50 chars or less'

      def check(message)
        MSG if message.lines.first.chomp.length > 50
      end
    end
  end
end
