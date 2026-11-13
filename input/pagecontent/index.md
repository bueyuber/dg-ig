### Use Case

Eine Hausarztpraxis erfasst die Arzneimittelallergien ihrer Patientinnen und Patienten strukturiert und codiert. Eine Notfallstation liest diese Daten später, zum Beispiel bevor sie ein Medikament verabreicht. Sie muss sich darauf verlassen können, dass jede Allergie den Auslöser, den klinischen Status und die Kritikalität enthält und von einer Ärztin oder einem Arzt erfasst wurde.

### Scope

Dieses IG definiert ein Profil für Allergien gegen Arzneimittel auf Basis von CH Core AllergyIntolerance. Der Auslöser wird mit der Schweizer Allergieliste codiert, der Beginn als Datum oder ungefähres Alter. Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren.

Nicht abgedeckt sind Allergien gegen Nahrungsmittel, Umweltstoffe oder biologische Stoffe, Intoleranzen ohne Arzneimittelbezug sowie der Austausch als Dokument (z. B. im EPD).

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil auf CH Core AllergyIntolerance mit den Regeln für Arzneimittelallergien (Kategorie, Status, Code, Kritikalität, Beginn, Erfasser, Reaktion) und der Invariante dg-allergy-1.
* [Penicillinallergie von Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html): Beispiel einer bestätigten, hochkritischen Allergie gegen Benzylpenicillin mit Urtikaria als Reaktion, erfasst von Dr. med. Sara Keller in der Praxis am Park.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf.

### Autorin

Berfin Büyükgöz

<p style="font-size:smaller">Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>
