require 'spec_helper'

module Poper
  module Rule
    describe SummaryCharacterLimit do
      describe '#check' do
        let(:rule) { SummaryCharacterLimit.new }
        subject { rule.check(msg) }

        context 'fifty char summary' do
          let(:msg) { 'Implement that feature - really really really well' }
          it { should be_nil }
        end

        context 'fifty-one char summary' do
          let(:msg) { 'Implement that feature - really really really well.' }
          it { should_not be_nil }

          context 'when summary matches ignore pattern' do
            before do
              File.should_receive(:exist?)
                  .and_return(true)

              YAML.should_receive(:load_file)
                  .and_return(
                    'summary_character_limit' => {
                      'ignore_if_summary_matches' => 'Implement that feature'
                    }
                  )
            end

            it { should be_nil }
          end

          context 'when summary does not match ignore pattern' do
            before do
              File.should_receive(:exist?)
                  .and_return(true)

              YAML.should_receive(:load_file)
                  .and_return(
                    'summary_character_limit' => {
                      'ignore_if_summary_matches' => 'Implement that feature\$'
                    }
                  )
            end

            it { should_not be_nil }
          end
        end

        context 'fifty char summary with a newline' do
          let(:msg) { "Implement that feature - really really really well\n" }
          it { should be_nil }
        end
      end
    end
  end
end
