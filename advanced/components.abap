REPORT ZMACHINE_PARTS_MANAGEMENT.

CLASS MaterialManager DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_material,
             material_id TYPE string,
             description TYPE string,
             manufacturer TYPE string,
             quantity TYPE i,
           END OF ty_material.

    DATA materials TYPE TABLE OF ty_material.

    METHODS: constructor,
             create_material IMPORTING description TYPE string
                             manufacturer TYPE string
                             quantity TYPE i
                             RETURNING VALUE(material_id) TYPE string,
             display_materials,
             update_quantity IMPORTING material_id TYPE string
                             quantity TYPE i,
             delete_material IMPORTING material_id TYPE string.

ENDCLASS.

CLASS MaterialManager IMPLEMENTATION.
  METHOD constructor.
    " Initialisierung, falls benötigt
  ENDMETHOD.

  METHOD create_material.
    " Logik zur Erstellung einer Materialnummer
    DATA(new_material) = VALUE ty_material(
                            material_id = |MAT_{ sy-index ALPHA = OUT}|  " Beispiel für Materialnummer-Generierung
                            description = description
                            manufacturer = manufacturer
                            quantity = quantity
                          ).
    APPEND new_material TO materials.
    material_id = new_material-material_id.
  ENDMETHOD.

  METHOD display_materials.
    LOOP AT materials INTO DATA(material).
      WRITE: / 'Material ID:', material-material_id,
             / 'Description:', material-description,
             / 'Manufacturer:', material-manufacturer,
             / 'Quantity:', material-quantity,
             /.
    ENDLOOP.
  ENDMETHOD.

  METHOD update_quantity.
    " Logik zur Aktualisierung der Menge eines Materials
    LOOP AT materials INTO DATA(material) WHERE material_id = material_id.
      material-quantity = quantity.
      EXIT.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete_material.
    " Logik zum Löschen eines Materials
    DELETE materials WHERE material_id = material_id.
  ENDMETHOD.

ENDCLASS.

DATA(material_manager) = NEW MaterialManager( ).

START-OF-SELECTION.

" Beispielanwendung des Materialmanagers
DATA(material_id1) = material_manager->create_material(
                       description = 'Bolzen',
                       manufacturer = 'ABC Inc.',
                       quantity = 100 ).

DATA(material_id2) = material_manager->create_material(
                       description = 'Schraube',
                       manufacturer = 'XYZ Corp.',
                       quantity = 200 ).

material_manager->display_materials( ).

material_manager->update_quantity( material_id = material_id1
                                  quantity = 150 ).

material_manager->display_materials( ).

material_manager->delete_material( material_id = material_id2 ).

material_manager->display_materials( ).
