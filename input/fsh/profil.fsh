/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// =====================================================================
// Schritt 5: Euer Profil
//
// Die Kopfzeilen sind schon ausgefüllt. Für jede Anforderung aus dem
// Aufgabenblatt steht unten eine auskommentierte Zeile mit dem Element.
// Entfernt die // und ersetzt TODO_Regel durch die Regel, die ihr
// gewählt habt. Eine Anforderung kann auch mehrere Zeilen brauchen.
//
// Wichtig: Hier stehen Regeln für alle Allergien, z. B. "criticality MS".
// Einen Wert setzt ihr im Profil nur, wenn er für jede Allergie immer
// gilt (Wert fixieren). Werte, die nur für eine bestimmte Patientin
// gelten, z. B. criticality #high, gehören ins Beispiel (beispiele.fsh).
//
// Regeltypen:
//   Kardinalität   * element 1..1
//   Must Support   * element MS
//   Binding        * element from $ValueSet (required)
//   Typ            * element[x] only dateTime
//                  * element only Reference(CHCorePractitioner)
//   Wert           * element = #code
//
// Nach jeder Änderung lokal prüfen:  sushi build .
// =====================================================================

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: nur Allergien gegen Arzneimittel
// Gilt für jede Allergie dieses Profils, darum wird der Wert fixiert.
* category 1..1 MS
* category = #medication

// Anforderung 2: klinischer Status
// "muss immer angegeben sein" -> Pflichtfeld
* clinicalStatus 1..1 MS

// Anforderung 3: Codes aus der Schweizer Allergieliste ($ch-allergy-vs)
// extensible: Code aus der Liste verwenden, wenn ein passender existiert,
// sonst darf ein anderer Code oder Freitext erfasst werden.
// CH Core hat hier preferred, extensible ist strenger und damit erlaubt.
* code 1..1 MS
* code from $ch-allergy-vs (extensible)

// Anforderung 4: Kritikalität (wie gefährlich die Allergie ist)
// Für die Notfallstation zwingend; ist sie unbekannt, gibt es #unable-to-assess.
* criticality 1..1 MS

// Anforderung 5: Beginn der Allergie
// Datum (dateTime) oder ungefähres Alter (Age), kein Zeitraum oder Freitext.
* onset[x] only dateTime or Age
* onset[x] MS

// Anforderung 6: wer die Allergie erfasst hat
// Nur Ärztin oder Arzt (allein oder in ihrer Rolle in der Praxis),
// nicht Patientin oder Angehörige wie in CH Core erlaubt.
* recorder 1..1 MS
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)

// Anforderung 7: Reaktionen (die Symptome einer Reaktion stehen in reaction.manifestation)
// Optional ("wenn sie bekannt sind"), aber Systeme müssen sie verarbeiten können.
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Invariante (steht in invarianten.fsh)
* obeys dg-allergy-1
