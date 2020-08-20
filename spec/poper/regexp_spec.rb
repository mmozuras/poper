require 'spec_helper'

module Poper
  describe Regexp do
    subject { described_class.new('a string') }

    it { should match('Look, a string') }
    it { should_not match('Look, another string') }

    context 'when set to case-insensitive' do
      subject { described_class.new('a string', described_class::IGNORECASE) }

      it { should match('LOOK, A STRING') }
    end

    context 'when initialized with nil' do
      subject { described_class.new(nil) }

      it { should == /.^/ }
      it { should_not match('Look, a string') }
      it { should_not match('') }
    end

    context 'when initialized with false' do
      subject { described_class.new(false) }

      it { should == /.^/ }
      it { should_not match('Look, a string') }
      it { should_not match('') }
    end

    context 'when initialized with true' do
      subject { described_class.new(true) }

      it { should == // }
      it { should match('Look, a string') }
      it { should match('') }
      it { should match("\n") }
    end

    context 'when intialized with an empty string' do
      subject { described_class.new('') }

      it { should == // }
    end

    context 'when initialized with a string containing special characters' do
      subject { described_class.new('^Look') }

      it { should match('Look, a string') }
      it { should_not match('^Look, a string') }

      context 'and the string has double quotes' do
        subject { described_class.new("^Look") }

        it { should match('Look, a string') }
      end
    end

    context 'when initialized with a string containing escaped characters' do
      subject { described_class.new('\^Look') }

      it { should match('^Look, a string') }
      it { should_not match('Look, a string') }

      context 'and the string has double quotes' do
        subject { described_class.new("\^Look") }

        it { should match('Look, a string') }
        it { should_not match('^Look, a string') }
      end
    end

  end
end
