require 'card_evaluator'

RSpec.describe CardEvaluator do
    let(:cards) { "2H 3H 4H 5H 6H" }
    let(:instance) { described_class.new(cards: cards) }

    describe 'evaluate!' do
        let(:subject) { instance.evaluate! }

        it 'returns valuable' do
            expect(subject).to eq("valuable")
        end
    end

    describe '#invalid_input' do
        let(:card_string) { "2h 3h 4h 5h 6h"}
        let(:subject) { instance.invalid_input(card_string) }
        context 'happy path' do 
            it 'should return false' do
                expect(subject).to eq(false)
            end
        end 

        context 'sad paths' do
            context 'duplicate card values' do
                let(:card_string) { "2h 2h 4h 5h 6h" }

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end

            context 'too few cards' do
                let(:card_string) { "2h 3h 4h 5h" }

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end

            context 'too many cards' do
                let(:card_string) { "2h 3h 4h 5h 6h 7h" }

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end

            context 'empty string' do 
                let(:card_string) { "" } 

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end
        end

    end

    describe '#invalid_output' do 
        let(:card_hash) do 
            {
                "2" => "H",
                "3" => "H",
                "4" => "H",
                "5" => "H",
                "6" => "H"
            }
        end

        let(:subject) { instance.invalid_output(card_hash) }

        context 'happy path' do 
            it 'returns false' do
                expect(subject).to eq(false)
            end
        end 

        context 'sad paths' do
            context 'Invalid suit' do
                let(:card_hash) do 
                    {
                        "2" => "H",
                        "3" => "H",
                        "4" => "H",
                        "5" => "H",
                        "6" => "X"
                    }
                end


                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end

            context 'Invalid values' do
                let(:card_hash) do 
                    {
                        "2" => "H",
                        "3" => "H",
                        "4" => "H",
                        "5" => "H",
                        "X" => "H"
                    }
                end

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end
        end
    end
end