#import "/.calepin/calepin.typ" as calepin

#set document(title: [Bookly Documentation])

#metadata((
  layout: "layouts/site-landing.html",
  tags: ("overview", "getting started"),
)) <website-metadata>

#html.elem("section", attrs: (class: "landing-hero"))[
  #html.elem("img", attrs: (
    src: "assets/bookly-full.svg",
    alt: "Bookly",
    class: "landing-hero-wordmark",
    style: "display: block; margin-inline: auto; color: currentColor;",
    "data-inline-svg": "1",
  ))
  #html.elem("h2", attrs: (style: "font-size: 1.3em; font-weight: 700;"))[
    Clean, customizable book template for Typst
  ]
  #html.elem("div", attrs: (class: "landing-cta-row", style: "color: white;"))[
    #html.elem("a", attrs: (
      class: "landing-button",
      href: "getting-started.html",
      style: "background: #c1002a",
    ))[Documentation]
  ]
]

Bookly is a Typst template for writing and publishing structured books, theses and reports. It provides a consistent look out of the box, a set of ready-to-use themes, and the helpers needed to handle front matter, parts, chapters, appendices and everything in between.

// features
#let themes-card() = [
  #calepin.elements.card(
    class: "landing-feature-card",
    style: "height: 100%; width: 100%; flex: 1;",
  )[
    = #emoji.palette Themed

    *Six built-in themes*

    Pick the look of your book from `fancy`, `classic`, `modern`, `obook`, `orly` and `pretty`. Each theme styles parts, chapters, headings, mini tables of contents and callout boxes consistently.
  ]
]

#let structure-card() = [
  #calepin.elements.card(
    class: "landing-feature-card",
    style: "height: 100%; width: 100%; flex: 1;",
  )[
    = #emoji.books Structured

    *Made for books and theses*

    Front matter, main matter and appendix environments handle page numbering and chapter numbering for you. Title pages for books and theses, back covers, parts and tables of contents are included.
  ]
]

#let tufte-card() = [
  #calepin.elements.card(
    class: "landing-feature-card",
    style: "height: 100%; width: 100%; flex: 1;",
  )[
    = #emoji.page.pencil Tufte-ready

    *Wide margins, side notes*

    Switch to a layout inspired by Edward Tufte with a single option. Side notes, side figures and full-width blocks are built on the `marginalia` package.
  ]
]

#let custom-card() = [
  #calepin.elements.card(
    class: "landing-feature-card",
    style: "height: 100%; width: 100%; flex: 1;",
  )[
    = #emoji.wrench Customizable

    *Adapt it to your needs*

    Fonts, colors, paper size, paragraph indentation and page openings can all be tuned. Go further by writing your own theme with standard Typst `show` and `set` rules.
  ]
]

#calepin.elements.columns(
  html-attrs: (style: "align-items: stretch;"),
  columns: 2,
  wrap: false,
  themes-card(),
  structure-card(),
  tufte-card(),
  custom-card()
)

= Why Bookly?

Writing a book involves much more than typesetting chapters. Bookly takes care of the recurring details, such as page numbering across the front matter, main matter and appendices, part and chapter openings on right-hand pages, mini tables of contents, numbered equations and callout boxes. You can focus on the content.

= Get started in a few lines

Import the template, initialize it with a show rule and start writing:

```typ
#import "@preview/bookly:5.3.0": *

#show: bookly.with(
  title: "My book",
  author: "Author Name",
  theme: fancy,
)

#show: front-matter
// preface, abstract, ...

#show: main-matter
#tableofcontents

= Introduction
...

#show: appendix
= Additional material
...
```

= A theme for every book

Bookly ships with six themes, from the sober `classic` to the colorful `fancy` and the O'Reilly-inspired `orly`. All themes share the same API, so you can switch from one to another without touching your content. If none of them fits, you can define your own theme and use the template states (colors, localization, numbering patterns, ...) to keep it consistent with the rest of the template.

= Everything a book needs

Bookly comes with a set of helpers for common tasks:

- book and thesis title pages, and back covers with abstracts;
- subfigures, numbered equations and boxed equations;
- information, tip, warning and proof boxes;
- short or long titles for headings and tables of contents;
- tables of contents, lists of figures and lists of tables.

= Multilingual

The template is localized in English, Chinese, French, German, Italian, Portuguese and Spanish. To add another language, provide a JSON dictionary of terms.

= Why choose Bookly?

#emoji.palette Ready-made themes: a professional look from the first page.

#emoji.books Book structure built in: front matter, parts, chapters and appendices work without extra setup.

#emoji.page.pencil Tufte layout: wide margins and side notes when your content needs them.

#emoji.wrench Easy to customize: change colors, fonts and layout options, or write your own theme.
