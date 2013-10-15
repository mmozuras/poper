require 'spec_helper'

module Poper
  module Rule
    describe Banned do
      describe '#check' do
        let(:rule) { Banned.new }
        subject { rule.check(message) }

        context 'non-banned commit message' do
          let(:message) { 'Implement that feature' }
          it { should be_nil }
        end

        context 'banned commit messages' do
          context ' fix' do
            let(:message) { ' fix' }
            it { should_not be_nil }
          end

          context 'Oops ' do
            let(:message) { ' Oops' }
            it { should_not be_nil }
          end

          context ' ChaNges ' do
            let(:message) { ' ChaNges' }
            it { should_not be_nil }
          end
        end
      end
    end
  end
end
