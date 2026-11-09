#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Callout boxes])
#metadata((tags: ("helpers", "callout boxes", "info-box", "custom-box"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Callout boxes]

Bookly provides several types of boxes to highlight different kinds of content. Their style is defined by the current theme, and their titles are translated according to the `lang` argument of `#bookly.with`. The previews below use the default `fancy` theme.

= Predefined boxes

== Information box

`#info-box` provides general information or useful advice.

```typ
#info-box[This is an information box.]
```

#preview("../assets/helpers/box-info.png", alt: "Information box", width: 80%)

== Tip box

`#tip-box` provides tips or recommendations.

```typ
#tip-box[This is a tip box.]
```

#preview("../assets/helpers/box-tip.png", alt: "Tip box", width: 80%)

== Warning box

`#warning-box` warns the reader about a potential danger or important information.

```typ
#warning-box[This is a warning box.]
```

#preview("../assets/helpers/box-warning.png", alt: "Warning box", width: 80%)

== Important box

`#important-box` emphasizes crucial information or key points.

```typ
#important-box[This is an important box.]
```

#preview("../assets/helpers/box-important.png", alt: "Important box", width: 80%)

== Proof box

`#proof-box` presents proofs or mathematical demonstrations.

```typ
#proof-box[This is a proof box.]
```

#preview("../assets/helpers/box-proof.png", alt: "Proof box", width: 80%)

== Question box

`#question-box` asks questions or proposes problems to solve.

```typ
#question-box[This is a question box.]
```

#preview("../assets/helpers/box-question.png", alt: "Question box", width: 80%)

== Code box

`#code-box` presents source code or code snippets.

```typ
#code-box[This is a code box.]
```

#preview("../assets/helpers/box-code.png", alt: "Code box", width: 80%)

= Custom boxes

The boxes above are built with the `#custom-box` function, which you can use to create your own boxes.

```typ
#custom-box(
  title: none,
  icon: "info",
  color: rgb(29, 144, 208),
  breakable: true,
)[...]
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("title", [string | content], default: [none])[
  Title of the box.
]

#argument-callout("icon", [string], default: ["info"])[
  Name of the icon displayed in the title of the box. Available icons are:

  #html.elem("ul", attrs: (style: "padding-left: 0;"))[
    #icon-item("alert")
    #icon-item("info")
    #icon-item("question")
    #icon-item("report")
    #icon-item("stop")
    #icon-item("tip")
    #icon-item("code")
  ]
]

#argument-callout("color", [color], default: [rgb(29, 144, 208)])[
  Color of the box.
]

#argument-callout("breakable", [bool], default: [true])[
  If `true`, the box can be broken across pages.
]

*Example*

```typ
#let my-box = custom-box.with(title: "My box", icon: "report", color: rgb("#8a2be2"))

#my-box[This is a custom box.]
```

#preview("../assets/helpers/box-custom.png", alt: "Custom box", width: 80%)

#calepin.elements.callout(kind: "tip")[
  Defining your own box with `custom-box.with(...)`, as above, is exactly how the predefined boxes are implemented. The box then follows the style of the theme in use.
]
