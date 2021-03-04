class ResistorColorTrio
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  private
  attr_reader :color_names
  attr_reader :zeros

  def initialize(color_names = [])
    @color_names = color_names
    @zeros = 0
  end

  def ohms
    color_names.first(2).map do |v|
      raise ArgumentError if COLORS.index(v).nil?
      COLORS.index(v)
    end.join
  end

  def zeros
    '0' * COLORS.index(color_names[2])
  end

  def resistor_value
    (ohms + zeros).to_i
  end

  def format
    (resistor_value >= 1000) ? "#{resistor_value / 1000} kiloohms" : "#{resistor_value} ohms"
  end

  public
  def label
    "Resistor value: #{format}"
  end
end

#243842
# c6922d