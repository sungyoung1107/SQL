--Rem Copyright (c) 1990 by Oracle Corporation
--Rem NAME
--REM    UTLSAMPL.SQL
--Rem  FUNCTION
--Rem  NOTES
--Rem  MODIFIED
--Rem	gdudey	   06/28/95 -  Modified for desktop seed database
--Rem	glumpkin   10/21/92 -  Renamed from SQLBLD.SQL
--Rem	blinden   07/27/92 -  Added primary and foreign keys to EMP and DEPT
--Rem	rlim	   04/29/91 -	      change char to varchar2
--Rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
--Rem	pritto	   04/04/91 -	      change SYSDATE to 13-JUL-87
--REM MENDELS 12/07/90 - BUG 30123;
--REM ADD TO_DATE CALLS SO LANGUAGE INDEPENDENT
--
--Rem
--Rem $Header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli Generic<base> $ sqlbld.sql
--Rem
--SET TERMOUT OFF
--SET ECHO OFF
--
--Rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
--Rem OATES:     Created: 16-Feb-83

/*
 * SCOTT 계정 생성 및 암호 TIGER 지정
 */


-- 이 부분은 sqlplus에서 실행할 것 --

grant resource, connect, dba to test; -- test에 권한 부여
--alter user test identified by test account unlock;  -- test 사용자 계정 잠김 해제

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO test; -- cmd
ALTER USER test DEFAULT TABLESPACE USERS; -- USERS 테이블스페이스 공간 할당 -- User altered.
ALTER USER test TEMPORARY TABLESPACE TEMP; -- TEMP 테이블스페이스 공간 할당 -- User altered.
GRANT unlimited TABLESPACE TO test; -- TABLESPACE 공간 무제한 부여(GRANT) -- Grant succeeded. 

alter user test account unlock; -- 새로운 사용자 계정 잠김 해제 -- cmd
-- alter user test identified by test account unlock; 이 문구랑 동일

------------------------------

CONNECT test/111111; -- CONNECT test/test..

------------------------------

SELECT * FROM EMP;


DROP TABLE DEPT;


CREATE TABLE DEPT (
	DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

INSERT INTO DEPT VALUES (
	10,
	'ACCOUNTING',
	'NEW YORK'
);

INSERT INTO DEPT VALUES (
	20,
	'RESEARCH',
	'DALLAS'
);

INSERT INTO DEPT VALUES (
	30,
	'SALES',
	'CHICAGO'
);

INSERT INTO DEPT VALUES (
	40,
	'OPERATIONS',
	'BOSTON'
);




DROP TABLE EMP;

CREATE TABLE EMP (
	EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7, 2),
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

INSERT INTO EMP VALUES (
	7369,
	'SMITH',
	'CLERK',
	7902,
	TO_DATE('17-12-1980', 'dd-mm-yyyy'),
	800,
	NULL,
	20
);

INSERT INTO EMP VALUES (
	7499,
	'ALLEN',
	'SALESMAN',
	7698,
	TO_DATE('20-2-1981', 'dd-mm-yyyy'),
	1600,
	300,
	30
);

INSERT INTO EMP VALUES (
	7521,
	'WARD',
	'SALESMAN',
	7698,
	TO_DATE('22-2-1981', 'dd-mm-yyyy'),
	1250,
	500,
	30
);

INSERT INTO EMP VALUES (
	7566,
	'JONES',
	'MANAGER',
	7839,
	TO_DATE('2-4-1981', 'dd-mm-yyyy'),
	2975,
	NULL,
	20
);

INSERT INTO EMP VALUES (
	7654,
	'MARTIN',
	'SALESMAN',
	7698,
	TO_DATE('28-9-1981', 'dd-mm-yyyy'),
	1250,
	1400,
	30
);

INSERT INTO EMP VALUES (
	7698,
	'BLAKE',
	'MANAGER',
	7839,
	TO_DATE('1-5-1981', 'dd-mm-yyyy'),
	2850,
	NULL,
	30
);

INSERT INTO EMP VALUES (
	7782,
	'CLARK',
	'MANAGER',
	7839,
	TO_DATE('9-6-1981', 'dd-mm-yyyy'),
	2450,
	NULL,
	10
);

INSERT INTO EMP VALUES (
	7788,
	'SCOTT',
	'ANALYST',
	7566,
	TO_DATE('13-7-1987', 'dd-mm-yyyy')-85,
	3000,
	NULL,
	20
);

INSERT INTO EMP VALUES (
	7839,
	'KING',
	'PRESIDENT',
	NULL,
	TO_DATE('17-11-1981', 'dd-mm-yyyy'),
	5000,
	NULL,
	10
);

INSERT INTO EMP VALUES (
	7844,
	'TURNER',
	'SALESMAN',
	7698,
	TO_DATE('8-9-1981', 'dd-mm-yyyy'),
	1500,
	0,
	30
);

INSERT INTO EMP VALUES (
	7876,
	'ADAMS',
	'CLERK',
	7788,
	TO_DATE('13-7-1987', 'dd-mm-yyyy')-51,
	1100,
	NULL,
	20
);

INSERT INTO EMP VALUES (
	7900,
	'JAMES',
	'CLERK',
	7698,
	TO_DATE('3-12-1981', 'dd-mm-yyyy'),
	950,
	NULL,
	30
);

INSERT INTO EMP VALUES (
	7902,
	'FORD',
	'ANALYST',
	7566,
	TO_DATE('3-12-1981', 'dd-mm-yyyy'),
	3000,
	NULL,
	20
);

INSERT INTO EMP VALUES (
	7934,
	'MILLER',
	'CLERK',
	7782,
	TO_DATE('23-1-1982', 'dd-mm-yyyy'),
	1300,
	NULL,
	10
);




DROP TABLE BONUS;

CREATE TABLE BONUS (
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	SAL NUMBER,
	COMM NUMBER
);



DROP TABLE SALGRADE;

CREATE TABLE SALGRADE (
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
);

INSERT INTO SALGRADE VALUES (
	1,
	700,
	1200
);

INSERT INTO SALGRADE VALUES (
	2,
	1201,
	1400
);

INSERT INTO SALGRADE VALUES (
	3,
	1401,
	2000
);

INSERT INTO SALGRADE VALUES (
	4,
	2001,
	3000
);

INSERT INTO SALGRADE VALUES (
	5,
	3001,
	9999
);

COMMIT;

SET TERMOUT ON

SET ECHO ON







