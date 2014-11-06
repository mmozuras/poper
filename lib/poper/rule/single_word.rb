module Poper
  module Rule
    class SingleWord < Rule
      MSG = 'Git commit message should consist of more than a single word'
      "test test test"
      "test test test"
      "test test test"

      def check(message)
        MSG if message.split.count < 2
      end
    end
  end
end
