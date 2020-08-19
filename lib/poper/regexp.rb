# A regular expression that may be initialized with any value that responds to `to_s`.
#
# @param [Object] init_value
#   The value from which to create a regular expression. Must respond to `to_s`.
#   If `init_value` is `true`, the regular expression will match against all strings.
#   If `init_value` is `false` or `nil`, the regular expression will match against no strings.
#
# @param [Object] options
#   From 'https://ruby-doc.org/core-2.3.0/Regexp.html#method-c-new':
#   'If options is an Fixnum, it should be one or more of the constants Regexp::EXTENDED,
#   Regexp::IGNORECASE, and Regexp::MULTILINE, or-ed together.
#   'Otherwise, if options is not nil or false, the regexp will be case insensitive.'
module Poper
  class Regexp < ::Regexp
    ANY_STRING_MATCHER = ''
    NO_STRING_MATCHER = '.^'
    INIT_VALUES_MATCHING_ALL_STRINGS = [true].freeze
    INIT_VALUES_MATCHING_NO_STRINGS = [nil, false].freeze

    def initialize(init_value, options = nil)
      @init_value = init_value
      super(modified_init_value, options)
    end

    private

    attr_reader :init_value

    def modified_init_value
      case init_value
      when *INIT_VALUES_MATCHING_ALL_STRINGS
        ANY_STRING_MATCHER
      when *INIT_VALUES_MATCHING_NO_STRINGS
        NO_STRING_MATCHER
      else
        init_value.to_s
      end
    end
  end
end
