# coding: utf-8

module PhyshRoller
  class Die
    attr_reader :sides

    def initialize(sides:)
      @sides = sides
    end
  end
end
