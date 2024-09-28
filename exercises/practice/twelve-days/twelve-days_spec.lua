local twelve_days = require('twelve-days')

describe('twelve-days', function()
  describe('verse', function()
    it('first day a partridge in a pear tree', function()
      local expected = { 'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.' }
      assert.are.same(expected, twelve_days.recite(1, 1))
    end)

    it('second day two turtle doves', function()
      local expected = {
        'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(2, 2))
    end)

    it('third day three french hens', function()
      local expected = {
        'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(3, 3))
    end)

    it('fourth day four calling birds', function()
      local expected = {
        'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(4, 4))
    end)

    it('fifth day five gold rings', function()
      local expected = {
        'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(5, 5))
    end)

    it('sixth day six geese-a-laying', function()
      local expected = {
        'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(6, 6))
    end)

    it('seventh day seven swans-a-swimming', function()
      local expected = {
        'On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(7, 7))
    end)

    it('eighth day eight maids-a-milking', function()
      local expected = {
        'On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(8, 8))
    end)

    it('ninth day nine ladies dancing', function()
      local expected = {
        'On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(9, 9))
    end)

    it('tenth day ten lords-a-leaping', function()
      local expected = {
        'On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(10, 10))
    end)

    it('eleventh day eleven pipers piping', function()
      local expected = {
        'On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(11, 11))
    end)

    it('twelfth day twelve drummers drumming', function()
      local expected = {
        'On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(12, 12))
    end)
  end)

  describe('lyrics', function()
    it('recites first three verses of the song', function()
      local expected = {
        'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.',
        'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(1, 3))
    end)

    it('recites three verses from the middle of the song', function()
      local expected = {
        'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(4, 6))
    end)

    it('recites the whole song', function()
      local expected = {
        'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.',
        'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.',
        'On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
      }
      assert.are.same(expected, twelve_days.recite(1, 12))
    end)
  end)
end)
