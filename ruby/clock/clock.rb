class Clock

  private

  def initialize(hour: 0, minute: 0)
    @minutes = hour * 60 + minute
  end

  def display(minutes)
    '%02d:%02d' % [(minutes / 60) % 24, minutes % 60]
  end

  protected

  attr_accessor :minutes

  public

  def ==(other)
    display(other.minutes) == display(minutes)
  end

  def -(other)
    @minutes -= other.minutes
    self
  end

  def +(other)
    @minutes += other.minutes
    self
  end

  def to_s
    display(minutes)
  end
end
