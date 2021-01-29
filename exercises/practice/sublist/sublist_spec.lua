local is_sublist = require('sublist')

describe('sublist', function()
  it('should consider an empty list to be a sublist of an empty list', function()
    assert.equal(true, is_sublist({}, {}))
  end)

  it('should consider an empty list to be a sublist of a non-empty list', function()
    assert.equal(true, is_sublist({}, { 1, 2, 3 }))
  end)

  it('should consider a list to be a sublist of itself', function()
    assert.equal(true, is_sublist({ 1, 2, 3 }, { 1, 2, 3 }))
  end)

  it('should not consider a subset to be a sublist', function()
    assert.equal(false, is_sublist({ 1, 2, 3 }, { 2, 1, 3 }))
  end)

  it('should find a sublist at the beginning of a list', function()
    assert.equal(true, is_sublist({ 11, 22, 33 }, { 11, 22, 33, 44, 55 }))
  end)

  it('should find a sublist in the middle of a list', function()
    assert.equal(true, is_sublist({ 12, 13, 14 }, { 11, 12, 13, 14, 15 }))
  end)

  it('should find a sublist at the end of a list', function()
    assert.equal(true, is_sublist({ 30, 40, 50 }, { 10, 20, 30, 40, 50 }))
  end)

  it('should be able to determine when a list is not a sublist', function()
    assert.equal(false, is_sublist({ 1, 2, 3 }, { 5, 6, 7, 8, 9 }))
  end)

  it('should not consider almost sublists to be sublists', function()
    assert.equal(false, is_sublist({ 3, 4, 5 }, { 1, 2, 4, 5, 6 }))
    assert.equal(false, is_sublist({ 3, 4, 5 }, { 1, 2, 3, 4, 6 }))
  end)

  it('should find a sublist when there are multiple instances of the sublist', function()
    assert.equal(true, is_sublist({ 1, 2, 3 }, { 0, 1, 2, 3, 4, 1, 2, 3, 6 }))
  end)
end)
