# coding: utf-8

module PhyshRoller
  RSpec.describe Die do
    let(:die) { FactoryGirl.build :die }
    subject { die }

    it { should respond_to :sides }
  end
end
