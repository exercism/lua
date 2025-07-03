local change = require('change')

describe('change', function()
  it('change for 1 cent', function()
    assert.same({ 1 }, change(1, { 1, 5, 10, 25 }))
  end)

  it('single coin change', function()
    assert.same({ 25 }, change(25, { 1, 5, 10, 25, 100 }))
  end)

  it('multiple coin change', function()
    assert.same({ 5, 10 }, change(15, { 1, 5, 10, 25, 100 }))
  end)

  it('change with lilliputian coins', function()
    assert.same({ 4, 4, 15 }, change(23, { 1, 4, 15, 20, 50 }))
  end)

  it('change with lower elbonia coins', function()
    assert.same({ 21, 21, 21 }, change(63, { 1, 5, 10, 21, 25 }))
  end)

  it('large target values', function()
    assert.same({ 2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100 },
                change(999, { 1, 2, 5, 10, 20, 50, 100 }))
  end)

  it('possible change without unit coins available', function()
    assert.same({ 2, 2, 2, 5, 10 }, change(21, { 2, 5, 10, 20, 50 }))
  end)

  it('another possible change without unit coins available', function()
    assert.same({ 4, 4, 4, 5, 5, 5 }, change(27, { 4, 5 }))
  end)

  it('a greedy approach is not optimal', function()
    assert.same({ 10, 10 }, change(20, { 1, 10, 11 }))
  end)

  it('no coins make 0 change', function()
    assert.same({}, change(0, { 1, 5, 10, 21, 25 }))
  end)

  it('error testing for change smaller than the smallest of coins', function()
    assert.has.error(function()
      change(3, { 5, 10 })
    end, "can't make target with given coins")
  end)

  it('error if no combination can add up to target', function()
    assert.has.error(function()
      change(94, { 5, 10 })
    end, "can't make target with given coins")
  end)

  it('cannot find negative change values', function()
    assert.has.error(function()
      change(-5, { 1, 2, 5 })
    end, "target can't be negative")
  end)
end)
