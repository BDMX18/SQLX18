-- 01
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE EMPNO IN (SELECT MGR
                                                FROM EMP
                                                WHERE JOB = 'SALESMAN')));

-- 2
SELECT EMP.*, SAL+SAL*.25 AS "HIKED SAL"
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE)
                  FROM EMP);

-- 3
SELECT *
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                GROUP BY MGR
                                HAVING COUNT(*) > 1));

-- 4
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE SAL > 2000));

-- 5
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
            FROM EMP
            WHERE DEPTNO = 20);

-- 6
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH')
AND SAL < ANY(SELECT SAL
              FROM EMP
              WHERE DEPTNO = 10);

-- 7
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE SAL IN (SELECT SAL
                                            FROM EMP
                                            WHERE SAL = (SELECT MAX(SAL)
                                                        FROM EMP
                                                        WHERE SAL < (SELECT MAX (SAL)FROM EMP)))));

-- 8
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

-- 9
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
AND MGR = (SELECT EMPNO
          FROM EMP
          WHERE ENAME = 'BLAKE')
AND SAL > (SELECT SAL
          FROM EMP
          WHERE ENAME = 'SCOTT')
AND DEPTNO = (SELECT DEPTNO
              FROM DEPT
              WHERE DNAME = 'ACCOUNTING');

-- 10
SELECT MAX(SAL)
FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL IN (SELECT MIN(SAL)
                              FROM EMP
                              WHERE SAL > 1500));

-- 11
SELECT DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              WHERE SAL > (SELECT AVG(SAL)
                          FROM EMP));