local line_up = require('line-up')

describe('line-up', function()
  it('format smallest non-exceptional ordinal numeral 4', function()
    local expected = 'Gianna, you are the 4th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Gianna', 4))
  end)

  it('format greatest single digit non-exceptional ordinal numeral 9', function()
    local expected = 'Maarten, you are the 9th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Maarten', 9))
  end)

  it('format non-exceptional ordinal numeral 5', function()
    local expected = 'Petronila, you are the 5th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Petronila', 5))
  end)

  it('format non-exceptional ordinal numeral 6', function()
    local expected = 'Attakullakulla, you are the 6th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Attakullakulla', 6))
  end)

  it('format non-exceptional ordinal numeral 7', function()
    local expected = 'Kate, you are the 7th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Kate', 7))
  end)

  it('format non-exceptional ordinal numeral 8', function()
    local expected = 'Maximiliano, you are the 8th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Maximiliano', 8))
  end)

  it('format exceptional ordinal numeral 1', function()
    local expected = 'Mary, you are the 1st customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Mary', 1))
  end)

  it('format exceptional ordinal numeral 2', function()
    local expected = 'Haruto, you are the 2nd customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Haruto', 2))
  end)

  it('format exceptional ordinal numeral 3', function()
    local expected = 'Henriette, you are the 3rd customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Henriette', 3))
  end)

  it('format smallest two digit non-exceptional ordinal numeral 10', function()
    local expected = 'Alvarez, you are the 10th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Alvarez', 10))
  end)

  it('format non-exceptional ordinal numeral 11', function()
    local expected = 'Jacqueline, you are the 11th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Jacqueline', 11))
  end)

  it('format non-exceptional ordinal numeral 12', function()
    local expected = 'Juan, you are the 12th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Juan', 12))
  end)

  it('format non-exceptional ordinal numeral 13', function()
    local expected = 'Patricia, you are the 13th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Patricia', 13))
  end)

  it('format exceptional ordinal numeral 21', function()
    local expected = 'Washi, you are the 21st customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Washi', 21))
  end)

  it('format exceptional ordinal numeral 62', function()
    local expected = 'Nayra, you are the 62nd customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Nayra', 62))
  end)

  it('format exceptional ordinal numeral 100', function()
    local expected = 'John, you are the 100th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('John', 100))
  end)

  it('format exceptional ordinal numeral 101', function()
    local expected = 'Zeinab, you are the 101st customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Zeinab', 101))
  end)

  it('format non-exceptional ordinal numeral 112', function()
    local expected = 'Knud, you are the 112th customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Knud', 112))
  end)

  it('format exceptional ordinal numeral 123', function()
    local expected = 'Yma, you are the 123rd customer we serve today. Thank you!'
    assert.are.same(expected, line_up.format('Yma', 123))
  end)
end)
