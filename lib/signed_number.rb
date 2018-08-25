require 'no_negative_numbers'

class SignedNumber
  using NoNegativeNumbers

  def self.positive(number)
    fail 'unimplemented'
  end

  def self.negative(number)
    fail 'unimplemented'
  end

  def ==(other)
    fail 'unimplemented'
  end

  def +(other)
    fail 'unimplemented'
  end

  def -(other)
    fail 'unimplemented'
  end

  def *(other)
    fail 'unimplemented'
  end

  def <(other)
    fail 'unimplemented'
  end
end
