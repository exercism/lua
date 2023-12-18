local BottleSong = require 'bottle-song'

describe('lyrics', function()
  describe('single verse', function()
    it('first generic verse', function()
      expected = table.concat({
        "Ten green bottles hanging on the wall,\n",
        "Ten green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be nine green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(10, 1))
    end)

    it('last generic verse', function()
      expected = table.concat({
        "Three green bottles hanging on the wall,\n",
        "Three green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be two green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(3, 1))
    end)

    it('verse with 2 bottles', function()
      expected = table.concat({
        "Two green bottles hanging on the wall,\n",
        "Two green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be one green bottle hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(2, 1))
    end)

    it('verse with 1 bottle', function()
      expected = table.concat({
        "One green bottle hanging on the wall,\n",
        "One green bottle hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be no green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(1, 1))
    end)
  end)

  describe('multiple verses', function()
    it('first two verses', function()
      expected = table.concat({
        "Ten green bottles hanging on the wall,\n",
        "Ten green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be nine green bottles hanging on the wall.\n",
        "\n",
        "Nine green bottles hanging on the wall,\n",
        "Nine green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be eight green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(10, 2))
    end)

    it('last three verses', function()
      expected = table.concat({
        "Three green bottles hanging on the wall,\n",
        "Three green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be two green bottles hanging on the wall.\n",
        "\n",
        "Two green bottles hanging on the wall,\n",
        "Two green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be one green bottle hanging on the wall.\n",
        "\n",
        "One green bottle hanging on the wall,\n",
        "One green bottle hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be no green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(3, 3))
    end)

    it('all verses', function()
      expected = table.concat({
        "Ten green bottles hanging on the wall,\n",
        "Ten green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be nine green bottles hanging on the wall.\n",
        "\n",
        "Nine green bottles hanging on the wall,\n",
        "Nine green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be eight green bottles hanging on the wall.\n",
        "\n",
        "Eight green bottles hanging on the wall,\n",
        "Eight green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be seven green bottles hanging on the wall.\n",
        "\n",
        "Seven green bottles hanging on the wall,\n",
        "Seven green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be six green bottles hanging on the wall.\n",
        "\n",
        "Six green bottles hanging on the wall,\n",
        "Six green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be five green bottles hanging on the wall.\n",
        "\n",
        "Five green bottles hanging on the wall,\n",
        "Five green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be four green bottles hanging on the wall.\n",
        "\n",
        "Four green bottles hanging on the wall,\n",
        "Four green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be three green bottles hanging on the wall.\n",
        "\n",
        "Three green bottles hanging on the wall,\n",
        "Three green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be two green bottles hanging on the wall.\n",
        "\n",
        "Two green bottles hanging on the wall,\n",
        "Two green bottles hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be one green bottle hanging on the wall.\n",
        "\n",
        "One green bottle hanging on the wall,\n",
        "One green bottle hanging on the wall,\n",
        "And if one green bottle should accidentally fall,\n",
        "There'll be no green bottles hanging on the wall.\n"
      })
      assert.equal(expected, BottleSong.recite(10, 10))
    end)
  end)
end)
