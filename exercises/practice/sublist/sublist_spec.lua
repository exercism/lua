local sublist = require('sublist')

describe('sublist', function()
  it('empty lists', function()
    assert.equal('equal', sublist({}, {}))
  end)

  it('empty list within non empty list', function()
    assert.equal('sublist', sublist({}, { 1, 2, 3 }))
  end)

  it('non empty list contains empty list', function()
    assert.equal('superlist', sublist({ 1, 2, 3 }, {}))
  end)

  it('list equals itself', function()
    assert.equal('equal', sublist({ 1, 2, 3 }, { 1, 2, 3 }))
  end)

  it('different lists', function()
    assert.equal('unequal', sublist({ 1, 2, 3 }, { 2, 3, 4 }))
  end)

  it('false start', function()
    assert.equal('sublist', sublist({ 1, 2, 5 }, { 0, 1, 2, 3, 1, 2, 5, 6 }))
  end)

  it('consecutive', function()
    assert.equal('sublist', sublist({ 1, 1, 2 }, { 0, 1, 1, 1, 2, 1, 2 }))
  end)

  it('sublist at start', function()
    assert.equal('sublist', sublist({ 0, 1, 2 }, { 0, 1, 2, 3, 4, 5 }))
  end)

  it('sublist in middle', function()
    assert.equal('sublist', sublist({ 2, 3, 4 }, { 0, 1, 2, 3, 4, 5 }))
  end)

  it('sublist at end', function()
    assert.equal('sublist', sublist({ 3, 4, 5 }, { 0, 1, 2, 3, 4, 5 }))
  end)

  it('at start of superlist', function()
    assert.equal('superlist', sublist({ 0, 1, 2, 3, 4, 5 }, { 0, 1, 2 }))
  end)

  it('in middle of superlist', function()
    assert.equal('superlist', sublist({ 0, 1, 2, 3, 4, 5 }, { 2, 3 }))
  end)

  it('at end of superlist', function()
    assert.equal('superlist', sublist({ 0, 1, 2, 3, 4, 5 }, { 3, 4, 5 }))
  end)

  it('first list missing element from second list', function()
    assert.equal('unequal', sublist({ 1, 3 }, { 1, 2, 3 }))
  end)

  it('second list missing element from first list', function()
    assert.equal('unequal', sublist({ 1, 2, 3 }, { 1, 3 }))
  end)

  it('first list missing additional digits from second list', function()
    assert.equal('unequal', sublist({ 1, 2 }, { 1, 22 }))
  end)

  it('order matters to a list', function()
    assert.equal('unequal', sublist({ 1, 2, 3 }, { 3, 2, 1 }))
  end)

  it('same digits but different numbers', function()
    assert.equal('unequal', sublist({ 1, 0, 1 }, { 10, 1 }))
  end)
end)
