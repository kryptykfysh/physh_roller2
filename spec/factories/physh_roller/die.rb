# coding: utf-8

FactoryGirl.define do
  factory :die, class: PhyshRoller::Die do
    sides { rand(3..100) }

    initialize_with { new(sides: sides) }
  end
end
