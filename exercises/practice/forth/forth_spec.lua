local forth = require('forth')

describe('forth', function()
  it('numbers just get pushed onto the stack', function()
    assert.are.same({ 1, 2, 3, 4, 5 }, forth.evaluate({ '1 2 3 4 5' }))
  end)

  it('pushes negative numbers onto the stack', function()
    assert.are.same({ -1, -2, -3, -4, -5 }, forth.evaluate({ '-1 -2 -3 -4 -5' }))
  end)

  it('can add two numbers', function()
    assert.are.same({ 3 }, forth.evaluate({ '1 2 +' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '+' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 +' })
    end)
  end)

  it('can subtract two numbers', function()
    assert.are.same({ -1 }, forth.evaluate({ '3 4 -' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '-' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 -' })
    end)
  end)

  it('can multiply two numbers', function()
    assert.are.same({ 8 }, forth.evaluate({ '2 4 *' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '*' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 *' })
    end)
  end)

  it('can divide two numbers', function()
    assert.are.same({ 4 }, forth.evaluate({ '12 3 /' }))
  end)

  it('performs integer division', function()
    assert.are.same({ 2 }, forth.evaluate({ '8 3 /' }))
  end)

  it('errors if dividing by zero', function()
    assert.has.error(function()
      forth.evaluate({ '4 0 /' })
    end)
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '/' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 /' })
    end)
  end)

  it('addition and subtraction', function()
    assert.are.same({ -1 }, forth.evaluate({ '1 2 + 4 -' }))
  end)

  it('multiplication and division', function()
    assert.are.same({ 2 }, forth.evaluate({ '2 4 * 3 /' }))
  end)

  it('copies a value on the stack', function()
    assert.are.same({ 1, 1 }, forth.evaluate({ '1 dup' }))
  end)

  it('copies the top value on the stack', function()
    assert.are.same({ 1, 2, 2 }, forth.evaluate({ '1 2 dup' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ 'dup' })
    end)
  end)

  it('removes the top value on the stack if it is the only one', function()
    assert.are.same({}, forth.evaluate({ '1 drop' }))
  end)

  it('removes the top value on the stack if it is not the only one', function()
    assert.are.same({ 1 }, forth.evaluate({ '1 2 drop' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ 'drop' })
    end)
  end)

  it('swaps the top two values on the stack if they are the only ones', function()
    assert.are.same({ 2, 1 }, forth.evaluate({ '1 2 swap' }))
  end)

  it('swaps the top two values on the stack if they are not the only ones', function()
    assert.are.same({ 1, 3, 2 }, forth.evaluate({ '1 2 3 swap' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ 'swap' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 swap' })
    end)
  end)

  it('copies the second element if there are only two', function()
    assert.are.same({ 1, 2, 1 }, forth.evaluate({ '1 2 over' }))
  end)

  it('copies the second element if there are more than two', function()
    assert.are.same({ 1, 2, 3, 2 }, forth.evaluate({ '1 2 3 over' }))
  end)

  it('errors if there is nothing on the stack', function()
    assert.has.error(function()
      forth.evaluate({ 'over' })
    end)
  end)

  it('errors if there is only one value on the stack', function()
    assert.has.error(function()
      forth.evaluate({ '1 over' })
    end)
  end)

  it('can consist of built-in words', function()
    assert.are.same({ 1, 1, 1 }, forth.evaluate({ ': dup-twice dup dup ;', '1 dup-twice' }))
  end)

  it('execute in the right order', function()
    assert.are.same({ 1, 2, 3 }, forth.evaluate({ ': countup 1 2 3 ;', 'countup' }))
  end)

  it('can override other user-defined words', function()
    assert.are.same({ 1, 1, 1 }, forth.evaluate({ ': foo dup ;', ': foo dup dup ;', '1 foo' }))
  end)

  it('can override built-in words', function()
    assert.are.same({ 1, 1 }, forth.evaluate({ ': swap dup ;', '1 swap' }))
  end)

  it('can override built-in operators', function()
    assert.are.same({ 12 }, forth.evaluate({ ': + * ;', '3 4 +' }))
  end)

  it('can use different words with the same name', function()
    assert.are.same({ 5, 6 }, forth.evaluate({ ': foo 5 ;', ': bar foo ;', ': foo 6 ;', 'bar foo' }))
  end)

  it('can define word that uses word with the same name', function()
    assert.are.same({ 11 }, forth.evaluate({ ': foo 10 ;', ': foo foo 1 + ;', 'foo' }))
  end)

  it('cannot redefine non-negative numbers', function()
    assert.has.error(function()
      forth.evaluate({ ': 1 2 ;' })
    end)
  end)

  it('cannot redefine negative numbers', function()
    assert.has.error(function()
      forth.evaluate({ ': -1 2 ;' })
    end)
  end)

  it('errors if executing a non-existent word', function()
    assert.has.error(function()
      forth.evaluate({ 'foo' })
    end)
  end)

  it('only defines locally', function()
    assert.are.same({ 0 }, forth.evaluate({ ': + - ;', '1 1 +' }))
    assert.are.same({ 2 }, forth.evaluate({ '1 1 +' }))
  end)

  it('DUP is case-insensitive', function()
    assert.are.same({ 1, 1, 1, 1 }, forth.evaluate({ '1 DUP Dup dup' }))
  end)

  it('DROP is case-insensitive', function()
    assert.are.same({ 1 }, forth.evaluate({ '1 2 3 4 DROP Drop drop' }))
  end)

  it('SWAP is case-insensitive', function()
    assert.are.same({ 2, 3, 4, 1 }, forth.evaluate({ '1 2 SWAP 3 Swap 4 swap' }))
  end)

  it('OVER is case-insensitive', function()
    assert.are.same({ 1, 2, 1, 2, 1 }, forth.evaluate({ '1 2 OVER Over over' }))
  end)

  it('user-defined words are case-insensitive', function()
    assert.are.same({ 1, 1, 1, 1 }, forth.evaluate({ ': foo dup ;', '1 FOO Foo foo' }))
  end)

  it('definitions are case-insensitive', function()
    assert.are.same({ 1, 1, 1, 1 }, forth.evaluate({ ': SWAP DUP Dup dup ;', '1 swap' }))
  end)
end)
