local diamond = require 'diamond'

describe('diamond', function()
  it('should generate the diamond for A', function()
    assert.are.equal('A\n', diamond('A'))
  end)

  it('should generate the diamond for B', function()
    local expected =
      ' A \n' ..
      'B B\n' ..
      ' A \n'

    assert.are.equal(expected, diamond('B'))
  end)

  it('should generate the diamond for C', function()
    local expected =
      '  A  \n' ..
      ' B B \n' ..
      'C   C\n' ..
      ' B B \n' ..
      '  A  \n'

    assert.are.equal(expected, diamond('C'))
  end)

  it('should generate the diamond for E', function()
    local expected =
      '    A    \n' ..
      '   B B   \n' ..
      '  C   C  \n' ..
      ' D     D \n' ..
      'E       E\n' ..
      ' D     D \n' ..
      '  C   C  \n' ..
      '   B B   \n' ..
      '    A    \n'

    assert.are.equal(expected, diamond('E'))
  end)

  it('should generate the diamond for H', function()
    local expected =
      '       A       \n' ..
      '      B B      \n' ..
      '     C   C     \n' ..
      '    D     D    \n' ..
      '   E       E   \n' ..
      '  F         F  \n' ..
      ' G           G \n' ..
      'H             H\n' ..
      ' G           G \n' ..
      '  F         F  \n' ..
      '   E       E   \n' ..
      '    D     D    \n' ..
      '     C   C     \n' ..
      '      B B      \n' ..
      '       A       \n'

    assert.are.equal(expected, diamond('H'))
  end)
end)
