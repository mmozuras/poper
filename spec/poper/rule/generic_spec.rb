require 'spec_helper'

module Poper
  module Rule
    describe Generic do
      describe '#check' do
        let(:rule) { Generic.new }
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

          context 'fix tests' do
            let(:message) { 'fix tests' }
            it { should_not be_nil }
          end

          context 'oops fixes' do
            let(:message) { "oops\n\nfixes" }
            it { should_not be_nil }
          end

          context 'oops, fix tests' do
            let(:message) { 'oops, fix tests' }
            it { should_not be_nil }
          end
        end
      end
    end
  end
end
