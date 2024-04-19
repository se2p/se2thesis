# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Fix the referencing with cleveref's `\cref` etc. for the `resq` (research
  questions) and `hyp` (hypotheses) environments
  (see [#8](https://github.com/se2p/se2thesis/issues/8))
- Add the thesis type `phdphil` for a PhD thesis in philosophy.

## [v3.3.1] – 2024–02–23

### Changed
- Make the citations in the margin appear in ACM style, too.
- Make sidenotes appear right ragged.

## [v3.3.0] – 2024–02–22

### Added

- Enhance the options for bibliography styles, one can now choose between
  `alphabetic` and `numeric` style.  The former loads the default BibLaTeX
  `alphabetic` style, the latter uses ACM's numeric style.
- For the new numeric style, we support an enhanced `\autocite` macro, which
  typesets the citation in the margin column for the first appearance per
  chapter.
- Add thesis-type option `phdeng` for a doctoral degree in engineering.

### Changed

- The default citation style, when setting `biblatex=true` while loading the
  `se2packages` package is now `numeric` based on the ACM numeric style instead
  of `alphabetic`.  The latter can now be chosen explicitly.
  See [issue #7](https://github.com/se2p/se2thesis/issues/7) for a discussion
  on the general decision.

## [v3.2.0] – 2023–09–12

### Changed

- Remove deprecated options from `siunitx` loading.
- Use `inconsolata-nerd-font` as the default mono-spaced font.
- Updates on the documentation.

### Removed

- Removed option `fontmode` of the `se2thesis` class, which was already
  deprecated.

## [v3.1.0] – 2023–07–04

### Changed

- The `lua-widow-control` package causes build failures in different settings,
  although the same TeX Live version is used.  Until this can be resolved, we
  deactivate the loading of this package from `se2packages` by default.  It can
  still be activated manually by adding the `widowcontrol=true` option to the
  `se2packages` package.
- Set penalties for widows and orphans only if `lua-widow-control` package is
  not loaded.
- Change the formatting of chapter headings.

## [v3.0.0] – 2023–04–18

### Added

- Add documentation on how to install the bundle if it is not part of the
  existing TeX distribution.
- Add a package `se2packages` that provides the ability to directly load
  recommended packages with recommended options.

### Changed

- The `paper=a4` and `paper=b5` options now produce the exact same text-block
  sizes.
- Make the logo height smaller for B5 paper.
- The default class is now `scrbook` instead of `scrreprt`.

### Removed

- **Breaking:** Removed the `biblatex` class option from `se2thesis`, use the
  `se2packages` package with its `biblatex=true` option instead.
- **Breaking:** Removed the `paper=a5` option.
- Removed the automated loading of the `microtype`, `selnolig`, and
  `lua-widow-control` packages from `se2thesis`—use `se2packages` instead.

## [v2.1.0] – 2023–01–27

### Added

- Add license text of LaTeX Project Public License (LPPL) to repository
- Add a continuous integration pipline using GitHub Actions
- Add styling for chapter, section, and sub-section headings

### Fixed

- Fix the font selection in the documentation of `se2fonts` to only use the
  filename but not the font name
- Fix the definitions of `\frontmatter`, `\mainmatter`, and `\backmatter` to
  match the definitions from KOMA Script's `scrbook` class.

## [v2.0.0] – 2023–01–10

### Added

- A file `se2thesis.tex` that contains the combined documentation from all DTX
  files as well as their code
- Use Libertinus and Fira Code as fonts

### Changed

- Split the large `se2thesis.dtx` into several DTX files for the different packages
- Deprecate the `fmode` argument to `se2fonts.sty`.  *Attention:* This is a breaking change!
- The `build.lua` now also builds all `*.tex` files
- Use the default back-reference styling of `biblatex`
- Changed the dimensions of the type area

### Fixed

- Get correct translation for lower-title back for PhD theses

### Removed

- Support for the TeX Gyre and Palatino/Helvetica fonts.  We replace all fonts by the Libertinus font family.

## [v1.3.1] – 2022–11–22

### Fixed

- Fix typos that caused issues with missing spaces, thanks to @Wooza

## [v1.3.0] – 2022–11–08

### Changed

These changes might be breaking changes!

- Change the width of the text block to match a golden ratio with its height.
- Change the available predefined colours.
- Change the option names of `se2colors` and `se2fonts` to `cmode` and `fmode`,
  respectively.
- Use Helvetica instead of Optima as the sans-serif default font.

### Fixed

- For summary boxes a white space was missing between the text “Summary” and the
  opening bracket, reported by @Wooza

## [v1.2.0] – 2022–10–24

### Added

- A macro `\matrnumber` to specify the matriculation number of the student on
  the title page.

## [v1.1.1] - 2022-09-27

### Fixed

- Neo Euler needs to be loaded as a upright math font

### Updated

- Fonts get now scaled automatically when using LuaTeX

## [v1.1.0] - 2022-09-12

### Added
- Documentation of the load-time options of se2thesis.cls

### Fixed
- Compilation issue of the example file with pdfLaTeX, added a contional option
  to `ntheorem`.

## [v1.0.0] - 2022-09-09

### Added
- First official release

[v3.3.1]: https://github.com/se2p/se2thesis/compare/v3.3.1...v3.3.0
[v3.3.0]: https://github.com/se2p/se2thesis/compare/v3.3.0...v3.2.0
[v3.2.0]: https://github.com/se2p/se2thesis/compare/v3.2.0...v3.1.0
[v3.1.0]: https://github.com/se2p/se2thesis/compare/v3.1.0...v3.0.0
[v3.0.0]: https://github.com/se2p/se2thesis/compare/v3.0.0...v2.1.0
[v2.1.0]: https://github.com/se2p/se2thesis/compare/v2.1.0...v2.0.0
[v2.0.0]: https://github.com/se2p/se2thesis/compare/v2.0.0...v1.3.1
[v1.3.1]: https://github.com/se2p/se2thesis/compare/v1.3.1...v1.3.0
[v1.3.0]: https://github.com/se2p/se2thesis/compare/v1.3.0...v1.2.0
[v1.2.0]: https://github.com/se2p/se2thesis/compare/v1.2.0...v1.1.1
[v1.1.1]: https://github.com/se2p/se2thesis/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/se2p/se2thesis/compare/1.0.0...v1.1.0
