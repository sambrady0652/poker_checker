require 'card_evaluator'

RSpec.describe CardEvaluator do
    let(:cards) { "2H 3H 4H 5H 6H" }
    let(:instance) { described_class.new(cards: cards) }

    describe 'evaluate' do
        let(:subject) { instance.evaluate }

        it 'returns the expected value' do
            expect(subject).to eq("Straight Flush")
        end

        context 'high card' do
            let(:cards) { "2H 3H 4H 5H 7D" }

            it 'returns the expected value' do
                expect(subject).to eq("High Card: 7 of Diamonds")
            end
        end

        context 'invalid hand' do
            let(:cards) { "2H 3H 4H 5H " }
        
            it 'returns the expected value' do
                expect(subject).to eq("Invalid hand")
            end
        end
    end

    describe '#straight_flush' do
        let(:subject) { instance.straight_flush}
        
        context 'the hand matches expectation' do 
            let(:cards) { "2h 3h 4h 5h 6h"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "2h 3c 4h 5h 6h"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#four_of_a_kind' do
        let(:subject) { instance.four_of_a_kind}
        
        context 'the hand matches expectation' do 
            let(:cards) { "8c 8d 8h 8s 5s"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "8c 8d 8h 9s 5s"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#full_house' do
        let(:subject) { instance.full_house}
        
        context 'the hand matches expectation' do 
            let(:cards) { "8c 8d 8h 5c 5s"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "8c 8d 7h 5c 5s"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end  
    end

    describe '#flush' do
        let(:subject) { instance.flush}
        
        context 'the hand matches expectation' do 
            let(:cards) { "2h 4h 6h 8h 10h"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "2h 4h 6h 8h 10c" }
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#straight' do
        let(:subject) { instance.straight}
        
        context 'the hand matches expectation' do 
            let(:cards) { "6h 7s 8d 9c 10h"}
            it 'should return true' do
                expect(subject).to eq(true)
            end

            context 'and Ace is low' do
                let(:cards) { "ah 2c 3d 4h 5d" }

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "6h 7s 8d 9c jh"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#three_of_a_kind' do
        let(:subject) { instance.three_of_a_kind}
        
        context 'the hand matches expectation' do 
            let(:cards) { "10h 10c 10d kh ah"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) {  "10h 10c 9d 9h ah"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#two_pair' do
        let(:subject) { instance.two_pair}
        
        context 'the hand matches expectation' do 
            let(:cards) { "10h 10c 9d 9h ah" }
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "10h 10c 9d 8h ah"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#pair' do
        let(:subject) { instance.pair}
        
        context 'the hand matches expectation' do 
            let(:cards) { "10h 10c 9d 8h ah"}
            it 'should return true' do
                expect(subject).to eq(true)
            end
        end 

        context 'the hand does not match expectation' do 
            let(:cards) { "10h 9c 8d 7h 6h"}
            it 'should return true' do
                expect(subject).to eq(false)
            end
        end 
    end

    describe '#high_card' do
        let(:subject) { instance.high_card}
        
        context 'the hand matches expectation' do 
            let(:cards) { "2c 3d 4h 5s 6d" }
            it 'should return true' do
                expect(subject).to eq("High Card: 6 of Diamonds")
            end
        end 
    end

    describe '#invalid_input' do
        let(:card_string) { "2h 3h 4h 5h 6h"}
        let(:subject) { instance.invalid_input?(card_string) }
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
                2 => ["H"],
                3 => ["H"],
                4 => ["H"],
                5 => ["H"],
                6 => ["H"]
            }
        end

        let(:subject) { instance.invalid_output?(card_hash) }

        context 'happy path' do 
            it 'returns false' do
                expect(subject).to eq(false)
            end
        
            context 'there are pairs' do
                let(:card_hash) do 
                    {
                        2 => ["H", "C"],
                        4 => ["H"],
                        5 => ["H"],
                        6 => ["H"]
                    }
                end

                it 'returns false' do
                    expect(subject).to eq(false)
                end
            end
        end 

        context 'sad paths' do
            context 'Invalid suit' do
                let(:card_hash) do 
                    {
                        2 => ["H"],
                        3 => ["H"],
                        4 => ["H"],
                        5 => ["H"],
                        6 => ["X"]
                    }
                end


                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end

            context 'Invalid values' do
                let(:card_hash) do 
                    {
                        2 => ["H"],
                        3 => ["H"],
                        4 => ["H"],
                        5 => ["H"],
                        16 => ["H"]
                    }
                end

                it 'should return true' do
                    expect(subject).to eq(true)
                end
            end
        end
    end
end