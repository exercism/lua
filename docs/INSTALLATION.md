## Installing Lua

-   [Mac](#mac)
-   [Linux](#linux)

### [Mac](#mac)

First install lua using [homebrew][1]

    $ brew install lua

Then install [luarocks][2] to install packages for lua

    $ brew install luarocks

Then install [busted][3] testing framework for lua

    $ luarocks install busted

### [Linux](#linux)

On Debian based distributions install [luarocks][2] using apt

    $ sudo apt-get install luarocks

This will also install lua 5.1 if it's not already installed on your system.

Then install [busted][3] testing framework for lua

    $ sudo luarocks install busted

[1]: http://brew.sh/

[2]: http://luarocks.org/

[3]: http://olivinelabs.com/busted/
