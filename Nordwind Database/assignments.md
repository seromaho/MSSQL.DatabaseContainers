# SQL Training Assignments

Erstellen Sie ein SQL-Skript das die folgenden Aufgaben erfüllt:

## First Assignment
1. Diese Aufgabe bezieht sich auf die Tabelle `Kategorien`.
2. Fügen Sie mit `INSERT INTO` zwei weitere Kategorien an. Lassen Sie die beiden letzten Felder leer.
3. Fügen Sie mit `INSERT INTO` eine weitere Kategorie an. Diesmal soll auch die Spalte `Beschreibung` leer bleiben.

## Second Assignment
1. Legen Sie mit `SELECT INTO` eine Kopie der `Kunden`-Tabelle (`KundenDACH`) an, die aber nur die deutschen Kunden enthält.
2. Fügen Sie mit `INSERT INTO` die Kunden aus Österreich und aus der Schweiz an die neue Tabelle an.
3. Erstellen Sie eine Tabelle auf Basis der `Artikel`-Tabelle. Die neue Tabelle soll alle Artikel enthalten, deren `Einzelpreis` unter `15,00` beträgt. Die Tabelle soll alle Felder der `Artikel`-Tabelle haben. Nennen Sie die neue Tabelle `Billigartikel`.

   Fügen Sie alle Artikel, deren `Einzelpreis` zwischen `15,00` und `21,00` liegt, an die `Billigartikel`-Tabelle an.

## Third Assignment
1. Legen Sie eine Kopie der `Artikel`-Tabelle (`ArtikelKopie`) an.
2. Fügen Sie der Tabelle `ArtikelKopie` eine Spalte `Verkaufspreis` vom Typ `decimal(6,2)` hinzu.
3. Füllen Sie die neue Spalte mit Werten, so dass der `Verkaufspreis` **40%** über dem `Einzelpreis` liegt.
4. Erhöhen Sie die `Einzelpreise` der Artikel des Lieferanten mit der Nummer **12** um **15%**.
5. Erhöhen Sie die `Einzelpreise` der Artikel der Lieferanten mit der Nummer **17** und **19** um **20%**.
6. Aktualisieren Sie für die geänderten `Einzelpreise` die Werte in der Spalte `Verkaufspreis`.
7. Löschen Sie die Artikel aus den Kategorien **2** und **4**.
8. Löschen Sie die `Auslaufartikel`, die nicht mehr im Lager sind.
9. Löschen Sie alle Artikel, deren `Einzelpreis` zwischen `8,00` und `15,00` beträgt.

## Fourth Assignment
1. Legen Sie eine Kopie der `Artikel`-Tabelle (`ArtikelMerge`) an, welche die Artikel enthält deren `Artikel-Nr` kleiner als **10** ist. Ermöglichen Sie das Einfügen von Werten in die `Artikel-Nr`-Spalte. Erhöhen Sie in der `Artikel`-Tabelle die `Einzelpreise` der Artikel, deren `Artikel-Nr` kleiner als **10** ist, um **20%**.
2. Fügen Sie in die Tabelle `ArtikelMerge` einen weiteren Artikel ein. Fügen Sie auch der `Artikel`-Tabelle einen neuen Datensatz hinzu.
3. Fügen Sie anschließend die Tabellen `Artikel` und `ArtikelMerge` zusammen. Die Preise sollen auf dem alten Stand sein, der neue Artikel in der `Artikel`-Tabelle soll in `ArtikelMerge` vorhanden sein, und der zusätzliche Artikel in `ArtikelMerge` soll gelöscht werden.

# Fifth Assignment
1. Wiederholen Sie einige Schritte aus **Assignment 2** und **Assignment 3** und verwenden Sie `OUTPUT`. Welche virtuellen Tabellen können Sie in den unterschiedlichen Befehlen verwenden?
2. Löschen Sie den Inhalt der Tabelle `ArtikelMerge`. Löschen Sie die Tabelle `ArtikelMerge`.
3. Löschen Sie den Inhalt der Tabelle `ArtikelKopie` so, dass auch die Identitätswerte zurückgesetzt werden.
4. Löschen Sie die Tabelle `ArtikelKopie`.
