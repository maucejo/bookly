#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Parts and chapters])
#metadata((tags: ("book content", "parts", "chapters", "sections"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Parts and chapters]

This page explains how to structure the content of your book with parts, chapters and sections.

= Parts

To structure the book content, you can define parts using the `#part` function. Its style is defined by the current theme.

```typ
#part("Part title")
```

#calepin.elements.callout[
  Parts are numbered according to the `part-numbering` option of `config-options` (see #link("../getting-started.html")[Getting started]). Set it to `none` to remove the numbering.
]

= Chapters

Chapters can be defined using the standard Typst markup (`= Chapter title`). Bookly also defines a `#chapter` function that avoids boilerplate code, such as the manual inclusion of standard elements like the title, the abstract and the mini table of contents.

```typ
#chapter(
  title: none,
  abstract: none,
  toc: true,
  numbered: true,
  label: none,
)[...]
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("title", [string | content])[
  Chapter title.
]

#argument-callout("abstract", [string | content], default: [none])[
  Summary displayed below the chapter title.
]

#argument-callout("toc", [bool], default: [true])[
  Indicates whether a mini table of contents should be displayed at the beginning of the chapter. If `true`, the title, the abstract and the mini table of contents are placed on a dedicated page.
]

#argument-callout("numbered", [bool], default: [true])[
  Indicates whether the chapter should be numbered.
]

#argument-callout("label", [label], default: [none])[
  Label of the chapter, used to reference it.
]

*Example*

```typ
#chapter(
  title: "First chapter",
  abstract: lorem(20),
  label: <ch:1>,
)[
  // Content of the chapter
]
```

#calepin.elements.callout(kind: "tip")[
  If you use a `.typ` file for each chapter, you can use `#chapter` as a show rule at the top of the file:

  ```typ
  #show: chapter.with(title: "First chapter", abstract: lorem(20), toc: true, label: <ch:1>)

  // Content of the chapter
  == First section
  ```
]

= Unnumbered chapters

For unnumbered chapters, you can use the `#chapter-nonum` function. This function assumes that you have a `.typ` file per chapter.

```typ
#show: chapter-nonum

// Content of the chapter
= Chapter title
```

In an unnumbered chapter, figures, tables and equations are numbered without the chapter number.

= Unnumbered sections

Bookly also provides the label `<nonum-sec>` to create unnumbered sections. To use it, add the label after the title of the section.

```typ
== Section title <nonum-sec>
```

#calepin.elements.callout(kind: "warning")[
  The `<nonum-sec>` label only works for sections, not for chapters. When applied to a chapter, it breaks the global numbering of the document. For unnumbered chapters, use the `#chapter-nonum` function instead.
]
