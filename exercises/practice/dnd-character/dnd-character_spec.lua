local dnd = require 'dnd-character'
require('assertions')

describe('dnd', function()
  describe('modifier', function()
    it('should return -4 for score 3', function()
      assert.equal(-4, dnd.modifier(3))
    end)

    it('should return -3 for score 4', function()
      assert.equal(-3, dnd.modifier(4))
    end)

    it('should return -3 for score 5', function()
      assert.equal(-3, dnd.modifier(5))
    end)

    it('should return -2 for score 6', function()
      assert.equal(-2, dnd.modifier(6))
    end)

    it('should return -2 for score 7', function()
      assert.equal(-2, dnd.modifier(7))
    end)

    it('should return -1 for score 8', function()
      assert.equal(-1, dnd.modifier(8))
    end)

    it('should return -1 for score 9', function()
      assert.equal(-1, dnd.modifier(9))
    end)

    it('should return 0 for score 10', function()
      assert.equal(0, dnd.modifier(10))
    end)

    it('should return 0 for score 11', function()
      assert.equal(0, dnd.modifier(11))
    end)

    it('should return +1 for score 12', function()
      assert.equal(1, dnd.modifier(12))
    end)

    it('should return +1 for score 13', function()
      assert.equal(1, dnd.modifier(13))
    end)

    it('should return +2 for score 14', function()
      assert.equal(2, dnd.modifier(14))
    end)

    it('should return +2 for score 15', function()
      assert.equal(2, dnd.modifier(15))
    end)

    it('should return +3 for score 16', function()
      assert.equal(3, dnd.modifier(16))
    end)

    it('should return +3 for score 17', function()
      assert.equal(3, dnd.modifier(17))
    end)

    it('should return +4 for score 18', function()
      assert.equal(4, dnd.modifier(18))
    end)
  end)

  describe('ability', function()
    it('uses 3 largest numbers from scores in descending order', function()
      assert.equal(9, dnd.ability({ 4, 3, 2, 1 }))
    end)

    it('uses 3 largest numbers from scores in ascending order', function()
      assert.equal(9, dnd.ability({ 1, 2, 3, 4 }))
    end)

    it('uses 3 largest numbers from scores in random order', function()
      assert.equal(9, dnd.ability({ 2, 4, 3, 1 }))
    end)

    it('returns 3 with lowest equal numbers', function()
      assert.equal(3, dnd.ability({ 1, 1, 1, 1 }))
    end)

    it('returns 18 with highest equal numbers', function()
      assert.equal(18, dnd.ability({ 6, 6, 6, 6 }))
    end)
  end)

  describe('roll_dice', function()
    it('returns 4 numbers, each in the range 1 to 6', function()
      for _ = 1, 10 do
        local scores = dnd.roll_dice()
        assert.equal(4, #scores)
        for _, score in ipairs(scores) do
          assert.equal("integer", math.type(score))
          assert.lteq(1, score)
          assert.lteq(score, 6)
        end
      end
    end)
  end)

  describe('Character', function()
    it('creates a character with the supplied name', function()
      local names = {
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Eve",
        "Fred",
        "Ginny",
        "Harriet",
        "Ileana",
        "Joseph",
        "Kincaid",
        "Larry"
      }
      for _, name in ipairs(names) do
        assert.equal(name, dnd.Character:new(name).name)
      end
    end)

    it('creates a character with valid strength', function()
      local character = dnd.Character:new("Alice")
      local strength = character.strength
      assert.equal("integer", math.type(strength))
      assert.lteq(3, strength)
      assert.lteq(strength, 18)
      assert.equal(strength, character.strength)
    end)

    it('creates a character with valid dexterity', function()
      local character = dnd.Character:new("Bob")
      local dexterity = character.dexterity
      assert.equal("integer", math.type(dexterity))
      assert.lteq(3, dexterity)
      assert.lteq(dexterity, 18)
      assert.equal(dexterity, character.dexterity)
    end)

    it('creates a character with valid constitution', function()
      local character = dnd.Character:new("Charlie")
      local constitution = character.constitution
      assert.equal("integer", math.type(constitution))
      assert.lteq(3, constitution)
      assert.lteq(constitution, 18)
      assert.equal(constitution, character.constitution)
    end)

    it('creates a character with valid intelligence', function()
      local character = dnd.Character:new("David")
      local intelligence = character.intelligence
      assert.equal("integer", math.type(intelligence))
      assert.lteq(3, intelligence)
      assert.lteq(intelligence, 18)
      assert.equal(intelligence, character.intelligence)
    end)

    it('creates a character with valid wisdom', function()
      local character = dnd.Character:new("Eve")
      local wisdom = character.wisdom
      assert.equal("integer", math.type(wisdom))
      assert.lteq(3, wisdom)
      assert.lteq(wisdom, 18)
      assert.equal(wisdom, character.wisdom)
    end)

    it('creates a character with valid charisma', function()
      local character = dnd.Character:new("Fred")
      local charisma = character.charisma
      assert.equal("integer", math.type(charisma))
      assert.lteq(3, charisma)
      assert.lteq(charisma, 18)
      assert.equal(charisma, character.charisma)
    end)

    it('creates a character with valid hitpoints', function()
      for i = 1, 10 do
        local character = dnd.Character:new(tostring(i))
        assert.equal(10 + dnd.modifier(character.constitution), character.hitpoints)
      end
    end)
  end)
end)
