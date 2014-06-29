local Beer = require('beer-song')

describe('Beer', function() 

  it('prints an arbitrary verse', function()
    local expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n"
    local result = Beer.verse(8)
    assert.are.equals(expected,result)
  end)

  it('handles 1 bottle', function()
    local expected = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    local result = Beer.verse(1)
    assert.are.equals(expected,result)
  end)

  it('handles 0 bottles', function()
    local expected = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    local result = Beer.verse(0)
    assert.are.equals(expected,result)
  end)

  it('sings several verses', function() 
    local expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n\n7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n\n6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n"
    local result = Beer.sing(8, 6)
    assert.are.equals(expected,result)
  end)

  it('sings the rest of the verses', function()
    local expected = "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n\n2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    local result = Beer.sing(3)
    assert.are.equals(expected,result)
  end)
end)
