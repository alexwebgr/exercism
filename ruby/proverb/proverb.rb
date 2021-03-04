class Proverb
  private
  attr_reader :items
  attr_reader :qualifier

  def initialize(*items, qualifier: '')
    @items = items
    @qualifier = qualifier
  end

  def print_phrase(a, b)
    "For want of a #{a} the #{b} was lost."
  end

  def print_footer
    elems = [items.first]
    elems.prepend(qualifier) unless qualifier.empty?

    "And all for the want of a #{elems.join(' ')}."
  end

  public
  def to_s
    proverb = ''
    items.each_cons(2) do |a, b|
      proverb << print_phrase(a, b) << "\n"
    end

    proverb << print_footer
  end
end