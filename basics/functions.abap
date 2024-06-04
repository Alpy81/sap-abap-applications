REPORT ZFUNCTION_METHOD_EXAMPLE.

CLASS lass DEFINITION.
  PUBLIC SECTION.
    METHODS:
      calculate_area IMPORTING iv_radius TYPE i RETURNING VALUE(rv_area) TYPE i,
      display_message.
ENDCLASS.

CLASS lass IMPLEMENTATION.
  METHOD calculate_area.
    rv_area = CONV i( sy-radius ) ** 2 * 3.14.
  ENDMETHOD.

  METHOD display_message.
    WRITE: / 'Berechnung des Flächeninhalts eines Kreises'.
  ENDMETHOD.
ENDCLASS.

DATA(lo_object) = NEW lass( ).

* Aufruf der Methode zur Berechnung der Fläche
DATA(lv_area) = lo_object->calculate_area( iv_radius = 5 ).

* Ausgabe der berechneten Fläche
WRITE: / 'Der Flächeninhalt des Kreises mit Radius 5 ist:', lv_area.
