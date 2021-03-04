class Raindrops
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong',
  }.freeze

  def self.convert(raindrop)
    sound = RULES.select { |key, _| (raindrop % key).zero? }
    sound.empty? ? raindrop.to_s : sound.values.join
  end
end
