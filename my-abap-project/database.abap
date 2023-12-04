REPORT ZSAP_EXAMPLE.

DATA: lt_data TYPE TABLE OF ZEMPLOYEE,
      ls_employee TYPE ZEMPLOYEE.

* Tabelle erstellen
CREATE TABLE ZEMPLOYEE
  ( EMPLOYEE_ID   INT PRIMARY KEY,
    FIRST_NAME    VARCHAR(50),
    LAST_NAME     VARCHAR(50),
    BIRTHDATE     DATE ).

* Daten einfügen
ls_employee-EMPLOYEE_ID = 1.
ls_employee-FIRST_NAME = 'Max'.
ls_employee-LAST_NAME = 'Mustermann'.
ls_employee-BIRTHDATE = '1990-01-01'.
APPEND ls_employee TO lt_data.

ls_employee-EMPLOYEE_ID = 2.
ls_employee-FIRST_NAME = 'Anna'.
ls_employee-LAST_NAME = 'Musterfrau'.
ls_employee-BIRTHDATE = '1995-02-15'.
APPEND ls_employee TO lt_data.

* Daten in die Tabelle einfügen
INSERT INTO ZEMPLOYEE VALUES CORRESPONDING #(lt_data).

* Daten aus der Tabelle abrufen
SELECT * FROM ZEMPLOYEE INTO TABLE lt_data.

* Daten anzeigen
LOOP AT lt_data INTO ls_employee.
  WRITE: / 'Employee ID:', ls_employee-EMPLOYEE_ID,
         / 'First Name:', ls_employee-FIRST_NAME,
         / 'Last Name:', ls_employee-LAST_NAME,
         / 'Birthdate:', ls_employee-BIRTHDATE,
         /.
ENDLOOP.
