require 'spec_helper'

module Poper
  module Rule
    describe SingleWord do
      describe '#check' do
        let(:rule) { SingleWord.new }
        subject { rule.check(message) }

        context 'zero word message' do
          let(:message) { ' ' }
          it { should_not be_nil }
        end

        context 'single word message' do
          let(:message) { 'Fix' }
          it { should_not be_nil }
        end

        context 'multiple word message' do
          let(:message) { 'Implement that feature' }
          it { should be_nil }
        end
      end
    end
  end
end
