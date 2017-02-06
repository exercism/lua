## Installing Lua

-   [MacOS](#mac)
-   [Ubuntu](#ubuntu)
-   [Windows](#windows)

#### [MacOS](#mac)

First install Lua and [Luarocks][2] using [Homebrew][1]:

```shell
$ brew install lua
```

Then install the [Busted][3] testing framework for Lua:

```shell
$ luarocks install busted
```

Then run your tests:

```shell
$ busted .
```

#### [Ubuntu](#ubuntu)

First install Lua and [Luarocks][2] using [Apt][6]:

```shell
$ sudo apt-get install lua5.3 luarocks
```

Then install the [Busted][3] testing framework for Lua:

```shell
$ luarocks install busted
```

If this fails, you may need to use `sudo`:

```shell
$ sudo luarocks install busted
```

Then run your tests:

```shell
$ busted .
```

#### [Windows](#windows)

First install Lua and [Luarocks][2] using [Chocolatey][7]:

    C:\> choco install lua

Then install the [Busted][3] testing framework for Lua:

    C:\> luarocks install busted

Then run your tests:

    C:\> busted .

[1]: http://brew.sh/

[2]: http://luarocks.org/

[3]: http://olivinelabs.com/busted/

[4]: https://github.com/Olivine-Labs/lua-style-guide

[5]: http://tylerneylon.com/a/learn-lua/

[6]: https://help.ubuntu.com/lts/serverguide/apt.html

[7]: http://chocolatey.org/
