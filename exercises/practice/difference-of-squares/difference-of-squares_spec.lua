local diff = require('difference-of-squares')

describe('difference-of-squares', function()
  describe('square the sum of the numbers up to the given number', function()
    it('square of sum 1', function()
      assert.equal(1, diff.square_of_sum(1))
    end)

    it('square of sum 5', function()
      assert.equal(225, diff.square_of_sum(5))
    end)

    it('square of sum 100', function()
      assert.equal(25502500, diff.square_of_sum(100))
    end)
  end)

  describe('sum the squares of the numbers up to the given number', function()
    it('sum of squares 1', function()
      assert.equal(1, diff.sum_of_squares(1))
    end)

    it('sum of squares 5', function()
      assert.equal(55, diff.sum_of_squares(5))
    end)

    it('sum of squares 100', function()
      assert.equal(338350, diff.sum_of_squares(100))
    end)
  end)

  describe('subtract sum of squares from square of sums', function()
    it('difference of squares 1', function()
      assert.equal(0, diff.difference_of_squares(1))
    end)

    it('difference of squares 5', function()
      assert.equal(170, diff.difference_of_squares(5))
    end)

    it('difference of squares 100', function()
      assert.equal(25164150, diff.difference_of_squares(100))
    end)
  end)
end)
