# SQL Training Assignments

Erstellen Sie eine Skriptdatei, welche die folgenden Fragen beantwortet:

## First Assignment
1. Wie viele Tiere gibt es?
2. Wie viele Tiere gibt es von jeder Tierart?
3. Wie heißen die männlichen Tiere?
4. Wie heißen die Tiere, deren Namen mit **l**, **m**, **n**, **o**, **p**, **q**, **r** oder **s** beginnen?
5. Wie heißen die Tiere, die in den 80er Jahren geboren wurden?
   Es soll außerdem das Geburtsdatum angezeigt werden.
   Es sollen zuerst die jüngsten Tiere angezeigt werden.
6. Wie heißen die Löwen und die Elefanten?
7. Erstellen Sie eine `View`, die alle Tiere der Tierart **5** anzeigt.
   Es sollen alle Spalten der Tabelle in der `View` enthalten sein.
   Außerdem sollen in diese `View` nur Tiere dieser Tierart eingetragen werden können.
   Sorgen Sie außerdem dafür, dass die Definition der `View` nicht angesehen werden kann.
   Die Tabellen, die der `View` zugrunde liegen, dürfen nicht geändert werden.

## Second Assignment
1. Welche Pfleger füttern ihre Tiere mit Keksen?
   Es sollen keine doppelten Datensätze angezeigt werden.
2. Erstellen Sie eine Abfrage, die für jedes Tier den Namen des Tieres, den Futternamen und die Futtermenge anzeigt.
3. Ermitteln Sie, die Gesamt-Futtermenge für jedes Tier.
4. Ermitteln Sie die Pfleger, deren Gehalt unter dem Durchschnittsgehalt liegt.

## Third Assignment
1. Erstellen Sie einen `Trigger` der verhindert dass ein Tier mit einem Pfleger hinzugefügt wird, der mehr als vier Tiere versorgt.

## Fourth Assignment
1. In welchem Lager ist das Futter für die Löwen?
2. Welches Futter gibt der „reichste“ Pfleger seinen Tieren?
3. Wie teuer war das Futter, das ins Raubtierhaus geliefert wurde?
4. Welcher Lieferant hat am meisten Futter ins Nachthaus geliefert?

## Fifth Assignment
Der Tabelle `Pfleger` soll eine neue Spalte mit eindeutigen Werten hinzugefügt werden.
Der Inhalt dieser Spalte soll nach der folgenden Regel automatisch erstellt werden.
Die Erstellung dieses Wertes soll über eine `Funktion` erfolgen:
- Erster Buchstabe des Namens
- Erster Buchstabe des Ortes
- Erste Ziffer der Telefonnummer hinter der Vorwahl
- Falls nötig eine laufende Nummer

## Sixth Assignment
1. Sorgen Sie dafür, dass sich der Bestand eines Futters erhöht, sobald eine neue Lieferung eintrifft.
2. Erstellen Sie eine Abfrage, die auflistet, welcher Lieferant, welches Futter zu welchem Preis liefert.
   Das Ergebnis dieser Abfrage soll als `XML-Dokument` nach Lieferant gruppiert erfolgen.
3. Erstellen Sie eine Abfrage, die feststellt, welche Tiere welches Futter erhalten.
   Die Abfrage soll auch Tiere enthalten, die eventuell nicht im Speiseplan auftauchen.
4. Erstellen Sie eine Abfrage, die jeden Datensatz der Tabelle `Pfleger` mit jedem Datensatz der Tabelle `Tier` verknüpft.
   Wie viele Zeilen hat das Ergebnis?

## Seventh Assignment
Der Zoo befürchtet, dass unbefugte Datenänderungen an den Tabellen `Tier`, `Tierart`, `Futter` und `Speiseplan` durchgeführt werden.
Deswegen soll zukünftig **jeder** geänderte oder gelöschte Datensatz in einer dieser Tabellen gesichert werden.
Erstellen Sie eine neue Tabelle `Protokoll`.
In dieser Tabelle sollen die gelöschten oder überschriebenen Datensätze möglichst platzsparend gespeichert werden.
Zusätzlich sollen der **Zeitpunkt** der Änderung und der **Benutzer**, der die Änderungen durchgeführt hat, gespeichert werden.

Die `Protokoll`-Tabelle muss natürlich auch vor Manipulationen geschützt werden.
Das könnten Sie mit einem `Trigger` umsetzen.

## Eighth Assignment
Der Zoo möchte zukünftig sicherstellen, dass die Tiere sich ausgewogen und abwechslungsreich ernähren.
Es soll wöchentlich für jedes Tier **automatisch** ein Futterplan erstellt werden.
Für den Futterplan gelten die folgenden Bedingungen:
- Ein Tier darf nur Futter erhalten, das für die Tierart **geeignet** ist.
   Dazu kann der bisherige Speiseplan ausgewertet und, falls nötig, in einer neuen Tabelle festgehalten werden.
- Ein Tier soll jede geeignete Futterart **wöchentlich** erhalten.
   Die Reihenfolge soll aber variieren.
Der Futterplan für jedes Tier soll in **Tabelle(n)** gespeichert werden.
Es soll die **Kalenderwoche** und das **Kalenderjahr** erkennbar sein.
