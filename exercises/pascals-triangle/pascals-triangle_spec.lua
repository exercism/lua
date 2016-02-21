local Triangle = require('pascals-triangle')

describe('pascals-triangle', function()
  it('should generate a triangle with one row', function()
    assert.same({ { 1 } }, Triangle(1).rows)
  end)

  it('should generate a triangle with two rows', function()
    assert.same({ { 1 }, { 1, 1 } }, Triangle(2).rows)
  end)

  it('should generate a triangle with three rows', function()
    assert.same({ { 1 }, { 1, 1 }, { 1, 2, 1 } }, Triangle(3).rows)
  end)

  it('should allow the last row to be accessed directly', function()
    assert.same({ 1, 2, 1 }, Triangle(3).last_row)
  end)

  it('should generate the fourth row correctly', function()
    assert.same({ 1, 3, 3, 1 }, Triangle(4).last_row)
  end)

  it('should generate the fifth row correctly', function()
    assert.same({ 1, 4, 6, 4, 1 }, Triangle(5).last_row)
  end)

  it('should generate the twentieth row correctly', function()
    local twentieth = { 1, 19, 171, 969, 3876, 11628, 27132, 50388, 75582, 92378, 92378, 75582, 50388, 27132, 11628, 3876, 969, 171, 19, 1 }
    assert.same(twentieth, Triangle(20).last_row)
  end)
end)
