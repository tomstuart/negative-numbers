require 'signed_number'

RSpec.describe 'signed numbers' do
  def pos(number)
    SignedNumber.positive(number)
  end

  def neg(number)
    SignedNumber.negative(number)
  end

  describe 'equality' do
    describe 'of positive numbers' do
      specify('+1 = +1') { expect(pos(1)).to eq pos(1) }
      specify('+1 ≠ +2') { expect(pos(1)).not_to eq pos(2) }
      specify('+2 ≠ +1') { expect(pos(2)).not_to eq pos(1) }
    end

    describe 'of negative numbers' do
      specify('-1 = -1') { expect(neg(1)).to eq neg(1) }
      specify('-1 ≠ -2') { expect(neg(1)).not_to eq neg(2) }
      specify('-2 ≠ -1') { expect(neg(2)).not_to eq neg(1) }
    end

    describe 'of numbers with opposite signs' do
      specify('+1 ≠ -1') { expect(pos(1)).not_to eq neg(1) }
      specify('-1 ≠ +1') { expect(neg(1)).not_to eq pos(1) }
    end
  end

  describe 'addition' do
    describe 'with the same sign' do
      specify('+1 + +2 = +3') { expect(pos(1) + pos(2)).to eq pos(3) }
      specify('-1 + -2 = -3') { expect(neg(1) + neg(2)).to eq neg(3) }
    end

    describe 'with the opposite sign' do
      describe 'of smaller magnitude' do
        specify('+3 + -2 = +1') { expect(pos(3) + neg(2)).to eq pos(1) }
        specify('-3 + +2 = -1') { expect(neg(3) + pos(2)).to eq neg(1) }
      end

      describe 'of larger magnitude' do
        specify('+2 + -3 = -1') { expect(pos(2) + neg(3)).to eq neg(1) }
        specify('-2 + +3 = +1') { expect(neg(2) + pos(3)).to eq pos(1) }
      end
    end

    describe 'with zero result' do
      specify('+1 + -1 = -1 + +1') { expect(pos(1) + neg(1)).to eq neg(1) + pos(1) }
    end
  end

  describe 'subtraction' do
    describe 'with the same sign' do
      describe 'of smaller magnitude' do
        specify('+3 - +2 = +1') { expect(pos(3) - pos(2)).to eq pos(1) }
        specify('-3 - -2 = -1') { expect(neg(3) - neg(2)).to eq neg(1) }
      end

      describe 'of larger magnitude' do
        specify('+2 - +3 = -1') { expect(pos(2) - pos(3)).to eq neg(1) }
        specify('-2 - -3 = +1') { expect(neg(2) - neg(3)).to eq pos(1) }
      end
    end

    describe 'with the opposite sign' do
      specify('+1 - -2 = +3') { expect(pos(1) - neg(2)).to eq pos(3) }
      specify('-1 - +2 = -3') { expect(neg(1) - pos(2)).to eq neg(3) }
    end

    describe 'with zero result' do
      specify('+1 - +1 = -1 - -1') { expect(pos(1) - pos(1)).to eq neg(1) - neg(1) }
    end
  end

  describe 'multiplication' do
    describe 'with the same sign' do
      specify('+2 × +3 = +6') { expect(pos(2) * pos(3)).to eq pos(6) }
      specify('-2 × -3 = +6') { expect(neg(2) * neg(3)).to eq pos(6) }
    end

    describe 'with the opposite sign' do
      specify('+2 × -3 = -6') { expect(pos(2) * neg(3)).to eq neg(6) }
      specify('-2 × +3 = -6') { expect(neg(2) * pos(3)).to eq neg(6) }
    end

    describe 'with zero result' do
      specify('+2 × +0 = -3 × +0') { expect(pos(2) * pos(0)).to eq neg(3) * pos(0) }
    end
  end

  describe 'ordering' do
    describe 'of positive numbers' do
      specify('+1 < +2') { expect(pos(1)).to be < pos(2) }
      specify('+2 ≮ +1') { expect(pos(2)).not_to be < pos(1) }
    end

    describe 'of negative numbers' do
      specify('-1 ≮ -2') { expect(neg(1)).not_to be < neg(2) }
      specify('-2 < -1') { expect(neg(2)).to be < neg(1) }
    end

    describe 'of numbers with opposite signs' do
      specify('+1 ≮ -2') { expect(pos(1)).not_to be < neg(2) }
      specify('-2 < +1') { expect(neg(2)).to be < pos(1) }
      specify('-1 < +2') { expect(neg(1)).to be < pos(2) }
      specify('+2 ≮ -1') { expect(pos(2)).not_to be < neg(1) }

      describe 'including zero' do
        specify('+0 ≮ -0') { expect(pos(0)).not_to be < neg(0) }
        specify('-0 ≮ +0') { expect(neg(0)).not_to be < pos(0) }
        specify('+0 ≮ -1') { expect(pos(0)).not_to be < neg(1) }
        specify('-1 < +0') { expect(neg(1)).to be < pos(0) }
        specify('-0 < +1') { expect(neg(0)).to be < pos(1) }
        specify('+1 ≮ -0') { expect(pos(1)).not_to be < neg(0) }
      end
    end
  end
end
