local grep = require('grep')

describe('grep', function()
  it('one file, one match, no flags', function()
    local expected = { "Of Atreus, Agamemnon, King of men." }
    local actual = grep({ files = { 'iliad.txt' }, flags = {}, pattern = 'Agamemnon' })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, print line numbers flag', function()
    local expected = { "2:Of that Forbidden Tree, whose mortal tast" }
    local actual = grep({ files = { 'paradise-lost.txt' }, flags = { '-n' }, pattern = 'Forbidden' })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, case-insensitive flag', function()
    local expected = { "Of that Forbidden Tree, whose mortal tast" }
    local actual = grep({ files = { 'paradise-lost.txt' }, flags = { '-i' }, pattern = 'FORBIDDEN' })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, print file names flag', function()
    local expected = { "paradise-lost.txt" }
    local actual = grep({ files = { 'paradise-lost.txt' }, flags = { '-l' }, pattern = 'Forbidden' })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, match entire lines flag', function()
    local expected = { "With loss of Eden, till one greater Man" }
    local actual = grep({
      files = { 'paradise-lost.txt' },
      flags = { '-x' },
      pattern = 'With loss of Eden, till one greater Man'
    })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, multiple flags', function()
    local expected = { "9:Of Atreus, Agamemnon, King of men." }
    local actual = grep({
      files = { 'iliad.txt' },
      flags = { '-n', '-i', '-x' },
      pattern = 'OF ATREUS, Agamemnon, KIng of MEN.'
    })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, no flags', function()
    local expected = {
      "Nor how it may concern my modesty,",
      "But I beseech your grace that I may know",
      "The worst that may befall me in this case,"
    }
    local actual = grep({ files = { 'midsummer-night.txt' }, flags = {}, pattern = 'may' })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, print line numbers flag', function()
    local expected = {
      "3:Nor how it may concern my modesty,",
      "5:But I beseech your grace that I may know",
      "6:The worst that may befall me in this case,"
    }
    local actual = grep({ files = { 'midsummer-night.txt' }, flags = { '-n' }, pattern = 'may' })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, match entire lines flag', function()
    local expected = {}
    local actual = grep({ files = { 'midsummer-night.txt' }, flags = { '-x' }, pattern = 'may' })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, case-insensitive flag', function()
    local expected = { "Achilles sing, O Goddess! Peleus' son;", "The noble Chief Achilles from the son" }
    local actual = grep({ files = { 'iliad.txt' }, flags = { '-i' }, pattern = 'ACHILLES' })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, inverted flag', function()
    local expected = {
      "Brought Death into the World, and all our woe,",
      "With loss of Eden, till one greater Man",
      "Restore us, and regain the blissful Seat,",
      "Sing Heav'nly Muse, that on the secret top",
      "That Shepherd, who first taught the chosen Seed"
    }
    local actual = grep({ files = { 'paradise-lost.txt' }, flags = { '-v' }, pattern = 'Of' })
    assert.are.same(expected, actual)
  end)

  it('one file, no matches, various flags', function()
    local expected = {}
    local actual = grep({ files = { 'iliad.txt' }, flags = { '-n', '-l', '-x', '-i' }, pattern = 'Gandalf' })
    assert.are.same(expected, actual)
  end)

  it('one file, one match, file flag takes precedence over line flag', function()
    local expected = { "iliad.txt" }
    local actual = grep({ files = { 'iliad.txt' }, flags = { '-n', '-l' }, pattern = 'ten' })
    assert.are.same(expected, actual)
  end)

  it('one file, several matches, inverted and match entire lines flags', function()
    local expected = {
      "Achilles sing, O Goddess! Peleus' son;",
      "His wrath pernicious, who ten thousand woes",
      "Caused to Achaia's host, sent many a soul",
      "And Heroes gave (so stood the will of Jove)",
      "To dogs and to all ravening fowls a prey,",
      "When fierce dispute had separated once",
      "The noble Chief Achilles from the son",
      "Of Atreus, Agamemnon, King of men."
    }
    local actual = grep(
                     { files = { 'iliad.txt' }, flags = { '-x', '-v' }, pattern = 'Illustrious into Ades premature,' })
    assert.are.same(expected, actual)
  end)

  it('multiple files, one match, no flags', function()
    local expected = { "iliad.txt:Of Atreus, Agamemnon, King of men." }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = {},
      pattern = 'Agamemnon'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, no flags', function()
    local expected = {
      "midsummer-night.txt:Nor how it may concern my modesty,",
      "midsummer-night.txt:But I beseech your grace that I may know",
      "midsummer-night.txt:The worst that may befall me in this case,"
    }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = {},
      pattern = 'may'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, print line numbers flag', function()
    local expected = {
      "midsummer-night.txt:5:But I beseech your grace that I may know",
      "midsummer-night.txt:6:The worst that may befall me in this case,",
      "paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast",
      "paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top"
    }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-n' },
      pattern = 'that'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, one match, print file names flag', function()
    local expected = { "iliad.txt", "paradise-lost.txt" }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-l' },
      pattern = 'who'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, case-insensitive flag', function()
    local expected = {
      "iliad.txt:Caused to Achaia's host, sent many a soul",
      "iliad.txt:Illustrious into Ades premature,",
      "iliad.txt:And Heroes gave (so stood the will of Jove)",
      "iliad.txt:To dogs and to all ravening fowls a prey,",
      "midsummer-night.txt:I do entreat your grace to pardon me.",
      "midsummer-night.txt:In such a presence here to plead my thoughts;",
      "midsummer-night.txt:If I refuse to wed Demetrius.",
      "paradise-lost.txt:Brought Death into the World, and all our woe,",
      "paradise-lost.txt:Restore us, and regain the blissful Seat,",
      "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top"
    }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-i' },
      pattern = 'TO'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, inverted flag', function()
    local expected = {
      "iliad.txt:Achilles sing, O Goddess! Peleus' son;",
      "iliad.txt:The noble Chief Achilles from the son",
      "midsummer-night.txt:If I refuse to wed Demetrius."
    }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-v' },
      pattern = 'a'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, one match, match entire lines flag', function()
    local expected = { "midsummer-night.txt:But I beseech your grace that I may know" }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-x' },
      pattern = 'But I beseech your grace that I may know'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, one match, multiple flags', function()
    local expected = { "paradise-lost.txt:4:With loss of Eden, till one greater Man" }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-n', '-i', '-x' },
      pattern = 'WITH LOSS OF EDEN, TILL ONE GREATER MAN'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, no matches, various flags', function()
    local expected = {}
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-n', '-l', '-x', '-i' },
      pattern = 'Frodo'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, file flag takes precedence over line number flag', function()
    local expected = { "iliad.txt", "paradise-lost.txt" }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-n', '-l' },
      pattern = 'who'
    })
    assert.are.same(expected, actual)
  end)

  it('multiple files, several matches, inverted and match entire lines flags', function()
    local expected = {
      "iliad.txt:Achilles sing, O Goddess! Peleus' son;",
      "iliad.txt:His wrath pernicious, who ten thousand woes",
      "iliad.txt:Caused to Achaia's host, sent many a soul",
      "iliad.txt:And Heroes gave (so stood the will of Jove)",
      "iliad.txt:To dogs and to all ravening fowls a prey,",
      "iliad.txt:When fierce dispute had separated once",
      "iliad.txt:The noble Chief Achilles from the son",
      "iliad.txt:Of Atreus, Agamemnon, King of men.",
      "midsummer-night.txt:I do entreat your grace to pardon me.",
      "midsummer-night.txt:I know not by what power I am made bold,",
      "midsummer-night.txt:Nor how it may concern my modesty,",
      "midsummer-night.txt:In such a presence here to plead my thoughts;",
      "midsummer-night.txt:But I beseech your grace that I may know",
      "midsummer-night.txt:The worst that may befall me in this case,",
      "midsummer-night.txt:If I refuse to wed Demetrius.",
      "paradise-lost.txt:Of Mans First Disobedience, and the Fruit",
      "paradise-lost.txt:Of that Forbidden Tree, whose mortal tast",
      "paradise-lost.txt:Brought Death into the World, and all our woe,",
      "paradise-lost.txt:With loss of Eden, till one greater Man",
      "paradise-lost.txt:Restore us, and regain the blissful Seat,",
      "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top",
      "paradise-lost.txt:Of Oreb, or of Sinai, didst inspire",
      "paradise-lost.txt:That Shepherd, who first taught the chosen Seed"
    }
    local actual = grep({
      files = { 'iliad.txt', 'midsummer-night.txt', 'paradise-lost.txt' },
      flags = { '-x', '-v' },
      pattern = 'Illustrious into Ades premature,'
    })
    assert.are.same(expected, actual)
  end)
end)
