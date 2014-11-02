# coding: utf-8

module PhyshRoller
  RSpec.describe Die do
    let(:die) { FactoryGirl.build :die }
    subject { die }

    it { expect(die).to respond_to :sides }
    it { expect(die).to respond_to :roll }
    it { expect(die).to respond_to :history }

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
