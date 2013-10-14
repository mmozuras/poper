require 'spec_helper'

module Poper
  module Rule
    describe Capitalization do
      describe '#check' do
        let(:rule) { Capitalization.new }
        subject { rule.check(message) }

        context 'capitalized message' do
          let(:message) { 'Implement that feature' }
          it { should be_nil }
        end

        context 'non-capitalized message' do
          let(:message) { 'implement that feature' }
          it { should == 'Commit message should start with a capital letter' }
        end
      end
    end
  end
end
