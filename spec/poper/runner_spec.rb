require 'spec_helper'

module Poper
  describe Runner do
    describe '#run' do
      let(:runner) { Runner.new(commit, 'spec/specrepo.git') }
      subject { runner.run }

      context 'first commit' do
        let(:commit) { '85ae779' }
        its(:count) { should == 2 }
      end

      context 'head commit' do
        let(:commit) { 'd0fa2b8' }
        its(:count) { should == 0 }
      end
    end
  end
end
