CREATE TABLE CLINIC(
CLINIC_ID NUMBER(3)PRIMARY KEY, 
CLINIC_NAME VARCHAR(15),
ADDRESS VARCHAR(25),
PHONE VARCHAR(25)
);

CREATE TABLE EMPLOYEE(
EMPLOYEE_ID NUMBER(3) PRIMARY KEY,
CLINIC_ID NUMBER(3),
ENAME VARCHAR(15),
POSITION VARCHAR(25),
PHONE VARCHAR(25),
SAL NUMBER(6),
FOREIGN KEY (CLINIC_ID) REFERENCES CLINIC(CLINIC_ID)
);

CREATE TABLE PATIENTS(
PATIENT_ID NUMBER(5) PRIMARY KEY,
PNAME VARCHAR(15),
PHONE VARCHAR(25),
ADDRESS VARCHAR(20)
);

CREATE TABLE APPOINTMENT(
APPOINTMENT_ID NUMBER(10) PRIMARY KEY,
ADATE DATE,
CLINIC_ID NUMBER(3),
PATIENT_ID NUMBER(5),
ISMISSED VARCHAR(1),
EMPLOYEE_ID NUMBER(3),
FOREIGN KEY (CLINIC_ID) REFERENCES CLINIC(CLINIC_ID),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENTS(PATIENT_ID),
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE PAYMENT(
PAYMENT_ID NUMBER(10) PRIMARY KEY,
ISPAID CHAR(1),
AMOUNT NUMBER(6),
PATIENT_ID NUMBER(5),
APPOINTMENT_ID NUMBER(10),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENTS(PATIENT_ID),
FOREIGN KEY (APPOINTMENT_ID) REFERENCES APPOINTMENT(APPOINTMENT_ID)
);

CREATE TABLE TREATMENT(
TREATMENT_ID NUMBER(5) PRIMARY KEY,
TNAME VARCHAR(20),
TCOST NUMBER(6)
);

CREATE TABLE TREATMENT_PERFORMED(
TREATMENT_ID NUMBER(5) NOT NULL,
APPOINTMENT_ID NUMBER(10)NOT NULL,
PAYMENT_ID NUMBER(10),
FOREIGN KEY (TREATMENT_ID) REFERENCES TREATMENT(TREATMENT_ID),
FOREIGN KEY (APPOINTMENT_ID) REFERENCES APPOINTMENT(APPOINTMENT_ID),
FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID),
UNIQUE(TREATMENT_ID,APPOINTMENT_ID)
);

INSERT INTO CLINIC VALUES(1,'DENTA CLINIC','ALEJA RZECZYPOSPOLITEJ 5','+48-980-354-095');
INSERT INTO CLINIC VALUES(2,'LUX CLINIC','NOWOGRODZKA 59','+48-070-813-709');
INSERT INTO CLINIC VALUES(3,'SUNSHINE CLINIC','CYNAMONOWA 47','+48-811-101-373');
INSERT INTO CLINIC VALUES(4,'MILNER MEDICAL','PORY 78','+48-911-001-001');
INSERT INTO CLINIC VALUES(5,'DEEZ CLINIC','BRYLOWSKA 12','+48-111-111-111');

INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ZIELINSKI','HEAD DOCTOR','+48-105-706-262',4500,1);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('KOWALCZYK','CHIEF ASSISTANT','+48-371-494-663',4000,1);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('NOWAK','SURGEON','+48-119-141-644',3750,1);



INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('LEWANDOWSKI','HEAD DOCTOR','+48-755-356-156',6500,2);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('MOSTYN','ASSISTANT','+48-556-744-618',2500,2);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('SHAPLIN','SURGEON','+48-189-536-221',3400,2);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('HOUSBEY','ADMINISTRATOR','+48-284-915-993',3000,2);


INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('BIELAWSKI','HEAD DOCTOR','+48-623-328-090',8900,3);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ABRAMOWICZ','FINANCIAL EXPERT','+48-138-542-440',5600,3);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ADAMCZYK','SURGEON','+48-594-357-599',4800,3);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('GRUSZYNSKI','ADMINISTRATOR','+48-919-644-298',4000,3);

INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ANTONIONI','HEAD DOCTOR','+48-469-562-169',7800,4);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('LIPIELLO','CHIEF ASSISTANT','+48-423-526-005',6500,4);



INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ANDONIIEV','HEAD DOCTOR','+48-995-449-374',8000,5);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('PRZYBOROWSKI','CHIEF ASSISTANT','+48-855-784-886',5500,5);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ORNACKI','TRAINEE','+48-318-520-497',3000,5);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('OSTROWSKI','FINANCIAL EXPERT','+48-318-520-497',4500,5);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('ADAMKOWSKI','SURGEON','+48-318-520-497',4800,5);
INSERT INTO EMPLOYEE(ENAME,POSITION,PHONE,SAL,CLINIC_ID) VALUES('SWIETLINSKI','ADMINISTRATOR','+48-379-542-213',4000,5);

INSERT INTO PATIENTS VALUES(1,'PADILLO','+48-171-886-336','PIOTROWSKA 126');
INSERT INTO PATIENTS VALUES(2,'LONDER','+48-462-239-352','OSTRZYCKA 58');
INSERT INTO PATIENTS VALUES(3,'CUMBER','+48-221-866-826','AKADEMICKA 75');
INSERT INTO PATIENTS VALUES(4,'GOTCHER','+48-438-254-341','PIASTOWSKA 8');
INSERT INTO PATIENTS VALUES(5,'RUTTEN','+48-171-886-336','PILICZNA 115');
INSERT INTO PATIENTS VALUES(6,'RUEGG','+231-671-554','MAZOWIECKA 125');
INSERT INTO PATIENTS VALUES(7,'KAYSER','+48-423-107-650','KOBIERZYCKA 145');
INSERT INTO PATIENTS VALUES(8,'GRISHIN','+48-374-596-701','KORSYKANSKA 128');
INSERT INTO PATIENTS VALUES(9,'KYTE','+48-210-658-826','GNIEWKOWSKA 50');
INSERT INTO PATIENTS VALUES(10,'KIMBLIN','+48-215-558-830','CICHA 31');

INSERT INTO APPOINTMENT VALUES(1,TO_DATE('04/29/2020','MM/DD/YYYY'),1,1,'Y',1);
INSERT INTO APPOINTMENT VALUES(2,TO_DATE('01/10/2020','MM/DD/YYYY'),1,1,'Y',1);
INSERT INTO APPOINTMENT VALUES(3,TO_DATE('03/15/2021','MM/DD/YYYY'),1,1,'Y',1);
INSERT INTO APPOINTMENT VALUES(4,TO_DATE('05/18/2021','MM/DD/YYYY'),1,1,'N',2);
INSERT INTO APPOINTMENT VALUES(5,TO_DATE('07/19/2019','MM/DD/YYYY'),1,1,'Y',2);
INSERT INTO APPOINTMENT VALUES(6,TO_DATE('06/20/2019','MM/DD/YYYY'),1,2,'Y',3);

INSERT INTO APPOINTMENT VALUES(7,TO_DATE('06/14/2020','MM/DD/YYYY'),2,2,'Y',4);
INSERT INTO APPOINTMENT VALUES(8,TO_DATE('07/28/2019','MM/DD/YYYY'),2,2,'Y',4);
INSERT INTO APPOINTMENT VALUES(9,TO_DATE('04/22/2021','MM/DD/YYYY'),2,2,'Y',4);
INSERT INTO APPOINTMENT VALUES(10,TO_DATE('06/07/2021','MM/DD/YYYY'),2,3,'N',4);
INSERT INTO APPOINTMENT VALUES(11,TO_DATE('04/10/2021','MM/DD/YYYY'),3,3,'Y',5);
INSERT INTO APPOINTMENT VALUES(12,TO_DATE('01/21/2019','MM/DD/YYYY'),2,3,'Y',5);

INSERT INTO APPOINTMENT VALUES(13,TO_DATE('04/14/2021','MM/DD/YYYY'),2,4,'N',6);
INSERT INTO APPOINTMENT VALUES(14,TO_DATE('12/06/2019','MM/DD/YYYY'),2,4,'Y',6);
INSERT INTO APPOINTMENT VALUES(15,TO_DATE('05/25/2019','MM/DD/YYYY'),3,4,'Y',7);
INSERT INTO APPOINTMENT VALUES(16,TO_DATE('06/12/2020','MM/DD/YYYY'),3,4,'Y',7);
INSERT INTO APPOINTMENT VALUES(17,TO_DATE('06/05/2019','MM/DD/YYYY'),3,4,'Y',8);
INSERT INTO APPOINTMENT VALUES(18,TO_DATE('10/25/2020','MM/DD/YYYY'),4,4,'N',8);

INSERT INTO APPOINTMENT VALUES(19,TO_DATE('06/16/2020','MM/DD/YYYY'),4,5,'Y',9);
INSERT INTO APPOINTMENT VALUES(20,TO_DATE('10/31/2020','MM/DD/YYYY'),4,5,'Y',10);
INSERT INTO APPOINTMENT VALUES(21,TO_DATE('03/11/2021','MM/DD/YYYY'),4,5,'Y',10);
INSERT INTO APPOINTMENT VALUES(22,TO_DATE('10/03/2019','MM/DD/YYYY'),5,6,'Y',10);
INSERT INTO APPOINTMENT VALUES(23,TO_DATE('05/12/2019','MM/DD/YYYY'),5,6,'N',11);
INSERT INTO APPOINTMENT VALUES(24,TO_DATE('06/21/2019','MM/DD/YYYY'),5,7,'Y',11);

INSERT INTO APPOINTMENT VALUES(25,TO_DATE('12/14/2019','MM/DD/YYYY'),5,8,'Y',16);
INSERT INTO APPOINTMENT VALUES(26,TO_DATE('09/02/2020','MM/DD/YYYY'),5,8,'Y',17);
INSERT INTO APPOINTMENT VALUES(27,TO_DATE('10/03/2020','MM/DD/YYYY'),5,8,'Y',19);
INSERT INTO APPOINTMENT VALUES(28,TO_DATE('04/04/2021','MM/DD/YYYY'),5,9,'N',19);
INSERT INTO APPOINTMENT VALUES(29,TO_DATE('05/26/2019','MM/DD/YYYY'),5,9,'Y',18);
INSERT INTO APPOINTMENT VALUES(30,TO_DATE('12/25/2020','MM/DD/YYYY'),5,10,'Y',19);


INSERT INTO PAYMENT VALUES(1,'Y',1300,1,1);
INSERT INTO PAYMENT VALUES(2,'Y',2500,1,2);
INSERT INTO PAYMENT VALUES(3,'Y',6500,1,3);
INSERT INTO PAYMENT VALUES(4,'N',450,1,4);
INSERT INTO PAYMENT VALUES(5,'Y',300,1,5);

INSERT INTO PAYMENT VALUES(6,'Y',780,1,6);
INSERT INTO PAYMENT VALUES(7,'Y',900,1,7);
INSERT INTO PAYMENT VALUES(8,'N',1300,2,8);
INSERT INTO PAYMENT VALUES(9,'N',1100,2,9);
INSERT INTO PAYMENT VALUES(10,'Y',1000,2,10);
INSERT INTO PAYMENT VALUES(11,'Y',800,2,11);
INSERT INTO PAYMENT VALUES(12,'Y',1450,3,12);
INSERT INTO PAYMENT VALUES(13,'Y',1500,3,13);
INSERT INTO PAYMENT VALUES(14,'Y',1700,3,14);
INSERT INTO PAYMENT VALUES(15,'N',1800,4,15);
INSERT INTO PAYMENT VALUES(16,'Y',1000,4,16);
INSERT INTO PAYMENT VALUES(17,'Y',5500,4,17);
INSERT INTO PAYMENT VALUES(18,'Y',6500,4,18);
INSERT INTO PAYMENT VALUES(19,'N',8000,5,19);
INSERT INTO PAYMENT VALUES(20,'Y',750,6,20);
INSERT INTO PAYMENT VALUES(21,'Y',600,6,21);
INSERT INTO PAYMENT VALUES(22,'N',700,6,22);
INSERT INTO PAYMENT VALUES(23,'Y',500,6,23);
INSERT INTO PAYMENT VALUES(24,'Y',550,7,24);
INSERT INTO PAYMENT VALUES(25,'Y',980,7,25);
INSERT INTO PAYMENT VALUES(26,'Y',1560,8,26);
INSERT INTO PAYMENT VALUES(27,'N',1800,8,27);
INSERT INTO PAYMENT VALUES(28,'Y',2000,9,28);
INSERT INTO PAYMENT VALUES(29,'Y',1900,9,29);
INSERT INTO PAYMENT VALUES(30,'Y',2200,10,30);


INSERT INTO TREATMENT VALUES(1,'FILLING',150);
INSERT INTO TREATMENT VALUES(2,'DENTAL CROWNS',500);
INSERT INTO TREATMENT VALUES(3,'BRACES',2500);
INSERT INTO TREATMENT VALUES(4,'TOOTH EXTRACTION',450);
INSERT INTO TREATMENT VALUES(5,'ORAL SURGERY',1800);
INSERT INTO TREATMENT VALUES(6,'IMPLANTS',3500);

INSERT INTO TREATMENT_PERFORMED VALUES(1,1,1);
INSERT INTO TREATMENT_PERFORMED VALUES(1,2,7);
INSERT INTO TREATMENT_PERFORMED VALUES(1,3,8);
INSERT INTO TREATMENT_PERFORMED VALUES(1,4,29);
INSERT INTO TREATMENT_PERFORMED VALUES(1,5,4);
INSERT INTO TREATMENT_PERFORMED VALUES(4,6,2);
INSERT INTO TREATMENT_PERFORMED VALUES(2,7,3);
INSERT INTO TREATMENT_PERFORMED VALUES(6,8,30);
INSERT INTO TREATMENT_PERFORMED VALUES(5,9,5);
INSERT INTO TREATMENT_PERFORMED VALUES(4,10,6);
INSERT INTO TREATMENT_PERFORMED VALUES(4,11,9);
INSERT INTO TREATMENT_PERFORMED VALUES(3,12,10);
INSERT INTO TREATMENT_PERFORMED VALUES(2,13,11);
INSERT INTO TREATMENT_PERFORMED VALUES(2,14,12);
INSERT INTO TREATMENT_PERFORMED VALUES(1,15,13);
INSERT INTO TREATMENT_PERFORMED VALUES(1,16,14);
INSERT INTO TREATMENT_PERFORMED VALUES(2,17,15);
INSERT INTO TREATMENT_PERFORMED VALUES(4,18,16);
INSERT INTO TREATMENT_PERFORMED VALUES(5,19,17);
INSERT INTO TREATMENT_PERFORMED VALUES(5,20,18);
INSERT INTO TREATMENT_PERFORMED VALUES(5,21,19);
INSERT INTO TREATMENT_PERFORMED VALUES(6,22,20);
INSERT INTO TREATMENT_PERFORMED VALUES(5,23,21);
INSERT INTO TREATMENT_PERFORMED VALUES(6,24,22);
INSERT INTO TREATMENT_PERFORMED VALUES(6,25,23);
INSERT INTO TREATMENT_PERFORMED VALUES(5,26,24);
INSERT INTO TREATMENT_PERFORMED VALUES(5,27,25);
INSERT INTO TREATMENT_PERFORMED VALUES(5,28,26);
INSERT INTO TREATMENT_PERFORMED VALUES(5,29,27);
INSERT INTO TREATMENT_PERFORMED VALUES(3,30,28);


--1 query.Selects info about workers with the latest appointments done
SELECT E.EMPLOYEE_ID,ENAME,POSITION
FROM EMPLOYEE E, APPOINTMENT A
WHERE E.EMPLOYEE_ID = A.EMPLOYEE_ID AND ADATE IN(
SELECT MAX(ADATE)
FROM APPOINTMENT
)
GROUP BY E.EMPLOYEE_ID,ENAME,POSITION;

--2 query.Shows information about KYTE's appointments
SELECT ADATE,ISMISSED,PNAME
FROM APPOINTMENT A,PATIENTS P
WHERE P.PATIENT_ID = A.PATIENT_ID AND PNAME = 'KYTE';
--3 query.Shows how many each client spent in their clinic
SELECT PNAME,SUM(AMOUNT)
FROM PAYMENT PT,PATIENTS P
WHERE P.PATIENT_ID = PT.PATIENT_ID AND ISPAID = 'Y'
GROUP BY PNAME;
--4 query. Shows treatment performed the least number of times
SELECT TNAME, COUNT(TP.TREATMENT_ID)
FROM  TREATMENT T,TREATMENT_PERFORMED TP
WHERE T.TREATMENT_ID = TP.TREATMENT_ID 
GROUP BY TNAME,TP.TREATMENT_ID
HAVING COUNT(TP.TREATMENT_ID) = (
SELECT MIN(COUNT(TREATMENT_ID))
FROM TREATMENT_PERFORMED
GROUP BY TREATMENT_ID);
--5 query.Shows all patients who didn't pay for at least 1 appointment
SELECT PNAME
FROM PATIENTS P, PAYMENT PT
WHERE P.PATIENT_ID = PT.PATIENT_ID  AND ISPAID ='N'
GROUP BY PNAME;
--6 query.Shows all employees with the smallest number appointments performed
SELECT ENAME
FROM EMPLOYEE E, APPOINTMENT A 
WHERE E.EMPLOYEE_ID = A.EMPLOYEE_ID 
HAVING COUNT(A.EMPLOYEE_ID) =(
SELECT MIN(COUNT(EMPLOYEE_ID))
FROM APPOINTMENT
GROUP BY EMPLOYEE_ID
)
GROUP BY ENAME;
--7 query.Shows the highest paid head doctor
SELECT ENAME,POSITION,SAL
FROM EMPLOYEE
WHERE POSITION = 'HEAD DOCTOR' AND SAL = (
SELECT MAX(SAL)
FROM EMPLOYEE 
WHERE POSITION = 'HEAD DOCTOR'
);
--8 query.Shows how much money was brought by every treatment
SELECT TNAME,(COUNT(TP.TREATMENT_ID) * TCOST)
FROM TREATMENT T, TREATMENT_PERFORMED TP
WHERE T.TREATMENT_ID = TP.TREATMENT_ID
GROUP BY TNAME,TP.TREATMENT_ID, TCOST;
--9 query.Shows patients who never missed an appointment
SELECT P.PATIENT_ID,PNAME
FROM PATIENTS P, APPOINTMENT A
WHERE P.PATIENT_ID = A.PATIENT_ID 
GROUP BY P.PATIENT_ID,PNAME
HAVING (P.PATIENT_ID) IN(
SELECT PATIENT_ID
FROM APPOINTMENT
WHERE ISMISSED = 'N'
GROUP BY PATIENT_ID
);
--10 query.Shows the head doctor with the biggest number of appointments
SELECT ENAME,COUNT(A.EMPLOYEE_ID)
FROM EMPLOYEE E,APPOINTMENT A
WHERE E.EMPLOYEE_ID = A.EMPLOYEE_ID AND POSITION = 'HEAD DOCTOR'
GROUP BY ENAME,A.EMPLOYEE_ID
HAVING COUNT(A.EMPLOYEE_ID) IN (
SELECT MAX(COUNT(EMPLOYEE_ID))
FROM APPOINTMENT
GROUP BY EMPLOYEE_ID
);

SET SERVEROUTPUT ON;

-------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
--TRIGGERS

--1 trigger. Doesn't let add clinic during certain time period
CREATE OR REPLACE TRIGGER T1
BEFORE INSERT 
ON CLINIC
BEGIN
IF(TO_CHAR(SYSDATE,'HH12:MI')  NOT BETWEEN '10:00' AND '22:00') THEN
RAISE_APPLICATION_ERROR(-20222,'Addition of new clinic at this time is not allowed');   
END IF;
END;
INSERT INTO CLINIC(CLINIC_ID)
VALUES(123);
--2 trigger.Shows the difference between new and old salary
CREATE OR REPLACE TRIGGER T2
AFTER UPDATE
ON EMPLOYEE
FOR EACH ROW
DECLARE DIFFERENCE EMPLOYEE.SAL%TYPE;
BEGIN
DIFFERENCE := :NEW.SAL - :OLD.SAL;
DBMS_OUTPUT.PUT_LINE('SALARY CHANGED BY '||DIFFERENCE);
END;

UPDATE EMPLOYEE     
SET SAL = 12000
WHERE EMPLOYEE_ID = 3;

SELECT EMPLOYEE_ID,SAL
FROM EMPLOYEE
WHERE EMPLOYEE_ID = 3;
--3 trigger.Patients deletion log: who,by whom and when
CREATE TABLE PATIENTS_LOG(PATIENT_ID NUMBER(5),PNAME VARCHAR(15),WHO_DELETED VARCHAR(15),WHEN_DELETED DATE);

CREATE OR REPLACE TRIGGER T3
AFTER DELETE
ON PATIENTS
FOR EACH ROW
DECLARE
USERNAME VARCHAR(15);
BEGIN
SELECT USER INTO USERNAME FROM DUAL;
INSERT INTO PATIENTS_LOG VALUES(:OLD.PATIENT_ID,:OLD.PNAME,USERNAME,SYSDATE);
END;

DELETE FROM PATIENTS
WHERE PATIENT_ID = 1;

SELECT * FROM PATIENTS;
--4 trigger.Trigger that doesn't allow to delete head doctors
CREATE OR REPLACE TRIGGER T4
BEFORE DELETE
ON EMPLOYEE
FOR EACH ROW
BEGIN
IF :OLD.POSITION = 'HEAD DOCTOR' THEN
RAISE_APPLICATION_ERROR(-20111,'HEAD DOCTORS ARE NOW ALLOWED TO BE DELETED');
END IF;
END;
DELETE FROM EMPLOYEE WHERE POSITION ='HEAD DOCTOR';
--5 trigger.Doesn't allow to make new salary less than old salary
CREATE OR REPLACE TRIGGER T5
BEFORE UPDATE OF SAL
ON EMPLOYEE
FOR EACH ROW
BEGIN
IF :NEW.SAL < :OLD.SAL THEN
RAISE_APPLICATION_ERROR(-20010,'New salary cannot be less than current salary');
END IF;
END;

UPDATE EMPLOYEE
SET SAL = 10
WHERE EMPLOYEE_ID = 1;

CREATE OR REPLACE TRIGGER DELETE_TRAINEE
BEFORE DELETE
ON EMPLOYEE
FOR EACH ROW
BEGIN
IF :OLD.POSITION = 'TRAINEE'
THEN 
RAISE_APPLICATION_ERROR(-20777,'WE CANNOT FIRE TRINEES, LET THEM WORK');
END IF;
END;
DELETE FROM EMPLOYEE 
WHERE POSITION = 'TRAINEE';
------------------------------------------------------------------------------------------------
--PROCEDURES
--Procedure which increases salary of  employees in particular clinic
--to the desired level if it is lower than one
CREATE OR REPLACE PROCEDURE UPDATE_MIN_SAL(
P_LOWERBOUND EMPLOYEE.SAL%TYPE, 
P_CLINICID EMPLOYEE.CLINIC_ID%TYPE)
IS
CURSOR CUR IS SELECT SAL, CLINIC_ID,EMPLOYEE_ID FROM EMPLOYEE  WHERE CLINIC_ID = P_CLINICID;
V_CLINICID CLINIC.CLINIC_ID%TYPE;
V_SAL EMPLOYEE.SAL%TYPE;
V_EMPLOYEE_ID EMPLOYEE.EMPLOYEE_ID%TYPE;
    BEGIN
        OPEN CUR;
            LOOP
                FETCH CUR INTO V_SAL, V_CLINICID, V_EMPLOYEE_ID;
                EXIT WHEN CUR%NOTFOUND;
                 IF V_SAL < P_LOWERBOUND THEN
                    UPDATE EMPLOYEE 
                    SET SAL = P_LOWERBOUND
                    WHERE CLINIC_ID = P_CLINICID AND EMPLOYEE_ID = V_EMPLOYEE_ID;
                    DBMS_OUTPUT.PUT_LINE('SALARY OF EMPLOYEE ' || 
                    TO_CHAR(V_EMPLOYEE_ID) ||'WAS INCREASED TO '|| TO_CHAR(P_LOWERBOUND));
                END IF;
            END LOOP;
        CLOSE CUR;
    END;

SELECT * FROM EMPLOYEE WHERE CLINIC_ID = 1;

EXECUTE UPDATE_MIN_SAL(4100,1);

--Procedure for adding new employee

CREATE OR REPLACE PROCEDURE ADD_EMPLOYEE(
P_CLINIC_ID EMPLOYEE.CLINIC_ID%TYPE,
P_ENAME EMPLOYEE.ENAME%TYPE,
P_POSITION EMPLOYEE.POSITION%TYPE,
P_PHONE EMPLOYEE.PHONE%TYPE,
P_SAL EMPLOYEE.SAL%TYPE
)
IS
V_IFCLINICEXISTS INTEGER;
V_IFPHONEEXISTS INTEGER;
V_NEWID INTEGER;
BEGIN
    --CHECK THE CLINIC
        SELECT COUNT(1) INTO V_IFCLINICEXISTS
        FROM CLINIC
        WHERE CLINIC_ID = P_CLINIC_ID;
        
            IF V_IFCLINICEXISTS = 0 THEN
            RAISE_APPLICATION_ERROR(-20100,'THE CLINIC DOES NOT EXIST');
            END IF;
    
    --CHECK IF THE PHONE IS TAKEN
        SELECT COUNT(1) INTO V_IFPHONEEXISTS
        FROM EMPLOYEE
        WHERE PHONE = P_PHONE;
        
            IF V_IFPHONEEXISTS = 1 THEN
            RAISE_APPLICATION_ERROR(-20110,'THIS PHONE IS ALREADY TAKEN');
            END IF;

        SELECT MAX(EMPLOYEE_ID) + 1 INTO V_NEWID
        FROM EMPLOYEE;
        
        
        IF P_SAL > 99999 THEN
        RAISE_APPLICATION_ERROR(-20111,'SALARY IS TOO BIG');
        END IF;

        INSERT INTO EMPLOYEE(EMPLOYEE_ID,CLINIC_ID,ENAME,POSITION,PHONE,SAL)
        VALUES(V_NEWID,P_CLINIC_ID,P_ENAME,P_POSITION,P_PHONE,P_SAL);
END;

EXECUTE ADD_EMPLOYEE(1,'DOE','BIG CHEESE','+48-888-777-666',7777);

SELECT * FROM EMPLOYEE 
WHERE CLINIC_ID = 1;

EXECUTE ADD_EMPLOYEE(1,'DOE JUNIOR','BIGGIE CHEESE','+48-171-886-336',7777);

EXECUTE ADD_EMPLOYEE(1,'DOE JUNIOR','BIGGIE CHEESE','+48-111-222-333',777777);


CREATE OR REPLACE PROCEDURE ADD_CLINIC
(
P_NEWNAME CLINIC.CLINIC_NAME%TYPE,
P_ADDRESS CLINIC.ADDRESS%TYPE,
P_PHONE CLINIC.PHONE%TYPE)
IS
V_IFCLINICEXISTS INTEGER;
V_IFPHONEEXISTS INTEGER;
V_NEWID INTEGER;
BEGIN
 --CHECK THE CLINIC
        SELECT COUNT(1) INTO V_IFCLINICEXISTS
        FROM CLINIC
        WHERE CLINIC_NAME = P_NEWNAME;
        
            IF V_IFCLINICEXISTS = 1 THEN
            RAISE_APPLICATION_ERROR(-20170,'THE CLINIC ALREADY EXISTS');
            END IF;
    
    --CHECK IF THE PHONE IS TAKEN
        SELECT COUNT(1) INTO V_IFPHONEEXISTS
        FROM CLINIC
        WHERE PHONE = P_PHONE;
        
            IF V_IFPHONEEXISTS = 1 THEN
            RAISE_APPLICATION_ERROR(-20120,'THIS PHONE IS ALREADY TAKEN');
            END IF;

        SELECT MAX(CLINIC_ID) + 1 INTO V_NEWID
        FROM CLINIC;
        
        INSERT INTO CLINIC(CLINIC_ID,CLINIC_NAME,ADDRESS,PHONE)
        VALUES(V_NEWID,P_NEWNAME,P_ADDRESS,P_PHONE);
END;

SELECT * FROM CLINIC;
--execute multiple times
EXECUTE ADD_CLINIC('DENTA ','KOSZTKOWA 77','+48-888-777-666');
-------------------------------------------------------------------------------------------------

DROP TABLE TREATMENT_PERFORMED;
DROP TABLE TREATMENT;
DROP TABLE PAYMENT;
DROP TABLE APPOINTMENT;
DROP TABLE PATIENTS;
DROP TABLE EMPLOYEE;
DROP TABLE CLINIC;
