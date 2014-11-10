# coding: utf-8

module PhyshRoller
  class DiceStringParser
    RAW_STRING_REGEX = /\A(?<number_of_dice>\d+)d(?<sides_on_die>\d+)(?<modifier>[\+-]\d+)?\z/i

    def parse(dice_string:)
      raise ArgumentError unless dice_string =~ RAW_STRING_REGEX
      matches = RAW_STRING_REGEX.match dice_string
      {
        number_of_dice: matches[:number_of_dice].to_i || 1,
        sides_on_die: matches[:sides_on_die].to_i,
        modifier: matches[:modifier].to_i || 0
      }
    end
  end
end
