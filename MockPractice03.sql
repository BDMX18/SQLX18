-- 1
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE EMPNO IN (SELECT MGR
                                                FROM EMP
                                                WHERE JOB = 'SALESMAN')));

SELECT DISTINCT D3.DNAME, D3.LOC
FROM EMP E1, EMP E2, EMP E3, DEPT D3
WHERE E1.MGR = E2.EMPNO
AND E2.MGR = E3.EMPNO
AND E3.DEPTNO = D3.DEPTNO
AND E1.JOB = 'SALESMAN';

-- 2

SELECT ENAME, SAL+SAL*.25
FROM (SELECT EMP.*, ROWNUM AS "SLNO"
      FROM EMP)
WHERE SLNO = (SELECT COUNT(*)
              FROM EMP);

SELECT EMP.*, SAL+SAL*.25
FROM EMP
WHERE EMPNO = (SELECT MAX(EMPNO)
                  FROM EMP);

-- 3
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                  FROM EMP
                  GROUP BY DEPTNO
                  HAVING COUNT(*) IN (SELECT MAX(CNT)
                                    FROM (SELECT COUNT(*) AS CNT
                                          FROM EMP
                                          GROUP BY DEPTNO)));

-- 4
SELECT DNAME, LOC, DEPTNO
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR IN (SELECT MGR
                              FROM EMP
                              GROUP BY MGR
                              HAVING COUNT(*) > 1));

-- 5
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB IN (SELECT JOB
                              FROM EMP
                              WHERE JOB = 'MANAGER'
                              GROUP BY JOB
                              HAVING COUNT(*) >= 1));

-- 6
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR IN (SELECT EMPNO
                              FROM EMP
                              WHERE SAL > 2000));

-- 7
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
            FROM EMP
            WHERE DEPTNO = 20);

-- 8
SELECT ENAME
FROM EMP
WHERE COMM != 0
AND COMM > (SELECT MAX(SAL)
            FROM EMP
            WHERE JOB = 'SALESMAN')
AND MGR != (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'KING');

-- 9
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                GROUP BY DEPTNO
                HAVING COUNT(*) > 2 AND COUNT(*) < 6);

-- 10
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH')
AND SAL < ANY(SELECT SAL
              FROM EMP
              WHERE DEPTNO = 10);

-- 11
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                              FROM EMP
                              WHERE SAL = (SELECT MAX(SAL)
                                          FROM EMP
                                          WHERE SAL < (SELECT MAX(SAL)
                                                      FROM EMP))));

-- 12
SELECT ENAME
FROM EMP
WHERE MGR IN (SELECT MGR
             FROM EMP
             GROUP BY MGR
             HAVING COUNT(*) > 1)
AND SAL > (SELECT SAL
          FROM EMP
          WHERE HIREDATE = (SELECT MIN(HIREDATE)
                           FROM EMP));

-- 13
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER')
AND MGR = (SELECT EMPNO
          FROM EMP
          WHERE ENAME = 'KING');

-- 14
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE LOC IN ('CHICAGO', 'NEW YORK'))
AND SAL > (SELECT SAL
          FROM EMP
          WHERE ENAME = 'SCOTT');

-- 15
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
AND MGR = (SELECT EMPNO
          FROM EMP
          WHERE ENAME = 'BLAKE')
AND SAL > (SELECT SAL
          FROM EMP
          WHERE ENAME = 'SCOTT')
AND DEPTNO IN (SELECT DEPTNO
              FROM DEPT
              WHERE DNAME = 'ACCOUNTING');

-- 16
SELECT ENAME
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
FROM EMP
WHERE SAL IN (SELECT MIN(SAL)
FROM EMP
WHERE SAL > 1500)));

-- 17
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 GROUP BY DEPTNO
                 HAVING SUM(SAL) < (SELECT MAX(TOTAL)
                                    FROM
                                          (SELECT SUM(SAL) AS "TOTAL"
                                          FROM EMP
                                          GROUP BY DEPTNO)));

