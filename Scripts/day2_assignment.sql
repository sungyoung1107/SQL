/* 이론 과제 */
-- Q2-1
--(1) : 테이블
--(2) : 외래키(FK)
--(3) : NULL

-- Q2-2
--(1) : 문자셋(CharacterSet)
--(2) : 문자셋(CharSet)

-- Q2-3
--(1) : VARCHAR2
--(2) : CHAR

-- Q2-4
--(1) : 제약조건
--(2) : 기본키(PRIMARY KEY)
--(3) : 외래키(FOREIGN KEY)

 -- Q2-5
--(1) : 무결성(INTEGRITY)
--(2) : 무결성
--(3) : 무결성

 -- Q2-6
--(1) : UNIQUE
--(2) : NOT NULL
--(3) : INDEX

/* 실습 과제 */
/* 출력순서는 문제에 없으면 이미지와 달라도 됨 */

/*
 * EMP 테이블을 사용하여 다음과 같이 출력하는 SQL문을 작성하세요
 */ 

/* 1 EMP 테이블에서 부서번호, 평균 급여, 최고 급여, 최저 급여, 사원수를 출력
 * 단, 평균 급여 출력시 소수점을 제외하고 각 부서번호별로 출력 (그룹화)
 */
SELECT e.DEPTNO
, TRUNC(AVG(e.SAL),0) AS AVG_SAL
, MAX(e.SAL) AS MAX_SAL
, MIN(e.SAL) AS MIN_SAL
, COUNT(e.EMPNO) AS CNT
FROM EMP e
GROUP BY e.DEPTNO;

/* 2 같은 직책에 있는 사원이 3명 이상인 경우 직책과 인원수를 출력(JOB으로 그룹화) */
SELECT e.JOB, COUNT(*)
FROM EMP e
GROUP BY e.JOB
HAVING COUNT(*)>=3;

/* 3 사원들의 입사년도를 기준으로 부서별로 몇 명이 입사했는지 출력 */
SELECT SUBSTR(TO_CHAR(e.HIREDATE, 'YYYY/MM/DD'),1,4) AS HIRE_YEAR
, e.DEPTNO
, COUNT(*) AS CNT
FROM EMP e
GROUP BY SUBSTR(TO_CHAR(e.HIREDATE, 'YYYY/MM/DD'),1,4), e.DEPTNO ;

/* 4 추가 수당(COMM)을 받는 사원수와 받지 않는 사원수를 출력 */
SELECT NVL2(e.COMM, 'Y', 'N') AS EXIST_COMM, COUNT(*) AS CNT
FROM EMP e
GROUP BY NVL2(e.COMM, 'Y', 'N');

/* 5 각 부서의 입사 연도별 사원수, 최고급여, 급여합, 평균 급여를 출력하고
 * 각 부서별 소계와 총계를 함께 출력(ROLLUP 함수로 그룹화)  */
SELECT e.DEPTNO, SUBSTR(TO_CHAR(e.HIREDATE, 'YYYY/MM/DD'),1,4) AS HIRE_YEAR
, COUNT(*) AS CNT
, MAX(e.SAL) AS MAX_SAL
, SUM(e.SAL) AS SUM_SAL
, AVG(e.SAL) AS AVG_SAL
FROM EMP e
GROUP BY ROLLUP(e.DEPTNO, SUBSTR(TO_CHAR(e.HIREDATE, 'YYYY/MM/DD'),1,4));

/*
 * EMP와 DEPT 테이블을 사용하여 다음과 같이 출력하는 SQL문을 작성하세요
 */

/* 1 Inner-join 방식으로 급여(SAL)이 2000 초과인 사원들의 부서 정보, 사원 정보를 출력 */
-- (1) 오라클 SQL
SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.SAL
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO
AND e.SAL > 2000
ORDER BY d.DEPTNO ;
-- (2) 표준 SQL
SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.SAL
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.SAL > 2000
ORDER BY d.DEPTNO ;

/* 2 Natural-join 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력 */
SELECT DEPTNO, DNAME
, TRUNC(AVG(SAL),0) AS AVG_SAL
, MAX(SAL) AS MAX_SAL
, MIN(SAL) AS MIN_SAL
, COUNT(EMPNO) AS CNT
FROM EMP NATURAL JOIN DEPT
GROUP BY DEPTNO, DNAME;

/* 3 모든 부서 정보와 사원 정보를 부서정보를 기준으로 조인(right-join) */
-- (1) 오라클 SQL 
SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.JOB, e.SAL  
FROM EMP e, DEPT d
WHERE e.DEPTNO(+) = d.DEPTNO 
ORDER BY e.DEPTNO;
-- (2) 표준 SQL
SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.JOB, e.SAL  
FROM EMP e RIGHT OUTER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO;

/* 4 부서정보, 사원정보, 급여 등급 정보를 JOIN하여 각 사원의 직속 상관의 정보를 부서번호, 사원번호 순으로 정렬하여 출력
 * (right-join)
 */
-- (1) 오라클 SQL
SELECT d.DEPTNO
, d.DNAME 
, e1.EMPNO
, e1.ENAME
, e1.MGR
, e1.SAL
, e1.DEPTNO
, s.LOSAL
, s.HISAL 
, s.GRADE
, e2.EMPNO AS MGR_EMPNO
, e2.ENAME AS MGR_ENAME
FROM EMP e1, DEPT d, SALGRADE s, EMP e2
WHERE e1.DEPTNO(+) = d.DEPTNO -- RIGHT 조인
AND e1.SAL BETWEEN s.LOSAL(+) AND s.HISAL(+) -- LEFT 조인
AND e1.MGR = e2.EMPNO(+) -- LEFT 조인
ORDER BY d.DEPTNO, e1.EMPNO ;
-- (2) 표준 SQL
SELECT d.DEPTNO
, d.DNAME 
, e1.EMPNO
, e1.ENAME
, e1.MGR
, e1.SAL
, e1.DEPTNO
, s.LOSAL
, s.HISAL 
, s.GRADE
, e2.EMPNO AS MGR_EMPNO
, e2.ENAME AS MGR_ENAME
FROM EMP e1 RIGHT OUTER JOIN DEPT d -- RIGHT 조인
ON e1.DEPTNO = d.DEPTNO
LEFT OUTER JOIN SALGRADE s ON e1.SAL BETWEEN s.LOSAL AND s.HISAL -- LEFT 조인
LEFT OUTER JOIN EMP e2 ON e1.MGR = e2.EMPNO -- LEFT 조인
ORDER BY d.DEPTNO, e1.EMPNO ;

/* 
 * EMP와 DEPT 테이블을 사용하여 다음과 같이 출력하는 SQL문을 작성하세요
 */

/* 1 'ALLEN'과 같은 직책(JOB)인 직원들의 사원명, 사원정보, 부서정보를 출력 */
SELECT e.JOB, e.EMPNO, e.ENAME ,e.SAL, d.DEPTNO, d.DNAME 
FROM EMP e, DEPT d 
WHERE e.DEPTNO = d.DEPTNO AND 
e.JOB = (SELECT JOB FROM EMP WHERE ENAME='ALLEN')
ORDER BY e.SAL DESC, e.EMPNO DESC;

/* 2 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원 정보, 부서 정보, 급여 출력 */
SELECT e.EMPNO, e.ENAME, d.DNAME, e.HIREDATE, d.LOC, e.SAL, s.GRADE 
FROM EMP e, DEPT d, SALGRADE s  
WHERE e.DEPTNO = d.DEPTNO AND 
e.SAL BETWEEN s.LOSAL AND s.HISAL AND 
e.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY e.SAL DESC, e.EMPNO ASC;

/* 3 부서코드 10인 부서에 근무하는 사원 중 부서코드 30번 부서에 존재하니 않는 직책을 가진 사원들의 정보를 출력 */
SELECT e.EMPNO, e.ENAME, e.JOB, d.DEPTNO, d.DNAME, d.LOC 
FROM EMP e, DEPT d  
WHERE e.DEPTNO = d.DEPTNO AND
d.DEPTNO = 10 AND 
e.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);

/* 4 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 정보를 출력
 * 다중행 함수를 사용한 경우 MAX()사용 
 */
SELECT e.EMPNO, e.ENAME, e.SAL, s.GRADE 
FROM EMP e, SALGRADE s 
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL AND 
e.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY EMPNO;

/* 5 위의 4번을 다중행 함수를 사용하지 않고 ALL 키워드를 사용하여 결과를 출력 */
SELECT e.EMPNO, e.ENAME, e.SAL, s.GRADE 
FROM EMP e, SALGRADE s 
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL AND 
e.SAL > ALL(SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY EMPNO;
