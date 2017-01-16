local transpose = require 'transpose'

describe('transpose', function()
  it('should transpose the empty string to the empty string', function()
    assert.are.equal('', transpose(''))
  end)

  it('should transpose a short string with a single row', function()
    assert.are.equal('A\n1', transpose('A1'))
  end)

  it('should transpose a short string with a single column', function()
    assert.are.equal('A1', transpose('A\n1'))
  end)

  it('should transpose a long string with a single row', function()
    assert.are.equal('S\ni\nn\ng\nl\ne\n \nl\ni\nn\ne\n.', transpose('Single line.'))
  end)

  it('should transpose a string with empty lines', function()
    local input =
      '\n' ..
      'Line 2\n' ..
      '\n' ..
      'L4'
    local expected =
      ' L L\n' ..
      ' i 4\n' ..
      ' n\n' ..
      ' e\n' ..
      '  \n' ..
      ' 2'
    assert.are.equal(expected, transpose(input))
  end)

  it('should transpose a string with the first line longer than the second', function()
    local input =
      'The fourth line.\n' ..
      'The fifth line.'
    local expected =
      'TT\n' ..
      'hh\n' ..
      'ee\n' ..
      '  \n' ..
      'ff\n' ..
      'oi\n' ..
      'uf\n' ..
      'rt\n' ..
      'th\n' ..
      'h \n' ..
      ' l\n' ..
      'li\n' ..
      'in\n' ..
      'ne\n' ..
      'e.\n' ..
      '.'

    assert.are.equal(expected, transpose(input))
  end)

  it('should transpose a string with the second line longer than the first', function()
    local input =
      'The first line.\n' ..
      'The second line.'
    local expected =
      'TT\n' ..
      'hh\n' ..
      'ee\n' ..
      '  \n' ..
      'fs\n' ..
      'ie\n' ..
      'rc\n' ..
      'so\n' ..
      'tn\n' ..
      ' d\n' ..
      'l \n' ..
      'il\n' ..
      'ni\n' ..
      'en\n' ..
      '.e\n' ..
      ' .'

    assert.are.equal(expected, transpose(input))
  end)

  it('should transpose a square string', function()
    local input =
      'HEART\n' ..
      'EMBER\n' ..
      'ABUSE\n' ..
      'RESIN\n' ..
      'TREND'
    local expected =
      'HEART\n' ..
      'EMBER\n' ..
      'ABUSE\n' ..
      'RESIN\n' ..
      'TREND'

    assert.are.equal(expected, transpose(input))
  end)

  it('should transpose a triangular string', function()
    local input =
      'T\n' ..
      'EE\n' ..
      'AAA\n' ..
      'SSSS\n' ..
      'EEEEE\n' ..
      'RRRRRR'
    local expected =
      'TEASER\n' ..
      ' EASER\n' ..
      '  ASER\n' ..
      '   SER\n' ..
      '    ER\n' ..
      '     R'

    assert.are.equal(expected, transpose(input))
  end)

  it('should transpose a string with many lines', function()
    local input =
      "Chor. Two households, both alike in dignity,\n" ..
      "In fair Verona, where we lay our scene,\n" ..
      "From ancient grudge break to new mutiny,\n" ..
      "Where civil blood makes civil hands unclean.\n" ..
      "From forth the fatal loins of these two foes\n" ..
      "A pair of star-cross'd lovers take their life;\n" ..
      "Whose misadventur'd piteous overthrows\n" ..
      "Doth with their death bury their parents' strife.\n" ..
      "The fearful passage of their death-mark'd love,\n" ..
      "And the continuance of their parents' rage,\n" ..
      "Which, but their children's end, naught could remove,\n" ..
      "Is now the two hours' traffic of our stage;\n" ..
      "The which if you with patient ears attend,\n" ..
      "What here shall miss, our toil shall strive to mend."
    local expected =
      "CIFWFAWDTAWITW\n" ..
      "hnrhr hohnhshh\n" ..
      "o oeopotedi ea\n" ..
      "rfmrmash  cn t\n" ..
      ".a e ie fthow \n" ..
      " ia fr weh,whh\n" ..
      "Trnco miae  ie\n" ..
      "w ciroitr btcr\n" ..
      "oVivtfshfcuhhe\n" ..
      " eeih a uote  \n" ..
      "hrnl sdtln  is\n" ..
      "oot ttvh tttfh\n" ..
      "un bhaeepihw a\n" ..
      "saglernianeoyl\n" ..
      "e,ro -trsui ol\n" ..
      "h uofcu sarhu \n" ..
      "owddarrdan o m\n" ..
      "lhg to'egccuwi\n" ..
      "deemasdaeehris\n" ..
      "sr als t  ists\n" ..
      ",ebk 'phool'h,\n" ..
      "  reldi ffd   \n" ..
      "bweso tb  rtpo\n" ..
      "oea ileutterau\n" ..
      "t kcnoorhhnatr\n" ..
      "hl isvuyee'fi \n" ..
      " atv es iisfet\n" ..
      "ayoior trr ino\n" ..
      "l  lfsoh  ecti\n" ..
      "ion   vedpn  l\n" ..
      "kuehtteieadoe \n" ..
      "erwaharrar,fas\n" ..
      "   nekt te  rh\n" ..
      "ismdsehphnnosa\n" ..
      "ncuse ra-tau l\n" ..
      " et  tormsural\n" ..
      "dniuthwea'g t \n" ..
      "iennwesnr hsts\n" ..
      "g,ycoi tkrttet\n" ..
      "n ,l r s'a anr\n" ..
      "i  ef  'dgcgdi\n" ..
      "t  aol   eoe,v\n" ..
      "y  nei sl,u; e\n" ..
      ",  .sf to l   \n" ..
      "     e rv d  t\n" ..
      "     ; ie    o\n" ..
      "       f, r   \n" ..
      "       e  e  m\n" ..
      "       .  m  e\n" ..
      "          o  n\n" ..
      "          v  d\n" ..
      "          e  .\n" ..
      "          ,"

    assert.are.equal(expected, transpose(input))
  end)
end)
