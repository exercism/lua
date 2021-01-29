local all_your_base = require 'all-your-base'

describe('all-your-base', function()
  it('should convert a single binary digit to a single decimal digit', function()
    assert.are.same({ 1 }, all_your_base.convert({ 1 }, 2).to(10))
  end)

  it('should convert multiple binary digits to a single decimal digit', function()
    assert.are.same({ 5 }, all_your_base.convert({ 1, 0, 1 }, 2).to(10))
  end)

  it('should convert a single decimal digit to binary', function()
    assert.are.same({ 1, 0, 1 }, all_your_base.convert({ 5 }, 10).to(2))
  end)

  it('should convert binary to decimal', function()
    assert.are.same({ 1, 0, 1, 0, 1, 0 }, all_your_base.convert({ 4, 2 }, 10).to(2))
  end)

  it('should convert decimal to binary', function()
    assert.are.same({ 4, 2 }, all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(10))
  end)

  it('should convert trinary to hexadecimal', function()
    assert.are.same({ 2, 10 }, all_your_base.convert({ 1, 1, 2, 0 }, 3).to(16))
  end)

  it('should convert hexadecimal to trinary', function()
    assert.are.same({ 1, 1, 2, 0 }, all_your_base.convert({ 2, 10 }, 16).to(3))
  end)

  it('should convert between large bases', function()
    assert.are.same({ 6, 10, 45 }, all_your_base.convert({ 3, 46, 60 }, 97).to(73))
  end)

  it('should convert no digits to 0', function()
    assert.are.same({ 0 }, all_your_base.convert({ }, 2).to(10))
  end)

  it('should convert no digits to 0', function()
    assert.are.same({ 0 }, all_your_base.convert({ }, 10).to(2))
  end)

  it('should convert multiple 0 digits to 0', function()
    assert.are.same({ 0 }, all_your_base.convert({ 0, 0, 0 }, 10).to(2))
  end)

  it('should ignore leading zeros', function()
    assert.are.same({ 4, 2 }, all_your_base.convert({ 0, 6, 0 }, 7).to(10))
  end)

  it('should not allow negative digits', function()
    assert.has_error(function()
      all_your_base.convert({ 1, -1, 1, 0, 1, 0 }, 2).to(10)
    end, 'negative digits are not allowed')
  end)

  it('should not allow digits that are out of range', function()
    assert.has_error(function()
      all_your_base.convert({ 1, 2, 1, 0, 1, 0 }, 2).to(10)
    end, 'digit out of range')
  end)

  it('should not allow an input base less than 2', function()
    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, -1).to(10)
    end, 'invalid input base')

    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 0).to(10)
    end, 'invalid input base')

    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 1).to(10)
    end, 'invalid input base')
  end)

  it('should not allow an output base less than 2', function()
    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(-1)
    end, 'invalid output base')

    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(0)
    end, 'invalid output base')

    assert.has_error(function()
      all_your_base.convert({ 1, 0, 1, 0, 1, 0 }, 2).to(1)
    end, 'invalid output base')
  end)
end)
