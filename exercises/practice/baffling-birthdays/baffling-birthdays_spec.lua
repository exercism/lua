local baffling_birthdays = require('baffling-birthdays')

describe('baffling-birthdays', function()
  describe('shared birthday', function()
    it('one birthdate', function()
      local actual = baffling_birthdays.shared_birthday({ '2000-01-01' })
      assert.are.equal(false, actual)
    end)

    it('two birthdates with same year, month, and day', function()
      local actual = baffling_birthdays.shared_birthday({ '2000-01-01', '2000-01-01' })
      assert.are.equal(true, actual)
    end)

    it('two birthdates with same year and month, but different day', function()
      local actual = baffling_birthdays.shared_birthday({ '2012-05-09', '2012-05-17' })
      assert.are.equal(false, actual)
    end)

    it('two birthdates with same month and day, but different year', function()
      local actual = baffling_birthdays.shared_birthday({ '1999-10-23', '1988-10-23' })
      assert.are.equal(true, actual)
    end)

    it('two birthdates with same year, but different month and day', function()
      local actual = baffling_birthdays.shared_birthday({ '2007-12-19', '2007-04-27' })
      assert.are.equal(false, actual)
    end)

    it('two birthdates with different year, month, and day', function()
      local actual = baffling_birthdays.shared_birthday({ '1997-08-04', '1963-11-23' })
      assert.are.equal(false, actual)
    end)

    it('multiple birthdates without shared birthday', function()
      local actual = baffling_birthdays.shared_birthday({ '1966-07-29', '1977-02-12', '2001-12-25', '1980-11-10' })
      assert.are.equal(false, actual)
    end)

    it('multiple birthdates with one shared birthday', function()
      local actual = baffling_birthdays.shared_birthday({ '1966-07-29', '1977-02-12', '2001-07-29', '1980-11-10' })
      assert.are.equal(true, actual)
    end)

    it('multiple birthdates with more than one shared birthday', function()
      local actual = baffling_birthdays.shared_birthday({
        '1966-07-29',
        '1977-02-12',
        '2001-12-25',
        '1980-07-29',
        '2019-02-12'
      })
      assert.are.equal(true, actual)
    end)
  end)

  describe('random birthdates', function()
    it('generate requested number of birthdates', function()
      for i = 1, 10 do
        assert.are.equal(i, #baffling_birthdays.random_birthdates(i))
      end
    end)

    it('years are not leap years', function()
      local birthdates = baffling_birthdays.random_birthdates(1000)
      for _, birthdate in ipairs(birthdates) do
        local year = tonumber(birthdate:sub(1, 4))
        assert.is_false(year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0))
      end
    end)

    it('months are random', function()
      local birthdates = baffling_birthdays.random_birthdates(1000)
      local seen = {}
      local unique_count = 0
      for _, birthdate in ipairs(birthdates) do
        local month = tonumber(birthdate:sub(6, 7))
        if not seen[month] then
          seen[month] = true
          unique_count = unique_count + 1
        end
      end
      assert.are.equal(12, unique_count)
    end)

    it('days are random', function()
      local birthdates = baffling_birthdays.random_birthdates(1000)
      local seen = {}
      local unique_count = 0
      for _, birthdate in ipairs(birthdates) do
        local day = tonumber(birthdate:sub(9, 10))
        if not seen[day] then
          seen[day] = true
          unique_count = unique_count + 1
        end
      end
      assert.are.equal(31, unique_count)
    end)
  end)

  describe('estimated probability of at least one shared birthday', function()
    it('for one person', function()
      local actual = baffling_birthdays.estimated_probability_of_shared_birthday(1)
      assert.are.near(0.0, actual, 1)
    end)

    it('among ten people', function()
      local actual = baffling_birthdays.estimated_probability_of_shared_birthday(10)
      assert.are.near(11.694818, actual, 1)
    end)

    it('among twenty-three people', function()
      local actual = baffling_birthdays.estimated_probability_of_shared_birthday(23)
      assert.are.near(50.729723, actual, 1)
    end)

    it('among seventy people', function()
      local actual = baffling_birthdays.estimated_probability_of_shared_birthday(70)
      assert.are.near(99.915958, actual, 1)
    end)
  end)
end)
