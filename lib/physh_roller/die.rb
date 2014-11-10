# coding: utf-8

module PhyshRoller
  class Die
    attr_reader :sides, :history

    def initialize(sides:)
      @sides = sides
      @history = []
    end

    def roll
      @history << rand(1..@sides)
      @history.last
    end
  end
end
