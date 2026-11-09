#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Short or long titles])
#metadata((tags: ("helpers", "short title", "caption", "list of figures"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Short or long titles]

Bookly provides the `#short-or-long` function to manage long and short versions of a title or a caption.

```typ
#short-or-long(short, long)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("short", [string | content])[
  Short version, displayed in the list of figures, the list of tables and the running headers.
]

#argument-callout("long", [string | content])[
  Long version, displayed in the main text.
]

= Usage

- Applied to a heading, the short title is used in the header or the footer, while the long title is displayed in the main text.
- Applied to a figure or a table caption, the short caption is displayed in the list of figures or the list of tables, while the long caption is used in the main text.

```typ
#figure(
  rect(),
  caption: short-or-long("Short caption", "Long caption"),
)

See the list of figures for the short caption.
```
