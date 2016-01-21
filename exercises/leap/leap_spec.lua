local isLeapYear = require('leap')

describe('Year', function()

  it('a known leap year', function()
    assert.is_true(isLeapYear(1996))
  end)

  it('any old year', function()
    assert.is_false(isLeapYear(1997))
  end)

  it('turn of the 20th century', function()
    assert.is_false(isLeapYear(1900))
  end)

  it('turn of the 21st century', function()
    assert.is_true(isLeapYear(2400))
  end)

end)
