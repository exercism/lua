local function recite_verse(verse)
  local ordinals = {
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth'
  }

  local gifts = {
    'a Partridge in a Pear Tree.',
    'two Turtle Doves, and',
    'three French Hens,',
    'four Calling Birds,',
    'five Gold Rings,',
    'six Geese-a-Laying,',
    'seven Swans-a-Swimming,',
    'eight Maids-a-Milking,',
    'nine Ladies Dancing,',
    'ten Lords-a-Leaping,',
    'eleven Pipers Piping,',
    'twelve Drummers Drumming,'
  }

  local result = { 'On the', ordinals[verse], 'day of Christmas my true love gave to me:' }
  for index = verse, 1, -1 do
    table.insert(result, gifts[index])
  end

  return table.concat(result, ' ')
end

local function recite(start_verse, end_verse)
  local result = {}
  for verse = start_verse, end_verse do
    table.insert(result, recite_verse(verse))
  end
  return result
end

return { recite = recite }
