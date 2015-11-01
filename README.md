# xLua

Exercism exercises in Lua

## Setup Dev environment for contributing

### Mac OS

For Mac OS, you can use [homebrew][1] to install Lua and [luarocks][2]

    $ brew install lua

Then install [busted][3] testing framework for lua. Busted is similiar to Jasmine testing framework in Javascript.

    $ luarocks install busted

Then create a folder for a new test, test class and the implementation.

    → ls -l
    total 16
    -rw-r--r--@ 1 aarti  staff  1111 Nov 25 14:05 bob_test.lua
    -rw-r--r--@ 1 aarti  staff   453 Nov 25 14:05 bob.lua

Run the test    

    $ busted bob_test.lua

Rename bob.lua to example.lua, add test to config.json

    → ls -l
    total 16
    -rw-r--r--@ 1 aarti  staff  1111 Nov 25 14:05 bob_test.lua
    -rw-r--r--@ 1 aarti  staff   453 Nov 25 14:05 example.lua

Other resources

  1. [Lua Style Guide][4]
  2. [Learn Lua in 15 minutes][5]

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com

[1]: http://brew.sh/
[2]: http://luarocks.org/
[3]: http://olivinelabs.com/busted/
[4]: https://github.com/Olivine-Labs/lua-style-guide
[5]: http://tylerneylon.com/a/learn-lua/
