require 'spec_helper'

module Poper
  describe Config do
    let(:config) { described_class.new(config_hash) }
    let(:config_hash) { {} }

    describe '#disallow_generic_enabled' do
      subject { config.disallow_generic_enabled }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_DISALLOW_GENERIC_ENABLED' => 'false') }
        it { should == 'false' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'disallow_generic' => { 'enabled' => false } } }
        it { should == false }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == true }
      end
    end

    describe '#disallow_generic_words' do
      subject { config.disallow_generic_words }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_DISALLOW_GENERIC_WORDS' => 'in, envar,words,should, be, comma, separated') }
        it { should == 'in, envar,words,should, be, comma, separated' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'disallow_generic' => { 'words' => %w(in config words should be array) } } }
        it { should == %w(in config words should be array) }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == %w(fix fixed fixes oops todo fixme commit changes hm hmm hmmm test tests quickfix) }
      end
    end

    describe '#character_limit_enabled' do
      subject { config.character_limit_enabled }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_CHARACTER_LIMIT_ENABLED' => 'false') }
        it { should == 'false' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'character_limit' => { 'enabled' => false } } }
        it { should == false }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == true }
      end
    end

    describe '#character_limit_number' do
      subject { config.character_limit_number }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_CHARACTER_LIMIT_NUMBER' => 100) }
        it { should == 100 }
      end

      context 'from config hash' do
        let(:config_hash) { { 'character_limit' => { 'number' => 100 } } }
        it { should == 100 }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == 72 }
      end
    end

    describe '#summary_character_limit_enabled' do
      subject { config.summary_character_limit_enabled }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_SUMMARY_CHARACTER_LIMIT_ENABLED' => 'false') }
        it { should == 'false' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'summary_character_limit' => { 'enabled' => false } } }
        it { should == false }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == true }
      end
    end

    describe '#summary_character_limit_number' do
      subject { config.summary_character_limit_number }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_SUMMARY_CHARACTER_LIMIT_NUMBER' => 80) }
        it { should == 80 }
      end

      context 'from config hash' do
        let(:config_hash) { { 'summary_character_limit' => { 'number' => 80 } } }
        it { should == 80 }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == 50 }
      end
    end

    describe '#disallow_single_word_enabled' do
      subject { config.disallow_single_word_enabled }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_DISALLOW_SINGLE_WORD_ENABLED' => 'false') }
        it { should == 'false' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'disallow_single_word' => { 'enabled' => false } } }
        it { should == false }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == true }
      end
    end

    describe '#enforce_capitalized_enabled' do
      subject { config.enforce_capitalized_enabled }

      context 'from env variable' do
        before { stub_const('ENV', 'POPER_ENFORCE_CAPITALIZED_ENABLED' => 'false') }
        it { should == 'false' }
      end

      context 'from config hash' do
        let(:config_hash) { { 'enforce_capitalized' => { 'enabled' => false } } }
        it { should == false }
      end

      context 'default' do
        let(:config_hash) { ConfigFile::EMPTY }
        it { should == true }
      end
    end
  end
end