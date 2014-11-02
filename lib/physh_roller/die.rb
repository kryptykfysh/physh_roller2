# coding: utf-8

module PhyshRoller
  class Die
    attr_reader :sides, :history

    def initialize(sides:)
      @sides = sides
    end

    def roll
      1
    end
  end
end
