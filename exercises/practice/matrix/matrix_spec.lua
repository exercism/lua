local Matrix = require('matrix')

describe('matrix', function()
  it('extract row from one number matrix', function()
    local matrix = Matrix('1')
    assert.are.same({ 1 }, matrix.row(1))
  end)

  it('can extract row', function()
    local matrix = Matrix('1 2\n3 4')
    assert.are.same({ 3, 4 }, matrix.row(2))
  end)

  it('extract row where numbers have different widths', function()
    local matrix = Matrix('1 2\n10 20')
    assert.are.same({ 10, 20 }, matrix.row(2))
  end)

  it('can extract row from non-square matrix with no corresponding column', function()
    local matrix = Matrix('1 2 3\n4 5 6\n7 8 9\n8 7 6')
    assert.are.same({ 8, 7, 6 }, matrix.row(4))
  end)

  it('extract column from one number matrix', function()
    local matrix = Matrix('1')
    assert.are.same({ 1 }, matrix.column(1))
  end)

  it('can extract column', function()
    local matrix = Matrix('1 2 3\n4 5 6\n7 8 9')
    assert.are.same({ 3, 6, 9 }, matrix.column(3))
  end)

  it('can extract column from non-square matrix with no corresponding row', function()
    local matrix = Matrix('1 2 3 4\n5 6 7 8\n9 8 7 6')
    assert.are.same({ 4, 8, 6 }, matrix.column(4))
  end)

  it('extract column where numbers have different widths', function()
    local matrix = Matrix('89 1903 3\n18 3 1\n9 4 800')
    assert.are.same({ 1903, 3, 4 }, matrix.column(2))
  end)
end)
