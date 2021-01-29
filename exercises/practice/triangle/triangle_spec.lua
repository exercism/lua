local triangle = require('triangle')

describe('triangle', function()
  it('equilateral triangles have equal sides', function()
    assert.are.equals('equilateral', triangle.kind(2, 2, 2))
  end)

  it('larger equilateral triangles also have equal sides', function()
    assert.are.equals('equilateral', triangle.kind(10, 10, 10))
  end)

  it('isosceles triangles have last two sides equal', function()
    assert.are.equals('isosceles', triangle.kind(3, 4, 4))
  end)

  it('isosceles trianges have first and last sides equal', function()
    assert.are.equals('isosceles', triangle.kind(4, 3, 4))
  end)

  it('isosceles triangles have two first sides equal', function()
    assert.are.equals('isosceles', triangle.kind(4, 4, 3))
  end)

  it('isosceles triangles have in fact exactly two sides equal', function()
    assert.are.equals('isosceles', triangle.kind(10, 10, 2))
  end)

  it('scalene triangles have no equal sides', function()
    assert.are.equals('scalene', triangle.kind(3, 4, 5))
  end)

  it('scalene triangles have no equal sides at a larger scale too', function()
    assert.are.equals('scalene', triangle.kind(10, 11, 12))
  end)

  it('scalene triangles have no equal sides in descending order either', function()
    assert.are.equals('scalene', triangle.kind(5, 4, 2))
  end)

  it('very small triangles are legal', function()
    assert.are.equals('scalene', triangle.kind(0.4, 0.6, 0.3))
  end)

  it('test triangles with no size are illegal', function()
    assert.has_error(function() triangle.kind(0, 0, 0) end, 'Input Error')
  end)

  it('triangles with negative sides are illegal', function()
    assert.has_error(function() triangle.kind(3, 4, -5) end, 'Input Error')
  end)

  it('triangles violating triangle inequality are illegal', function()
    assert.has_error(function() triangle.kind(1, 1, 3) end, 'Input Error')
  end)

  it('triangles violating triangle inequality are illegal 2', function()
    assert.has_error(function() triangle.kind(7, 3, 2) end, 'Input Error')
  end)
end)
