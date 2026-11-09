#import "/.calepin/calepin.typ" as calepin
#import "doc-utils.typ": argument-callout

#set document(title: [Getting started])
#metadata((tags: ("getting started", "import", "basic usage", "themes", "layout"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Getting started]

This section gives an overview of the general usage of the Bookly template. It covers how to import and initialize the template, the available configuration options, and the supported layouts.

= Import the template

To use the `bookly` template, you need to include the following line at the beginning of your `typ` file:

```typ
#import "@preview/bookly:5.3.0": *
```

#calepin.elements.callout(kind: "warning")[
In `bookly`, the supplement of the `ref` function is set to `none` by default to avoid unexpected behavior when referencing more than one item. You can revert this setting by using the following syntax after the template definition:

```typ
#set ref(supplement: auto)
```
]

= Template initialization

After importing the template, you have to initialize it with a show rule using the `#bookly` command. This function takes a set of optional arguments that allow you to customize the appearance of your book.

```typ
#show: bookly.with(
  title: "Title",
  author: "Author Name",
  theme: fancy,
  tufte: false,
  lang: "en",
  fonts: default-fonts,
  colors: default-colors,
  title-page: default-title-page,
  config-options: default-config-options,
)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("title", [string | content], default: ["Title"])[
Title of the book.
]

#argument-callout("author", [string | content], default: ["Author Name"])[
Author of the book.
]

#argument-callout("theme", [dictionary], default: [fancy])[
Theme of the document. Possible values are:
- `fancy` (default)
- `modern`
- `classic`
- `obook`
- `orly` (O'Reilly inspired)
- `pretty`

See the #link("theming/built-in-themes.html")[Built-in themes] page for a description and a gallery of each theme.
]

#argument-callout("tufte", [bool], default: [false])[
If `true`, the layout of the document is inspired by the works of Edward Tufte (wide margins, side notes, etc.).
]

#argument-callout("lang", [string], default: ["en"])[
Language of the document.

Supported languages:
- `"en"`: English (default)
- `"zh"`: Chinese
- `"fr"`: French
- `"de"`: German
- `"it"`: Italian
- `"pt"`: Portuguese
- `"es"`: Spanish
]

#argument-callout("fonts", [dictionary], default: [default-fonts])[
Fonts used in the document, given as a dictionary with the keys `size`, `body`, `math` and `raw`. See #link("theming/fonts-colors.html#fonts")[Fonts and colors] for details.
]

#argument-callout("colors", [dictionary], default: [default-colors])[
Colors used in the document, given as a dictionary with the keys `primary`, `secondary`, `boxeq` and `header`. See #link("theming/fonts-colors.html#colors")[Fonts and colors] for details.
]

#argument-callout("title-page", [content], default: [default-title-page])[
Content of the title page.
]

#argument-callout("config-options", [dictionary], default: [default-config-options])[
Configuration options of the document. They allow a more fine-grained control of some aspects of the template. The dictionary contains the following keys:
- `alt-margins` (bool): if `true`, margins are alternated for odd and even pages when `tufte` is enabled (default: `false`)
- `justify-headings` (bool): if `true`, headings are justified (default: `true`)
- `open-right` (bool | string): controls which divisions start on a right-hand page (default: `true`)
  - `true`: parts and chapters start on a right-hand page
  - `false`: parts and chapters start on the next page
  - `"part"`: only parts start on a right-hand page, chapters start on the next page
  - `"chapter"`: only chapters start on a right-hand page, parts start on the next page
- `paper-size` (string): size of the paper (default: `"a4"`)
- `par-indent` (bool): if `true`, paragraphs are indented (default: `false`)
- `par-indent-amount` (length): amount of the paragraph indentation (default: `1.5em`). Chinese typesetting conventionally indents by two characters, which is `2em` for a CJK font.
- `part-numbering` (string): numbering pattern for parts (default: `"1"`)

#calepin.elements.callout[
Unless `open-right` is `false`, the front matter, the main matter, the title page and the back cover also start on the appropriate page for two-sided printing.
]

#calepin.elements.callout[
If `part-numbering` is set to `none`, the parts are not numbered. If it is set to `"1"`, the parts are numbered with Arabic numerals. If it is set to `"I"`, the parts are numbered with Roman numerals. Other numbering patterns are possible.
]
]

= Initialization example

```typ
#import "@preview/bookly:5.3.0": *

#show: bookly.with(
  author: "Author Name",
  fonts: (
    body: "Lato",
    math: "Lete Sans Math",
  ),
  theme: modern,
  lang: "en",
)
```

= Dependencies

The `bookly` template relies on several Typst packages to provide additional functionalities:

- `marginalia:0.3.1`: for the Tufte layout.
- `hydra:0.6.3`: for running headers.
- `equate:0.3.3`: for advanced equation numbering.
- `showybox:2.0.4`: for custom boxes.
- `suboutline:0.3.1`: for mini tables of contents in chapters.
- `subpar:0.2.2`: for subfigures.
