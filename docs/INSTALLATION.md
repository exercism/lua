## Installing Lua

### Mac
First install lua using [homebrew](http://brew.sh/)

```bash
brew install lua
```

Then install [luarocks][1] to install packages for lua:

```bash
brew install luarocks
```

### Linux
First install lua using apt-get:

```bash
apt-get install lua5.2
```

Then install [luarocks][1] to install packages for lua:

```bash
apt-get install luarocks
```

### Test framework

To run the tests, you need to install [busted](http://olivinelabs.com/busted/) testing framework for lua:

```bash
luarocks install busted
```

[1]: http://luarocks.org/
