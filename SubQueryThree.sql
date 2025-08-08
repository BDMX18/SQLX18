-- 01
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME LIKE '%S');

-- 02
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE DEPTNO = (SELECT DEPTNO
                            FROM DEPT
                            WHERE DNAME = 'ACCOUNTING'));

-- 03
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE COMM = (SELECT MAX(COMM)
                              FROM EMP));

-- 04
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME LIKE '_O%');

-- 05
SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT')
AND ENAME != 'SCOTT';

-- 06
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME IN ('ACCOUNTING', 'OPERATIONS'));

-- 07
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT SAL
            FROM EMP
            WHERE ENAME = 'MILLER');

-- 08
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB = (SELECT JOB
                            FROM EMP
                            WHERE JOB = 'SALESMAN'
                            GROUP BY JOB
                            HAVING COUNT(*) > 2));

-- 09
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR IS NULL);

-- 10
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT MGR
            FROM EMP
            WHERE ENAME = 'JONES');

-- 11
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME IN ('RESEARCH', 'ACCOUNTING'))
AND MGR IN (SELECT MGR
            FROM EMP
            GROUP BY MGR
            HAVING COUNT(*) > 1);

-- 12
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE ENAME NOT LIKE 'S%'
                AND SAL BETWEEN 1500 AND 2000);

-- 13
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL IN (SELECT MIN(SAL)
                              FROM EMP
                              WHERE SAL > 2000));

-- 14
SELECT LOC
FROM DEPT
WHERE DNAME = 'ACCOUNTING';

-- 15
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                GROUP BY DEPTNO
                HAVING COUNT(*) > 4);

-- 16
SELECT ENAME
FROM EMP
WHERE JOB != (SELECT JOB
              FROM EMP
              WHERE ENAME = 'ALLEN')
AND SAL > (SELECT SAL
          FROM EMP
          WHERE ENAME = 'MARTIN');

-- 17
(SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE ENAME = 'ADAM')));

-- 18
SELECT JOB, MGR
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'JONES');

-- 19
SELECT ENAME, HIREDATE, COMM
FROM EMP
WHERE EMPNO = (SELECT MGR
              FROM EMP
              WHERE ENAME = 'FORD');

-- 20
SELECT COUNT(*)
FROM EMP
WHERE SAL < (SELECT SAL
            FROM EMP
            WHERE EMPNO = (SELECT MGR
                          FROM EMP
                          WHERE ENAME = 'BLAKE'));

-- 21
SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'CHICAGO')
AND COMM = 0;

-- 22
SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES')
AND SAL > (SELECT AVG(SAL)
          FROM EMP
          WHERE DEPTNO = (SELECT DEPTNO
                          FROM DEPT
                          WHERE DNAME = 'SALES'));

-- 23
SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH')
AND JOB = 'MANAGER';

-- 24
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE COMM IS NOT NULL
                AND COMM > 0);

-- 25
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL = (SELECT MAX(SAL)
                            FROM EMP
                            WHERE MGR IS NULL));

-- 26
SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'BLAKE')
AND COMM IS NOT NULL
AND COMM > 0;

-- 27
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                              FROM EMP
                              WHERE EMPNO IN (SELECT MGR
                                              FROM EMP
                                              WHERE JOB = 'SALESMAN')));

-- 28
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE ENAME IN (SELECT ENAME
                                FROM EMP
                                WHERE JOB = 'CLERK'
                                AND MGR = (SELECT EMPNO
                                          FROM EMP
                                          WHERE ENAME = 'BLAKE')
                                AND SAL < (SELECT SAL
                                          FROM EMP
                                          WHERE ENAME = 'MARTIN')));

-- 29
SELECT ENAME
FROM EMP
WHERE MGR != (SELECT EMPNO
              FROM EMP
              WHERE JOB = 'PRESIDENT')
AND COMM > 0
AND SAL > (SELECT MAX(SAL)
          FROM EMP
          WHERE JOB = 'CLERK');

-- 30
