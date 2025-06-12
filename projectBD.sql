
SELECT 
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    p.type AS "Position",
    o.otdel_name AS "Department",
    p.salary AS "Salary",
    e.hiredate_empl AS "Start date",
    l.name_language AS "Language"
FROM Employee e
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
JOIN Employee_Language el ON e.id_empl = el.id_empl
JOIN Language l ON el.id_language = l.id_language
WHERE e.surname_empl = 'Ivanova'  
ORDER BY e.surname_empl;


SELECT 
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    p.type AS "Position",
    o.otdel_name AS "Department",
    p.salary AS "Salary",
    e.hiredate_empl AS "Start date",
    l.name_language AS "Language"
FROM Employee e
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
JOIN Employee_Language el ON e.id_empl = el.id_empl
JOIN Language l ON el.id_language = l.id_language
WHERE l.name_language = 'English'   
ORDER BY e.surname_empl;

SELECT 
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    p.type AS "Position",
    o.otdel_name AS "Department",
    p.salary AS "Salary",
    e.hiredate_empl AS "Start date",
    l.name_language AS "Language"
FROM Employee e
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
JOIN Employee_Language el ON e.id_empl = el.id_empl
JOIN Language l ON el.id_language = l.id_language
WHERE p.salary= 2700  
ORDER BY e.surname_empl;

SELECT 
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    p.type AS "Position",
    o.otdel_name AS "Department",
    p.salary AS "Salary",
    e.hiredate_empl AS "Start date",
    l.name_language AS "Language"
FROM Employee e
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
JOIN Employee_Language el ON e.id_empl = el.id_empl
JOIN Language l ON el.id_language = l.id_language
WHERE o.otdel_name= 'HR'  
ORDER BY e.surname_empl;


--po naznachavane
SELECT * FROM (
    SELECT 
        e.name_empl AS "Ime",
        e.surname_empl AS "Familia",
        e.hiredate_empl AS "Data_postupvane",
        p.type AS "Dlujnost",
        o.otdel_name AS "Otdel"
    FROM Employee e
    JOIN Position p ON e.Position_id_position = p.id_position
    JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
    ORDER BY e.hiredate_empl DESC   
)
WHERE ROWNUM <= 3;                    


SELECT
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    p.type AS "Position",
    o.otdel_name AS "Department"
FROM Employee e
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
WHERE p.type = 'HR Manager'   
ORDER BY p.type, o.otdel_name;


SELECT
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    e.hiredate_empl AS "Start date"
FROM Employee e
WHERE e.hiredate_empl BETWEEN TO_DATE('01-JAN-2015', 'DD-MON-YYYY') AND TO_DATE('01-JAN-2025', 'DD-MON-YYYY')
ORDER BY e.hiredate_empl;

INSERT INTO Calendar (calendar_id, month, year, max_days)
VALUES (3, TO_DATE('01-MAR-2024', 'DD-MON-YYYY'), TO_DATE('01-MAR-2024', 'DD-MON-YYYY'), 31);

INSERT INTO Calendar (calendar_id, month, year, max_days)
VALUES (4, TO_DATE('01-APR-2024', 'DD-MON-YYYY'), TO_DATE('01-APR-2024', 'DD-MON-YYYY'), 30);

SELECT
    e.name_empl AS "Name",
    e.surname_empl AS "Surname",
    o.otdel_name AS "Department",
    p.type AS "Position",
    c.month AS "Month",
    r.type AS "Reason",                          
    par.number_of_days AS "Days for this reason"
FROM Present_Absent pa
JOIN Employee e ON pa.employee_id_empl = e.id_empl
JOIN Calendar c ON pa.calendar_calendar_id = c.calendar_id
JOIN Position p ON e.Position_id_position = p.id_position
JOIN Otdel o ON e.Otdel_id_otdel = o.id_otdel
JOIN Present_Absent_Reason par ON pa.id_absence = par.present_absent_id_absence
JOIN ReasonOFF r ON par.reasonoff_reason_id = r.reason_id            
WHERE o.otdel_name = 'IT'
ORDER BY c.month, o.otdel_name, p.type;

--CREATE SEQUENCE emp_seq
--START WITH 4 
--INCREMENT BY 1
--NOCACHE
--NOCYCLE;

--CREATE OR REPLACE TRIGGER trg_employee_id
--BEFORE INSERT ON Employee
--FOR EACH ROW
--BEGIN
--  :NEW.id_empl := emp_seq.NEXTVAL;
--END;
--/


--CREATE SEQUENCE otdel_seq
--START WITH 4    
--INCREMENT BY 1

--CREATE OR REPLACE TRIGGER trg_otdel_id
--BEFORE INSERT ON Otdel
--FOR EACH ROW
--BEGIN
  --:NEW.id_otdel := otdel_seq.NEXTVAL;
--END;
--/


INSERT INTO Otdel (otdel_name)
VALUES ('Customer Support');

CREATE OR REPLACE PROCEDURE findBySurname(v_surname VARCHAR2)
AS
  CURSOR c_emp IS
    SELECT e.name_empl, e.surname_empl, p.type, o.otdel_name, e.hiredate_empl
    FROM Employee e
    JOIN Position p ON e.position_id_position = p.id_position
    JOIN Otdel o ON e.otdel_id_otdel = o.id_otdel
    WHERE e.surname_empl = v_surname;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Employee surname ' || v_surname);

  FOR record IN c_emp LOOP
    DBMS_OUTPUT.PUT_LINE(record.name_empl || ' ' || record.surname_empl || ' - ' ||
                         record.type || ' @ ' || record.otdel_name || ', ' || record.hiredate_empl);
  END LOOP;
END;
/
EXEC findBySurname('Ivanova');

CREATE OR REPLACE PROCEDURE last3Hired
AS
  CURSOR c_emp IS
    SELECT name_empl, surname_empl, hiredate_empl
    FROM (
      SELECT * FROM Employee ORDER BY hiredate_empl DESC
    )
    WHERE ROWNUM <= 3;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Last 3 assigned:');

  FOR record IN c_emp LOOP
    DBMS_OUTPUT.PUT_LINE(record.name_empl || ' ' || record.surname_empl || ' - ' || record.hiredate_empl);
  END LOOP;
END;
/
EXEC last3Hired;

CREATE OR REPLACE PROCEDURE findByPosition(v_position VARCHAR2)
AS
  CURSOR c_emp IS
    SELECT e.name_empl, e.surname_empl, p.type, o.otdel_name
    FROM Employee e
    JOIN Position p ON e.position_id_position = p.id_position
    JOIN Otdel o ON e.otdel_id_otdel = o.id_otdel
    WHERE p.type LIKE '%' || v_position || '%';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Employees with this position: ' || v_position);

  FOR record IN c_emp LOOP
    DBMS_OUTPUT.PUT_LINE(record.name_empl || ' ' || record.surname_empl || ' - ' ||
                         record.type || ', ' || record.otdel_name);
  END LOOP;
END;
/

EXEC findByPosition('Manager');

CREATE OR REPLACE PROCEDURE findByPeriod(v_from DATE, v_to DATE)
AS
  CURSOR c_emp IS
    SELECT name_empl, surname_empl, hiredate_empl
    FROM Employee
    WHERE hiredate_empl BETWEEN v_from AND v_to;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Employees assigned in this period: ' || v_from || ' ? ' || v_to);

  FOR record IN c_emp LOOP
    DBMS_OUTPUT.PUT_LINE(record.name_empl || ' ' || record.surname_empl || ' - ' || record.hiredate_empl);
  END LOOP;
END;
/
EXEC findByPeriod(TO_DATE('01-JAN-2015', 'DD-MON-YYYY'), TO_DATE('01-JAN-2025', 'DD-MON-YYYY'));

CREATE OR REPLACE PROCEDURE absencesByDepartment(v_department VARCHAR2)
AS
  CURSOR c_abs IS
    SELECT e.name_empl, e.surname_empl, o.otdel_name, p.type,
           c.month, r.type AS reason, par.number_of_days
    FROM Present_Absent pa
    JOIN Employee e ON pa.employee_id_empl = e.id_empl
    JOIN Calendar c ON pa.calendar_calendar_id = c.calendar_id
    JOIN Position p ON e.position_id_position = p.id_position
    JOIN Otdel o ON e.otdel_id_otdel = o.id_otdel
    JOIN Present_Absent_Reason par ON pa.id_absence = par.present_absent_id_absence
    JOIN ReasonOFF r ON par.reasonoff_reason_id = r.reason_id
    WHERE o.otdel_name = v_department;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Absences of a depratment: ' || v_department);

  FOR record IN c_abs LOOP
    DBMS_OUTPUT.PUT_LINE(record.name_empl || ' ' || record.surname_empl ||
                         ' - ' || record.type || ' (' || record.reason || '): ' || record.number_of_days || ' ???');
  END LOOP;
END;
/
EXEC absencesByDepartment('IT');


--triger

-- BEFORE Trigger: ????????? ???? ?????? ???? ??? ?? ?????? ??????? ?? ?????? ?????????
-- ?? ????????? ?????????? ?? ???????? DAYSABSENT ? ??????? Present_Absent

CREATE OR REPLACE TRIGGER trg_check_reason_days_total
BEFORE INSERT OR UPDATE ON Present_Absent_Reason
FOR EACH ROW
DECLARE
  v_total_except_current NUMBER := 0;
  v_allowed_days NUMBER := 0;
BEGIN
  -- ???????? ?????? ??????? ?? ?????? ?????????, ??? ??????? ????? (??? ? UPDATE)
  SELECT NVL(SUM(number_of_days), 0)
  INTO v_total_except_current
  FROM Present_Absent_Reason
  WHERE present_absent_id_absence = :NEW.present_absent_id_absence
    AND (:NEW.reasonoff_reason_id IS NULL OR ROWID != :NEW.ROWID);

  -- ??????? ????? ??? ????????? ?? ?????????
  SELECT daysabsent
  INTO v_allowed_days
  FROM Present_Absent
  WHERE id_absence = :NEW.present_absent_id_absence;

  -- ?????????? ?????? ???????? + ?????? ??? ??? ??????????
  IF (v_total_except_current + :NEW.number_of_days) > v_allowed_days THEN
    RAISE_APPLICATION_ERROR(-20031, 'Total days for this absence ID exceed the allowed value!');
  END IF;
END;
/



-- AFTER Trigger: ??????? ????????? ? ?????????? ??? ? ??????? ??? ??????? ????????

CREATE OR REPLACE TRIGGER trg_log_absence_reason
AFTER INSERT ON Present_Absent_Reason
FOR EACH ROW
DECLARE
  v_reason_type VARCHAR2(50);
BEGIN
  -- Get the reason type from ReasonOFF
  SELECT type
  INTO v_reason_type
  FROM ReasonOFF
  WHERE reason_id = :NEW.reasonoff_reason_id;

  -- Output log message
  DBMS_OUTPUT.PUT_LINE('Inserted absence reason: "' || v_reason_type ||
                       '" for absence ID: ' || :NEW.present_absent_id_absence ||
                       ' | Days: ' || :NEW.number_of_days);
END;
/



--INSERT INTO PRESENT_ABSENT_REASON (REASONOFF_REASON_ID, PRESENT_ABSENT_ID_ABSENCE, NUMBER_OF_DAYS)
--VALUES (2, 5, 2);


--INSERT INTO PRESENT_ABSENT_REASON (REASONOFF_REASON_ID, PRESENT_ABSENT_ID_ABSENCE, NUMBER_OF_DAYS)
--VALUES (1, 2, 2);

--INSERT INTO present_absent_reason (reasonoff_reason_id, present_absent_id_absence, number_of_days)
--VALUES (3, 4, 0);











