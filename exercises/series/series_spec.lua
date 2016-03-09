local series = require('series')

describe('series', function()
  it('should generate 1 character series', function()
    local result = {}
    for s in series('abcde', 1) do
      table.insert(result, s)
    end
    assert.same({ 'a', 'b', 'c', 'd', 'e' }, result)
  end)

  it('should generate multi-character series', function()
    local result = {}
    for s in series('hello', 3) do
      table.insert(result, s)
    end
    assert.same({ 'hel', 'ell', 'llo' }, result)
  end)

  it('should generate one series when the series length equals the string length', function()
    local result = {}
    for s in series('exercism', 8) do
      table.insert(result, s)
    end
    assert.same({ 'exercism' }, result)
  end)

  it('should return no series when the series length requested is longer than the string', function()
    local result = {}
    for s in series('1234', 5) do
      table.insert(result, s)
    end
    assert.same({}, result)
  end)
end)
