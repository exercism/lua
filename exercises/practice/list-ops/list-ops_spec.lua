local map = require('list-ops').map
local reduce = require('list-ops').reduce
local filter = require('list-ops').filter

describe('list-ops', function()
  local function should_not_be_called() error('unexpected call') end

  describe('map', function()
    local function identity(x) return x end
    local function square(x) return x * x end

    it('should return an empty array and not call f when the input is an empty array', function()
      assert.same({}, map({}, should_not_be_called))
    end)

    it('should return an array identical to the input when f is identity', function()
      assert.same({ 1, 2, 3, 4 }, map({ 1, 2, 3, 4 }, identity))
    end)

    it('should return an array of the same length where each element in the output is f(x_i)', function()
      assert.same({ 1, 4, 9, 16 }, map({ 1, 2, 3, 4 }, square))
    end)

    it('should not mutate the input', function()
      local xs = { 1, 2, 3, 4 }
      map(xs, square)
      assert.same({ 1, 2, 3, 4 }, xs)
    end)
  end)

  describe('reduce', function()
    local function sum(x, acc)
      return x + acc
    end

    local function first_even(x, acc)
      return (acc % 2 == 0) and acc or x
    end

    it('should reduce the input array using the provided accumulator and reduction function', function()
      assert.equal(10, reduce({ 1, 2, 3, 4 }, 0, sum))
    end)

    it('should begin reduction with the provided initial value', function()
      assert.equal(15, reduce({ 1, 2, 3, 4 }, 5, sum))
    end)

    it('should reduce from left to right', function()
      assert.equal(2, reduce({ 1, 2, 3, 4 }, 1, first_even))
    end)

    it('should return the initial accumulator and not call the reduction function when the array is empty', function()
      assert.equal(55, reduce({}, 55, should_not_be_called))
    end)

    it('should not mutate the input', function()
      local xs = { 1, 2, 3, 4 }
      reduce(xs, 0, sum)
      assert.same({ 1, 2, 3, 4 }, xs)
    end)
  end)

  describe('filter', function()
    local function always_true() return true end
    local function always_false() return false end
    local function is_even(x) return x % 2 == 0 end

    it('should return an empty array and not call the predicate when the input is an empty array', function()
      assert.same({}, filter({}, should_not_be_called))
    end)

    it('should return the entire input when the predicate is always true', function()
      assert.same({ 1, 2, 3, 4 }, filter({ 1, 2, 3, 4 }, always_true))
    end)

    it('should return an empty array when the predicate is always false', function()
      assert.same({}, filter({ 1, 2, 3, 4 }, always_false))
    end)

    it('should filter out elements for which the predicate is false', function()
      assert.same({ 2, 4 }, filter({ 1, 2, 3, 4 }, is_even))
    end)

    it('should not mutate the input', function()
      local xs = { 1, 2, 3, 4 }
      filter(xs, is_even)
      assert.same({ 1, 2, 3, 4 }, xs)
    end)
  end)
end)
