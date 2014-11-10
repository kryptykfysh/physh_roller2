# coding: utf-8

module PhyshRoller
  RSpec.describe Die do
    let(:die) { FactoryGirl.build :die }
    subject { die }

    it { expect(die).to respond_to :sides }
    it { expect(die).to respond_to :roll }
    it { expect(die).to respond_to :history }

    describe 'attributes' do
      describe '@history' do
        context 'when die has not been rolled' do
          it { expect(die.history).to be_empty }
        end

        context 'after rolling the die' do
          it 'should increase by one' do
            expect{ die.roll }.to change{die.history.size}.from(0).to(1)
          end
        end
      end
    end

    describe 'methods' do
      describe '#roll' do
        it { expect(die.roll).to be >= 1 }
        it 'should be less than or equal to @sides' do
          expect(die.roll).to be <= die.sides
        end
      end
    end
  end
end
