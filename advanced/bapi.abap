REPORT ZCREATE_BUSINESS_CUSTOMER.

DATA: lt_addressdata TYPE TABLE OF BAPIADDR1,
      lt_bankdata TYPE TABLE OF BAPIBANK,
      lt_contactdata TYPE TABLE OF BAPICUCFG,
      lt_return TYPE TABLE OF BAPIRET2,
      lt_extensionin TYPE TABLE OF BAPIPAREX,
      lt_extensionout TYPE TABLE OF BAPIPAREX.

DATA: lv_customer TYPE BAPIKNA1,
      lv_companycode TYPE BAPIKOMGL,
      lv_salesarea TYPE BAPISVAKM,
      lv_partnerfunctions TYPE BAPIVSAKM,
      lv_creditdata TYPE BAPIKREDIT.

* Hier kommen die notwendigen Informationen für den Geschäftskunden rein
* in den entsprechenden Tabellen lt_addressdata, lt_bankdata, lt_contactdata usw.

* Beispiel: Adresse

CLEAR lt_addressdata.
lt_addressdata-item = 1.
lt_addressdata-title = 'Mr.'.
lt_addressdata-name1 = 'John Doe'.
lt_addressdata-street = '123 Main Street'.
lt_addressdata-city = 'Anytown'.
lt_addressdata-postl_cod1 = '12345'.
APPEND lt_addressdata.

* Beispiel: Bankdaten
CLEAR lt_bankdata.
lt_bankdata-bankl = '123456789'.
lt_bankdata-bankn = '987654321'.
lt_bankdata-bkont = '001'.
APPEND lt_bankdata.

* Beispiel: Kontaktinformationen
CLEAR lt_contactdata.
lt_contactdata-item = 1.
lt_contactdata-title = 'Mr.'.
lt_contactdata-name1 = 'John Doe'.
lt_contactdata-smtp_addr = 'john.doe@example.com'.
APPEND lt_contactdata.

* Beispiel: Weitere Informationen können entsprechend den Anforderungen hinzugefügt werden.

* Aufrufen der BAPI-Funktion zur Kundenanlage
CALL FUNCTION 'BAPI_CUSTOMER_CREATEFROMDATA1'
  EXPORTING
    customerdata = lv_customer
    companycode = lv_companycode
    salesarea = lv_salesarea
    partnerfunctions = lv_partnerfunctions
    creditdata = lv_creditdata
  TABLES
    addressdata = lt_addressdata
    bankdata = lt_bankdata
    contactperson = lt_contactdata
    extensionin = lt_extensionin
    extensionout = lt_extensionout
    return = lt_return.

* Überprüfen der Rückgabetabelle lt_return auf etwaige Fehler
LOOP AT lt_return INTO DATA(ls_return).
  IF ls_return-type = 'E' OR ls_return-type = 'A'.
    WRITE: / 'Error Message:', ls_return-message,
           / 'Error ID:', ls_return-id.
  ENDIF.
ENDLOOP.
