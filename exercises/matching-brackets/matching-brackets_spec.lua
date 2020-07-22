-- canonical test data 2.0.0

local brackets = require('matching-brackets')

describe('matching-brackets', function()
  it('should accept paired square brackets', function()
    assert.is_true(brackets.valid('[]'))
  end)

  it('should accept empty string', function()
    assert.is_true(brackets.valid(''))
  end)

  it('should reject unpaired brackets', function()
    assert.is_false(brackets.valid('[['))
  end)

  it('should reject wrong ordered brackets', function()
    assert.is_false(brackets.valid('}{'))
  end)

  it('should reject wrong closing bracket', function()
    assert.is_false(brackets.valid('{]'))
  end)

  it('should accept paired with whitespace', function()
    assert.is_true(brackets.valid('{ }'))
  end)

  it('should reject partially paired brackets', function()
    assert.is_false(brackets.valid('{[])'))
  end)

  it('should accept simple nested brackets', function()
    assert.is_true(brackets.valid('{[]}'))
  end)

  it('should accept several paired brackets', function()
    assert.is_true(brackets.valid('{}[]'))
  end)

  it('should accept paired and nested brackets', function()
    assert.is_true(brackets.valid('([{}({}[])])'))
  end)

  it('should reject unopened closing brackets', function()
    assert.is_false(brackets.valid('{[)][]}'))
  end)

  it('should reject unpaired and nested brackets', function()
    assert.is_false(brackets.valid('([{])'))
  end)

  it('should reject paired and wrong nested brackets', function()
    assert.is_false(brackets.valid('[({]})'))
  end)

  it('should reject paired and incomplete brackets', function()
    assert.is_false(brackets.valid('{}['))
  end)

  it('should reject too many closing brackets', function()
    assert.is_false(brackets.valid('[]]'))
  end)

  it('should accept math expression', function()
    assert.is_true(brackets.valid('(((185 + 223.85) * 15) - 543)/2'))
  end)

  it('should accept complex latex expression', function()
    assert.is_true(brackets.valid([[\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)]]))
  end)
end)
