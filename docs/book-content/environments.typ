#import "/.calepin/calepin.typ" as calepin

#set document(title: [Environments])
#metadata((tags: ("book content", "environments", "front matter", "main matter", "appendix"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Environments]

Bookly provides environments to structure the content of a book. Each environment is activated with a show rule placed in the main `typ` file at the desired location, and applies until the next environment.

= Front matter

Environment for preliminary content (abstract, foreword, acknowledgments, etc.). Pages are numbered with Roman numerals and chapters are not numbered.

```typ
#show: front-matter
```

= Main matter

Environment for the main content (introduction, tables of contents, chapters, conclusion, bibliography, etc.). Pages and chapters are numbered with Arabic numerals, and page numbering restarts at 1.

```typ
#show: main-matter
```

= Appendix

Environment for the appendices. Chapters are numbered with letters (A, B, ...), and figures, tables and equations follow the same pattern (e.g., `A.1`).

```typ
#show: appendix
```

= Back matter

Environment for the closing pages of the book. Pages have neither header nor footer.

```typ
#show: back-matter
```

#calepin.elements.callout[
  Unless the `open-right` option is set to `false`, the front matter and the main matter start on a right-hand (odd) page, as expected for two-sided printing (see `config-options` in #link("../getting-started.html")[Getting started]).
]
