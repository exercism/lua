package = 'dev-dependencies'
version = 'git-0'
source = {
  url = 'https://github.com/exercism/lua'
}
description = {
  summary = 'Development dependencies for the Exercism Lua track.',
  homepage = 'https://github.com/exercism/lua/'
}
dependencies = {
  'lua >= 5.3',
  'busted >= 2.2.0-1',
  'dkjson ~> 2.8-1',
  'luaformatter'
}
build = {
  type = 'builtin',
  modules = {}
}
