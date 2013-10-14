module Poper
  module Rule
    class SingleWord < Rule
      MSG = 'Commit message should consist of more than a single word'

      def check(message)
        MSG if message.split.count < 2
      end
    end
  end
end
