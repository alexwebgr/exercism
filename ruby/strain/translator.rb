class Translator
  def speak
    yield self
  end

  protected

  def french
    'bon jour'
  end

  def spanish
    'hola'
  end

  def turkey
    'gobble'
  end

  def method_missing(*args)
    'awkward silence'
  end
end

p Translator.new.speak(&'spanish'.to_sym)