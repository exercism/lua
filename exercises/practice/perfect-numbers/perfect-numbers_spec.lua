local perfect_numbers = require('perfect-numbers')

describe('perfect-numbers', function()
  describe('perfect numbers', function()
    it('smallest perfect number is classified correctly', function()
      assert.equal('perfect', perfect_numbers.classify(6))
    end)

    it('medium perfect number is classified correctly', function()
      assert.equal('perfect', perfect_numbers.classify(28))
    end)

    it('large perfect number is classified correctly', function()
      assert.equal('perfect', perfect_numbers.classify(33550336))
    end)
  end)

  describe('abundant numbers', function()
    it('smallest abundant number is classified correctly', function()
      assert.equal('abundant', perfect_numbers.classify(12))
    end)

    it('medium abundant number is classified correctly', function()
      assert.equal('abundant', perfect_numbers.classify(30))
    end)

    it('large abundant number is classified correctly', function()
      assert.equal('abundant', perfect_numbers.classify(33550335))
    end)

    it('perfect square abundant number is classified correctly', function()
      assert.equal('abundant', perfect_numbers.classify(196))
    end)
  end)

  describe('deficient numbers', function()
    it('smallest prime deficient number is classified correctly', function()
      assert.equal('deficient', perfect_numbers.classify(2))
    end)

    it('smallest non-prime deficient number is classified correctly', function()
      assert.equal('deficient', perfect_numbers.classify(4))
    end)

    it('medium deficient number is classified correctly', function()
      assert.equal('deficient', perfect_numbers.classify(32))
    end)

    it('large deficient number is classified correctly', function()
      assert.equal('deficient', perfect_numbers.classify(33550337))
    end)

    it('edge case (no factors other than itself) is classified correctly', function()
      assert.equal('deficient', perfect_numbers.classify(1))
    end)
  end)

  describe('invalid inputs', function()
    it('zero is rejected (as it is not a positive integer)', function()
      assert.has_error(function()
        perfect_numbers.classify(0)
      end)
    end)

    it('negative integer is rejected (as it is not a positive integer)', function()
      assert.has_error(function()
        perfect_numbers.classify(-1)
      end)
    end)
  end)
end)
