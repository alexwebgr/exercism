class Clock

  private

  def initialize(hour: 0, minute: 0)
    @total_minutes = hour * 60 + minute
  end

  def display(minutes)
    "%02d:%02d" % [(minutes / 60) % 24, minutes % 60]
  end

  protected

  attr_accessor :total_minutes

  public

  def ==(object)
    display(object.total_minutes) == display(total_minutes)
  end

  def -(object)
    @total_minutes -= object.total_minutes
    self
  end

  def +(object)
    @total_minutes += object.total_minutes
    self
  end

  def to_s
    display(total_minutes)
  end
end
