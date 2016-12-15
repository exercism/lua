local meetup = require 'meetup'

describe('meetup', function()
  it('monteenth of May 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 5,
      week = 'teenth',
      day = 'Monday'
    }))
  end)

  it('monteenth of August 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 8,
      week = 'teenth',
      day = 'Monday'
    }))
  end)

  it('monteenth of September 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 9,
      week = 'teenth',
      day = 'Monday'
    }))
  end)

  it('tuesteenth of March 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 3,
      week = 'teenth',
      day = 'Tuesday'
    }))
  end)

  it('tuesteenth of April 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 4,
      week = 'teenth',
      day = 'Tuesday'
    }))
  end)

  it('tuesteenth of August 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 8,
      week = 'teenth',
      day = 'Tuesday'
    }))
  end)

  it('wednesteenth of January 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 1,
      week = 'teenth',
      day = 'Wednesday'
    }))
  end)

  it('wednesteenth of February 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 2,
      week = 'teenth',
      day = 'Wednesday'
    }))
  end)

  it('wednesteenth of June 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 6,
      week = 'teenth',
      day = 'Wednesday'
    }))
  end)

  it('thursteenth of May 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 5,
      week = 'teenth',
      day = 'Thursday'
    }))
  end)

  it('thursteenth of June 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 6,
      week = 'teenth',
      day = 'Thursday'
    }))
  end)

  it('thursteenth of September 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 9,
      week = 'teenth',
      day = 'Thursday'
    }))
  end)

  it('friteenth of April 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 4,
      week = 'teenth',
      day = 'Friday'
    }))
  end)

  it('friteenth of August 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 8,
      week = 'teenth',
      day = 'Friday'
    }))
  end)

  it('friteenth of September 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 9,
      week = 'teenth',
      day = 'Friday'
    }))
  end)

  it('saturteenth of February 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 2,
      week = 'teenth',
      day = 'Saturday'
    }))
  end)

  it('saturteenth of April 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 4,
      week = 'teenth',
      day = 'Saturday'
    }))
  end)

  it('saturteenth of October 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 10,
      week = 'teenth',
      day = 'Saturday'
    }))
  end)

  it('sunteenth of May 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 5,
      week = 'teenth',
      day = 'Sunday'
    }))
  end)

  it('sunteenth of June 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 6,
      week = 'teenth',
      day = 'Sunday'
    }))
  end)

  it('sunteenth of October 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 10,
      week = 'teenth',
      day = 'Sunday'
    }))
  end)

  it('first Monday of March 2013', function()
    assert.are.equal(4, meetup({
      year = 2013,
      month = 3,
      week = 'first',
      day = 'Monday'
    }))
  end)

  it('first Monday of April 2013', function()
    assert.are.equal(1, meetup({
      year = 2013,
      month = 4,
      week = 'first',
      day = 'Monday'
    }))
  end)

  it('first Tuesday of May 2013', function()
    assert.are.equal(7, meetup({
      year = 2013,
      month = 5,
      week = 'first',
      day = 'Tuesday'
    }))
  end)

  it('first Tuesday of June 2013', function()
    assert.are.equal(4, meetup({
      year = 2013,
      month = 6,
      week = 'first',
      day = 'Tuesday'
    }))
  end)

  it('first Wednesday of July 2013', function()
    assert.are.equal(3, meetup({
      year = 2013,
      month = 7,
      week = 'first',
      day = 'Wednesday'
    }))
  end)

  it('first Wednesday of August 2013', function()
    assert.are.equal(7, meetup({
      year = 2013,
      month = 8,
      week = 'first',
      day = 'Wednesday'
    }))
  end)

  it('first Thursday of September 2013', function()
    assert.are.equal(5, meetup({
      year = 2013,
      month = 9,
      week = 'first',
      day = 'Thursday'
    }))
  end)

  it('first Thursday of October 2013', function()
    assert.are.equal(3, meetup({
      year = 2013,
      month = 10,
      week = 'first',
      day = 'Thursday'
    }))
  end)

  it('first Friday of November 2013', function()
    assert.are.equal(1, meetup({
      year = 2013,
      month = 11,
      week = 'first',
      day = 'Friday'
    }))
  end)

  it('first Friday of December 2013', function()
    assert.are.equal(6, meetup({
      year = 2013,
      month = 12,
      week = 'first',
      day = 'Friday'
    }))
  end)

  it('first Saturday of January 2013', function()
    assert.are.equal(5, meetup({
      year = 2013,
      month = 1,
      week = 'first',
      day = 'Saturday'
    }))
  end)

  it('first Saturday of February 2013', function()
    assert.are.equal(2, meetup({
      year = 2013,
      month = 2,
      week = 'first',
      day = 'Saturday'
    }))
  end)

  it('first Sunday of March 2013', function()
    assert.are.equal(3, meetup({
      year = 2013,
      month = 3,
      week = 'first',
      day = 'Sunday'
    }))
  end)

  it('first Sunday of April 2013', function()
    assert.are.equal(7, meetup({
      year = 2013,
      month = 4,
      week = 'first',
      day = 'Sunday'
    }))
  end)

  it('second Monday of March 2013', function()
    assert.are.equal(11, meetup({
      year = 2013,
      month = 3,
      week = 'second',
      day = 'Monday'
    }))
  end)

  it('second Monday of April 2013', function()
    assert.are.equal(8, meetup({
      year = 2013,
      month = 4,
      week = 'second',
      day = 'Monday'
    }))
  end)

  it('second Tuesday of May 2013', function()
    assert.are.equal(14, meetup({
      year = 2013,
      month = 5,
      week = 'second',
      day = 'Tuesday'
    }))
  end)

  it('second Tuesday of June 2013', function()
    assert.are.equal(11, meetup({
      year = 2013,
      month = 6,
      week = 'second',
      day = 'Tuesday'
    }))
  end)

  it('second Wednesday of July 2013', function()
    assert.are.equal(10, meetup({
      year = 2013,
      month = 7,
      week = 'second',
      day = 'Wednesday'
    }))
  end)

  it('second Wednesday of August 2013', function()
    assert.are.equal(14, meetup({
      year = 2013,
      month = 8,
      week = 'second',
      day = 'Wednesday'
    }))
  end)

  it('second Thursday of September 2013', function()
    assert.are.equal(12, meetup({
      year = 2013,
      month = 9,
      week = 'second',
      day = 'Thursday'
    }))
  end)

  it('second Thursday of October 2013', function()
    assert.are.equal(10, meetup({
      year = 2013,
      month = 10,
      week = 'second',
      day = 'Thursday'
    }))
  end)

  it('second Friday of November 2013', function()
    assert.are.equal(8, meetup({
      year = 2013,
      month = 11,
      week = 'second',
      day = 'Friday'
    }))
  end)

  it('second Friday of December 2013', function()
    assert.are.equal(13, meetup({
      year = 2013,
      month = 12,
      week = 'second',
      day = 'Friday'
    }))
  end)

  it('second Saturday of January 2013', function()
    assert.are.equal(12, meetup({
      year = 2013,
      month = 1,
      week = 'second',
      day = 'Saturday'
    }))
  end)

  it('second Saturday of February 2013', function()
    assert.are.equal(9, meetup({
      year = 2013,
      month = 2,
      week = 'second',
      day = 'Saturday'
    }))
  end)

  it('second Sunday of March 2013', function()
    assert.are.equal(10, meetup({
      year = 2013,
      month = 3,
      week = 'second',
      day = 'Sunday'
    }))
  end)

  it('second Sunday of April 2013', function()
    assert.are.equal(14, meetup({
      year = 2013,
      month = 4,
      week = 'second',
      day = 'Sunday'
    }))
  end)

  it('third Monday of March 2013', function()
    assert.are.equal(18, meetup({
      year = 2013,
      month = 3,
      week = 'third',
      day = 'Monday'
    }))
  end)

  it('third Monday of April 2013', function()
    assert.are.equal(15, meetup({
      year = 2013,
      month = 4,
      week = 'third',
      day = 'Monday'
    }))
  end)

  it('third Tuesday of May 2013', function()
    assert.are.equal(21, meetup({
      year = 2013,
      month = 5,
      week = 'third',
      day = 'Tuesday'
    }))
  end)

  it('third Tuesday of June 2013', function()
    assert.are.equal(18, meetup({
      year = 2013,
      month = 6,
      week = 'third',
      day = 'Tuesday'
    }))
  end)

  it('third Wednesday of July 2013', function()
    assert.are.equal(17, meetup({
      year = 2013,
      month = 7,
      week = 'third',
      day = 'Wednesday'
    }))
  end)

  it('third Wednesday of August 2013', function()
    assert.are.equal(21, meetup({
      year = 2013,
      month = 8,
      week = 'third',
      day = 'Wednesday'
    }))
  end)

  it('third Thursday of September 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 9,
      week = 'third',
      day = 'Thursday'
    }))
  end)

  it('third Thursday of October 2013', function()
    assert.are.equal(17, meetup({
      year = 2013,
      month = 10,
      week = 'third',
      day = 'Thursday'
    }))
  end)

  it('third Friday of November 2013', function()
    assert.are.equal(15, meetup({
      year = 2013,
      month = 11,
      week = 'third',
      day = 'Friday'
    }))
  end)

  it('third Friday of December 2013', function()
    assert.are.equal(20, meetup({
      year = 2013,
      month = 12,
      week = 'third',
      day = 'Friday'
    }))
  end)

  it('third Saturday of January 2013', function()
    assert.are.equal(19, meetup({
      year = 2013,
      month = 1,
      week = 'third',
      day = 'Saturday'
    }))
  end)

  it('third Saturday of February 2013', function()
    assert.are.equal(16, meetup({
      year = 2013,
      month = 2,
      week = 'third',
      day = 'Saturday'
    }))
  end)

  it('third Sunday of March 2013', function()
    assert.are.equal(17, meetup({
      year = 2013,
      month = 3,
      week = 'third',
      day = 'Sunday'
    }))
  end)

  it('third Sunday of April 2013', function()
    assert.are.equal(21, meetup({
      year = 2013,
      month = 4,
      week = 'third',
      day = 'Sunday'
    }))
  end)

  it('fourth Monday of March 2013', function()
    assert.are.equal(25, meetup({
      year = 2013,
      month = 3,
      week = 'fourth',
      day = 'Monday'
    }))
  end)

  it('fourth Monday of April 2013', function()
    assert.are.equal(22, meetup({
      year = 2013,
      month = 4,
      week = 'fourth',
      day = 'Monday'
    }))
  end)

  it('fourth Tuesday of May 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 5,
      week = 'fourth',
      day = 'Tuesday'
    }))
  end)

  it('fourth Tuesday of June 2013', function()
    assert.are.equal(25, meetup({
      year = 2013,
      month = 6,
      week = 'fourth',
      day = 'Tuesday'
    }))
  end)

  it('fourth Wednesday of July 2013', function()
    assert.are.equal(24, meetup({
      year = 2013,
      month = 7,
      week = 'fourth',
      day = 'Wednesday'
    }))
  end)

  it('fourth Wednesday of August 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 8,
      week = 'fourth',
      day = 'Wednesday'
    }))
  end)

  it('fourth Thursday of September 2013', function()
    assert.are.equal(26, meetup({
      year = 2013,
      month = 9,
      week = 'fourth',
      day = 'Thursday'
    }))
  end)

  it('fourth Thursday of October 2013', function()
    assert.are.equal(24, meetup({
      year = 2013,
      month = 10,
      week = 'fourth',
      day = 'Thursday'
    }))
  end)

  it('fourth Friday of November 2013', function()
    assert.are.equal(22, meetup({
      year = 2013,
      month = 11,
      week = 'fourth',
      day = 'Friday'
    }))
  end)

  it('fourth Friday of December 2013', function()
    assert.are.equal(27, meetup({
      year = 2013,
      month = 12,
      week = 'fourth',
      day = 'Friday'
    }))
  end)

  it('fourth Saturday of January 2013', function()
    assert.are.equal(26, meetup({
      year = 2013,
      month = 1,
      week = 'fourth',
      day = 'Saturday'
    }))
  end)

  it('fourth Saturday of February 2013', function()
    assert.are.equal(23, meetup({
      year = 2013,
      month = 2,
      week = 'fourth',
      day = 'Saturday'
    }))
  end)

  it('fourth Sunday of March 2013', function()
    assert.are.equal(24, meetup({
      year = 2013,
      month = 3,
      week = 'fourth',
      day = 'Sunday'
    }))
  end)

  it('fourth Sunday of April 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 4,
      week = 'fourth',
      day = 'Sunday'
    }))
  end)

  it('last Monday of March 2013', function()
    assert.are.equal(25, meetup({
      year = 2013,
      month = 3,
      week = 'last',
      day = 'Monday'
    }))
  end)

  it('last Monday of April 2013', function()
    assert.are.equal(29, meetup({
      year = 2013,
      month = 4,
      week = 'last',
      day = 'Monday'
    }))
  end)

  it('last Tuesday of May 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 5,
      week = 'last',
      day = 'Tuesday'
    }))
  end)

  it('last Tuesday of June 2013', function()
    assert.are.equal(25, meetup({
      year = 2013,
      month = 6,
      week = 'last',
      day = 'Tuesday'
    }))
  end)

  it('last Wednesday of July 2013', function()
    assert.are.equal(31, meetup({
      year = 2013,
      month = 7,
      week = 'last',
      day = 'Wednesday'
    }))
  end)

  it('last Wednesday of August 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 8,
      week = 'last',
      day = 'Wednesday'
    }))
  end)

  it('last Thursday of September 2013', function()
    assert.are.equal(26, meetup({
      year = 2013,
      month = 9,
      week = 'last',
      day = 'Thursday'
    }))
  end)

  it('last Thursday of October 2013', function()
    assert.are.equal(31, meetup({
      year = 2013,
      month = 10,
      week = 'last',
      day = 'Thursday'
    }))
  end)

  it('last Friday of November 2013', function()
    assert.are.equal(29, meetup({
      year = 2013,
      month = 11,
      week = 'last',
      day = 'Friday'
    }))
  end)

  it('last Friday of December 2013', function()
    assert.are.equal(27, meetup({
      year = 2013,
      month = 12,
      week = 'last',
      day = 'Friday'
    }))
  end)

  it('last Saturday of January 2013', function()
    assert.are.equal(26, meetup({
      year = 2013,
      month = 1,
      week = 'last',
      day = 'Saturday'
    }))
  end)

  it('last Saturday of February 2013', function()
    assert.are.equal(23, meetup({
      year = 2013,
      month = 2,
      week = 'last',
      day = 'Saturday'
    }))
  end)

  it('last Sunday of March 2013', function()
    assert.are.equal(31, meetup({
      year = 2013,
      month = 3,
      week = 'last',
      day = 'Sunday'
    }))
  end)

  it('last Sunday of April 2013', function()
    assert.are.equal(28, meetup({
      year = 2013,
      month = 4,
      week = 'last',
      day = 'Sunday'
    }))
  end)

  it('last Wednesday of February 2012', function()
    assert.are.equal(29, meetup({
      year = 2012,
      month = 2,
      week = 'last',
      day = 'Wednesday'
    }))
  end)

  it('last Wednesday of December 2014', function()
    assert.are.equal(31, meetup({
      year = 2014,
      month = 12,
      week = 'last',
      day = 'Wednesday'
    }))
  end)

  it('last Sunday of February 2015', function()
    assert.are.equal(22, meetup({
      year = 2015,
      month = 2,
      week = 'last',
      day = 'Sunday'
    }))
  end)

  it('first Friday of December 2012', function()
    assert.are.equal(7, meetup({
      year = 2012,
      month = 12,
      week = 'first',
      day = 'Friday'
    }))
  end)
end)
