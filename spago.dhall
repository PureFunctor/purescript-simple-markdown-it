{ name = "simple-markdown-it"
, dependencies =
  [ "effect"
  , "foreign"
  , "functions"
  , "options"
  , "psci-support"
  , "untagged-union"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, license = "BSD-3-Clause"
, repository = "https://github.com/PureFunctor/simple-markdown-it.git"
}
