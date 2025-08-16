-- 61
SELECT ENAME
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                WHERE ENAME = 'SMITH');

-- 62
SELECT ENAME
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE ENAME = 'ADAMS'));

-- 63
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE ENAME ='JONES'));

-- 64
SELECT SAL
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                WHERE ENAME = 'MILLER');

-- 65
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO IN (SELECT MGR
                                FROM EMP
                                WHERE EMPNO IN (SELECT MGR
                                                FROM EMP
                                                WHERE ENAME = 'SMITH')));

-- 66
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'BLAKE');

-- 67
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'KING');

-- 68
SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'JONES');

-- 69
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT MGR
            FROM EMP
            WHERE ENAME = 'BLAKE')
AND ENAME != 'BLAKE';

-- 70
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT MGR
            FROM EMP
            WHERE ENAME = 'FORD')
AND ENAME != 'FORD';

-- 61
SELECT SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP));

SELECT E1.SAL
FROM EMP E1
WHERE 1 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE E1.SAL < E2.SAL);

-- 62
SELECT SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP
                        WHERE SAL < (SELECT MAX(SAL)
                                    FROM EMP
                                    WHERE SAL < (SELECT MAX(SAL)
                                                FROM EMP
                                                WHERE SAL < (SELECT MAX(SAL)
                                                FROM EMP)))));

SELECT E1.SAL
FROM EMP E1
WHERE 4 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE E1.SAL <  E2.SAL);

-- 63
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP
                        WHERE SAL < (SELECT MAX(SAL)
                                    FROM EMP)));

SELECT E1.ENAME, E1.SAL
FROM EMP E1
WHERE 2 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE E1.SAL  <  E2.SAL);

-- 64
SELECT EMPNO
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP));

SELECT E1.EMPNO, E1.SAL
FROM EMP E1
WHERE 1 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE E1.SAL < E2.SAL);

-- 65
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL IN (SELECT MAX(SAL)
                              FROM EMP
                              WHERE SAL < (SELECT MAX(SAL)
                                          FROM EMP
                                          WHERE SAL < (SELECT MAX(SAL)
                                                      FROM EMP
                                                      WHERE SAL < (SELECT MAX(SAL)
                                                      FROM EMP)))));

-- 66
SELECT *
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE)
                  FROM EMP
                  WHERE HIREDATE > (SELECT MIN(HIREDATE)
                                    FROM EMP));

SELECT E1.*
FROM EMP E1
WHERE 1 IN (SELECT COUNT(DISTINCT E2.HIREDATE)
            FROM EMP E2
            WHERE E1.HIREDATE > E2.HIREDATE);

-- 67
SELECT ENAME
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE)
                  FROM EMP
                  WHERE HIREDATE < (SELECT MAX(HIREDATE)
                                    FROM EMP));

SELECT E1.ENAME
FROM EMP E1
WHERE 1 IN (SELECT COUNT(DISTINCT E2.HIREDATE)
            FROM EMP E2
            WHERE E1.HIREDATE < E2.HIREDATE);

-- 68
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE HIREDATE = (SELECT MIN(HIREDATE)
                                  FROM EMP));

-- 69
SELECT *
FROM EMP
WHERE SAL = (SELECT MIN(SAL)
            FROM EMP
            WHERE SAL > (SELECT MIN(SAL)
                        FROM EMP
                        WHERE SAL > (SELECT MIN(SAL)
                                    FROM EMP
                                    WHERE SAL > (SELECT MIN(SAL)
                                                FROM EMP
                                                WHERE SAL > (SELECT MIN(SAL)
                                                            FROM EMP
                                                            WHERE SAL > (SELECT MIN(SAL)
                                                                        FROM EMP
                                                                        WHERE SAL > (SELECT MIN(SAL)
                                                                                    FROM EMP)))))));

SELECT E1.*
FROM EMP E1
WHERE 6 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE E1.SAL > E2.SAL);

-- 70
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL = (SELECT MAX(SAL)
                            FROM EMP
                            WHERE SAL > (SELECT MAX(SAL)
                                        FROM EMP)));