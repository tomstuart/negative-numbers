require 'no_negative_numbers'

class SignedNumber
  using NoNegativeNumbers

  def self.positive(number)
    new(0, number)
  end

  def self.negative(number)
    new(number, 0)
  end

  def initialize(left, right)
    @left, @right = left, right
  end

  def ==(other)
    left + other.right == other.left + right
  end

  def +(other)
    SignedNumber.new(left + other.left, right + other.right)
  end

  def -(other)
    SignedNumber.new(left + other.right, other.left + right)
  end

  def *(other)
    SignedNumber.new(
      left * other.right + other.left * right,
      left * other.left + right * other.right
    )
  end

  def <(other)
    other.left + right < left + other.right
  end

  protected

  attr_reader :left, :right
end
