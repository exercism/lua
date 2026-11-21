local transpose = require('transpose')

describe('transpose', function()
  it('empty string', function()
    local input = '' --
    .. ''

    local expected = '' --
    .. ''

    assert.are.equal(expected, transpose(input))
  end)

  it('two characters in a row', function()
    local input = '' --
    .. 'A1'

    local expected = '' --
    .. 'A\n' -- 
    .. '1'

    assert.are.equal(expected, transpose(input))
  end)

  it('two characters in a column', function()
    local input = '' --
    .. 'A\n' -- 
    .. '1'

    local expected = '' --
    .. 'A1'

    assert.are.equal(expected, transpose(input))
  end)

  it('simple', function()
    local input = '' --
    .. 'ABC\n' -- 
    .. '123'

    local expected = '' --
    .. 'A1\n' -- 
    .. 'B2\n' -- 
    .. 'C3'

    assert.are.equal(expected, transpose(input))
  end)

  it('single line', function()
    local input = '' --
    .. 'Single line.'

    local expected = '' --
    .. 'S\n' -- 
    .. 'i\n' -- 
    .. 'n\n' -- 
    .. 'g\n' -- 
    .. 'l\n' -- 
    .. 'e\n' -- 
    .. ' \n' -- 
    .. 'l\n' -- 
    .. 'i\n' -- 
    .. 'n\n' -- 
    .. 'e\n' -- 
    .. '.'

    assert.are.equal(expected, transpose(input))
  end)

  it('first line longer than second line', function()
    local input = '' --
    .. 'The fourth line.\n' -- 
    .. 'The fifth line.'

    local expected = '' --
    .. 'TT\n' -- 
    .. 'hh\n' -- 
    .. 'ee\n' -- 
    .. '  \n' -- 
    .. 'ff\n' -- 
    .. 'oi\n' -- 
    .. 'uf\n' -- 
    .. 'rt\n' -- 
    .. 'th\n' -- 
    .. 'h \n' -- 
    .. ' l\n' -- 
    .. 'li\n' -- 
    .. 'in\n' -- 
    .. 'ne\n' -- 
    .. 'e.\n' -- 
    .. '.'

    assert.are.equal(expected, transpose(input))
  end)

  it('second line longer than first line', function()
    local input = '' --
    .. 'The first line.\n' -- 
    .. 'The second line.'

    local expected = '' --
    .. 'TT\n' -- 
    .. 'hh\n' -- 
    .. 'ee\n' -- 
    .. '  \n' -- 
    .. 'fs\n' -- 
    .. 'ie\n' -- 
    .. 'rc\n' -- 
    .. 'so\n' -- 
    .. 'tn\n' -- 
    .. ' d\n' -- 
    .. 'l \n' -- 
    .. 'il\n' -- 
    .. 'ni\n' -- 
    .. 'en\n' -- 
    .. '.e\n' -- 
    .. ' .'

    assert.are.equal(expected, transpose(input))
  end)

  it('mixed line length', function()
    local input = '' --
    .. 'The longest line.\n' -- 
    .. 'A long line.\n' -- 
    .. 'A longer line.\n' -- 
    .. 'A line.'

    local expected = '' --
    .. 'TAAA\n' -- 
    .. 'h   \n' -- 
    .. 'elll\n' -- 
    .. ' ooi\n' -- 
    .. 'lnnn\n' -- 
    .. 'ogge\n' -- 
    .. 'n e.\n' -- 
    .. 'glr\n' -- 
    .. 'ei \n' -- 
    .. 'snl\n' -- 
    .. 'tei\n' -- 
    .. ' .n\n' -- 
    .. 'l e\n' -- 
    .. 'i .\n' -- 
    .. 'n\n' -- 
    .. 'e\n' -- 
    .. '.'

    assert.are.equal(expected, transpose(input))
  end)

  it('square', function()
    local input = '' --
    .. 'HEART\n' -- 
    .. 'EMBER\n' -- 
    .. 'ABUSE\n' -- 
    .. 'RESIN\n' -- 
    .. 'TREND'

    local expected = '' --
    .. 'HEART\n' -- 
    .. 'EMBER\n' -- 
    .. 'ABUSE\n' -- 
    .. 'RESIN\n' -- 
    .. 'TREND'

    assert.are.equal(expected, transpose(input))
  end)

  it('rectangle', function()
    local input = '' --
    .. 'FRACTURE\n' -- 
    .. 'OUTLINED\n' -- 
    .. 'BLOOMING\n' -- 
    .. 'SEPTETTE'

    local expected = '' --
    .. 'FOBS\n' -- 
    .. 'RULE\n' -- 
    .. 'ATOP\n' -- 
    .. 'CLOT\n' -- 
    .. 'TIME\n' -- 
    .. 'UNIT\n' -- 
    .. 'RENT\n' -- 
    .. 'EDGE'

    assert.are.equal(expected, transpose(input))
  end)

  it('triangle', function()
    local input = '' --
    .. 'T\n' -- 
    .. 'EE\n' -- 
    .. 'AAA\n' -- 
    .. 'SSSS\n' -- 
    .. 'EEEEE\n' -- 
    .. 'RRRRRR'

    local expected = '' --
    .. 'TEASER\n' -- 
    .. ' EASER\n' -- 
    .. '  ASER\n' -- 
    .. '   SER\n' -- 
    .. '    ER\n' -- 
    .. '     R'

    assert.are.equal(expected, transpose(input))
  end)

  it('jagged triangle', function()
    local input = '' --
    .. '11\n' -- 
    .. '2\n' -- 
    .. '3333\n' -- 
    .. '444\n' -- 
    .. '555555\n' -- 
    .. '66666'

    local expected = '' --
    .. '123456\n' -- 
    .. '1 3456\n' -- 
    .. '  3456\n' -- 
    .. '  3 56\n' -- 
    .. '    56\n' -- 
    .. '    5'

    assert.are.equal(expected, transpose(input))
  end)
end)
