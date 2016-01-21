Beer = {}

local GENERIC_VERSE = "N bottles of beer on the wall, N bottles of beer.\nTake one down and pass it around, M bottles of beer on the wall.\n"

local VERSE_FOR_0 = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

function Beer.verse(number)
  if (number == 0) then
    return VERSE_FOR_0
  end
  local a_verse = GENERIC_VERSE:gsub("N", number):gsub("M", number - 1)
  if (number < 3) then
    a_verse = a_verse:gsub("1 bottles","1 bottle")
  end
  if (number == 1) then
    a_verse= a_verse:gsub("one","it"):gsub("0 bottles","no more bottles")
  end
  return a_verse
end

function Beer.sing(start, finish)
  if (finish == nil ) then finish=0 end
  local verses = ""
  for i = start, finish, -1 do
    verses=verses..Beer.verse(i)
    if (i ~= finish) then verses=verses.."\n" end
  end
  return verses
end

return Beer
