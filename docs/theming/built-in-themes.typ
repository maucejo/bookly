#import "/.calepin/calepin.typ" as calepin

#set document(title: [Built-in themes])
#metadata((tags: ("theming", "built-in themes", "themes gallery"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Built-in themes]

Bookly provides a set of built-in themes that define the appearance of your book: parts, chapters, headings, mini tables of contents, callout boxes and equation boxes. All themes share the same API, so you can switch from one to another without touching your content.

Currently, Bookly includes the following built-in themes:

- `fancy` (default)
- `modern`
- `classic`
- `obook`
- `orly` (O'Reilly inspired)
- `pretty`

To apply a built-in theme, set the `theme` argument of the `#bookly.with` function to the desired theme. For example, to use the `modern` theme, you would write:

```typ
#show: bookly.with(
  theme: modern,
)
```

All built-in themes use the same default colors and fonts, which can be changed with the `colors` and `fonts` arguments of `#bookly.with` (see #link("fonts-colors.html")[Fonts and colors]). If none of the built-in themes fits your needs, you can combine them or write your own (see #link("custom-themes.html")[Custom themes]).

= Fancy

The `fancy` theme is the default theme of Bookly. Chapter openings display a large chapter number in the primary color, aligned to the right above the chapter title.

```typ
#show: bookly.with(theme: fancy)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-fancy.png", "Part – fancy theme", [Part]),
    ("../assets/theming/chapter-fancy.png", "Chapter – fancy theme", [Chapter]),
    ("../assets/theming/chapter-nonum-fancy.png", "Unnumbered chapter – fancy theme", [Unnumbered chapter]),
    ("../assets/theming/sections-fancy.png", "Section – fancy theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)

= Modern

The `modern` theme opens chapters with a banner filled with a primary color gradient. The chapter title is displayed in a rounded label overlapping the banner.

```typ
#show: bookly.with(theme: modern)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-modern.png", "Part – modern theme", [Part]),
    ("../assets/theming/chapter-modern.png", "Chapter – modern theme", [Chapter]),
    ("../assets/theming/chapter-nonum-modern.png", "Unnumbered chapter – modern theme", [Unnumbered chapter]),
    ("../assets/theming/sections-modern.png", "Section – modern theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)

= Classic

The `classic` theme is a sober theme with black headings and no colored ornaments, close to the look of traditional books.

```typ
#show: bookly.with(theme: classic)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-classic.png", "Part – classic theme", [Part]),
    ("../assets/theming/chapter-classic.png", "Chapter – classic theme", [Chapter]),
    ("../assets/theming/chapter-nonum-classic.png", "Unnumbered chapter – classic theme", [Unnumbered chapter]),
    ("../assets/theming/sections-classic.png", "Section – classic theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)

= Obook

The `obook` theme frames chapter titles in a rounded box. Its mini table of contents uses `partial-outline` to show the chapters and sections of the current part.

```typ
#show: bookly.with(theme: obook)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-obook.png", "Part – obook theme", [Part]),
    ("../assets/theming/chapter-obook.png", "Chapter – obook theme", [Chapter]),
    ("../assets/theming/chapter-nonum-obook.png", "Unnumbered chapter – obook theme", [Unnumbered chapter]),
    ("../assets/theming/sections-obook.png", "Section – obook theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)

= Orly

The `orly` theme is inspired by O'Reilly books. Chapter titles are right-aligned under an uppercase "CHAPTER" label and a horizontal rule.

```typ
#show: bookly.with(theme: orly)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-orly.png", "Part – orly theme", [Part]),
    ("../assets/theming/chapter-orly.png", "Chapter – orly theme", [Chapter]),
    ("../assets/theming/chapter-nonum-orly.png", "Unnumbered chapter – orly theme", [Unnumbered chapter]),
    ("../assets/theming/sections-orly.png", "Section – orly theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)

= Pretty

The `pretty` theme displays the chapter number in a colored badge next to the chapter title, and uses colored labels for the mini table of contents.

```typ
#show: bookly.with(theme: pretty)
```

#calepin.elements.gallery(
  (
    ("../assets/theming/part-pretty.png", "Part – pretty theme", [Part]),
    ("../assets/theming/chapter-pretty.png", "Chapter – pretty theme", [Chapter]),
    ("../assets/theming/chapter-nonum-pretty.png", "Unnumbered chapter – pretty theme", [Unnumbered chapter]),
    ("../assets/theming/sections-pretty.png", "Section – pretty theme", [Section]),
  ),
  columns: 2,
  max-width: 100%,
)
