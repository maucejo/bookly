#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Miscellaneous])
#metadata((tags: ("helpers", "miscellaneous", "counters", "indentation", "outline"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Miscellaneous]

Bookly provides several other helper functions to facilitate the writing of a book or a thesis and the creation of custom themes.

= reset-counters

```typ
#reset-counters
```

#argument-callout-(kind: "Command")[
  Resets the counters of equations, figures, tables, side notes and footnotes. The built-in themes call it at the beginning of each chapter.
]

= row-img

```typ
#row-img(logo)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("logo", [array])[
  Array of images to display in a row.

  ```typ
  #row-img((
    image("images/logo1.png", width: 20%),
    image("images/logo2.png", width: 20%),
    image("images/logo3.png", width: 20%),
  ))
  ```
]

= noindent

```typ
#noindent
```

#argument-callout-(kind: "Command")[
  Disables the indentation of a given paragraph when the `par-indent` option is enabled.

  ```typ
  #noindent This paragraph will not be indented.
  ```
]

= partial-outline

```typ
#partial-outline
```

#argument-callout-(kind: "Command")[
  Displays a partial outline of the document, showing only the chapters and sections between the current part and the next one. This function is useful to create a mini table of contents for a specific part of the document (see the `obook` theme).
]

= show-if

```typ
#show: show-if(condition, func)
```

#argument-callout-(kind: "Command")[
  Applies the show rule `func` only if `condition` is `true`. This is useful in custom themes, for instance to apply a rule only in the `tufte` layout.

  ```typ
  #show: show-if(states.tufte.get(), it => {
    set text(size: 0.9em)
    it
  })
  ```
]
