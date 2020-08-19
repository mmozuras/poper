require 'poper/regexp'

# Provides an interface to determine whether a rule should be ignored.
# Matches a string against a pattern to make this determination.
module Poper
  module Rule
    module Ignore
      module MatchingPattern
        def should_ignore?(string, ignore_pattern: nil)
          Regexp.new(ignore_pattern).match?(string)
        end
      end
    end
  end
end
