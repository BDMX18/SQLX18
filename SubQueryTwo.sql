-- 61
SELECT SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL)
            FROM EMP
            WHERE SAL > (SELECT MIN(SAL)
                              FROM EMP));

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
WHERE (SELECT COUNT(DISTINCT E2.SAL)
      FROM EMP E2
      WHERE E1.SAL < E2.SAL) = 4;

-- 63
SELECT E1.ENAME, E1.SAL
FROM EMP E1
WHERE 2 IN (SELECT COUNT(DISTINCT E2.SAL)
            FROM EMP E2
            WHERE  E1.SAL < E2.SAL);

SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP
                        WHERE SAL < (SELECT MAX(SAL)
                                    FROM EMP)));

-- 64
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE SAL < (SELECT MAX(SAL)
                        FROM EMP));


SELECT E1.ENAME, E1.SAL
FROM EMP E1
WHERE (SELECT COUNT(DISTINCT E2.SAL)
      FROM EMP E2
      WHERE E1.SAL < E2.SAL) = 1;

-- 65
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL = (SELECT MAX(SAL)
                            FROM EMP
                            WHERE SAL < (SELECT MAX(SAL)
                                        FROM EMP
                                        WHERE SAL < (SELECT MAX(SAL)
                                                    FROM EMP
                                                    WHERE SAL < (SELECT MAX(SAL)
                                                    FROM EMP)))));
SELECT D1.DNAME
FROM EMP E1, DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO
AND (SELECT COUNT(DISTINCT E2.SAL)
    FROM EMP E2
    WHERE E1.SAL < E2.SAL) = 3;

-- 66
SELECT *
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE)
                  FROM EMP
                  WHERE HIREDATE > (SELECT MIN(HIREDATE)
                                    FROM EMP));

SELECT *
FROM EMP E1
WHERE (SELECT COUNT(DISTINCT E2.HIREDATE)
      FROM EMP E2
      WHERE E1.HIREDATE > E2.HIREDATE) = 1;

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
      WHERE E1.HIREDATE <  E2.HIREDATE);

-- 68
SELECT LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM  EMP
                WHERE HIREDATE = (SELECT MIN(HIREDATE)
                                  FROM EMP));

SELECT D1.LOC
FROM EMP E1, DEPT D1
WHERE D1.DEPTNO = E1.DEPTNO
AND (SELECT COUNT(DISTINCT E2.HIREDATE)
    FROM EMP E2
    WHERE E1.HIREDATE > E2.HIREDATE) = 0;

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
                                                WHERE SAL > (SELECT MIN (SAL)
                                                            FROM EMP
                                                            WHERE SAL > (SELECT MIN(SAL)
                                                                        FROM EMP
                                                                        WHERE SAL > (SELECT MIN(SAL)
                                                                                    FROM EMP)))))));

SELECT *
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
                            WHERE SAL < (SELECT MAX(SAL)
                                        FROM EMP)));

SELECT DISTINCT D1.DNAME
FROM EMP E1, DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO
AND (SELECT COUNT(DISTINCT E2.SAL)
    FROM EMP E2
    WHERE E1.SAL < E2.SAL) = 1;

-- 71
SELECT ENAME
FROM EMP
WHERE EMPNO = (SELECT MGR
              FROM EMP
              WHERE ENAME = 'SMITH');
              
-- 72
SELECT ENAME
FROM EMP
WHERE EMPNO = (SELECT MGR
              FROM EMP
              WHERE EMPNO = (SELECT MGR
                            FROM EMP
                            WHERE ENAME = 'ADAMS'));

-- 73
SELECT DNAME
FROM  DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE ENAME = 'JONES'));

-- 74
SELECT SAL
FROM EMP
WHERE EMPNO = (SELECT MGR
              FROM EMP
              WHERE ENAME = 'MILLER');

-- 75
SELECT LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE EMPNO = (SELECT MGR
                                            FROM EMP
                                            WHERE ENAME = 'SMITH')));

-- 76
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'BLAKE');

-- 77
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'KING');

-- 78
SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE ENAME = 'JONES');

-- 79
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT EMPNO
            FROM EMP
            WHERE EMPNO = (SELECT MGR
                          FROM EMP
                          WHERE ENAME = 'BLAKE'));

-- 80
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT MGR
            FROM EMP
            WHERE ENAME = 'FORD');

-- 81
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                GROUP BY DEPTNO
                HAVING COUNT(*) > 4);

-- 82
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                GROUP BY DEPTNO
                HAVING COUNT(*) = 3);

-- 83
SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL
            FROM EMP
            GROUP BY SAL
            HAVING COUNT(*) > 1);

-- 84
SELECT SAL
FROM EMP
WHERE ENAME IN (SELECT ENAME
              FROM EMP
              GROUP BY ENAME
              HAVING COUNT(*) > 1);

-- 85
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT SAL, DEPTNO
              FROM EMP
              GROUP BY SAL, DEPTNO
              HAVING COUNT(*) > 1);

-- 86
SELECT *
FROM EMP
WHERE (HIREDATE, DEPTNO) IN (SELECT HIREDATE, DEPTNO
                            FROM EMP
                            GROUP BY HIREDATE, DEPTNO
                            HAVING COUNT(*) > 1);

-- 87
SELECT ENAME, SAL
FROM EMP
WHERE ENAME IN (SELECT ENAME
                FROM EMP
                GROUP BY ENAME
                HAVING COUNT(*) > 3);

-- 88
SELECT *
FROM EMP
WHERE (DEPTNO, JOB) IN (SELECT DEPTNO, JOB
                        FROM EMP
                        GROUP BY DEPTNO, JOB
                        HAVING COUNT(*) > 1); 

-- 89
SELECT *
FROM EMP
WHERE (ENAME, JOB) IN (SELECT ENAME, JOB
                      FROM EMP
                      GROUP BY ENAME, JOB
                      HAVING COUNT(*) > 1);

-- 90
SELECT *
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                GROUP BY MGR
                HAVING COUNT(*) > 2);