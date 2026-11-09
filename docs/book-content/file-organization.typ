#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": file-tree

#set document(title: [File organization])
#metadata((tags: ("book content", "file organization", "main file"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[File organization]

When writing a long document, such as a book or a thesis manuscript, it is preferable to adopt a multi-file organization to avoid having one very long main file. This is especially important during proofreading and correction, as well as when several people write together.

= Project structure

A typical structure for a Bookly project is:

#file-tree(```
main.typ
 appendices/
  app1.typ
 bibliography/
  biblio.bib
 chapters/
  chapter1.typ
 images/
  logo.png
 preamble/
  summary.typ
```)

= Main file

Based on this structure, the `main.typ` file could look like this:

```typ
// main.typ
#import "@preview/bookly:5.3.0": *

#show: bookly.with(...)

#show: front-matter

#include "preamble/summary.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[User guide]

#include "chapters/chapter1.typ"

#bibliography("bibliography/biblio.bib")

#show: appendix

#part[Appendices]
#include "appendices/app1.typ"

#back-cover(...)
```

The main file presents the general structure of the document. It contains:

- the front matter (`#front-matter`), main matter (`#main-matter`) and appendix (`#appendix`) environments (see #link("environments.html")[Environments]);
- a table of contents (`#tableofcontents`), a list of figures (`#listoffigures`) and a list of tables (`#listoftables`) (see #link("tables-of-contents.html")[Tables of contents]);
- parts (`#part`) (see #link("parts-chapters.html")[Parts and chapters]);
- chapters and appendices imported from other files using Typst's `#include` command;
- a bibliography inserted with Typst's `#bibliography` command;
- a back cover (`#back-cover`) containing the summary and abstract of the document.

#calepin.elements.callout(kind: "tip")[
  Each included chapter file starts with its own heading or with `#show: chapter.with(...)`, so that it can be moved or reordered in `main.typ` without any change to its content.
]
