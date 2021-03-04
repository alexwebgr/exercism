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
    sounds.empty? ? drip : sounds.values.join
  end

  def sounds
    rules.select { |key, _| (drip % key).zero? }
  end

  public
  def to_s
    filter.to_s
  end
end

if $PROGRAM_NAME == __FILE__
  rules = {3 => 'Fizz', 5 => 'Buzz'}
  (-15..15).each do |integer|
    puts Raindrops.new(integer, rules)
  end
end
