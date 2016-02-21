local beer = require('beer-song')

describe('beer-song', function()
  it('prints an arbitrary verse', function()
    local expected = '8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n'
    local result = beer.verse(8)
    assert.are.equal(expected, result)
  end)

  it('handles 1 bottle', function()
    local expected = '1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n'
    local result = beer.verse(1)
    assert.are.equal(expected, result)
  end)

  it('handles 0 bottles', function()
    local expected = 'No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n'
    local result = beer.verse(0)
    assert.are.equal(expected, result)
  end)

  it('sings several verses', function()
    local expected = '8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n\n7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n\n6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n'
    local result = beer.sing(8, 6)
    assert.are.equal(expected, result)
  end)

  it('sings the rest of the verses', function()
    local expected = '3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n\n2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n'
    local result = beer.sing(3)
    assert.are.equal(expected, result)
  end)
end)
