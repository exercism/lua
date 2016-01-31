local foodchain = {}

foodchain.CREATURES = {"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"}
foodchain.LINE_1 = "I know an old lady who swallowed a"
foodchain.LINE_2 = {
  fly = "I don't know why she swallowed the fly. Perhaps she'll die.",
  spider = "It wriggled and jiggled and tickled inside her.",
  bird = "How absurd to swallow a bird!",
  cat = "Imagine that, to swallow a cat!",
  dog = "What a hog, to swallow a dog!",
  goat = "Just opened her throat and swallowed a goat!",
  cow = "I don't know how she swallowed a cow!",
  horse = "She's dead, of course!"
}
foodchain.LINE_3_1 = "She swallowed the"
foodchain.LINE_3_2 = "to catch the"
foodchain.SPIDER_SPECIAL = "that wriggled and jiggled and tickled inside her"

function foodchain.verse(i)
  local c = foodchain.CREATURES[i]
  local a_verse = ""
  a_verse = a_verse..foodchain.LINE_1
                   .. " "
                   .. c
                   .. ".\n"
                   .. foodchain.LINE_2[c]
                   .. "\n"
  if (c ~= "fly" and c ~= "horse") then
    for j = i, 2, -1 do
      a_verse = a_verse..foodchain.LINE_3_1
                       .. " "
                       .. foodchain.CREATURES[j]
                       .. " "
                       .. foodchain.LINE_3_2
                       .. " "
                       .. foodchain.CREATURES[j-1]
      if (foodchain.CREATURES[j - 1] == "spider") then
         a_verse = a_verse .. " "
                          .. foodchain.SPIDER_SPECIAL
      end
      a_verse = a_verse .. ".\n"
    end
    a_verse = a_verse..foodchain.LINE_2["fly"]
                     .. "\n"
  end
  return a_verse
end

function foodchain.verses(m, n)
  song = ""
  for i = m, n do
    song = song .. foodchain.verse(i) .. "\n"
  end
  return song
end

function foodchain.sing()
  return foodchain.verses(1, 8)
end

return foodchain
