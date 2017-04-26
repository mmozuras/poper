require 'spec_helper'
require 'yaml'

module Poper
  describe ConfigFile do
    let(:config_file) { described_class.new }

    describe '#to_h' do
      subject { config_file.to_h }

      context 'not existing config file' do
        it do
          should include(
            'disallow_single_word' => {
              'enabled' => true
            }
          )
        end

        it do
          should include(
            'character_limit' => {
              'enabled' => true,
              'number' => 72
            }
          )
        end

        it do
          should include(
            'summary_character_limit' => {
              'enabled' => true,
              'number' => 50
            }
          )
        end

        it do
          should include(
            'disallow_generic' => {
              'enabled' => true,
              'words' => %w[fix fixed fixes oops todo fixme commit changes hm hmm hmmm test tests quickfix]
            }
          )
        end

        it do
          should include(
            'enforce_capitalized' => {
              'enabled' => true
            }
          )
        end
      end

      context 'only summary character limit in file' do
        before do
          File.should_receive(:exist?)
              .and_return(true)

          YAML.should_receive(:load_file)
              .and_return('summary_character_limit' => {
                            'number' => 95
                          })
        end

        it do
          should include(
            'summary_character_limit' => {
              'enabled' => true,
              'number' => 95
            }
          )
        end
      end
      context 'a value is set to false' do
        before do
          File.should_receive(:exist?)
              .and_return(true)

          YAML.should_receive(:load_file)
              .and_return('summary_character_limit' => {
                            'enabled' => false,
                            'number' => 95
                          })
        end

        it do
          should include(
            'summary_character_limit' => {
              'enabled' => false,
              'number' => 95
            }
          )
        end
      end
    end
  end
end
