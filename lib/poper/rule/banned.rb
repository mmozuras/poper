module Poper
  module Rule
    class Banned < Rule
      MSG = 'Consider writing a more detailed commit summary'
      BANNED = %w(fix fixed oops todo fixme commit changes hmm hmmm quickfix)

      def check(message)
        MSG if BANNED.include?(message.lines.first.strip.downcase)
      end
    end
  end
end
