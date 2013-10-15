require 'spec_helper'

module Poper
  module Rule
    describe FiftyCharSummary do
      describe '#check' do
        let(:rule) { FiftyCharSummary.new }
        subject { rule.check(message) }

        context 'fifty char summary' do
          let(:message) { 'Implement that feature - really really really well' }
          it { should be_nil }
        end

        context 'fifty-one char summary' do
          let(:message) { 'Implement that feature - really really really well.' }
          it { should_not be_nil }
        end
      end
    end
  end
end
