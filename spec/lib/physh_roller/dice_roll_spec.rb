# coding: utf-8

module PhyshRoller
  RSpec.describe DiceRoll do
    let(:dice_roll) { FactoryGirl.build :dice_roll }
    subject { dice_roll }

    it { expect(dice_roll).to respond_to(:raw_strings) }
    it { expect(dice_roll).to respond_to(:dice) }
    it { expect(dice_roll).to respond_to(:modifiers) }
    it { expect(dice_roll).to respond_to(:total_modifier) }
    it { expect(dice_roll).to respond_to(:parser) }
    it { expect(dice_roll).to respond_to(:parsed_strings) }
    it { expect(dice_roll).to respond_to(:roll) }

    describe 'attributes' do
      describe '@raw_strings' do
        it {
          expect(dice_roll.raw_strings)
          .to be_an_instance_of Array
        }
      end

      describe '@dice' do
        it {
          expect(dice_roll.dice)
          .to be_an_instance_of Array
        }

        context 'when created with raw_strings ["4d6"]' do
          let(:dice_roll) {FactoryGirl.build :dice_roll, raw_strings: ['4d6'] }

          it 'should return an array of size 4' do
            expect(dice_roll.dice.size)
            .to eq(4)
          end

          it 'should contain Die with six sides' do
            expect(dice_roll.dice.first.sides)
            .to eq(6)
          end
        end

        context 'when created with raw_strings ["4d6", "2d10+2"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6', '2d10+2'] }

          it 'should return an array of size 6' do
            expect(dice_roll.dice.size)
            .to eq(6)
          end

          it 'should have dice with 6 and 10 sides' do
            expect(dice_roll.dice.map(&:sides).uniq)
            .to eq([6, 10])
          end
        end
      end

      describe '@modifiers' do
        context 'when created with raw_strings["4d6"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6'] }

          it 'should return []' do
            expect(dice_roll.modifiers)
            .to eq([])
          end
        end

        context 'when created with raw_strings ["4d6-1", "2d10+2"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6-1', '2d10+2'] }

          it 'should return [-1, 2]' do
            expect(dice_roll.modifiers)
            .to eq([-1, 2])
          end
        end
      end
    end

    describe 'methods' do
      describe '#parsed_strings' do
        context 'when @raw_strings is ["42d6-12", "2d10+4"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['42d6-12', '2d10+4'] }
          let(:parsed) { dice_roll.parsed_strings }

          it { expect(parsed).to be_an_instance_of Array }
          it {
            expect(parsed)
            .to eq(dice_roll.raw_strings.map do |raw_string|
              dice_roll.parser.parse(dice_string: raw_string)
            end
                  )
          }
        end
      end

      describe '#roll' do
        let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6'] }
        let(:result) { dice_roll.roll }

        it 'should return a results hash' do
          expect(result).to be_an_instance_of Hash
        end

        it 'should have the keys :rolls, :modifiers, :total' do
          expect(result.keys).to match_array [:rolls, :modifiers, :total]
        end

        it 'should have :rolls.keys of [:d6]' do
          expect(result[:rolls].keys).to eq([:d6])
        end

        it {
          expect(result[:rolls][:d6].size).to eq(4)
        }
      end

      describe '#total_modifier' do
        context 'when created with raw_strings ["4d6"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6'] }
          it { expect(dice_roll.total_modifier).to eq(0) }
        end

        context 'when created with raw_strings ["4d6-1", "2d10+2"]' do
          let(:dice_roll) { FactoryGirl.build :dice_roll, raw_strings: ['4d6-1', '2d10+2'] }
          it { expect(dice_roll.total_modifier).to eq(1) }
        end
      end
    end
  end
end
