local IntergalacticTransmission = require('intergalactic-transmission')

describe('intergalactic-transmission', function()
  describe('calculate transmit sequences', function()
    it('empty message', function()
      local expected = {}
      local actual = IntergalacticTransmission.transmit_sequence({})
      assert.are.same(expected, actual)
    end)

    it('0x00 is transmitted as 0x0000', function()
      local expected = {
        0x00, --
        0x00
      }
      local actual = IntergalacticTransmission.transmit_sequence({ 0x00 })
      assert.are.same(expected, actual)
    end)

    it('0x02 is transmitted as 0x0300', function()
      local expected = {
        0x03, --
        0x00
      }
      local actual = IntergalacticTransmission.transmit_sequence({ 0x02 })
      assert.are.same(expected, actual)
    end)

    it('0x06 is transmitted as 0x0600', function()
      local expected = {
        0x06, --
        0x00
      }
      local actual = IntergalacticTransmission.transmit_sequence({ 0x06 })
      assert.are.same(expected, actual)
    end)

    it('0x05 is transmitted as 0x0581', function()
      local expected = {
        0x05, --
        0x81
      }
      local actual = IntergalacticTransmission.transmit_sequence({ 0x05 })
      assert.are.same(expected, actual)
    end)

    it('0x29 is transmitted as 0x2881', function()
      local expected = {
        0x28, --
        0x81
      }
      local actual = IntergalacticTransmission.transmit_sequence({ 0x29 })
      assert.are.same(expected, actual)
    end)

    it('0xc001c0de is transmitted as 0xc000711be1', function()
      local expected = {
        0xc0, --
        0x00, --
        0x71, --
        0x1b, --
        0xe1
      }
      local actual = IntergalacticTransmission.transmit_sequence({
        0xc0, --
        0x01, --
        0xc0, --
        0xde
      })
      assert.are.same(expected, actual)
    end)

    it('six byte message', function()
      local expected = {
        0x47, --
        0xb8, --
        0x99, --
        0xac, --
        0x17, --
        0xa0, --
        0x84
      }
      local actual = IntergalacticTransmission.transmit_sequence({
        0x47, --
        0x72, --
        0x65, --
        0x61, --
        0x74, --
        0x21
      })
      assert.are.same(expected, actual)
    end)

    it('seven byte message', function()
      local expected = {
        0x47, --
        0xb8, --
        0x99, --
        0xac, --
        0x17, --
        0xa0, --
        0xc5, --
        0x42
      }
      local actual = IntergalacticTransmission.transmit_sequence({
        0x47, --
        0x72, --
        0x65, --
        0x61, --
        0x74, --
        0x31, --
        0x21
      })
      assert.are.same(expected, actual)
    end)

    it('eight byte message', function()
      local expected = {
        0xc0, --
        0x00, --
        0x44, --
        0x66, --
        0x7d, --
        0x06, --
        0x78, --
        0x42, --
        0x21, --
        0x81
      }
      local actual = IntergalacticTransmission.transmit_sequence({
        0xc0, --
        0x01, --
        0x13, --
        0x37, --
        0xc0, --
        0xde, --
        0x21, --
        0x21
      })
      assert.are.same(expected, actual)
    end)

    it('twenty byte message', function()
      local expected = {
        0x44, --
        0xbd, --
        0x18, --
        0xaf, --
        0x27, --
        0x1b, --
        0xa5, --
        0xe7, --
        0x6c, --
        0x90, --
        0x1b, --
        0x2e, --
        0x33, --
        0x03, --
        0x84, --
        0xee, --
        0x65, --
        0xb8, --
        0xdb, --
        0xed, --
        0xd7, --
        0x28, --
        0x84
      }
      local actual = IntergalacticTransmission.transmit_sequence({
        0x45, --
        0x78, --
        0x65, --
        0x72, --
        0x63, --
        0x69, --
        0x73, --
        0x6d, --
        0x20, --
        0x69, --
        0x73, --
        0x20, --
        0x61, --
        0x77, --
        0x65, --
        0x73, --
        0x6f, --
        0x6d, --
        0x65, --
        0x21
      })
      assert.are.same(expected, actual)
    end)
  end)

  describe('decode received messages', function()
    it('empty message', function()
      local expected = {}
      local actual = IntergalacticTransmission.decode_message({})
      assert.are.same(expected, actual)
    end)

    it('zero message', function()
      local expected = { 0x00 }
      local actual = IntergalacticTransmission.decode_message({
        0x00, --
        0x00
      })
      assert.are.same(expected, actual)
    end)

    it('0x0300 is decoded to 0x02', function()
      local expected = { 0x02 }
      local actual = IntergalacticTransmission.decode_message({
        0x03, --
        0x00
      })
      assert.are.same(expected, actual)
    end)

    it('0x0581 is decoded to 0x05', function()
      local expected = { 0x05 }
      local actual = IntergalacticTransmission.decode_message({
        0x05, --
        0x81
      })
      assert.are.same(expected, actual)
    end)

    it('0x2881 is decoded to 0x29', function()
      local expected = { 0x29 }
      local actual = IntergalacticTransmission.decode_message({
        0x28, --
        0x81
      })
      assert.are.same(expected, actual)
    end)

    it('first byte has wrong parity', function()
      assert.has_error(function()
        IntergalacticTransmission.decode_message({
          0x07, --
          0x00
        })
      end, 'wrong parity')
    end)

    it('second byte has wrong parity', function()
      assert.has_error(function()
        IntergalacticTransmission.decode_message({
          0x03, --
          0x68
        })
      end, 'wrong parity')
    end)

    it('0xcf4b00 is decoded to 0xce94', function()
      local expected = {
        0xce, --
        0x94
      }
      local actual = IntergalacticTransmission.decode_message({
        0xcf, --
        0x4b, --
        0x00
      })
      assert.are.same(expected, actual)
    end)

    it('0xe2566500 is decoded to 0xe2ad90', function()
      local expected = {
        0xe2, --
        0xad, --
        0x90
      }
      local actual = IntergalacticTransmission.decode_message({
        0xe2, --
        0x56, --
        0x65, --
        0x00
      })
      assert.are.same(expected, actual)
    end)

    it('six byte message', function()
      local expected = {
        0x47, --
        0x72, --
        0x65, --
        0x61, --
        0x74, --
        0x21
      }
      local actual = IntergalacticTransmission.decode_message({
        0x47, --
        0xb8, --
        0x99, --
        0xac, --
        0x17, --
        0xa0, --
        0x84
      })
      assert.are.same(expected, actual)
    end)

    it('seven byte message', function()
      local expected = {
        0x47, --
        0x72, --
        0x65, --
        0x61, --
        0x74, --
        0x31, --
        0x21
      }
      local actual = IntergalacticTransmission.decode_message({
        0x47, --
        0xb8, --
        0x99, --
        0xac, --
        0x17, --
        0xa0, --
        0xc5, --
        0x42
      })
      assert.are.same(expected, actual)
    end)

    it('last byte has wrong parity', function()
      assert.has_error(function()
        IntergalacticTransmission.decode_message({
          0x47, --
          0xb8, --
          0x99, --
          0xac, --
          0x17, --
          0xa0, --
          0xc5, --
          0x43
        })
      end, 'wrong parity')
    end)

    it('eight byte message', function()
      local expected = {
        0xc0, --
        0x01, --
        0x13, --
        0x37, --
        0xc0, --
        0xde, --
        0x21, --
        0x21
      }
      local actual = IntergalacticTransmission.decode_message({
        0xc0, --
        0x00, --
        0x44, --
        0x66, --
        0x7d, --
        0x06, --
        0x78, --
        0x42, --
        0x21, --
        0x81
      })
      assert.are.same(expected, actual)
    end)

    it('twenty byte message', function()
      local expected = {
        0x45, --
        0x78, --
        0x65, --
        0x72, --
        0x63, --
        0x69, --
        0x73, --
        0x6d, --
        0x20, --
        0x69, --
        0x73, --
        0x20, --
        0x61, --
        0x77, --
        0x65, --
        0x73, --
        0x6f, --
        0x6d, --
        0x65, --
        0x21
      }
      local actual = IntergalacticTransmission.decode_message({
        0x44, --
        0xbd, --
        0x18, --
        0xaf, --
        0x27, --
        0x1b, --
        0xa5, --
        0xe7, --
        0x6c, --
        0x90, --
        0x1b, --
        0x2e, --
        0x33, --
        0x03, --
        0x84, --
        0xee, --
        0x65, --
        0xb8, --
        0xdb, --
        0xed, --
        0xd7, --
        0x28, --
        0x84
      })
      assert.are.same(expected, actual)
    end)

    it('wrong parity on 16th byte', function()
      assert.has_error(function()
        IntergalacticTransmission.decode_message({
          0x44, --
          0xbd, --
          0x18, --
          0xaf, --
          0x27, --
          0x1b, --
          0xa5, --
          0xe7, --
          0x6c, --
          0x90, --
          0x1b, --
          0x2e, --
          0x33, --
          0x03, --
          0x84, --
          0xef, --
          0x65, --
          0xb8, --
          0xdb, --
          0xed, --
          0xd7, --
          0x28, --
          0x84
        })
      end, 'wrong parity')
    end)
  end)
end)
