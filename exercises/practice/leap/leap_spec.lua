local is_leap_year = require('leap')

describe('leap', function()
  it('a known leap year', function()
    assert.is_true(is_leap_year(1996))
  end)

  it('any old year', function()
    assert.is_false(is_leap_year(1997))
  end)

  it('turn of the 20th century', function()
    assert.is_false(is_leap_year(1900))
  end)

  it('turn of the 21st century', function()
    assert.is_true(is_leap_year(2000))
  end)
end)
