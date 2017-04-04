module Poper
  module Rule
    class Rule
      @all = []

      def self.all
        @all.clone
      end

      def self.inherited(subclass)
        @all << subclass
      end

      def initialize(config = Config.new)
        @config = config
      end
    end
  end
end
