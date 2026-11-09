#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Fonts and colors])
#metadata((tags: ("theming", "fonts", "colors"))) <website-metadata>

#html.elem("p", attrs: (
  style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;",
))[Fonts and colors customization]

Sometimes, you may want to use a built-in theme, but customize the fonts and colors of your book to match your branding or personal preferences. Bookly allows you to override the default fonts and colors by providing your own definitions to the `fonts` and `colors` arguments of `#bookly.with`.

= Fonts

To use a custom font set, provide `bookly` with a `fonts` argument containing a dictionary with the following keys:

#argument-callout(kind: "Key", "size", "length", default: [11pt])[
  Size of the body text. The size of raw text is set to `0.8` times this value.
]

#argument-callout(kind: "Key", "body", "string | array", default: ["New Computer Modern"])[
  Font family for the body text.
]

#argument-callout(kind: "Key", "math", "string | array", default: ["New Computer Modern Math"])[
  Font family for mathematical equations.
]

#argument-callout(kind: "Key", "raw", "string | array", default: ["DejaVu Sans Mono"])[
  Font family for raw text, such as code snippets.
]

These defaults are exported by the template as `default-fonts`:
```typ
#let default-fonts = (
  size: 11pt,
  body: "New Computer Modern",
  math: "New Computer Modern Math",
  raw: "DejaVu Sans Mono",
)
```

Let's say you want to use "Lato" for the body text, "Lete Sans Math" for equations, and "Cascadia Code" or "Fira Code" (depending on font availability) for raw text, with a font size of 10pt. You can define your custom fonts as follows:
```typ
#let my-fonts = (
  size: 10pt,
  body: "Lato",
  math: "Lete Sans Math",
  raw: ("Cascadia Code", "Fira Code"),
)
```

Then, apply them to your book by passing the `my-fonts` dictionary to the `bookly` function:
```typ
#show: bookly.with(
  fonts: my-fonts,
)
```

#calepin.elements.callout(kind: "note")[
  You don't have to provide every key of the `fonts` dictionary. The dictionary you provide is merged with `default-fonts`, so if you only want to change the math font, you can just provide the `math` key and the other fonts keep their default values.
]

= Colors

Colors are customized the same way. Provide a `colors` argument to the `bookly` function, containing a dictionary with the following keys:

#argument-callout(kind: "Key", "primary", "color", default: [rgb("\#c1002a")])[
  Primary color of the book, used for chapter numbers, headings ornaments, links in tables of contents, etc.
]

#argument-callout(kind: "Key", "secondary", "color", default: [rgb("\#dddddd").darken(15%)])[
  Secondary color, used for rules and other secondary ornaments.
]

#argument-callout(kind: "Key", "boxeq", "color", default: [rgb("\#dddddd")])[
  Background color of the equation boxes created with `boxeq`.
]

#argument-callout(kind: "Key", "header", "color", default: [black])[
  Color used for adapting the color of the document headers.
]

These defaults are exported by the template as `default-colors`:
```typ
#let default-colors = (
  primary: rgb("#c1002a"),
  secondary: rgb("#dddddd").darken(15%),
  boxeq: rgb("#dddddd"),
  header: black,
)
```

Let's say you want to use a blue primary color and a light blue background for the equation boxes. You can define your custom colors as follows:
```typ
#let my-colors = (
  primary: rgb("#014682"),
  boxeq: rgb("#e6eef6"),
)
```

Then, apply them to your book by passing the `my-colors` dictionary to the `bookly` function:
```typ
#show: bookly.with(
  colors: my-colors,
)
```

#calepin.elements.callout(kind: "note")[
  As for fonts, the `colors` dictionary you provide is merged with `default-colors`, so you only need to give the keys you want to change.

  The resulting colors are stored in the `states.colors` state. When writing a #link("custom-themes.html")[custom theme], use `states.colors.get()` (inside a `context`) or the `colors` argument passed to the theme function, so that your theme follows the colors chosen by the user.
]
