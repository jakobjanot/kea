// Book styling for Java programming course

#let book(
  title: none,
  subtitle: none,
  author: none,
  date: none,
  body,
) = {
  // Set document properties
  set document(title: title, author: author)

  // Set page properties
  set page(
    paper: "a4",
    margin: (left: 2.5cm, right: 2cm, top: 2cm, bottom: 2cm),
    numbering: "1",
    number-align: center,
  )

  // Set text properties
  set text(
    font: ("Libertinus Serif", "New Computer Modern", "Times New Roman"),
    size: 11pt,
    lang: "da",
  )

  // Set paragraph properties
  set par(
    justify: true,
    leading: 0.65em,
  )

  // Configure headings
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    pagebreak()
    v(2cm)
    text(size: 24pt, weight: "bold")[#it]
    v(1cm)
  }

  show heading.where(level: 2): it => {
    v(1.5em)
    text(size: 18pt, weight: "bold")[#it]
    v(0.8em)
  }

  show heading.where(level: 3): it => {
    v(1.2em)
    text(size: 14pt, weight: "bold")[#it]
    v(0.6em)
  }

  // Configure code blocks
  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: rgb("#f8f8f8"),
      stroke: rgb("#e0e0e0"),
      radius: 4pt,
      inset: 12pt,
    )[
      #set text(font: ("JetBrains Mono", "Courier New"), size: 10pt)
      #it
    ]
  }

  // Configure inline code
  show raw.where(block: false): it => {
    box(
      fill: rgb("#f0f0f0"),
      stroke: rgb("#d0d0d0"),
      radius: 2pt,
      inset: (x: 4pt, y: 2pt),
    )[
      #set text(font: ("JetBrains Mono", "Courier New"), size: 10pt)
      #it
    ]
  }

  // Configure lists
  set list(marker: [•])
  set enum(numbering: "1.")

  // Title page
  page(numbering: none)[
    #align(center)[
      #v(4cm)
      #text(size: 32pt, weight: "bold")[#title]
      #v(1cm)
      #if subtitle != none [
        #text(size: 18pt)[#subtitle]
        #v(2cm)
      ]
      #text(size: 16pt)[#author]
      #v(1cm)
      #if date != none [
        #text(size: 14pt)[#date.display("[day].[month].[year]")]
      ]
      #v(1fr)
    ]
  ]

  // Table of contents
  page(numbering: none)[
    #outline(depth: 2, indent: 1em)
  ]

  // Reset page numbering for main content
  counter(page).update(1)

  // Main content
  body
}

// Helper function for exercises
#let exercise(title: none, body) = {
  block(
    width: 100%,
    fill: rgb("#e8f4fd"),
    stroke: rgb("#1f77b4"),
    radius: 6pt,
    inset: 12pt,
  )[
    #if title != none [
      #text(weight: "bold", size: 12pt)[Øvelse: #title]
      #v(0.5em)
    ]
    #body
  ]
}

// Helper function for notes
#let note(body) = {
  block(
    width: 100%,
    fill: rgb("#fff3cd"),
    stroke: rgb("#ffc107"),
    radius: 6pt,
    inset: 12pt,
  )[
    #text(weight: "bold")[Note: ]
    #body
  ]
}
