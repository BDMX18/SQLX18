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

-- 31
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR = (SELECT EMPNO
                            FROM EMP
                            WHERE ENAME = 'BLAKE'));

-- 32
SELECT ENAME
FROM EMP
WHERE JOB = (SELECT JOB
            FROM EMP
            WHERE ENAME = 'JONES')
AND SAL < (SELECT SAL
          FROM EMP
          WHERE ENAME = 'SCOTT')
AND ENAME != 'JONES';

-- 33
SELECT ENAME, SAL*12 AS "ANNUAL SALARY"
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE DEPTNO IN (20, 30)
                GROUP BY DEPTNO
                HAVING COUNT(*) >2);

-- 34
SELECT ENAME
FROM EMP
WHERE SAL < ANY(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN');

-- 35
SELECT SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL)
            FROM EMP
            WHERE SAL > (SELECT MIN(SAL)
                        FROM EMP
                        WHERE SAL > (SELECT MIN(SAL)
                                    FROM EMP)));

SELECT E1.SAL
FROM EMP E1
WHERE (SELECT COUNT(DISTINCT E2.SAL)
      FROM EMP E2
      WHERE E1.SAL > E2.SAL) = 2;

-- 36
SELECT ENAME
FROM EMP
WHERE SAL > ANY(SELECT SAL
                FROM EMP
                WHERE JOB = 'MANAGER');

-- 37


-- 38
SELECT *
FROM DEPT
WHERE LOC = 'NEW YORK';

-- 39
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE ENAME NOT LIKE 'A%'
                AND SAL BETWEEN 1000 AND 3000);

-- 40
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR = (SELECT EMPNO
                            FROM EMP
                            WHERE ENAME = 'BLAKE'));

-- 41
SELECT DNAME,  LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE EMPNO = (SELECT MGR
                                            FROM EMP
                                            WHERE ENAME = 'MARTIN')));

-- 42
SELECT MGR, JOB, DEPTNO
FROM EMP
WHERE COMM IS NULL OR COMM = 0
AND DEPTNO IN (SELECT DEPTNO
              FROM DEPT
              WHERE LOC IN ('DALLAS', 'CHICAGO'));

-- 43
SELECT EMP.*, SAL*12 AS "ANNUAL SALARY"
FROM EMP
WHERE COMM = (SELECT MAX(COMM)
              FROM EMP);

-- 44
SELECT ENAME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES')
AND COMM IS NOT NULL
AND COMM != 0
AND HIREDATE < (SELECT MAX(HIREDATE)
                FROM EMP);

-- 45
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE EMPNO = (SELECT MGR
                                            FROM EMP
                                            WHERE ENAME = 'WARD')));

-- 46
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL > (SELECT AVG(SAL)
                            FROM EMP
                            WHERE JOB = 'CLERK'));

-- 47
SELECT E.*, E.SAL+E.SAL*.25 AS "HIKED SAL"
FROM (SELECT E1.*, ROWNUM AS "SLNO"
                    FROM EMP E1) E
WHERE SLNO = (SELECT MAX(SLNO)
              FROM (SELECT ROWNUM AS "SLNO"
                    FROM EMP));

-- 48
SELECT DEPTNO
FROM EMP
WHERE JOB = 'MANAGER'
AND DEPTNO = (SELECT DEPTNO
              FROM DEPT
              WHERE DNAME = 'SALES');

-- 49
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE SAL = (SELECT MIN(SAL)
                            FROM EMP
                            WHERE MGR IS NOT NULL));

-- 50
SELECT HIREDATE, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

-- 51
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'PRESIDENT');

-- 52
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL IN (SELECT MAX(SAL)
                              FROM EMP
                              WHERE SAL < 3000));

-- 53
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR = (SELECT EMPNO
                            FROM EMP
                            WHERE ENAME = 'ADAMS'));

-- 54
SELECT *
FROM EMP
WHERE EMPNO = (SELECT MAX(EMPNO)
              FROM EMP);

-- 55
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
            FROM EMP
            WHERE DEPTNO = 30);

-- 56
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH')
AND SAL < ANY (SELECT SAL
              FROM EMP
              WHERE DEPTNO = 10);

-- 57
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'CLERK');

-- 58
SELECT DNAME
FROM DEPT
WHERE DNAME LIKE '%L%';

-- 59
SELECT ENAME
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'BLAKE');

-- 60
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                GROUP BY DEPTNO
                HAVING COUNT(*) BETWEEN 3 AND 5);

