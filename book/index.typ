#import "style.typ": *

#show: book.with(
  title: "Programmering 1 med Java",
  subtitle: "En praktisk introduktion til programmering på 1. semester",
  author: "Jakob Kofoed Janot",
  date: datetime.today(),
)

= Forord

Denne bog er en samling af undervisningsmateriale til Java programmering for begyndere på 1. semester af datamatiker uddannelsen. Bogen kombinerer teoretiske koncepter med praktiske øvelser for at give en solid grundlæggende forståelse af programmering.

Hvert kapitel er bygget op omkring et specifikt emne og indeholder både forklarende tekst og praktiske øvelser, der hjælper med at omsætte teorien til praksis.

#include "chapters/01-java-fra-scratch.typ"
#include "chapters/02-variabler-og-expressions.typ"
#include "chapters/03-metoder.typ"
#include "chapters/04-input-og-scanner.typ"
#include "chapters/05-betingelser-og-logik.typ"
#include "chapters/06-loekker-og-rekursion.typ"
#include "chapters/07-arrays.typ"
#include "chapters/08-klasser-som-vaerktoejskasse.typ"
#include "chapters/09-objekter-og-klasser.typ"
#include "chapters/10-objektorienteret-programmering.typ"
#include "chapters/11-collections.typ"
#include "chapters/12-test.typ"