REPORT ZINTERNAL_TABLE_EXAMPLE.

DATA: lt_numbers TYPE TABLE OF INT,
      lv_sum TYPE INT,
      lv_avg TYPE INT.

* Fülle die interne Tabelle mit Zahlen
DO 10 TIMES.
  APPEND sy-index TO lt_numbers.
ENDDO.

* Berechne die Summe der Zahlen
lv_sum = REDUCE i( INIT result = 0 FOR wa IN lt_numbers NEXT result = result + wa ).

* Berechnung Durchschnitt der Zahlen
lv_avg = lv_sum / lines( lt_numbers ).

* Ausgabe der Ergebnisse
WRITE: / 'Zahlen in der internen Tabelle:', lt_numbers,
       / 'Summe der Zahlen:', lv_sum,
       / 'Durchschnitt der Zahlen:', lv_avg.
