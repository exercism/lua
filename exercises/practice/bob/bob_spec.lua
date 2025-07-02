local bob = require('bob')

describe('bob', function()
  it('stating something', function()
    local result = bob.hey("Tom-ay-to, tom-aaaah-to.")
    assert.are.equals("Whatever.", result)
  end)

  it('shouting', function()
    local result = bob.hey("WATCH OUT!")
    assert.are.equals("Whoa, chill out!", result)
  end)

  it('shouting gibberish', function()
    local result = bob.hey("FCECDFCAAB")
    assert.are.equals("Whoa, chill out!", result)
  end)

  it('asking a question', function()
    local result = bob.hey("Does this cryogenic chamber make me look fat?")
    assert.are.equals("Sure.", result)
  end)

  it('asking a numeric question', function()
    local result = bob.hey("You are, what, like 15?")
    assert.are.equals("Sure.", result)
  end)

  it('asking gibberish', function()
    local result = bob.hey("fffbbcbeab?")
    assert.are.equals("Sure.", result)
  end)

  it('talking forcefully', function()
    local result = bob.hey("Hi there!")
    assert.are.equals("Whatever.", result)
  end)

  it('using acronyms in regular speech', function()
    local result = bob.hey("It's OK if you don't want to go work for NASA.")
    assert.are.equals("Whatever.", result)
  end)

  it('forceful question', function()
    local result = bob.hey("WHAT'S GOING ON?")
    assert.are.equals("Calm down, I know what I'm doing!", result)
  end)

  it('shouting numbers', function()
    local result = bob.hey("1, 2, 3 GO!")
    assert.are.equals("Whoa, chill out!", result)
  end)

  it('no letters', function()
    local result = bob.hey("1, 2, 3")
    assert.are.equals("Whatever.", result)
  end)

  it('question with no letters', function()
    local result = bob.hey("4?")
    assert.are.equals("Sure.", result)
  end)

  it('shouting with special characters', function()
    local result = bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")
    assert.are.equals("Whoa, chill out!", result)
  end)

  it('shouting with no exclamation mark', function()
    local result = bob.hey("I HATE THE DENTIST")
    assert.are.equals("Whoa, chill out!", result)
  end)

  it('statement containing question mark', function()
    local result = bob.hey("Ending with ? means a question.")
    assert.are.equals("Whatever.", result)
  end)

  it('non-letters with question', function()
    local result = bob.hey(":) ?")
    assert.are.equals("Sure.", result)
  end)

  it('prattling on', function()
    local result = bob.hey("Wait! Hang on. Are you going to be OK?")
    assert.are.equals("Sure.", result)
  end)

  it('silence', function()
    local result = bob.hey("")
    assert.are.equals("Fine. Be that way!", result)
  end)

  it('prolonged silence', function()
    local result = bob.hey("          ")
    assert.are.equals("Fine. Be that way!", result)
  end)

  it('alternate silence', function()
    local result = bob.hey("\t\t\t\t\t\t\t\t\t\t")
    assert.are.equals("Fine. Be that way!", result)
  end)

  it('starting with whitespace', function()
    local result = bob.hey("         hmmmmmmm...")
    assert.are.equals("Whatever.", result)
  end)

  it('ending with whitespace', function()
    local result = bob.hey("Okay if like my  spacebar  quite a bit?   ")
    assert.are.equals("Sure.", result)
  end)

  it('other whitespace', function()
    local result = bob.hey("\n\r \t")
    assert.are.equals("Fine. Be that way!", result)
  end)

  it('non-question ending with whitespace', function()
    local result = bob.hey("This is a statement ending with whitespace      ")
    assert.are.equals("Whatever.", result)
  end)

  it('multiple line question', function()
    local result = bob.hey("\nDoes this cryogenic chamber make\n me look fat?")
    assert.are.equals("Sure.", result)
  end)
end)
