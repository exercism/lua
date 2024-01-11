local BottleSong = {}

local GENERIC_VERSE = table.concat({
  "N green bottles hanging on the wall,\n",
  "N green bottles hanging on the wall,\n",
  "And if one green bottle should accidentally fall,\n",
  "There'll be M green bottles hanging on the wall.\n"
})

local words = { [0] = 'no', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten' }

local function title_case(word)
  return word:sub(1, 1):upper() .. word:sub(2)
end

local function verse(number)
  local a_verse = GENERIC_VERSE:gsub('N', title_case(words[number])):gsub('M', words[number - 1])
  if number < 3 then
    a_verse = a_verse:gsub('One green bottles', 'One green bottle')
    a_verse = a_verse:gsub('one green bottles', 'one green bottle')
  end
  return a_verse
end

--- Produces the lyrics to the song "Ten Green Bottles"
-- @param start_bottles The initial number of bottles on the wall
-- @param[opt=1] take_down The number of bottles that fall
function BottleSong.recite(start_bottles, take_down)
  finish_bottles = start_bottles + 1 - take_down

  local verses = ''
  for i = start_bottles, finish_bottles, -1 do
    verses = verses .. verse(i)
    if i ~= finish_bottles then
      verses = verses .. '\n'
    end
  end
  return verses
end

return BottleSong
