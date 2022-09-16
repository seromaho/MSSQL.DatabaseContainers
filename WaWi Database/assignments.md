# SQL Training Assignments

Erstellen Sie ein SQL-Skript das die folgenden Aufgaben erfüllt:

## First Assignment
Alle Aufgaben beziehen sich auf die Tabelle `Artikel` der Datenbank `WaWi`.
Erstellen Sie `SELECT`-Statements für die folgenden Aufgaben:
1. Lassen Sie den gesamten Inhalt der Tabelle anzeigen.
2. Zeigen Sie die Spalten `ArtBezeichnung`, `ArtGruppe` und `ArtLief` an.
3. Zeigen Sie die Spalten `ArtBezeichnung`, `ArtVKPreis` und `ArtLieferzeit` an.
4. Zeigen Sie die Spalten `ArtBezeichnung`, `ArtVKPreis` und `ArtLieferzeit` an. Vergeben Sie dabei die Überschriften **Bezeichnung**, **Verkaufspreis** und **Lieferzeit**.

## Second Assignment
Alle Aufgaben beziehen sich auf die Tabelle `Artikel` der Datenbank `WaWi`.
Führen Sie die folgenden Berechnungen durch. Lassen Sie jeweils die **Artikelbezeichnung**, die **Basisspalten** und die **berechnete Spalte** anzeigen. Vergeben Sie für die berechneten Spalten sinnvolle Aliasnamen.
1. Ermitteln Sie die **Differenz** zwischen `ArtVKPreis` und `ArtEKPreis`.
2. Berechnen Sie den **Wert** der bestellten Artikel.
3. Berechnen Sie den **Umsatzsteuerbetrag** je Artikel. Basis ist der Einkaufspreis.
4. Berechnen Sie den **Verkaufspreis** eines Artikels, wenn man einen Aufschlag von **40%** annimmt.

## Third Assignment
Die folgenden Aufgaben beziehen sich auf die Tabelle `Artikel` der Datenbank `WaWi`.
Erstellen Sie `SELECT`-Statements für die folgenden Aufgaben. Wählen Sie aus, welche Spalten sinnvollerweise jeweils angezeigt werden sollten.
1. Zeigen Sie alle Artikel des Lieferanten mit der Lieferantennummer **1130** an.
2. Zeigen Sie alle Artikel an, die weniger als **12,00** kosten.
3. Zeigen Sie alle **Arbeitsmäntel** an.
4. Zeigen Sie alle Artikel an, in deren Bezeichnung ein **glas** vorkommt.
5. Zeigen Sie alle Artikel der Artikelgruppe **KG** an.
6. Zeigen Sie alle Artikel an, die bestellt sind.
7. Zeigen Sie alle Artikel an, die nicht bestellt sind.
8. Zeigen Sie alle Artikel an, deren Bezeichnung mit **a**, **c** oder **d** beginnt.
9. Zeigen Sie alle Artikel an, deren Bezeichnung mit **a**, **b**, **c**, **d** oder **e** beginnt.
10. Zeigen Sie alle **Latzhosen** an.
11. Zeigen Sie alle Artikel an, bei denen die **Differenz** zwischen Einkaufspreis und Verkaufspreis weniger als **5,00** beträgt.
12. Zeigen Sie alle Artikel an, deren Bezeichnung aus **sechs Zeichen** besteht.
13. Zeigen Sie alle Artikel an, in deren Bezeichnung das **vorletzte Zeichen** eine **Ziffer** ist.
14. Zeigen Sie alle Artikel an, in deren Bezeichnung eine **zweistellige Zahl** enthalten ist.

## Fourth Assignment
Die folgenden Aufgaben beziehen sich auf die Tabelle `Artikel` in der `WaWi`-Datenbank.
Verwenden Sie jeweils `Aggregatfunktionen` um die folgenden Aufgaben zu lösen:
1. Wie teuer ist der **billigste** und der **teuerste** Artikel *(Basis ist der Einkaufspreis)*?
2. Ermitteln Sie den **Durchschnittspreis** aller Artikel.
3. Wie hoch ist die **Anzahl** der bestellten Artikel?
4. **Wie viele** Artikel haben einen **Umsatzsteuersatz** von **19%**?
5. Wie viel kostet der **teuerste** Artikel der von den Lieferanten mit der Nummer **1001** bzw. **1130** geliefert wird?
6. Bei **wie vielen** Artikeln ist die **Lieferzeit** unbekannt?

## Fifth Assignment
Die folgenden Aufgaben beziehen sich auf die Tabelle `Artikel` in der `WaWi`-Datenbank.
Verwenden Sie jeweils `Aggregatfunktionen` und die `GROUP BY`-Klausel, um die folgenden Aufgaben zu lösen:
1. Wie teuer ist in jeder Artikelgruppe der **billigste** und der **teuerste** Artikel?
2. Ermitteln Sie den **Durchschnittspreis** der Artikel pro Kategorie.
3. Ermitteln Sie den **Durchschnittspreis** der Artikel je Lieferant.
4. Wie teuer ist der **teuerste** Artikel je Lieferant aus den Kategorien **GA** und **HW**?
5. Ermitteln Sie, **wie viele** Artikel jeder Lieferant liefert.

## Sixth Assignment
Verwenden Sie jeweils `JOIN`s um die folgenden Aufgaben zu lösen:
1. Zeigen Sie **Artikelbezeichnungen** mit deren **Lagermenge** an.
2. Zeigen Sie alle **Artikel** mit deren **Artikelgruppe** an.
3. Zeigen Sie alle **Artikelbezeichnungen** und deren **Lagernamen** an.
4. Zeigen Sie alle **Artikelsets** an.
5. In welchen **Lagern** sind **Computer** gelagert?
6. Wie groß ist die Menge jedes Artikels aus der Warengruppe **Spielwaren**?
7. Zeigen Sie nur die **Bezeichnungen** der Artikelsets und die jeweils enthaltenen **Artikel** an.
8. Welche **Lieferanten** liefern **Computer**?
9. In welchen Lagern gibt es Artikel des Lieferanten **Gardena AG**?
10. Aus wie vielen Artikelgruppen liefert der Lieferant **Gardena AG** Artikel?
11. Bei welchen **Lieferanten** müssen **Waren** nachbestellt werden *(Lagerbestand < Mindestbestand)*?
