local is_leap_year = require('leap')

describe('leap', function()
  it('year not divisible by 4 is common year', function()
    assert.is_false(is_leap_year(2015))
  end)

  it('year divisible by 2, not divisible by 4 is common year', function()
    assert.is_false(is_leap_year(1970))
  end)

  it('year divisible by 4, not divisible by 100 is leap year', function()
    assert.is_true(is_leap_year(1996))
  end)

  it('year divisible by 4 and 5 is still a leap year', function()
    assert.is_true(is_leap_year(1960))
  end)

  it('year divisible by 100, not divisible by 400 is common year', function()
    assert.is_false(is_leap_year(2100))
  end)

  it('year divisible by 100 but not by 3 is still not a leap year', function()
    assert.is_false(is_leap_year(1900))
  end)

  it('year divisible by 400 is leap year', function()
    assert.is_true(is_leap_year(2000))
  end)

  it('year divisible by 400 but not by 125 is still a leap year', function()
    assert.is_true(is_leap_year(2400))
  end)

  it('year divisible by 200, not divisible by 400 is common year', function()
    assert.is_false(is_leap_year(1800))
  end)
end)
