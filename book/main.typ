#import "style.typ": *

#show: book.with(
  title: "Programmering 1 med Java",
  subtitle: "En praktisk introduktion til programmering på 1. semester på datamatiker uddannelsen",
  author: "Jakob Kofoed Janot",
  date: datetime.today(),
)

#include "chapters/01-forord.typ"
#include "chapters/02-java-fra-scratch.typ"
#include "chapters/03-variabler-og-expressions.typ"
#include "chapters/04-metoder.typ"
#include "chapters/05-input-og-scanner.typ"
#include "chapters/06-betingelser-og-logik.typ"
#include "chapters/07-loekker-og-rekursion.typ"
#include "chapters/08-arrays-og-referencer.typ"
#include "chapters/09-mere-arrays.typ"
#include "chapters/10-klasser-som-vaerktoejskasse.typ"
#include "chapters/11-brugerdefinerede-typer.typ"
#include "chapters/12-objekter-med-state.typ"
#include "chapters/13-komposition.typ"
#include "chapters/14-indkapsling.typ"
#include "chapters/15-arv.typ"
#include "chapters/16-collections.typ"
#include "chapters/17-test.typ"
