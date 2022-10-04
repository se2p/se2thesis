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

uploadconfig = {
  author      = "Stephan Lukasczyk",
  license     = "lppl1.3c",
  summary     = "A Thesis Class for the Chair of Software Engineering II at the University of Passau, Germany",
  topic       = {"class", "dissertation", "expl3"},
  ctanPath    = "/macros/latex/contrib/se2thesis",
  repository  = "https://github.com/se2p/se2thesis",
  bugtracker  = "https://github.com/se2p/se2thesis/issues",
  update      = true,
  description = [[
The se2thesis bundle provides a document class for writing a thesis with the [Chair of Software Engineering II](https://www.fim.uni-passau.de/en/chair-for-software-engineering-ii/) at the [University of Passau](https://www.uni-passau.de), Germany.  The class is based on Markus Kohm's [KOMA-Script](https://www.ctan.org/pkg/koma-script) classes and provides several additions and customizations to these classes.  While the class provides some basic settings, mostly regarding the type area, fonts, and the title page, it still provides large degrees of freedom to its users.  However, the package's documentation also provides recommendations regarding several aspects, for example, recommending [BibLaTeX](https://www.ctan.org/pkg/biblatex) for bibliographies.
  ]]
}
