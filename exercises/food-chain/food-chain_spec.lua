local song = require('food-chain')

describe('food-chain', function ()
  it('fly', function ()
    local expected = "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(1))
  end)

  it('spider', function ()
    local expected = "I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(2))
  end)

  it('bird', function ()
    local expected = "I know an old lady who swallowed a bird.\n" ..
      "How absurd to swallow a bird!\n" ..
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(3))
  end)

  it('cat', function ()
    local expected = "I know an old lady who swallowed a cat.\n" ..
      "Imagine that, to swallow a cat!\n" ..
      "She swallowed the cat to catch the bird.\n" ..
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. " ..
      "Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(4))
  end)

  it('dog', function ()
    local expected = "I know an old lady who swallowed a dog.\n" ..
      "What a hog, to swallow a dog!\n" ..
      "She swallowed the dog to catch the cat.\n" ..
      "She swallowed the cat to catch the bird.\n" ..
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. " ..
      "Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(5))
  end)

  it('goat', function ()
    local expected = "I know an old lady who swallowed a goat.\n" ..
      "Just opened her throat and swallowed a goat!\n" ..
      "She swallowed the goat to catch the dog.\n" ..
      "She swallowed the dog to catch the cat.\n" ..
      "She swallowed the cat to catch the bird.\n" ..
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. " ..
      "Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(6))
  end)

  it('cow', function ()
    local expected = "I know an old lady who swallowed a cow.\n" ..
      "I don't know how she swallowed a cow!\n" ..
      "She swallowed the cow to catch the goat.\n" ..
      "She swallowed the goat to catch the dog.\n" ..
      "She swallowed the dog to catch the cat.\n" ..
      "She swallowed the cat to catch the bird.\n" ..
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. " ..
      "Perhaps she'll die.\n"

    assert.are.equal(expected, song.verse(7))
  end)

  it('horse', function ()
    local expected = "I know an old lady who swallowed a horse.\n" ..
      "She's dead, of course!\n"

    assert.are.equal(expected, song.verse(8))
  end)

  it('multiple verses', function ()
    local expected = ""

    expected = "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\n\n" ..
      "I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\n" ..
      "She swallowed the spider to catch the fly.\n" ..
      "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"

    assert.are.equal(expected, song.verses(1, 2))
  end)

  it('the whole song', function ()
    assert.are.equal(song.verses(1, 8), song.sing())
  end)
end)
