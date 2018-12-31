local find = require('binary-search')
local TracedArray = require('TracedArray')
require('assertions')

describe('binary-search', function()
  it('should return -1 when an empty array is searched', function()
    local array = TracedArray{}

    assert.equal(-1, find(array, 6))
  end)

  it('should be able to find a value in a single element array with one access', function()
    local array = TracedArray{ 6 }

    assert.equal(1, find(array, 6))
    assert.equal(1, array.access_count)
  end)

  it('should return -1 if a value is less than the element in a single element array', function()
    local array = TracedArray{ 94 }

    assert.equal(-1, find(array, 6))
    assert.equal(1, array.access_count)
  end)

  it('should return -1 if a value is greater than the element in a single element array', function()
    local array = TracedArray{ 94 }

    assert.equal(-1, find(array, 602))
    assert.equal(1, array.access_count)
  end)

  it('should find an element in a longer array in less than log(n) accesses', function()
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    assert.equal(8, find(array, 2002))
    assert.lteq(array.access_count, 4)
  end)

  it('should find elements at the beginning of an array in less than log(n) accesses', function()
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    assert.equal(1, find(array, 6))
    assert.lteq(array.access_count, 4)
  end)

  it('should find elements at the end of an array in less than log(n) accesses', function()
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    assert.equal(10, find(array, 54322))
    assert.lteq(array.access_count, 4)
  end)

  it('should return -1 if a value is less than all elements in a long array', function()
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    assert.equal(-1, find(array, 2))
    assert.lteq(array.access_count, 4)
  end)

  it('should return -1 if a value is greater than all elements in a long array', function()
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    assert.equal(-1, find(array, 54323))
    assert.lteq(array.access_count, 4)
  end)
end)
