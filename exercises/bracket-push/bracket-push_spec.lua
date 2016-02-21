local brackets = require('bracket-push')

describe('bracket-push', function()
  it('should accept an empty string', function()
    assert.is_true(brackets.valid(''))
  end)

  it('should accept a matched pair of braces', function()
    assert.is_true(brackets.valid('{}'))
  end)

  it('should reject an opening brace without a closing brace', function()
    assert.is_false(brackets.valid('{'))
  end)

  it('should reject a closing brace without an opening brace', function()
    assert.is_false(brackets.valid('}{'))
  end)

  it('should accept a matched pair of parens', function()
    assert.is_true(brackets.valid('()'))
  end)

  it('should reject an opening paren without a closing paren', function()
    assert.is_false(brackets.valid('('))
  end)

  it('should reject a closing paren without an opening paren', function()
    assert.is_false(brackets.valid(')('))
  end)

  it('should accept a matched pair of square brackets', function()
    assert.is_true(brackets.valid('[]'))
  end)

  it('should reject an opening square bracket without a closing square bracket', function()
    assert.is_false(brackets.valid('['))
  end)

  it('should reject a closing square bracket without an opening square bracket', function()
    assert.is_false(brackets.valid(']['))
  end)

  it('should accept more than one pair of brackets', function()
    assert.is_true(brackets.valid('[]{}()'))
  end)

  it('should accept nested brackets', function()
    assert.is_true(brackets.valid('[{}]'))
  end)

  it('should reject properly balanced but improperly nested brackets', function()
    assert.is_false(brackets.valid('[{]}'))
  end)

  it('should allow deep nesting of brackets', function()
    assert.is_true(brackets.valid('[{(([{}]))}]'))
  end)

  it('should accept complicated brackets that are balanced and properly nested', function()
    assert.is_true(brackets.valid('{[]([()])}'))
  end)

  it('should reject complicated brackets that are not balanced', function()
    assert.is_false(brackets.valid('{[]([()]}'))
  end)

  it('should reject complicated brackets that are not properly nested', function()
    assert.is_false(brackets.valid('{[]([()]})'))
  end)

  it('should ignore non-bracket characters', function()
    assert.is_true(brackets.valid('{hello[]([a()])b}c'))
  end)
end)
