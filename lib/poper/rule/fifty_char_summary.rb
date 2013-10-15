module Poper
  module Rule
    class FiftyCharSummary < Rule
      MSG = 'Summary should be 50 chars or less'

      def check(message)
        MSG if message.lines.first.length > 50
      end
    end
  end
end
