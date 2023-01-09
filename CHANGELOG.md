# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- A file `se2thesis.tex` that contains the combined documentation from all DTX
  files as well as their code

### Changed

- Split the large `se2thesis.dtx` into several DTX files for the different packages
- The `build.lua` now also builds all `*.tex` files

### Fixed

- Get correct translation for lower-title back for PhD theses

## Removed

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

[v1.3.1]: https://github.com/se2p/se2thesis/compare/v1.3.1...v1.3.0
[v1.3.0]: https://github.com/se2p/se2thesis/compare/v1.3.0...v1.2.0
[v1.2.0]: https://github.com/se2p/se2thesis/compare/v1.2.0...v1.1.1
[v1.1.1]: https://github.com/se2p/se2thesis/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/se2p/se2thesis/compare/1.0.0...v1.1.0
