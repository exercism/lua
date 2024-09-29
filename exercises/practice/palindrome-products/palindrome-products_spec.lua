local palindrome_products = require('palindrome-products')

describe('palindrome-products', function()
  it('find the smallest palindrome from single digit factors', function()
    local expected = {
      value = 1, --
      factors = { { 1, 1 } }
    }
    assert.are.same(expected, palindrome_products.smallest(1, 9))
  end)

  it('find the largest palindrome from single digit factors', function()
    local expected = {
      value = 9, --
      factors = { { 1, 9 }, { 3, 3 } }
    }
    assert.are.same(expected, palindrome_products.largest(1, 9))
  end)

  it('find the smallest palindrome from double digit factors', function()
    local expected = {
      value = 121, --
      factors = { { 11, 11 } }
    }
    assert.are.same(expected, palindrome_products.smallest(10, 99))
  end)

  it('find the largest palindrome from double digit factors', function()
    local expected = {
      value = 9009, --
      factors = { { 91, 99 } }
    }
    assert.are.same(expected, palindrome_products.largest(10, 99))
  end)

  it('find the smallest palindrome from triple digit factors', function()
    local expected = {
      value = 10201, --
      factors = { { 101, 101 } }
    }
    assert.are.same(expected, palindrome_products.smallest(100, 999))
  end)

  it('find the largest palindrome from triple digit factors', function()
    local expected = {
      value = 906609, --
      factors = { { 913, 993 } }
    }
    assert.are.same(expected, palindrome_products.largest(100, 999))
  end)

  it('find the smallest palindrome from four digit factors', function()
    local expected = {
      value = 1002001, --
      factors = { { 1001, 1001 } }
    }
    assert.are.same(expected, palindrome_products.smallest(1000, 9999))
  end)

  it('find the largest palindrome from four digit factors', function()
    local expected = {
      value = 99000099, --
      factors = { { 9901, 9999 } }
    }
    assert.are.same(expected, palindrome_products.largest(1000, 9999))
  end)

  it('empty result for smallest if no palindrome in the range', function()
    local expected = {
      value = nil, --
      factors = {}
    }
    assert.are.same(expected, palindrome_products.smallest(1002, 1003))
  end)

  it('empty result for largest if no palindrome in the range', function()
    local expected = {
      value = nil, --
      factors = {}
    }
    assert.are.same(expected, palindrome_products.largest(15, 15))
  end)

  it('error result for smallest if min is more than max', function()
    assert.has_error(function()
      palindrome_products.smallest(10000, 1)
    end, 'min must be <= max')
  end)

  it('error result for largest if min is more than max', function()
    assert.has_error(function()
      palindrome_products.largest(2, 1)
    end, 'min must be <= max')
  end)

  it('smallest product does not use the smallest factor', function()
    local expected = {
      value = 10988901, --
      factors = { { 3297, 3333 } }
    }
    assert.are.same(expected, palindrome_products.smallest(3215, 4000))
  end)
end)
