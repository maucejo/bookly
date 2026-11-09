#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Subfigures])
#metadata((tags: ("helpers", "subfigures", "figures"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Subfigures]

Figures are usually inserted with Typst's `#figure` function. However, Typst does not currently provide a mechanism for handling subfigures (numbering and referencing). To address this limitation, Bookly includes a `#subfigure` function that numbers and references subfigures appropriately.

`#subfigure` wraps the `grid` function of the #link("https://typst.app/universe/package/subpar")[`subpar`] package, so it accepts the same arguments (`columns`, `caption`, `label`, ...). Subfigures are numbered with the pattern of the current environment (e.g., `1.1a` in the main matter, `A.1a` in the appendix).

= Example

```typ
#subfigure(
  figure(rect(), caption: []),
  figure(rect(), caption: []), <b>,
  columns: (1fr, 1fr),
  caption: [Figure title],
  label: <fig:subfig>,
)

Figure @fig:subfig shows an example of subfigures. Figure @b shows the second subfigure.
```

#preview("../assets/helpers/subfigure.png", alt: "Rendered subfigures", width: 80%)

#calepin.elements.callout(kind: "tip")[
  To reference a single subfigure, add a label right after it in the list of arguments, as `<b>` in the example above.
]
