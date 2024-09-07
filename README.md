# Exercism Lua Track

[![Test](https://github.com/exercism/lua/actions/workflows/test.yml/badge.svg)](https://github.com/exercism/lua/actions/workflows/test.yml)

Exercism exercises in Lua

## Setup dev environment for contributing

Install Lua and Luarocks according to the [installation instructions][1] for your platform.
Then, install all additional development dependencies with:

```shell
$ ./bin/install-dev-dependencies
```

To contribute a patch you will need a GitHub account and you will need to fork
the *exercism/lua* repo to your account.
Clone your fork with the command: `git clone https://github.com/<your_username>/lua`.
Create your patch and open a pull request to the exercism/lua repo.

See the GitHub Help for [forking a repo][2] and [creating a pull request][3]
if you are unfamiliar with this process.

To contribute a new exercise, create a folder named after the exercise within the
*lua/exercises* directory. Create your files for a new test, test class and the implementation.

For example, for the [Bob][4] exercise:

    $ tree bob
    bob
    ├── bob_spec.lua
    └── bob.lua

    0 directories, 2 files

Run the test

    $ busted

Rename *bob.lua* to *example.lua*, and add the exercise to the [lua/config.json][5] file.

    $ tree bob
    bob
    ├── bob_spec.lua
    └── example.lua

    0 directories, 2 files

Optionally, you can generate the spec from the upstream canonical data.
To use the spec generator, create a file called `spec_generator.lua` in the `.meta/` directory of the exercise.
This file should be a Lua module returning a table with two fields:
- `module_name` - A string containing the name of the Lua variable to which the module under test will be bound
- `generate_test` - A function that returns a string representation of a test given the corresponding case from the canonical data.

To use the test generator, run:

```shell
$ ./bin/generate-spec <exercise name>
```

This will use `curl` to fetch the canonical data from the upstream repository, generate the spec file, and format it.

## Contributing Guide

Please be familiar with the [contributing guide][6] in the docs repository.
This describes some great ways to get involved. In particular, please read the
[Pull Request Guidelines][7] before opening a pull request.

## Other Resources

Pleases see the [Useful Lua Resources][8] page.

## Lua icon
The Lua icon is inspired by the [Lua logo][9], which was designed by Alexandre Nakonechnyj.

[1]: https://exercism.io/tracks/lua/installation
[2]: https://help.github.com/articles/fork-a-repo/
[3]: https://help.github.com/articles/creating-a-pull-request/
[4]: https://github.com/exercism/lua/tree/master/exercises/bob
[5]: https://github.com/exercism/lua/blob/master/config.json
[6]: https://github.com/exercism/docs/tree/master/contributing-to-language-tracks
[7]: https://github.com/exercism/docs/blob/master/contributing/pull-request-guidelines.md
[8]: https://exercism.io/tracks/lua/resources
[9]: http://www.lua.org/images/
