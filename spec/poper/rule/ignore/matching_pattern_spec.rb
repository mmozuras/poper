require 'spec_helper'

module Poper
  module Rule
    module Ignore
      describe MatchingPattern do
        let(:klass) { Class.new { extend MatchingPattern } }

        describe '#should_ignore?' do
          subject { klass.should_ignore?(message, ignore_pattern: ignore_pattern) }
          let(:message) { 'Look, a message' }
          let(:ignore_pattern) { '^Look' }

          context 'when ignore pattern is not provided' do
            subject { klass.should_ignore?(message) }

            it { should be false }
          end

          context 'when ignore pattern is provided' do
            subject { klass.should_ignore?(message, ignore_pattern: ignore_pattern) }

            context 'when message matches ignore pattern' do
              it { should be true }
            end

            context 'when message does not match ignore pattern' do
              let(:message) { 'Hey, Look, a message' }

              it { should be false }
            end
          end
        end
      end
    end
  end
end
