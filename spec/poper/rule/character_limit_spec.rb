require 'spec_helper'

module Poper
  module Rule
    describe CharacterLimit do
      describe '#check' do
        let(:rule) { CharacterLimit.new }
        subject { rule.check(message) }

        context 'seventy-one char line' do
          let(:message) do
            'Implement that feature - really really really well

Write your commit message in the imperative: "Fix bug", not "Fixed bug"'
          end

          it { should be_nil }
        end

        context 'seventy-two char line' do
          let(:message) do
            'Implement that feature - really really really well

Write your commit message in the imperative: "Fix bug", not "Fixed bug"!
More text here!'
          end

          it { should be_nil }
        end

        context 'seventy-two char last line' do
          let(:message) do
            'Implement that feature - really really really well

Write your commit message in the imperative: "Fix bug", not "Fixed bug"!'
          end

          it { should be_nil }
        end

        context 'seventy-three char line' do
          let(:message) do
            'Implement that feature - really really really well

Write your commit message in the imperative: "Fix bugs", not "Fixed bugs"
More text here!'
          end

          it { should_not be_nil }

          context 'when message matches ignore pattern' do
            before do
              File.should_receive(:exist?)
                  .and_return(true)

              YAML.should_receive(:load_file)
                  .and_return(
                    'character_limit' => {
                      'ignore_if_message_matches' => 'Implement that feature'
                    }
                  )
            end

            it { should be_nil }
          end
        end

        context 'seventy-three char last line' do
          let(:message) do
            'Implement that feature - really really really well

Write your commit message in the imperative: "Fix bugs", not "Fixed bugs"'
          end

          it { should_not be_nil }

          context 'when message matches ignore pattern' do
            before do
              File.should_receive(:exist?)
                  .and_return(true)

              YAML.should_receive(:load_file)
                  .and_return(
                    'character_limit' => {
                      'ignore_if_message_matches' => 'Implement that feature'
                    }
                  )
            end

            it { should be_nil }
          end
        end
      end
    end
  end
end
