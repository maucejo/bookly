#import "/.calepin/calepin.typ" as calepin
#import "../doc-utils.typ": *

#set document(title: [Title pages])
#metadata((tags: ("helpers", "title page", "book", "thesis", "cover"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Title pages]

Bookly provides two functions to create title pages, one for a book and one for a thesis. They are passed to the `title-page` argument of `#bookly.with`.

#calepin.elements.callout[
  For both title pages, the title and the author of the document are taken from the `title` and `author` arguments of `#bookly.with`. The colors follow the `primary` color of the document.
]

= Book title page

`#book-title-page` creates a cover page followed by an inner title page.

```typ
#book-title-page(
  subtitle: "Book subtitle",
  edition: "First edition",
  institution: "Institution",
  series: "Discipline",
  year: datetime.today().year(),
  cover: none,
  logo: none,
  version-usage: none,
  copyright: none,
  show-cover-author: true,
)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("subtitle", [string | content], default: ["Book subtitle"])[
  Subtitle of the book.
]

#argument-callout("edition", [string | content], default: ["First edition"])[
  Edition of the book. Set it to `none` to hide it.
]

#argument-callout("institution", [string | content], default: ["Institution"])[
  Name of the institution, displayed in the footer band of the cover.
]

#argument-callout("series", [string | content], default: ["Discipline"])[
  Name of the series, displayed in the header band of the cover.
]

#argument-callout("year", [int | string | content], default: [datetime.today().year()])[
  Year of publication, used in the default copyright notice.
]

#argument-callout("cover", [image | content], default: [none])[
  Cover image of the book.
]

#argument-callout("logo", [image], default: [none])[
  Logo displayed at the bottom of the inner title page.
]

#argument-callout("version-usage", [string | content], default: [none])[
  Description of the version usage of the book (version number, date, licensing information, ...), displayed at the bottom of the inner title page. If `none`, a default notice translated in the language of the document is used.
]

#argument-callout("copyright", [string | content], default: [none])[
  Copyright information, displayed at the bottom of the inner title page. If `none`, it is set to "© author, year".
]

#argument-callout("show-cover-author", [bool], default: [true])[
  If `true`, the author name is displayed on the cover page.
]

*Example*

```typ
#show: bookly.with(
  title: "Bookly",
  author: "Mathieu Aucejo",
  title-page: book-title-page(
    subtitle: "User's guide",
    edition: "Version 5.3.0",
    series: "Typst book series",
    institution: "Typst community",
    cover: image("images/bookly-logo.png", width: 45%),
  ),
)
```

#calepin.elements.gallery(
  (
    ("../assets/helpers/book-title-page.png", "Book cover page", [Cover page]),
    ("../assets/helpers/book-title-page-2.png", "Book inner title page", [Inner title page]),
  ),
  columns: 2,
  max-width: 100%,
)

= Thesis title page

`#thesis-title-page` creates the title page of a doctoral thesis or of a French habilitation.

```typ
#thesis-title-page(
  type: "phd",
  school: "School name",
  doctoral-school: "Name of the doctoral school",
  supervisor: ("Supervisor name",),
  cosupervisor: none,
  laboratory: "Laboratory name",
  defense-date: "01 January 1970",
  discipline: "Discipline",
  specialty: "Specialty",
  committee: (:),
  logo: none,
)
```

#html.elem("div", attrs: (style: "margin-top: 2.5em;"))[]

#argument-callout("type", [string], default: ["phd"])[
  Type of thesis. Two values are possible:
  - `"phd"` for a doctoral thesis;
  - `"habilitation"` for a French habilitation.
]

#argument-callout("school", [string | content], default: ["School name"])[
  Name of the institution where the thesis was prepared.
]

#argument-callout("doctoral-school", [string | content], default: ["Name of the doctoral school"])[
  Name of the doctoral school.
]

#argument-callout("supervisor", [array], default: [("Supervisor name",)])[
  Name(s) of the thesis supervisor(s) or of the guarantor of the habilitation.
]

#argument-callout("cosupervisor", [array | none], default: [none])[
  Name(s) of the thesis co-supervisor(s).
]

#argument-callout("laboratory", [string | content], default: ["Laboratory name"])[
  Name of the research laboratory.
]

#argument-callout("defense-date", [string | content], default: ["01 January 1970"])[
  Date of the thesis defense.
]

#argument-callout("discipline", [string | content], default: ["Discipline"])[
  Name of the discipline.
]

#argument-callout("specialty", [string | content], default: ["Specialty"])[
  Name of the specialty.
]

#argument-callout("committee", [array], default: [(:)])[
  Members of the thesis committee. Each element of the array is a dictionary with the following keys:
  - `name`: name of the committee member;
  - `position`: position of the committee member (e.g., "Associate Professor", "Professor");
  - `affiliation`: affiliation of the committee member (e.g., "University Name");
  - `role`: role of the committee member (e.g., "Chair", "Member", "Reviewer").
]

#argument-callout("logo", [image], default: [none])[
  Logo of the institution.
]

*Example*

```typ
#let committee = (
  (
    name: "Hari Seldon",
    position: "Full Professor",
    affiliation: "Streeling University",
    role: "President",
  ),
  (
    name: "Gal Dornick",
    position: "Associate Professor",
    affiliation: "Synnax University",
    role: "Reviewer",
  ),
)

#show: bookly.with(
  title: "Bookly",
  author: "Mathieu Aucejo",
  title-page: thesis-title-page(
    supervisor: ("Supervisor A", "Supervisor B"),
    cosupervisor: ("Co-supervisor A",),
    committee: committee,
  ),
)
```

#preview("../assets/helpers/thesis-title-page.png", alt: "Thesis title page", width: 50%, border: true)
