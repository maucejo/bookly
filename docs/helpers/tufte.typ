#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Tufte helpers])
#metadata((tags: ("helpers", "tufte", "side notes", "marginalia", "wideblock"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Tufte helpers]

When the `tufte` layout is enabled (`tufte: true` in `#bookly.with`, see #link("../theming/layout.html")[Layout]), several customizations adapt the appearance of figures, tables and equations to the Tufte style. Bookly also provides the following functions, based on the #link("https://typst.app/universe/package/marginalia")[`marginalia`] package, to place content in the margins.

= Side notes

```typ
#note(..note-args)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("..note-args", [arguments])[
  Arguments of the `note` function of the `marginalia` package.

  #calepin.elements.callout[
    Bookly customizes the `marginalia` `note` function as follows:
    ```typ
    #let note = note.with(
      counter: states.sidenotecounter,
      numbering: (..i) => super(numbering("1", ..i)),
      keep-order: true,
    )
    ```
  ]
]

= Side figures

```typ
#notefigure(..notefigure-args)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("..notefigure-args", [arguments])[
  Arguments of the `notefigure` function of the `marginalia` package.

  #calepin.elements.callout[
    Bookly slightly customizes the `marginalia` `notefigure` function as follows:
    ```typ
    #let notefigure = notefigure.with(keep-order: true)
    ```
  ]
]

= Side citations

`#notecite` cites a reference in the text and displays the full reference in the margin.

```typ
#notecite(
  key,
  supplement: none,
  dy: 0em,
  alignment: "baseline",
)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("key", [label])[
  Key of the reference to cite.
]

#argument-callout("supplement", [string | content], default: [none])[
  Supplement of the citation (e.g., a page number).
]

#argument-callout("dy", [length], default: [0em])[
  Vertical adjustment of the side citation.
]

#argument-callout("alignment", [string], default: ["baseline"])[
  Alignment of the side citation. Possible values are:
  - `"top"`: align the top of the note with the reference;
  - `"caption-top"`: align the top of the note with the main text baseline;
  - `"bottom"`: align the bottom of the note with the reference;
  - `"baseline"` (default): align the baseline of the note with the main text baseline.
]

#calepin.elements.callout(kind: "warning")[
  `#notecite` requires a bibliography in the document. Otherwise, the compilation stops with an error.
]

= Wide blocks

`#wideblock` extends a block over the margin.

```typ
#wideblock(side: auto)[...]
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("side", [auto | string], default: [auto])[
  Side over which the block is extended. Possible values are:
  - `auto`: same as `"outer"`;
  - `"outer"`: outer side of the page;
  - `"inner"`: inner side of the page;
  - `"left"`: left side of the page;
  - `"right"`: right side of the page;
  - `"both"`: both sides of the page.
]

*Example: full-width figure*

```typ
#wideblock[
  #figure(image("images/figure.png"), caption: [Full width figure])
]
```

#calepin.elements.callout(kind: "tip")[
  If the same content must be compiled with and without the `tufte` layout, use `#wide-if-tufte` instead of `#wideblock`. It takes the same arguments, but only creates a wide block when the `tufte` layout is enabled. Otherwise, it simply returns its content.
]
