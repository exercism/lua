local meetup = require('meetup')

describe('meetup', function()
  it('when teenth monday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 5, week = 'teenth', day = 'Monday' }))
  end)

  it('when teenth monday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 8, week = 'teenth', day = 'Monday' }))
  end)

  it('when teenth monday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 9, week = 'teenth', day = 'Monday' }))
  end)

  it('when teenth tuesday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 3, week = 'teenth', day = 'Tuesday' }))
  end)

  it('when teenth tuesday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 4, week = 'teenth', day = 'Tuesday' }))
  end)

  it('when teenth tuesday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 8, week = 'teenth', day = 'Tuesday' }))
  end)

  it('when teenth wednesday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 1, week = 'teenth', day = 'Wednesday' }))
  end)

  it('when teenth wednesday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 2, week = 'teenth', day = 'Wednesday' }))
  end)

  it('when teenth wednesday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 6, week = 'teenth', day = 'Wednesday' }))
  end)

  it('when teenth thursday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 5, week = 'teenth', day = 'Thursday' }))
  end)

  it('when teenth thursday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 6, week = 'teenth', day = 'Thursday' }))
  end)

  it('when teenth thursday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 9, week = 'teenth', day = 'Thursday' }))
  end)

  it('when teenth friday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 4, week = 'teenth', day = 'Friday' }))
  end)

  it('when teenth friday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 8, week = 'teenth', day = 'Friday' }))
  end)

  it('when teenth friday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 9, week = 'teenth', day = 'Friday' }))
  end)

  it('when teenth saturday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 2, week = 'teenth', day = 'Saturday' }))
  end)

  it('when teenth saturday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 4, week = 'teenth', day = 'Saturday' }))
  end)

  it('when teenth saturday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 10, week = 'teenth', day = 'Saturday' }))
  end)

  it('when teenth sunday is the 19th, the last day of the teenth week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 5, week = 'teenth', day = 'Sunday' }))
  end)

  it('when teenth sunday is some day in the middle of the teenth week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 6, week = 'teenth', day = 'Sunday' }))
  end)

  it('when teenth sunday is the 13th, the first day of the teenth week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 10, week = 'teenth', day = 'Sunday' }))
  end)

  it('when first monday is some day in the middle of the first week', function()
    assert.are.equal(4, meetup({ year = 2013, month = 3, week = 'first', day = 'Monday' }))
  end)

  it('when first monday is the 1st, the first day of the first week', function()
    assert.are.equal(1, meetup({ year = 2013, month = 4, week = 'first', day = 'Monday' }))
  end)

  it('when first tuesday is the 7th, the last day of the first week', function()
    assert.are.equal(7, meetup({ year = 2013, month = 5, week = 'first', day = 'Tuesday' }))
  end)

  it('when first tuesday is some day in the middle of the first week', function()
    assert.are.equal(4, meetup({ year = 2013, month = 6, week = 'first', day = 'Tuesday' }))
  end)

  it('when first wednesday is some day in the middle of the first week', function()
    assert.are.equal(3, meetup({ year = 2013, month = 7, week = 'first', day = 'Wednesday' }))
  end)

  it('when first wednesday is the 7th, the last day of the first week', function()
    assert.are.equal(7, meetup({ year = 2013, month = 8, week = 'first', day = 'Wednesday' }))
  end)

  it('when first thursday is some day in the middle of the first week', function()
    assert.are.equal(5, meetup({ year = 2013, month = 9, week = 'first', day = 'Thursday' }))
  end)

  it('when first thursday is another day in the middle of the first week', function()
    assert.are.equal(3, meetup({ year = 2013, month = 10, week = 'first', day = 'Thursday' }))
  end)

  it('when first friday is the 1st, the first day of the first week', function()
    assert.are.equal(1, meetup({ year = 2013, month = 11, week = 'first', day = 'Friday' }))
  end)

  it('when first friday is some day in the middle of the first week', function()
    assert.are.equal(6, meetup({ year = 2013, month = 12, week = 'first', day = 'Friday' }))
  end)

  it('when first saturday is some day in the middle of the first week', function()
    assert.are.equal(5, meetup({ year = 2013, month = 1, week = 'first', day = 'Saturday' }))
  end)

  it('when first saturday is another day in the middle of the first week', function()
    assert.are.equal(2, meetup({ year = 2013, month = 2, week = 'first', day = 'Saturday' }))
  end)

  it('when first sunday is some day in the middle of the first week', function()
    assert.are.equal(3, meetup({ year = 2013, month = 3, week = 'first', day = 'Sunday' }))
  end)

  it('when first sunday is the 7th, the last day of the first week', function()
    assert.are.equal(7, meetup({ year = 2013, month = 4, week = 'first', day = 'Sunday' }))
  end)

  it('when second monday is some day in the middle of the second week', function()
    assert.are.equal(11, meetup({ year = 2013, month = 3, week = 'second', day = 'Monday' }))
  end)

  it('when second monday is the 8th, the first day of the second week', function()
    assert.are.equal(8, meetup({ year = 2013, month = 4, week = 'second', day = 'Monday' }))
  end)

  it('when second tuesday is the 14th, the last day of the second week', function()
    assert.are.equal(14, meetup({ year = 2013, month = 5, week = 'second', day = 'Tuesday' }))
  end)

  it('when second tuesday is some day in the middle of the second week', function()
    assert.are.equal(11, meetup({ year = 2013, month = 6, week = 'second', day = 'Tuesday' }))
  end)

  it('when second wednesday is some day in the middle of the second week', function()
    assert.are.equal(10, meetup({ year = 2013, month = 7, week = 'second', day = 'Wednesday' }))
  end)

  it('when second wednesday is the 14th, the last day of the second week', function()
    assert.are.equal(14, meetup({ year = 2013, month = 8, week = 'second', day = 'Wednesday' }))
  end)

  it('when second thursday is some day in the middle of the second week', function()
    assert.are.equal(12, meetup({ year = 2013, month = 9, week = 'second', day = 'Thursday' }))
  end)

  it('when second thursday is another day in the middle of the second week', function()
    assert.are.equal(10, meetup({ year = 2013, month = 10, week = 'second', day = 'Thursday' }))
  end)

  it('when second friday is the 8th, the first day of the second week', function()
    assert.are.equal(8, meetup({ year = 2013, month = 11, week = 'second', day = 'Friday' }))
  end)

  it('when second friday is some day in the middle of the second week', function()
    assert.are.equal(13, meetup({ year = 2013, month = 12, week = 'second', day = 'Friday' }))
  end)

  it('when second saturday is some day in the middle of the second week', function()
    assert.are.equal(12, meetup({ year = 2013, month = 1, week = 'second', day = 'Saturday' }))
  end)

  it('when second saturday is another day in the middle of the second week', function()
    assert.are.equal(9, meetup({ year = 2013, month = 2, week = 'second', day = 'Saturday' }))
  end)

  it('when second sunday is some day in the middle of the second week', function()
    assert.are.equal(10, meetup({ year = 2013, month = 3, week = 'second', day = 'Sunday' }))
  end)

  it('when second sunday is the 14th, the last day of the second week', function()
    assert.are.equal(14, meetup({ year = 2013, month = 4, week = 'second', day = 'Sunday' }))
  end)

  it('when third monday is some day in the middle of the third week', function()
    assert.are.equal(18, meetup({ year = 2013, month = 3, week = 'third', day = 'Monday' }))
  end)

  it('when third monday is the 15th, the first day of the third week', function()
    assert.are.equal(15, meetup({ year = 2013, month = 4, week = 'third', day = 'Monday' }))
  end)

  it('when third tuesday is the 21st, the last day of the third week', function()
    assert.are.equal(21, meetup({ year = 2013, month = 5, week = 'third', day = 'Tuesday' }))
  end)

  it('when third tuesday is some day in the middle of the third week', function()
    assert.are.equal(18, meetup({ year = 2013, month = 6, week = 'third', day = 'Tuesday' }))
  end)

  it('when third wednesday is some day in the middle of the third week', function()
    assert.are.equal(17, meetup({ year = 2013, month = 7, week = 'third', day = 'Wednesday' }))
  end)

  it('when third wednesday is the 21st, the last day of the third week', function()
    assert.are.equal(21, meetup({ year = 2013, month = 8, week = 'third', day = 'Wednesday' }))
  end)

  it('when third thursday is some day in the middle of the third week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 9, week = 'third', day = 'Thursday' }))
  end)

  it('when third thursday is another day in the middle of the third week', function()
    assert.are.equal(17, meetup({ year = 2013, month = 10, week = 'third', day = 'Thursday' }))
  end)

  it('when third friday is the 15th, the first day of the third week', function()
    assert.are.equal(15, meetup({ year = 2013, month = 11, week = 'third', day = 'Friday' }))
  end)

  it('when third friday is some day in the middle of the third week', function()
    assert.are.equal(20, meetup({ year = 2013, month = 12, week = 'third', day = 'Friday' }))
  end)

  it('when third saturday is some day in the middle of the third week', function()
    assert.are.equal(19, meetup({ year = 2013, month = 1, week = 'third', day = 'Saturday' }))
  end)

  it('when third saturday is another day in the middle of the third week', function()
    assert.are.equal(16, meetup({ year = 2013, month = 2, week = 'third', day = 'Saturday' }))
  end)

  it('when third sunday is some day in the middle of the third week', function()
    assert.are.equal(17, meetup({ year = 2013, month = 3, week = 'third', day = 'Sunday' }))
  end)

  it('when third sunday is the 21st, the last day of the third week', function()
    assert.are.equal(21, meetup({ year = 2013, month = 4, week = 'third', day = 'Sunday' }))
  end)

  it('when fourth monday is some day in the middle of the fourth week', function()
    assert.are.equal(25, meetup({ year = 2013, month = 3, week = 'fourth', day = 'Monday' }))
  end)

  it('when fourth monday is the 22nd, the first day of the fourth week', function()
    assert.are.equal(22, meetup({ year = 2013, month = 4, week = 'fourth', day = 'Monday' }))
  end)

  it('when fourth tuesday is the 28th, the last day of the fourth week', function()
    assert.are.equal(28, meetup({ year = 2013, month = 5, week = 'fourth', day = 'Tuesday' }))
  end)

  it('when fourth tuesday is some day in the middle of the fourth week', function()
    assert.are.equal(25, meetup({ year = 2013, month = 6, week = 'fourth', day = 'Tuesday' }))
  end)

  it('when fourth wednesday is some day in the middle of the fourth week', function()
    assert.are.equal(24, meetup({ year = 2013, month = 7, week = 'fourth', day = 'Wednesday' }))
  end)

  it('when fourth wednesday is the 28th, the last day of the fourth week', function()
    assert.are.equal(28, meetup({ year = 2013, month = 8, week = 'fourth', day = 'Wednesday' }))
  end)

  it('when fourth thursday is some day in the middle of the fourth week', function()
    assert.are.equal(26, meetup({ year = 2013, month = 9, week = 'fourth', day = 'Thursday' }))
  end)

  it('when fourth thursday is another day in the middle of the fourth week', function()
    assert.are.equal(24, meetup({ year = 2013, month = 10, week = 'fourth', day = 'Thursday' }))
  end)

  it('when fourth friday is the 22nd, the first day of the fourth week', function()
    assert.are.equal(22, meetup({ year = 2013, month = 11, week = 'fourth', day = 'Friday' }))
  end)

  it('when fourth friday is some day in the middle of the fourth week', function()
    assert.are.equal(27, meetup({ year = 2013, month = 12, week = 'fourth', day = 'Friday' }))
  end)

  it('when fourth saturday is some day in the middle of the fourth week', function()
    assert.are.equal(26, meetup({ year = 2013, month = 1, week = 'fourth', day = 'Saturday' }))
  end)

  it('when fourth saturday is another day in the middle of the fourth week', function()
    assert.are.equal(23, meetup({ year = 2013, month = 2, week = 'fourth', day = 'Saturday' }))
  end)

  it('when fourth sunday is some day in the middle of the fourth week', function()
    assert.are.equal(24, meetup({ year = 2013, month = 3, week = 'fourth', day = 'Sunday' }))
  end)

  it('when fourth sunday is the 28th, the last day of the fourth week', function()
    assert.are.equal(28, meetup({ year = 2013, month = 4, week = 'fourth', day = 'Sunday' }))
  end)

  it('last monday in a month with four mondays', function()
    assert.are.equal(25, meetup({ year = 2013, month = 3, week = 'last', day = 'Monday' }))
  end)

  it('last monday in a month with five mondays', function()
    assert.are.equal(29, meetup({ year = 2013, month = 4, week = 'last', day = 'Monday' }))
  end)

  it('last tuesday in a month with four tuesdays', function()
    assert.are.equal(28, meetup({ year = 2013, month = 5, week = 'last', day = 'Tuesday' }))
  end)

  it('last tuesday in another month with four tuesdays', function()
    assert.are.equal(25, meetup({ year = 2013, month = 6, week = 'last', day = 'Tuesday' }))
  end)

  it('last wednesday in a month with five wednesdays', function()
    assert.are.equal(31, meetup({ year = 2013, month = 7, week = 'last', day = 'Wednesday' }))
  end)

  it('last wednesday in a month with four wednesdays', function()
    assert.are.equal(28, meetup({ year = 2013, month = 8, week = 'last', day = 'Wednesday' }))
  end)

  it('last thursday in a month with four thursdays', function()
    assert.are.equal(26, meetup({ year = 2013, month = 9, week = 'last', day = 'Thursday' }))
  end)

  it('last thursday in a month with five thursdays', function()
    assert.are.equal(31, meetup({ year = 2013, month = 10, week = 'last', day = 'Thursday' }))
  end)

  it('last friday in a month with five fridays', function()
    assert.are.equal(29, meetup({ year = 2013, month = 11, week = 'last', day = 'Friday' }))
  end)

  it('last friday in a month with four fridays', function()
    assert.are.equal(27, meetup({ year = 2013, month = 12, week = 'last', day = 'Friday' }))
  end)

  it('last saturday in a month with four saturdays', function()
    assert.are.equal(26, meetup({ year = 2013, month = 1, week = 'last', day = 'Saturday' }))
  end)

  it('last saturday in another month with four saturdays', function()
    assert.are.equal(23, meetup({ year = 2013, month = 2, week = 'last', day = 'Saturday' }))
  end)

  it('last sunday in a month with five sundays', function()
    assert.are.equal(31, meetup({ year = 2013, month = 3, week = 'last', day = 'Sunday' }))
  end)

  it('last sunday in a month with four sundays', function()
    assert.are.equal(28, meetup({ year = 2013, month = 4, week = 'last', day = 'Sunday' }))
  end)

  it('when last wednesday in february in a leap year is the 29th', function()
    assert.are.equal(29, meetup({ year = 2012, month = 2, week = 'last', day = 'Wednesday' }))
  end)

  it('last wednesday in december that is also the last day of the year', function()
    assert.are.equal(31, meetup({ year = 2014, month = 12, week = 'last', day = 'Wednesday' }))
  end)

  it('when last sunday in february in a non-leap year is not the 29th', function()
    assert.are.equal(22, meetup({ year = 2015, month = 2, week = 'last', day = 'Sunday' }))
  end)

  it('when first friday is the 7th, the last day of the first week', function()
    assert.are.equal(7, meetup({ year = 2012, month = 12, week = 'first', day = 'Friday' }))
  end)
end)
