local all_your_base = require('all-your-base')

describe('all-your-base', function()
  it('single bit one to decimal', function()
    assert.are.same({ 1 }, all_your_base.convert({ 1 }, 2).to(10))
  end)

  it('binary to single decimal', function()
    assert.are.same({ 5 }, all_your_base.convert({ 1, 0, 1 }, 2).to(10))
  end)

  it('single decimal to binary', function()
    assert.are.same({ 1, 0, 1 }, all_your_base.convert({ 5 }, 10).to(2))
  end)

  it('binary to multiple decimal', function()
    assert.are.same({ 4, 2 }, all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(10))
  end)

  it('decimal to binary', function()
    assert.are.same({ 1, 0, 1, 0, 1, 0 }, all_your_base.convert({ 4, 2 }, 10).to(2))
  end)

  it('trinary to hexadecimal', function()
    assert.are.same({ 2, 10 }, all_your_base.convert({ 1, 1, 2, 0 }, 3).to(16))
  end)

  it('hexadecimal to trinary', function()
    assert.are.same({ 1, 1, 2, 0 }, all_your_base.convert({ 2, 10 }, 16).to(3))
  end)

  it('15-bit integer', function()
    assert.are.same({ 6, 10, 45 }, all_your_base.convert({ 3, 46, 60 }, 97).to(73))
  end)

  it('empty list', function()
    assert.are.same({ 0 }, all_your_base.convert({}, 2).to(10))
  end)

  it('single zero', function()
    assert.are.same({ 0 }, all_your_base.convert({ 0 }, 10).to(2))
  end)

  it('multiple zeros', function()
    assert.are.same({ 0 }, all_your_base.convert({ 0, 0, 0 }, 10).to(2))
  end)

  it('leading zeros', function()
    assert.are.same({ 4, 2 }, all_your_base.convert({ 0, 6, 0 }, 7).to(10))
  end)

  it('input base is one', function()
    assert.has_error(function()
      all_your_base.convert({ 0 }, 1).to(10)
    end)
  end)

  it('input base is zero', function()
    assert.has_error(function()
      all_your_base.convert({}, 0).to(10)
    end)
  end)

  it('input base is negative', function()
    assert.has_error(function()
      all_your_base.convert({ 1 }, -2).to(10)
    end)
  end)

  it('negative digit', function()
    assert.has_error(function()
      all_your_base.convert({ 1, -1, 1, 0, 1, 0 }, 2).to(10)
    end)
  end)

  it('invalid positive digit', function()
    assert.has_error(function()
      all_your_base.convert({ 1, 2, 1, 0, 1, 0 }, 2).to(10)
    end)
  end)

  it('output base is one', function()
    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(1)
    end)
  end)

  it('output base is zero', function()
    assert.has_error(function()
      all_your_base.convert({ 7 }, 10).to(0)
    end)
  end)

  it('output base is negative', function()
    assert.has_error(function()
      all_your_base.convert({ 1 }, 2).to(-7)
    end)
  end)

  it('both bases are negative', function()
    assert.has_error(function()
      all_your_base.convert({ 1 }, -2).to(-7)
    end)
  end)
end)
