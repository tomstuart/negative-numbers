require 'no_negative_numbers'

class SignedNumber
  using NoNegativeNumbers

  def self.positive(number)
    new(:positive, number)
  end

  def self.negative(number)
    new(:negative, number)
  end

  def initialize(sign, size)
    @sign, @size = sign, size
  end

  def ==(other)
    (sign == other.sign || size.zero?) && size == other.size
  end

  def +(other)
    if sign == other.sign
      SignedNumber.new(sign, size + other.size)
    else
      if size >= other.size
        SignedNumber.new(sign, size - other.size)
      else
        SignedNumber.new(sign == :positive ? :negative : :positive, other.size - size)
      end
    end
  end

  def -(other)
    if size >= other.size
      SignedNumber.new(sign, size - other.size)
    else
      SignedNumber.new(sign == :positive ? :negative : :positive, other.size - size)
    end
  end

  def *(other)
    fail 'unimplemented'
  end

  def <(other)
    fail 'unimplemented'
  end

  protected

  attr_reader :sign, :size
end
