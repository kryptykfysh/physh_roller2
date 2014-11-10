# coding: utf-8

module PhyshRoller
  RSpec.describe DiceStringParser do
    let(:parser) { PhyshRoller::DiceStringParser.new }
    subject { parser}

    it { expect(parser).to respond_to :parse }

    describe '#parse' do
      context 'without a String argument' do
        it { expect{ parser.parse }.to raise_error ArgumentError }
      end

      context 'with an invalid String argument' do
        it {
          expect{ parser.parse(dice_string: 'fregergr') }
          .to raise_error
        }
      end

      context 'with a valid String argument, "42d6-12"' do
        let(:dice_string) { '42d6-12' }
        let(:result) { parser.parse(dice_string: dice_string) }
        it {
          expect(result)
          .to be_an_instance_of Hash
        }

        it {
          expect(result.keys)
          .to match_array [:number_of_dice, :sides_on_die, :modifier]
        }

        it {
          expect(result[:number_of_dice])
          .to eq(42)
        }

        it {
          expect(result[:sides_on_die])
          .to eq(6)
        }

        it {
          expect(result[:modifier])
          .to eq(-12)
        }
      end
    end
  end
end
