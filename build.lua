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

-- Detail how to set the version automatically
function update_tag(file, content, tagname, tagdate)
  tagname = string.gsub(tagname, "^v", "")
  dict_tagdate = string.gsub(tagdate, "-", "/")

  if string.match(file, "CHANGELOG.md") then
    local pattern = "v%d%.%d.%d%?"
    local url = "https://github.com/se2p/se2thesis/compare/"
    local previous = string.match(content, "compare/(" .. pattern .. ")%.%.%.HEAD")
    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [v" .. tagname .. "] - " .. tagdate)
    return string.gsub(content,
      pattern .. "%.%.%.HEAD",
      "v" .. tagname .. "...HEAD\n[v" .. tagname .. "]: " .. url .. previous
        .. "...v" .. tagname)
  end
  if string.match(file, "%.dtx$") then
    content = string.gsub(content,
      "\n\\ProvidesExplClass %{se2thesis%} %{[^}]+%} %{[^}]+%}\n",
      "\n\\ProvidesExplClass {se2thesis} {"
        .. tagdate .. "} {" .. tagname .. "}\n")
    content = string.gsub(content,
      "\n\\ProvidesExplPackage %{se2colors%} %{[^}]+%} %{[^}]+%}\n",
      "\n\\ProvidesExplPackage {se2colors} {"
        .. tagdate .. "} {" .. tagname .. "}\n")
    content = string.gsub(content,
      "\n\\ProvidesExplPackage %{se2fonts%} %{[^}]+%} %{[^}]+%}\n",
      "\n\\ProvidesExplPackage {se2fonts} {"
        .. tagdate .. "} {" .. tagname .. "}\n")
    content = string.gsub(content,
      "\n\\ProvideDictionaryFor%{English%}%{se2translations%}%[[^]]+%]\n",
      "\n\\ProvideDictionaryFor{English}{se2translations}["
        .. dict_tagdate .. "]\n")
    content = string.gsub(content,
      "\n\\ProvideDictionaryFor%{German%}%{se2translations%}%[[^]]+%]\n",
      "\n\\ProvideDictionaryFor{German}{se2translations}["
        .. dict_tagdate .. "]\n")
  end
  return content
end
