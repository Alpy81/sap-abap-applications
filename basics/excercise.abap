REPORT ZDEMO_A01_FIRSTREPORT.

TYPES: BEGIN OF ty_matdata,
    matnr TYPE c LENGTH 15,
    mattext TYPE c LENGTH 30,
    matunit TYPE c LENGTH 3,
    END OF ty_matdata.

DATA lv_text TYPE string.
DATA ls_matdata TYPE ty_matdata.
DATA lt_matdata TYPE TABLE OF ty_matdata.

FIELD-SYMBOLS <fs_matdata> TYPE any.

DO 5 times
ls_matdata-matnr = sy-index.

IF ls_matdata-matnr = '1'.
    ls_matdata-mattext = 'Material 1'.
ELSEIF ls_matdata-matnr = '2'.
    ls_matdata-mattext = 'Material 2'.
ELSE 
CONCATENATE 'My testmaterial' ls_matdata-matnr into ls_mattext.
ENDIF

ls_matdata-matunit = 'ST'.
append ls_matdata to lt_matdata.
ENDDO.

LOOP at lt_matdata ASSIGNING <fs_matdata>.
    write / <fs_matdata>.
ENDLOOP.

