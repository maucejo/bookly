#import "/.calepin/calepin.typ" as calepin

#set document(title: [Layout])
#metadata((tags: ("theming", "built-in themes", "layout"))) <website-metadata>

#html.elem("p", attrs: (style: "color: var(--calepin-color-link); font-size: 2em; font-weight: bold;"))[Layout]

The template currently supports two layouts: `standard` and `tufte`.

The `standard` layout is the default layout, with symmetric margins. It is the most common layout for books and theses. Examples of the standard layout for each theme are presented on the #link("built-in-themes.html")[Built-in themes] page.

The `tufte` layout is inspired by the works of Edward Tufte, which emphasizes simplicity and clarity, often using wide margins for notes and figures. It is particularly suitable for books or theses that require extensive annotations or side comments. To implement the `tufte` layout, the template comes with several helper functions, based on the `marginalia` package, implementing side notes, side figures, full width blocks, etc.

#calepin.elements.gallery(
  (
    ("../assets/theming/tufte-figures.png", "Tufte layout – figures", [Figures and side figures]),
    ("../assets/theming/tufte-citations.png", "Tufte layout – citations", [Citations]),
    ("../assets/theming/tufte-wide.png", "Tufte layout – full width", [Full width elements]),
  ),
  columns: 3,
  max-width: 100%,
)

#calepin.elements.callout(kind: "note")[
  Tufte layout comes with a set of helper functions, based on the `marginalia` package, implementing side notes, side figures, full width blocks, etc. See the #link("../helpers/tufte.html")[Tufte helpers] page for details.
]