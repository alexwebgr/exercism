# frozen_string_literal: true

class Raindrops
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong',
  }.freeze

  def self.convert(integer)
    new(integer).to_s
  end

  private
  attr_reader :drip
  attr_reader :rules

  def initialize(drip, rules = RULES)
    @drip = drip
    @rules = rules
  end

  def filter
    sounds.empty? ? drip : sounds
  end

  def sounds
    @sounds ||= rules.each_with_object(+'') do |(factor, note), sound|
      sound << note if (drip % factor).zero?
    end
  end

  public
  def to_s
    filter.to_s
  end
end
