local find = require('binary-search')

describe('binary-search', function()
  local TracedArray = require('TracedArray')
  require('assertions')

  it('finds a value in an array with one element', function()
    local array = TracedArray { 6 }
    assert.equal(1, find(array, 6))
    assert.lteq(array.access_count, 1)
  end)

  it('finds a value in the middle of an array', function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(4, find(array, 6))
    assert.lteq(array.access_count, 3)
  end)

  it('finds a value at the beginning of an array', function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(1, find(array, 1))
    assert.lteq(array.access_count, 3)
  end)

  it('finds a value at the end of an array', function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(7, find(array, 11))
    assert.lteq(array.access_count, 3)
  end)

  it('finds a value in an array of odd length', function()
    local array = TracedArray { 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634 }
    assert.equal(10, find(array, 144))
    assert.lteq(array.access_count, 4)
  end)

  it('finds a value in an array of even length', function()
    local array = TracedArray { 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377 }
    assert.equal(6, find(array, 21))
    assert.lteq(array.access_count, 4)
  end)

  it('identifies that a value is not included in the array', function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(-1, find(array, 7))
    assert.lteq(array.access_count, 3)
  end)

  it("a value smaller than the array's smallest value is not found", function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(-1, find(array, 0))
    assert.lteq(array.access_count, 3)
  end)

  it("a value larger than the array's largest value is not found", function()
    local array = TracedArray { 1, 3, 4, 6, 8, 9, 11 }
    assert.equal(-1, find(array, 13))
    assert.lteq(array.access_count, 3)
  end)

  it('nothing is found in an empty array', function()
    local array = TracedArray {}
    assert.equal(-1, find(array, 1))
  end)

  it('nothing is found when the left and right bounds cross', function()
    local array = TracedArray { 1, 2 }
    assert.equal(-1, find(array, 0))
    assert.lteq(array.access_count, 2)
  end)
end)
