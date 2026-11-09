#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Equations])
#metadata((tags: ("helpers", "equations", "boxeq", "numbering"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Equations]

Equations are numbered by chapter (e.g., `(1.1)`), and sub-numbering of multiline equations is handled by the #link("https://typst.app/universe/package/equate")[`equate`] package. Bookly also provides helpers to highlight an equation or to remove its number.

= Boxed equations

To highlight an important equation, use the `#boxeq` function. Its style is defined by the current theme, and its background color by the `boxeq` key of the `colors` dictionary (see #link("../theming/fonts-colors.html#colors")[Fonts and colors]).

```typ
$
#boxeq[$p(A|B) prop p(B|A) space p(A)$]
$
```

#preview("../assets/helpers/eq-boxeq.png", alt: "Rendered boxed equation", width: 80%)

= Unnumbered equations

To create an equation without numbering, add the label `<nonum-eq>` after the equation.

```typ
$
integral_0^1 f(x) dif x = F(1) - F(0)
$ <nonum-eq>
```

#preview("../assets/helpers/eq-nonum.png", alt: "Rendered unnumbered equation", width: 80%)
