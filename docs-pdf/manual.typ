#import "../src/bookly.typ": *
#import "reset-theme.typ": *

#show: bookly.with(
  author: "Mathieu AUCEJO",
  title: "Bookly",
  fonts: (
    body: "Lato",
    math: "Lete Sans Math",
    raw: "Cascadia Code"
  ),
  lang: "en",
  title-page: book-title-page(
    subtitle: "User's guide",
    edition: "Version 5.3.0",
    series: " Typst book series",
    institution: "Typst community",
    logo: image("manual-images/typst-logo.svg"),
    cover: image("manual-images/bookly-logo.png", width: 45%),
  ),
  config-options: (
    open-right: false,
    par-indent: false,
  )
)

#show: front-matter

#include "book-content/foreword.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[User's manual]

#include "book-content/general-usage.typ"
#include "book-content/book-content.typ"
#include "book-content/helper.typ"
#include "book-content/theming.typ"

#show: appendix
#part[Themes in action!]

#[
  #set page(header: none, footer: none)
  #pagebreak(to: "odd")
]
#include "book-content/fancy.typ"

#context[
  #pagebreak(to: "odd")
  #show: reset-theme.with()
  #states.theme.update(classic)
  #show: classic.theme
  #include "book-content/classic.typ"

  #pagebreak(to: "odd")
  #show: reset-theme.with()
  #states.theme.update(modern)
  #show: modern.theme
  #include "book-content/modern.typ"

  #pagebreak(to: "odd")
  #show: reset-theme.with()
  #states.theme.update(orly)
  #show: orly.theme
  #include "book-content/orly.typ"

  #pagebreak(to: "odd")
  #show: reset-theme.with()
  #states.theme.update(obook)
  #show: obook.theme
  #include "book-content/obook.typ"

  #pagebreak(to: "odd")
  #show: reset-theme.with()
  #states.theme.update(pretty)
  #show: pretty.theme
  #include "book-content/pretty.typ"
]

#bibliography("book-content/sample.bib")