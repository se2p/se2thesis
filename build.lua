-- Build script for "se2thesis" files

-- Identify the bundle and module
bundle = ""
module = "se2thesis"

-- Release a TDS-style zip
packtdszip = true

-- Typeset only the .tex files
-- typesetfiles = {"*.tex"}

-- Sources files cover those for rollback
sourcesfiles =
  {
    "se2thesis.dtx",
    "se2thesis.ins",
  }
demofiles =
  {
    "examples/*.tex",
    "examples/*.pdf"
  }

installfiles = {"*.cls", "*.sty", "*.trsl"}

-- ASCII mangling is not useful for us
asciiengines = { }

-- Two runs for label testing
checkruns = 2

-- Use LuaLaTeX for compiling
typesetexe = "lualatex"

-- Set up test runners
checkengines = {"pdftex", "luatex"}
