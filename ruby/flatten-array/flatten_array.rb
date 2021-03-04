class FlattenArray
  def self.flatten(array)
    new(array).flatten
  end

  private
  attr_reader :array_tf

  def initialize(array_tf)
    @array_tf = array_tf
  end

  public
  def flatten
    array_tf.flatten.compact
  end
end