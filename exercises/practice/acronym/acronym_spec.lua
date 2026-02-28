local acronym = require('acronym')

describe('acronym', function()
  it('basic', function()
    local input = "Portable Network Graphics"
    local expected = 'PNG'
    assert.equal(expected, acronym(input))
  end)

  it('lowercase words', function()
    local input = "Ruby on Rails"
    local expected = 'ROR'
    assert.equal(expected, acronym(input))
  end)

  it('punctuation', function()
    local input = "First In, First Out"
    local expected = 'FIFO'
    assert.equal(expected, acronym(input))
  end)

  it('all caps word', function()
    local input = "GNU Image Manipulation Program"
    local expected = 'GIMP'
    assert.equal(expected, acronym(input))
  end)

  it('punctuation without whitespace', function()
    local input = "Complementary metal-oxide semiconductor"
    local expected = 'CMOS'
    assert.equal(expected, acronym(input))
  end)

  it('very long abbreviation', function()
    local input = "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
    local expected = 'ROTFLSHTMDCOALM'
    assert.equal(expected, acronym(input))
  end)

  it('consecutive delimiters', function()
    local input = "Something - I made up from thin air"
    local expected = 'SIMUFTA'
    assert.equal(expected, acronym(input))
  end)

  it('apostrophes', function()
    local input = "Halley's Comet"
    local expected = 'HC'
    assert.equal(expected, acronym(input))
  end)

  it('underscore emphasis', function()
    local input = "The Road _Not_ Taken"
    local expected = 'TRNT'
    assert.equal(expected, acronym(input))
  end)
end)
