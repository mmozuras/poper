require 'spec_helper'

module Poper
  describe Runner do
    describe '#run' do
      let(:runner) { Runner.new(commit, 'spec/specrepo.git') }
      subject { runner.run }

      context 'first commit' do
        let(:commit) { '85ae779' }
        its(:count) { should == 3 }
        its(:first) do
          should == '357c6fa: Commit message should start with a capital letter'
        end
        its(:last) do
          should == '85ae779: Consider writing a more detailed commit summary'
        end
      end

      context 'head commit' do
        let(:commit) { 'd0fa2b8' }
        its(:count) { should == 0 }
      end
    end
  end
end
