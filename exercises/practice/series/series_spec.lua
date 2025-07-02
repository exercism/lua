local series = require('series')

describe('series', function()
  it('slices of one from one', function()
    local result = {}
    for s in series("1", 1) do
      table.insert(result, s)
    end
    assert.same({ "1" }, result)
  end)

  it('slices of one from two', function()
    local result = {}
    for s in series("12", 1) do
      table.insert(result, s)
    end
    assert.same({ "1", "2" }, result)
  end)

  it('slices of two', function()
    local result = {}
    for s in series("35", 2) do
      table.insert(result, s)
    end
    assert.same({ "35" }, result)
  end)

  it('slices of two overlap', function()
    local result = {}
    for s in series("9142", 2) do
      table.insert(result, s)
    end
    assert.same({ "91", "14", "42" }, result)
  end)

  it('slices can include duplicates', function()
    local result = {}
    for s in series("777777", 3) do
      table.insert(result, s)
    end
    assert.same({ "777", "777", "777", "777" }, result)
  end)

  it('slices of a long series', function()
    local result = {}
    for s in series("918493904243", 5) do
      table.insert(result, s)
    end
    assert.same({ "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243" }, result)
  end)

  it('slice length is too large', function()
    assert.has_error(function()
      series("12345", 6)
    end, "slice length cannot be greater than series length")
  end)

  it('slice length is way too large', function()
    assert.has_error(function()
      series("12345", 42)
    end, "slice length cannot be greater than series length")
  end)

  it('slice length cannot be zero', function()
    assert.has_error(function()
      series("12345", 0)
    end, "slice length cannot be zero")
  end)

  it('slice length cannot be negative', function()
    assert.has_error(function()
      series("123", -1)
    end, "slice length cannot be negative")
  end)

  it('empty series is invalid', function()
    assert.has_error(function()
      series("", 1)
    end, "series cannot be empty")
  end)
end)
