## Installing Lua

-   [MacOS](#mac)
-   [Ubuntu](#ubuntu)
-   [Windows 10 (WSL)](#windows%2010)

#### [MacOS](#mac)

First install Lua and [Luarocks][2] using [Homebrew][1]:

```shell
$ brew install lua luarocks
```

Then install the [Busted][3] testing framework for Lua:

```shell
$ luarocks install busted
```

Then run your tests:

```shell
$ busted
```

#### [Ubuntu](#ubuntu)

First install Lua and [Luarocks][2] using [Apt][6]:

```shell
$ sudo apt-get install lua5.3 liblua5.3-dev luarocks
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
$ busted
```

#### [Windows 10](#windows%2010)

First you must enable [WSL (Windows Subsystem for Linux)][7] using [PowerShell][8] (Administrator):

```shell
PS> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

This requires a reboot.

Next, install Ubuntu from the [Microsoft Store][9], **or** download then install using PowerShell:

```shell
PS> curl.exe -L -o ubuntu1804.appx https://aka.ms/wsl-ubuntu-1804
PS> Add-AppxPackage .\ubuntu1804.appx; rm .\ubuntu1804.appx
PS> ubuntu1804
```

Then update your package list:

```shell
PS> wsl
$ sudo apt-get update
```

Now you are ready to install [LuaRocks][2] and [Busted][3] by following the [Ubuntu instructions](#ubuntu) above.

Once done you can run your tests directly from any Windows command line:

```cmd
C:\> wsl busted
```


[1]: http://brew.sh/

[2]: http://luarocks.org/

[3]: http://olivinelabs.com/busted/

[4]: https://github.com/Olivine-Labs/lua-style-guide

[5]: http://tylerneylon.com/a/learn-lua/

[6]: https://help.ubuntu.com/lts/serverguide/apt.html

[7]: https://docs.microsoft.com/en-us/windows/wsl/faq

[8]: https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-6

[9]: https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6
