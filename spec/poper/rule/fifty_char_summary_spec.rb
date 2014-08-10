require 'spec_helper'

module Poper
  module Rule
    describe FiftyCharSummary do
      describe '#check' do
        let(:rule) { FiftyCharSummary.new }
        subject { rule.check(msg) }

        context 'fifty char summary' do
          let(:msg) { 'Implement that feature - really really really well' }
          it { should be_nil }
        end

        context 'fifty-one char summary' do
          let(:msg) { 'Implement that feature - really really really well.' }
          it { should_not be_nil }
        end
      end
    end
  end
end
