--SELECT 100+5, 10-3, 30*2, 10/3
--FROM DUAL;
--SELECT 100+5, 10-3, 30*2, 10/3 FROM DUAL;
--SELECT dbms_random.value()*100 FROM DUAL;
--SELECT ENAME FROM EMP AS EMPLOYEE;
--SELECT ENAME AS "EMPLOYEE NAME" FROM EMP EMPLOYEE;
--SELECT * FROM EMP ORDER BY SAL;
--SELECT * FROM EMP ORDER BY SAL DESC;
--SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
--SELECT ENAME, JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO = 10;
--SELECT ENAME AS "ENAME2", JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO = 20 AND JOB = 'ANALYST';
--SELECT * FROM EMP 
--WHERE SAL > 2500
--ORDER BY SAL;
--SELECT * FROM EMP
--WHERE ENAME >= 'M'
--ORDER BY ENAME;
--SELECT CHR(0), CHR(65), ASCII('a'), ASCII('A') FROM dual;
--SELECT * FROM EMP WHERE SAL =w 5000;
--SELECT * FROM EMP WHERE SAL!= 5000;
--SELECT * FROM EMP WHERE SAL<> 5000;
--SELECT * FROM EMP WHERE SAL^= 5000;
--SELECT * FROM EMP WHERE NOT SAL=5000;
--SELECT * FROM EMP
--WHERE SAL = (SELECT MAX(SAL) FROM EMP);
--SELECT * FROM EMP WHERE SAL = 5000 AND SAL = 3000;
--SELECT * FROM EMP WHERE SAL = 5000 OR SAL = 3000;
--SELECT * FROM EMP WHERE SAL IN (5000,3000);
--SELECT * FROM EMP WHERE JOB = 'ANALYST' OR JOB = 'KING' OR JOB = 'CLERK';
--SELECT * FROM EMP WHERE JOB IN ('MANAGER','KING','CLERK');
--SELECT * FROM NLS_DATABASE_PARAMETERS 
--WHERE PARAMETER = 'NLS_CHARACTERSET';
--SELECT * FROM EMP
--ORDER BY
--(CASE WHEN DEPTNO = 10 THEN 1
--ELSE 2 END), SAL DESC;
--SELECT * FROM DEPT;
--SELECT ENAME FROM EMP WHERE DEPTNO ='20';
--SELECT * FROM EMP WHERE ENAME LIKE 'M%';
--SELECT * FROM EMP WHERE COMM = NULL;
--SELECT * FROM EMP WHERE JOB = 'CLERK'
--UNION
--SELECT * FROM EMP WHERE JOB = 'SALESMAN'

--SELECT EMPNO
--FROM EMP WHERE DEPTNO = 10
--UNION
--SELECT EMPNO, SAL
--FROM EMP WHERE DEPTNO = 20

--SELECT EMPNO, ENAME, SAL, DEPTNO

--SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
--FROM EMP;

--SELECT '010-1234-5678' AS REPLACE_BEFORE
--, REPLACE ('010-1234-5678','-','') AS REPLACE_1
--, REPLACE('010-1234-5678','-') AS REPLACE_2
--FROM DUAL;

--SELECT 'Oracle', LPAD('Oracle',10, '#') AS LPAD_1
--, RPAD('Oracle',10,'#') AS RPAD_1
--, LPAD('Oracle', 10) AS LPAD_2
--, RPAD('Oracle', 10) AS RPAD_2
--FROM DUAL;

--SELECT EMPNO, ENAME, CONCAT(EMPNO, ENAME),
--CONCAT(EMPNO, CONCAT(':', ENAME))
--FROM EMP
--WHERE ENAME = 'SMITH';

--SELECT CEIL(3.14) AS CEIL, FLOOR(3.14) AS FLOOR,
--CEIL(-3.14) AS CEIL_M, FLOOR(-3.14) AS FLOOR_M
--FROM DUAL;

--SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
--FROM EMP;

--SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;
--SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 12*20) AS WORK10YEAR
--FROM EMP;

--SELECT EMPNO, ENAME, HIREDATE, SYSDATE 
--FROM EMP
--WHERE ADD_MONTHS(HIREDATE, 12*40) > SYSDATE;
--
--SELECT ENAME, HIREDATE, SYSDATE,
--MONTHS_BETWEEN(HIREDATE, SYSDATE)/12 AS YEAR1 


--SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0)
--FROM EMP;

--SELECT EMPNO, ENAME, COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM, SAL*12+COMM, SAL*12)

/* 표준 SQL */
--SELECT *
--FROM EMP JOIN DEPT
--	(USING DEPTNO)
--ORDER BY EMPNO;

SELECT LTRIM('<_Oracle_>','_<')  AS LTRIM2,
RTRIM('<_Oracle_>','>_') AS RTRIM2
FROM DUAL;

SELECT LTRIM('<_Oracle_>','<_')  AS LTRIM2,
RTRIM('<_Oracle_>','_>') AS RTRIM2
FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE, 'CC') AS FORMAT_CC, --네 자리 연도의 끝 두자리를 기준으로 사용
ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY, --해당 연,월,일의 7월 1일 기준으로 반올림
ROUND(SYSDATE, 'Q') AS FORMAT_Q, -- 각 분기의 두번째 달의 16일 기준
ROUND(SYSDATE, 'DDD') AS FORMAT_DDD, -- 해당 일의 정오를 기준
ROUND(SYSDATE, 'HH') AS FORMAT_HH -- 해당 일의 시간을 기준
FROM DUAL;

SELECT EMPNO, ENAME, EMPNO + '500' FROM EMP
WHERE ENAME = 'SCOTT';

SELECT 1300-'1500', '1300'+1500 FROM DUAL;

SELECT TO_NUMBER('1500', '9999') - 1300
FROM DUAL;

SELECT * --'ABCD' + EMPNO, EMPNO
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS current_datetime
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON,
TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY,
TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

SELECT EMPNO, ENAME,
RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS "EMP 마스킹 처리",
RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS "ENAME 마스킹 처리"
FROM EMP
WHERE LENGTH(ENAME) >=6;

SELECT TO_NUMBER('3,300','999,999') - TO_NUMBER('1,100','999,999')
FROM DUAL;

SELECT TO_DATE('2023-03-15','YYYY-MM-DD') AS TODATE1,
TO_DATE('20150101','YYYY-MM-DD') AS TODATE2
FROM DUAL;

/*
* SELECT문 : 원하는 레코드(행)만 가져오는 명령어
* FROM 테이블명 : 데이터 장소
*/
SELECT a.* 
FROM EMP a;

/*
* 오라클 함수
* data type : 문자열, 숫자, 날짜, 시퀀스(숫자)  
*/

SELECT * 
FROM V$SQLFN_METADATA v
WHERE v.name = 'NVL'

/*
* 문자열 함수
* UPPER() : 대문자 변환
* LOWER() : 소문자 변환
* LENGTH() : 문자열 길이
* 
*/
SELECT ENAME, upper(ENAME) AS TO_UPPER_NAME, lower(ENAME) AS TO_LOWER_NAME
FROM EMP;

SELECT ENAME, UPPER(ENAME) AS TO_UPPER_NAME, LOWER(ENAME) AS TO_LOWER_NAME
FROM EMP;

SELECT *
FROM EMP 
WHERE UPPER(ENAME) = UPPER(trim('   Scott'));


/*
 * TRIM : 
*/

SELECT '['||TRIM('_ _ORACLE_ _11')||']' AS TRIM_B,
'['||TRIM(LEADING FROM '    _ _ORACLE_ _22')||']' AS TRIM_LEADING,
'['||TRIM(TRAILING FROM '  _ _ORACLE   _ _33')||']' AS TRIM_TRAILING,
'['||TRIM(BOTH FROM '_ _ORACLE_ _')||']' AS TRIM_BOTH
FROM DUAL;

/*
* CONCAT
*/
SELECT EMPNO, ENAME, CONCAT(EMPNO, ENAME), CONCAT(EMPNO,'     ')
FROM EMP
WHERE ENAME = UPPER('smith');

/*
* REPLACE 문자열 교체
* 전화번호 ,이메일, 집주소 등등
*/
SELECT '010-2919-1234' AS mobile_phone,
replace('010-2919-1234', '-', '') AS mobile
from DUAL;

/*
* LPAD, RPAD 문자열을 채우기 하는 함수
*/
SELECT LPAD('ORA_1234_XE', 20) AS LPAD_20,
RPAD('ORA_1234_XE', 20) AS RPAD_20
FROM DUAL;

/*
 * NUMBER 숫자를 다루는 함수들
 * 
 * 정수(INTEGER), 부동소수(FLOAT) - 소수점이 있는 숫자
 * 부동소수의 경우, 소수점 이하 정밀도(precision)차이가 발생
 * pi ~ 3.14..... (15자리 이하 소수)
 * 
 */
SELECT ROUND(3.1428, 3) AS round0,
ROUND(123.45678, 1) AS round1,
TRUNC(123.45678) AS trunc0,
TRUNC(-123.4567) AS trunc1,
FLOOR(3.14) AS floor0
FROM DUAL;

SELECT REMAINDER(15,2) AS C1,
REMAINDER(-11,4) AS C2
FROM DUAL;

/*
 * DATE 날짜를 다루는 함수들
 * 
 * 2023-04-01 minus 1 day
 * MARCH, 01, 2023
 *  
 * 날짜를 표현하는 일련번호 숫자가 존재
 * 
 */
SELECT SYSDATE AS NOW,
SYSDATE - 1 AS YESTERDAY,
SYSDATE + 10 AS TEN_DAYS_FROM_NOW
FROM DUAL;

-- month 받기
SELECT ADD_MONTHS(sysdate, :month)
FROM dual;

SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 12*20) AS WORK10YEAR
FROM EMP;

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = 
(SELECT MAX(HIREDATE)
FROM EMP)

-- MONTH_BETWEEN(입력날짜1, 입력날짜2)
SELECT ENAME, HIREDATE, SYSDATE
, MONTHS_BETWEEN(HIREDATE, SYSDATE) / 12 AS YEAR1
, MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 AS YEAR2 -- 앞쪽에 큰 날짜. 즉 나중 날짜를 넣어야 한다.
, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)/12) AS YEAR3
FROM EMP;

SELECT SYSDATE, NEXT_DAY(SYSDATE,'월요일'), -- 국가별 설정에 따라 MONDAY인지 월요일인지 결정이 남
LAST_DAY(SYSDATE)
FROM DUAL;

SELECT ENAME, EXTRACT (YEAR FROM HIREDATE) AS Y
, EXTRACT(MONTH FROM HIREDATE) AS M
, EXTRACT(DAY FROM HIREDATE) AS D
FROM EMP;

-- 날짜에 적용하는 ROUND 함수
SELECT SYSDATE, ROUND(SYSDATE, 'CC') AS FORMAT_CC, --네 자리 연도의 끝 두자리를 기준으로 사용
ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY, --해당 연,월,일의 7월 1일 기준으로 반올림
ROUND(SYSDATE, 'Q') AS FORMAT_Q, -- 각 분기의 두번째 달의 16일 기준
ROUND(SYSDATE, 'DDD') AS FORMAT_DDD, -- 해당 일의 정오를 기준
ROUND(SYSDATE, 'HH') AS FORMAT_HH -- 해당 일의 시간을 기준
FROM DUAL;

SELECT *
FROM EMP;

SELECT DEPTNO, COUNT(*) AS 건수
FROM EMP
GROUP BY DEPTNO 
HAVING COUNT(*) >=5;

/*
 * 형 변환(Cast, up-cast, down-cast) 
 * 
 * down-cast : 큰 수를 담는 데이터형에서 작은 수를 담는 데이터 형으로 명시적 변환
 * 
 * 예시 : 1234.5678 --> 234.3 (데이터가 짤림)
 * 
*/

SELECT *
FROM EMP
WHERE DEPTNO = '20'; -- 암묵적 형 변환에 의한 VARCHAR2 -> NUMBER

/* 암묵적 형 변환을 막기 위한 명시적 형 변환 */
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS CURRENT_DATETIME
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON,
TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY,
TO_CHAR(SYSDATE , 'DAY') AS DAY
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') AS MM
, TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR
, TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN
, TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
, TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR
, TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN
, TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS -- 17:15:25
, TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM -- 05:15:25
, TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM -- 05:15:25
FROM DUAL;

SELECT TO_NUMBER('10,000','999,999') - TO_NUMBER('1,100','999,999') 
FROM DUAL;

SELECT TO_DATE('2023-03-15', 'YYYY-MM-DD') AS TODATE1,
TO_DATE('20150101', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

SELECT * FROM EMP WHERE HIREDATE > TO_DATE('1981/07/01', 'YYYY/MM/DD') ; -- 문자열끼리 비교

SELECT TO_DATE('49/12/10','YY/MM/DD') AS YY_YEAR_49
, TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49
, TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50
, TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50
, TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51
, TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
FROM DUAL;

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM
, NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, COMM, SAL, NVL2(COMM, 'O', 'X')
, NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL
, DECODE(JOB, 'MANAGER', SAL*0.2,
'SALESMAN', SAL*0.3,
'ANALYST', SAL*0.05,
SAL*0.1) AS BONUS
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL
, CASE WHEN JOB = 'MANAGER' THEN SAL*0.2
WHEN JOB = 'SALESMAN' THEN SAL*0.3
WHEN JOB = 'ANALYST' THEN SAL*0.05
ELSE SAL*0.1 END AS BONUS
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL
, CASE JOB WHEN 'MANAGER' THEN SAL*0.2
WHEN 'SALESMAN' THEN SAL*0.3
WHEN 'ANALYST' THEN SAL*0.05
ELSE SAL*0.1 END AS BONUS 
FROM EMP;

SELECT EMPNO, ENAME, COMM
, CASE WHEN COMM IS NULL THEN ''
	WHEN COMM = 0 THEN 'Zero'
	WHEN COMM > 0 THEN 'Amount: '||COMM
	END AS Summary
	FROM EMP;