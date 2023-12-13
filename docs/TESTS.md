# Tests

Run your tests with

```shell
$ busted
```

Refer to [Installing Lua locally][install] for installing `busted`.

[install]: https://exercism.org/docs/tracks/lua/installation

## Debugging Unit Tests

This guide will show you how to set up [VSCode](https://code.visualstudio.com/) with the [Busted](https://github.com/lunarmodules/busted) test framework and [Local Lua Debugger](https://marketplace.visualstudio.com/items?itemName=tomblind.local-lua-debugger-vscode) so that you can set breakpoints in both the test spec and the file it is testing, facilitating a straightforward [Test Driven Developent](https://en.wikipedia.org/wiki/Test-driven_development) workflow. This is not canonical, there are many methods that may work but this method will at least get you up and running (note: this has been tested and works on Windows 10 and Ubuntu 20.04).

With all that jargon out of the way let's get started.

> You can skip these parts as they only serve to explain the process.

In **VSCode** remove or disable all the other **Lua** debugger extensions and install [Local Lua Debugger](https://marketplace.visualstudio.com/items?itemName=tomblind.local-lua-debugger-vscode). Then create a [custom launch configuration](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations) like this:

```json
{
	"name": "Busted",
	"type": "lua-local",
	"request": "launch",
	"program": {
		"command": "busted"
	},
	"cwd": "${workspaceFolder}/${relativeFileDirname}",
	"args": ["${file}"],
	"integratedTerminal": true
}
```

**note:** The property `integratedTerminal` will give a warning stating `Property integratedTerminal is not allowed` but you can happily ignore this.

> The `cwd` property specifices the current working directory, this is important for resolving paths. By default **Exercism** installs each exercise into it’s own folder under the folder of the track name. So in the case of **Lua** it looks like this:
>
> ```
> └── Exercism/
>     ├── lua/
>     │   ├── armstrong-numbers
>     │   ├── bank-account
>     │   ├── binarysearch
>     │   └── etc...
>     └── python/
>         └── etc...
> ```
>
> So when we open **VSCode** from the `/lua` folder like so:
>
> > `C:\users\<username>\Exercism\lua> code .`
> >
> > or
> >
> > `/home/<username>/exercism/lua> code .`
>
> **VSCode** will show each exercise in it's own folder in our workspace. That means we need the launch config to change the current working directory, `cwd`, to each individual exercise folder. We do this with a combination of the `${workspaceFolder}` and the `${relativeFileDirname}` [VSCode variables](https://code.visualstudio.com/docs/editor/variables-reference#_settings-command-variables-and-input-variables).
>
> The `args` property is what argument should be passed to **Busted**. In this case we use the variable `${file}` to reference the currently open file.

Then add these three lines to the top of the test file for the exercise you are undertaking, named `<exercise_name>_spec.lua`:

```lua
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
  require("lldebugger").start()
end
```

Now when you want to run the tests with the debugger, open the test file and then run the launch configuration you have just created from the `Run and Debug` (Ctrl+Shift+D) sidebar on the left. If the test file is in focus the launch configuration will run those tests, stopping on breakpoints, and print the output to the `DEBUG CONSOLE` tab in the integrated terminal on the bottom.

Happy Coding!
