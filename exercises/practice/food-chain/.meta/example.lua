local data = {
  {
    thing = 'fly',
    why = "I don't know why she swallowed the fly. Perhaps she'll die."
  },
  {
    thing = 'spider',
    quip = 'It wriggled and jiggled and tickled inside her.'
  },
  {
    thing = 'bird',
    quip = 'How absurd to swallow a bird!',
    why = 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.'
  },
  {
    thing = 'cat',
    quip = 'Imagine that, to swallow a cat!'
  },
  {
    thing = 'dog',
    quip = 'What a hog, to swallow a dog!'
  },
  {
    thing = 'goat',
    quip = 'Just opened her throat and swallowed a goat!'
  },
  {
    thing = 'cow',
    quip = "I don't know how she swallowed a cow!"
  },
  {
    thing = 'horse',
    quip = "She's dead, of course!",
    terminal = true
  }
}

local function verse(which)
  local verse = {
    'I know an old lady who swallowed a ' .. data[which].thing .. '.',
    data[which].quip
  }

  if not data[which].terminal then
    for i = which, 1, -1 do
      local why = 'She swallowed the %s to catch the %s.'
      table.insert(verse, data[i].why or why:format(data[i].thing, data[i - 1].thing))
    end
  end

  return table.concat(verse, '\n') .. '\n'
end

local function verses(from, to)
  local verses = {}
  for i = from, to do
    table.insert(verses, verse(i))
  end
  return table.concat(verses, '\n') .. '\n'
end

local function sing()
  return verses(1, #data)
end

return {
  verse = verse,
  verses = verses,
  sing = sing
}
