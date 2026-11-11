local brackets = require('matching-brackets')

describe('matching-brackets', function()
  it('paired square brackets', function()
    assert.is_true(brackets.valid('[]'))
  end)

  it('empty string', function()
    assert.is_true(brackets.valid(''))
  end)

  it('unpaired brackets', function()
    assert.is_false(brackets.valid('[['))
  end)

  it('wrong ordered brackets', function()
    assert.is_false(brackets.valid('}{'))
  end)

  it('wrong closing bracket', function()
    assert.is_false(brackets.valid('{]'))
  end)

  it('paired with whitespace', function()
    assert.is_true(brackets.valid('{ }'))
  end)

  it('partially paired brackets', function()
    assert.is_false(brackets.valid('{[])'))
  end)

  it('simple nested brackets', function()
    assert.is_true(brackets.valid('{[]}'))
  end)

  it('several paired brackets', function()
    assert.is_true(brackets.valid('{}[]'))
  end)

  it('paired and nested brackets', function()
    assert.is_true(brackets.valid('([{}({}[])])'))
  end)

  it('unopened closing brackets', function()
    assert.is_false(brackets.valid('{[)][]}'))
  end)

  it('unpaired and nested brackets', function()
    assert.is_false(brackets.valid('([{])'))
  end)

  it('paired and wrong nested brackets', function()
    assert.is_false(brackets.valid('[({]})'))
  end)

  it('paired and wrong nested brackets but innermost are correct', function()
    assert.is_false(brackets.valid('[({}])'))
  end)

  it('paired and incomplete brackets', function()
    assert.is_false(brackets.valid('{}['))
  end)

  it('too many closing brackets', function()
    assert.is_false(brackets.valid('[]]'))
  end)

  it('early unexpected brackets', function()
    assert.is_false(brackets.valid(')()'))
  end)

  it('early mismatched brackets', function()
    assert.is_false(brackets.valid('{)()'))
  end)

  it('math expression', function()
    assert.is_true(brackets.valid('(((185 + 223.85) * 15) - 543)/2'))
  end)

  it('complex latex expression', function()
    assert.is_true(brackets.valid(
                     '\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'))
  end)
end)
