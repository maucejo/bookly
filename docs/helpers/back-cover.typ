#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Back cover])
#metadata((tags: ("helpers", "back cover", "abstract"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Back cover]

The `#back-cover` function creates the back cover of the document. It displays the author and the title of the document, taken from `#bookly.with`, followed by one or several abstracts. It is usually the last command of the main file.

```typ
#back-cover(
  abstracts: (),
  logo: none,
)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("abstracts", [array], default: [()])[
  Abstracts of the document. Each element of the array is a dictionary with the following keys:
  - `title`: title of the abstract (e.g., "Abstract:");
  - `text`: text of the abstract.
]

#argument-callout("logo", [array], default: [none])[
  Logos displayed in a row above the author and title (see `#row-img` in #link("miscellaneous.html")[Miscellaneous]).
]

#calepin.elements.callout[
  Unless the `open-right` option is set to `false`, the back cover is placed on an even (left-hand) page, as expected for two-sided printing. It has neither header nor footer and does not count in the page numbering.
]

= Example

```typ
#let abstracts = (
  (
    title: [Abstract:],
    text: [This work presents the objectives, methodology, and main results of the work.],
  ),
  (
    title: [#set text(lang: "fr"); Résumé :],
    text: [#set text(lang: "fr"); Ce travail présente les objectifs, la méthodologie et les principaux résultats.],
  ),
)

#let logos = (
  align(left)[#image("images/logo1.svg", width: 45%)],
  align(right)[#image("images/logo2.png", width: 50%)],
)

#back-cover(abstracts: abstracts, logo: logos)
```

#preview("../assets/helpers/back-cover.png", alt: "Back cover (without logos)", width: 50%, border: true)
