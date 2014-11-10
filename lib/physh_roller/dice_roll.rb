# coding: utf-8

require_relative 'dice_string_parser'
require_relative 'die'

module PhyshRoller
  class DiceRoll

    attr_reader :raw_strings, :dice, :modifiers, :parser

    def initialize(raw_strings:)
      @raw_strings = raw_strings
      @dice, @modifiers = [], []
      @parser = PhyshRoller::DiceStringParser.new
      add_dice_from_raw_strings
      add_modifiers_from_raw_strings
    end

    def add_die(sides_on_die:)
      @dice << PhyshRoller::Die.new(sides: sides_on_die)
    end

    def add_modifier(modifier:)
      @modifiers << modifier
    end

    def dice_map
      sides = @dice.map(&:sides).uniq
      sides.inject({}) do |result, side_count|
        result["d#{side_count}".to_sym] = @dice.select { |die| die.sides == side_count }
        result
      end
    end

    def parsed_strings
      @raw_strings.map do |raw_string|
        @parser.parse(dice_string: raw_string)
      end
    end

    def roll
      @dice.each(&:roll)
      result = {
        rolls:      dice_map.inject({}) do |rolls, (key, value)|
                      rolls[key] = value.map { |die| die.history.last }
                      rolls
                    end,
        modifiers:  @modifiers
      }
      result[:total] = result[:rolls].values.flatten.reduce(&:+) + total_modifier
      result
    end

    def total_modifier
      @modifiers.inject(0, &:+)
    end

    private

      def add_dice_from_raw_strings
        parsed_strings.each do |parsed|
          parsed[:number_of_dice].times do
            add_die(sides_on_die: parsed[:sides_on_die])
          end
        end
      end

      def add_modifiers_from_raw_strings
        parsed_strings.each do |parsed|
          add_modifier(modifier: parsed[:modifier]) unless parsed[:modifier].zero?
        end
      end
  end
end
