#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Custom themes])
#metadata((tags: ("theming", "custom themes", "states"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Custom themes]

Using one of the #link("built-in-themes.html")[built-in themes] is a great way to get started with Bookly, but you may want to create your own theme to match your branding or personal style. This section explains how Bookly's theming system works, how to create a custom theme and how to apply it to your book.

= Theming system

In Bookly, a theme is a dictionary of standardized functions that define the visual appearance of the key elements of a book. This common interface allows themes to be used interchangeably and to be combined.

== Common interface

Every theme exposes the same interface, which is a dictionary defined as:
```typ
#let custom = (
  theme: custom-theme,
  part: custom-part,
  minitoc: custom-minitoc,
  custom-box: custom-custom-box,
  boxeq: custom-boxeq,
)
```

The elements of the dictionary are:
- `theme` (function): show rule defining the theme style (headings, outline entries, footnotes, headers and footers, ...). It receives the colors of the book through its `colors` argument.
- `part` (function): function defining the style of the part titles, used by `#part`.
- `minitoc` (content): mini table of contents displayed by `#minitoc`.
- `custom-box` (function): function defining the style of the callout boxes (`info-box`, `tip-box`, `warning-box`, `proof-box`, ...).
- `boxeq` (function): function defining the style of the equation boxes, used by `#boxeq`.

For instance, the `fancy` theme is defined as:
```typ
#let fancy = (
  theme: fancy-theme,
  part: fancy-part,
  minitoc: fancy-minitoc,
  custom-box: fancy-custom-box,
  boxeq: fancy-boxeq,
)
```

Thanks to this interface, high-level functions such as `#part`, `#minitoc`, `#boxeq` or `#info-box` work whatever the theme is. They simply call the corresponding function of the current theme, stored in `states.theme`:
```typ
#let part(title) = context (states.theme.get().part)(title)
#let boxeq(content) = context (states.theme.get().boxeq)(content)
```

== Partial theme definitions

A custom theme does not need to implement the complete interface. The theme you provide is merged with the `classic` theme, so any key that is not defined in your theme falls back to the `classic` implementation. This makes it straightforward to customize individual elements without redefining an entire theme.

= Setting up a custom theme

To implement a custom theme, you have to define a function that includes the `show` and `set` rules defining the style of the document (headings, footnotes, references, #sym.dots). Basically, a theme should be structured as follows:

```typ
// my-theme.typ
#import "@preview/bookly:5.3.0": *

#let my-theme(colors: default-colors, it) = {
  // Heading level 1 style (chapters)
  show heading.where(level: 1): it => context {
    // Page break before each chapter
    if not states.open-right-chapter.get() { pagebreak(weak: true) }
    ...
  }

  // Heading level 2 style
  show heading.where(level: 2): it => { ... }

  // Heading level 3 style
  show heading.where(level: 3): it => { ... }

  // Outline entry style
  show outline.entry: it => { ... }

  // Other show and set rules
  ...

  it
}

// Custom part function
#let my-part(title) = { ... }

// Custom minitoc
#let my-minitoc = { ... }

// Custom box style
#let my-custom-box(title: none, icon: "info", color: rgb(29, 144, 208), body) = { ... }

// Custom equation box style
#let my-boxeq(body) = { ... }

// Theme dictionary
#let custom-theme = (
  theme: my-theme,
  part: my-part,
  minitoc: my-minitoc,
  custom-box: my-custom-box,
  boxeq: my-boxeq,
)
```

Then, you can initialize the template with your custom theme as follows:
```typ
#import "@preview/bookly:5.3.0": *
#import "my-theme.typ": custom-theme

#show: bookly.with(
  theme: custom-theme,
)
```

#calepin.elements.callout(kind: "note")[
  You can explore the source code of the #link("https://github.com/maucejo/bookly/tree/main/src/themes")[built-in themes] to see how they are defined and how they rely on the template states to manage colors, numbering and page openings.
]

= Theme composition

Because a theme is a plain dictionary, you can reuse and combine elements of the existing themes in the definition of your own theme. The functions of a theme are accessible using the pattern `theme-name.key`. For example:
```typ
#import "@preview/bookly:5.3.0": *

#let custom = (
  theme: pretty.theme,
  part: obook.part,
  minitoc: modern.minitoc,
  custom-box: orly.custom-box,
  boxeq: pretty.boxeq,
)

#show: bookly.with(
  theme: custom,
)
```

Combined with the fallback to `classic`, this also lets you change a single element of a theme. For instance, to use the `classic` theme with the boxes of the `fancy` theme:
```typ
#show: bookly.with(
  theme: (custom-box: fancy.custom-box),
)
```

= Template states

Bookly provides some states that are useful when designing a custom theme. They store information about the current state of the document and are collected in a dictionary named `states`. The following states are available:

#argument-callout(kind: "State", "alt-margins", [bool], default: [false])[
  Indicates whether the margins are alternated for odd and even pages when the `tufte` layout is enabled.
]

#argument-callout(kind: "State", "author", [string | content])[
  Author of the document.
]

#argument-callout(kind: "State", "colors", [dictionary])[
  Color scheme of the document (see #link("fonts-colors.html")[Fonts and colors]).
]

#argument-callout(kind: "State", "counter-part", [counter])[
  Counter for parts.
]

#argument-callout(kind: "State", "is-toc-part", [bool], default: [false])[
  Indicates whether the current entry is a part in the table of contents.
]

#argument-callout(kind: "State", "isappendix", [bool], default: [false])[
  Indicates whether the current section is an appendix.
]

#argument-callout(kind: "State", "isfrontmatter", [bool], default: [false])[
  Indicates whether the current section is front matter.
]

#argument-callout(kind: "State", "justify-headings", [bool], default: [true])[
  Indicates whether headings are justified.
]

#argument-callout(kind: "State", "localization", [dictionary])[
  Dictionary of terms used in the document (e.g., "chapter", "part", ...) in the selected language.

  #calepin.elements.callout[
    To use a language that is not supported by default, you can modify the `states.localization` dictionary after initializing the template. For instance, to add support for Dutch:
    ```typ
    #states.localization.update(json("path_to_file/dutch.json"))
    ```

    For the English version, the JSON file is as follows:
    ```json
    {
      "and": " and ",
      "appendix": "Appendix",
      "authored": "authored by",
      "chapter": "Chapter",
      "committee": "Defense committee",
      "cosupervisor": "Co-supervisor:",
      "cosupervisors": "Co-supervisors:",
      "defended": "defended on",
      "discipline": "Discipline:",
      "doctoral-school": "DOCTORAL SCHOOL",
      "habilitation": "French Habilitation to supervise research",
      "lof": "List of figures",
      "lot": "List of tables",
      "minitoc": "Content",
      "note": "Note",
      "part": "Part",
      "phd": "Doctoral thesis",
      "proof": "Proof",
      "specialty": "Specialty:",
      "sponsor": "Sponsor:",
      "sponsors": "Sponsors:",
      "supervisor": "Supervisor:",
      "supervisors": "Supervisors:",
      "tip": "Tip",
      "toc": "Table of contents",
      "version-usage": "This version can be viewed and downloaded free of charge for personal use only. It must not be redistributed, sold, or used in derivative works.",
      "warning": "Warning"
    }
    ```
  ]
]

#argument-callout(kind: "State", "num-heading", [string], default: ["1"])[
  Numbering pattern for headings.
]

#argument-callout(kind: "State", "num-pattern", [string], default: ["1.1."])[
  Numbering pattern for sections.
]

#argument-callout(kind: "State", "num-pattern-eq", [string], default: ["(1.1)"])[
  Numbering pattern for equations.
]

#argument-callout(kind: "State", "num-pattern-fig", [string], default: ["1.1"])[
  Numbering pattern for figures.
]

#argument-callout(kind: "State", "num-pattern-subfig", [string], default: ["1.1a"])[
  Numbering pattern for subfigures.
]

#argument-callout(kind: "State", "open-right", [bool], default: [true])[
  Indicates whether the document is laid out for two-sided printing (`true` unless the `open-right` option is `false`).
]

#argument-callout(kind: "State", "open-right-chapter", [bool], default: [true])[
  Indicates whether chapters start on a right-hand page.
]

#argument-callout(kind: "State", "open-right-part", [bool], default: [true])[
  Indicates whether parts start on a right-hand page.
]

#argument-callout(kind: "State", "page-numbering", [string], default: ["1/1"])[
  Numbering pattern for pages.
]

#argument-callout(kind: "State", "paper-size", [string], default: ["a4"])[
  Size of the paper.
]

#argument-callout(kind: "State", "par-indent", [bool], default: [false])[
  Indicates whether paragraphs are indented.
]

#argument-callout(kind: "State", "par-indent-amount", [length], default: [1.5em])[
  Amount of the paragraph indentation.
]

#argument-callout(kind: "State", "part-numbering", [string], default: ["1"])[
  Numbering pattern for parts.
]

#argument-callout(kind: "State", "sidenotecounter", [counter])[
  Counter for side notes.
]

#argument-callout(kind: "State", "theme", [dictionary])[
  Current theme of the document (see #link("#theming-system")[Theming system]).
]

#argument-callout(kind: "State", "title", [string | content])[
  Title of the document.
]

#argument-callout(kind: "State", "tufte", [bool], default: [false])[
  Indicates whether the current layout is the Tufte layout.
]
