let conf = ./spago.dhall

in      conf
    //  { dependencies = conf.dependencies # [ "console", "prelude" ]
        , sources = conf.sources # [ "test/**/*.purs" ]
        }
