module Poper
  module Rule
    class Generic < Rule
      MSG = 'Consider writing a more detailed, not as generic, commit summary'
      GENERIC = %w(fix fixed fixes oops todo fixme commit changes hm hmm hmmm
                   test tests quickfix)

      def check(message)
        words = message.scan(/[\w-]+/).compact
        MSG if words.all? { |word| GENERIC.include?(word.downcase) }
      end
    end
  end
end
