local book_store = require('book-store')

describe('book-store', function()
  it('only a single book', function()
    local basket = { 1 }
    assert.are.same(800, book_store.total(basket))
  end)

  it('two of the same book', function()
    local basket = { 2, 2 }
    assert.are.same(1600, book_store.total(basket))
  end)

  it('empty basket', function()
    local basket = {}
    assert.are.same(0, book_store.total(basket))
  end)

  it('two different books', function()
    local basket = { 1, 2 }
    assert.are.same(1520, book_store.total(basket))
  end)

  it('three different books', function()
    local basket = { 1, 2, 3 }
    assert.are.same(2160, book_store.total(basket))
  end)

  it('four different books', function()
    local basket = { 1, 2, 3, 4 }
    assert.are.same(2560, book_store.total(basket))
  end)

  it('five different books', function()
    local basket = { 1, 2, 3, 4, 5 }
    assert.are.same(3000, book_store.total(basket))
  end)

  it('two groups of four is cheaper than group of five plus group of three', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 5 }
    assert.are.same(5120, book_store.total(basket))
  end)

  it('two groups of four is cheaper than groups of five and three', function()
    local basket = { 1, 1, 2, 3, 4, 4, 5, 5 }
    assert.are.same(5120, book_store.total(basket))
  end)

  it('group of four plus group of two is cheaper than two groups of three', function()
    local basket = { 1, 1, 2, 2, 3, 4 }
    assert.are.same(4080, book_store.total(basket))
  end)

  it('two each of first four books and one copy each of rest', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 4, 5 }
    assert.are.same(5560, book_store.total(basket))
  end)

  it('two copies of each book', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5 }
    assert.are.same(6000, book_store.total(basket))
  end)

  it('three copies of first book and two each of remaining', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1 }
    assert.are.same(6800, book_store.total(basket))
  end)

  it('three each of first two books and two each of remaining books', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2 }
    assert.are.same(7520, book_store.total(basket))
  end)

  it('four groups of four are cheaper than two groups each of five and three', function()
    local basket = { 1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5 }
    assert.are.same(10240, book_store.total(basket))
  end)

  it('check that groups of four are created properly even when there are more groups of three than groups of five',
     function()
    local basket = { 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5 }
    assert.are.same(14560, book_store.total(basket))
  end)

  it('one group of one and four is cheaper than one group of two and three', function()
    local basket = { 1, 1, 2, 3, 4 }
    assert.are.same(3360, book_store.total(basket))
  end)

  it('one group of one and two plus three groups of four is cheaper than one group of each size', function()
    local basket = { 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5 }
    assert.are.same(10000, book_store.total(basket))
  end)
end)
