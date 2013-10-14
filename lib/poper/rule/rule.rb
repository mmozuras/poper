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
    end
  end
end
