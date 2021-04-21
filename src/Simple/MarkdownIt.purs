 -- | Dead-simple bindings to [markdown-it](https://github.com/markdown-it/markdown-it).
module Simple.MarkdownIt where

import Data.Function.Uncurried (Fn2)
import Data.Options (Option, Options(..), opt, options)
import Effect (Effect)
import Foreign (Foreign, unsafeToForeign)
import Untagged.Union (type (|+|))


-- | Represents a `MarkdownIt` instance.
foreign import data MarkdownIt :: Type

data PresetName
  = Commonmark
  | Default
  | Zero
  | NoPreset

-- | Creates a new `MarkdownIt` instance.
newMarkdownIt :: PresetName -> Options MarkdownItOptions -> Effect MarkdownIt
newMarkdownIt presetName mdOptions =
  case presetName of
    Commonmark -> f "commonmark"
    Default -> f "default"
    Zero -> f "zero"
    NoPreset -> _new [options mdOptions]
  where
    f n = _new [unsafeToForeign n, options mdOptions]

-- | Provides a default `MarkdownIt` instance.
defaultMarkdownIt :: Effect MarkdownIt
defaultMarkdownIt = newMarkdownIt NoPreset (Options [])

-- | Renders Markdown into HTML.
render :: String -> MarkdownIt -> Effect String
render = _render

{-----------------------------------------------------------------------}

-- | Phantom type consumed by `options`.
-- |
-- | Documentation for options can be found here:
-- | https://markdown-it.github.io/markdown-it/#MarkdownIt.new
data MarkdownItOptions

html :: Option MarkdownItOptions Boolean
html = opt "html"

xhtmlOut :: Option MarkdownItOptions Boolean
xhtmlOut = opt "xhtmlOut"

breaks :: Option MarkdownItOptions Boolean
breaks = opt "breaks"

langPrefix :: Option MarkdownItOptions String
langPrefix = opt "langPrefix"

linkify :: Option MarkdownItOptions Boolean
linkify = opt "linkify"

typographer :: Option MarkdownItOptions Boolean
typographer = opt "typographer"

quotes :: Option MarkdownItOptions (String |+| Array String)
quotes = opt "quotes"

highlight :: Option MarkdownItOptions (Fn2 String String String)
highlight = opt "highlight"

{-----------------------------------------------------------------------}

foreign import _new :: Array Foreign -> Effect MarkdownIt

foreign import _render :: String -> MarkdownIt -> Effect String
