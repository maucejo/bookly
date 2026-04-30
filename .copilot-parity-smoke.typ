#import "src/bookly.typ": *

#show: bookly.with(
  title: "Parity smoke",
  author: "Copilot",
  theme: obook,
  tufte: true,
  title-page: book-title-page(),
  config-options: (
    open-right: true,
  ),
)

#context[#metadata((tag: "before-front", physical: here().page(), display: counter(page).display())) <before-front>]

#show: front-matter

#context[#metadata((tag: "front-start", physical: here().page(), display: counter(page).display())) <front-start>]

= Front

#context[#metadata((tag: "front-after-heading", physical: here().page(), display: counter(page).display())) <front-after-heading>]

#lorem(20)

#show: main-matter

#context[#metadata((tag: "main-start", physical: here().page(), display: counter(page).display())) <main-start>]

= Main

#context[#metadata((tag: "main-after-heading", physical: here().page(), display: counter(page).display())) <main-after-heading>]

#lorem(20)