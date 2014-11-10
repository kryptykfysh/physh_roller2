# coding: utf-8

FactoryGirl.define do
  factory :dice_roll, class: PhyshRoller::DiceRoll do
    raw_strings { ['4d6', '2d100-5'] }

    initialize_with { new(raw_strings: raw_strings) }
  end
end
