class Bob
  RESPONSES = {
    question: 'Sure.',
    yelling: 'Whoa, chill out!',
    yelling_question: 'Calm down, I know what I\'m doing!',
    silence: 'Fine. Be that way!',
    whatever: 'Whatever.'
  }

  attr_reader :remark

  def initialize(remark)
    @remark = remark.gsub(/[^a-zA-Z0-9?]/, '')
  end

  def self.hey(remark)
    new(remark).hey
  end

  def hey
    return RESPONSES[:yelling_question] if yelling_question?
    return RESPONSES[:question] if question?
    return RESPONSES[:yelling] if yelling?
    return RESPONSES[:silence] if silence?

    RESPONSES[:whatever]
  end

  private

  def question?
    remark.end_with?('?')
  end

  def yelling?
    # return false if it is a digit and upcase? since numbers and other characters return true when tested if they are upcase
    # but we need to cater for the scenario where there are digits and characters which should return true of yelling
    # using chopped_remark to remove the ? from the comparison so the digit check returns true when there is just digit and ?
    return false if chopped_remark !~ /\D/ && upcase?

    upcase?
  end

  def upcase?
    chopped_remark == chopped_remark.upcase
  end

  def yelling_question?
    question? && yelling?
  end

  def silence?
    remark.empty?
  end

  def chopped_remark
    remark.end_with?('?') ? remark.chop : remark
  end
end