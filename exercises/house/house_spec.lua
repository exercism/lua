local house = require('house')

local verses = {
  [[This is the house that Jack built.]],
  [[This is the malt
that lay in the house that Jack built.]],
  [[This is the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]],
  [[This is the horse and the hound and the horn
that belonged to the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.]]
}

describe('house', function()
  it('should correctly generate the first verse', function()
    assert.equal(verses[1], house.verse(1))
  end)

  it('should correctly generate all verses', function()
    for i = 1, #verses do
      assert.equal(verses[i], house.verse(i))
    end
  end)

  it('should recite the entire song', function()
    assert.equal(table.concat(verses, '\n'), house.recite())
  end)
end)
