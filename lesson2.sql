--SELECT *
--FROM emp 
--ORDER BY deptno, job, ename desc

--SELECT 
--FROM emp
--WHERE job ILIKE 'Clerk'
--ORDER BY sal;


--SELECT ename,sal,deptno
--FROM emp
--WHERE sal >= 800 AND sal <= 1500
--ORDER BY sal;



--SELECT DISTINCT job as "Job title" , lower(job) "Job title in lower case"  --shows unique values in columns
--FROM emp e
--ORDER BY job;


--SELECT DISTINCT comm 
--FROM emp e
--WHERE comm iS NOT NULL
--ORDER BY comm NULLS FIRST;


SELECT supervisor
FROM emp
ORDER BY supervisor NULLS FIRST;


SELECT *
FROM emp
WHERE deptno = 10 OR job ilike  'Clerk';



SELECT *
FROM emp
WHERE deptno IN (10,20,30) ; -- the same like OR 


SELECT *
FROM emp
WHERE hiredate < '2010-01-01'
ORDER BY job desc, ename;


SELECT *
FROM emp
WHERE hiredate BETWEEN '2010-01-01' AND '2010-05-25'
;



SELECT ename,hiredate, TO_CHAR (hiredate,'Day') "Day of week hired"
FROM emp
WHERE hiredate BETWEEN '2010-01-01' AND '2010-05-25'
;


SELECT ename, hiredate,
TO_CHAR (hiredate,'Month') "Month name",
EXTRACT (year FROM hiredate) "Month"
FROM emp
WHERE EXTRACT (month FROM hiredate) = 12;


SELECT ename,hiredate, hiredate + interval '10 years' AS "Hiredate in 10 years" ,
TO_CHAR (hiredate + interval '10 years','Day') "Day of the week  in 10 years"
FROM emp ;


SELECT * , 
EXTRACT (year FROM hiredate) "Year hired"
FROM emp 
WHERE EXTRACT (year FROM hiredate) IN (2006, 2010 )
ORDER BY hiredate;



SELECT * , 
EXTRACT (year FROM hiredate) "Year hired",
EXTRACT (year FROM AGE (now(),hiredate)) "Years worked"
FROM emp 
WHERE EXTRACT (year FROM hiredate) IN (2006, 2010 )
ORDER BY hiredate;


SELECT * 
FROM emp
WHERE ename ilike 'A%' OR ename ilike '%L%'

;


SELECT * 
FROM emp
WHERE ename ilike 'A%L%' ;

;


SELECT * 
FROM emp
WHERE ename ilike 'A%' OR ename ilike '%L%'
ORDER BY length(ename)
;

SELECT *
FROM emp
WHERE length(ename) = 6;


SELECT ename, substring(ename,3,1) "3rd letter in name"
FROM emp;


SELECT ename, substring(ename,3,1) "3rd letter in name"
FROM emp
WHERE ename ilike'%!%%' escape '!'
UPDATE  emp SET nуame = 'te%st' WHERE ename = 'KING';
;



SELECT * ,
TO_CHAR(hiredate, 'Day')
FROM emp
WHERE (job ilike 'Clerk' or job ilike 'salesman')
AND sal > 1250
OR TO_CHAR (hiredate, 'FMDay') = 'Sunday'


SELECT *, ROUND (sal + sal * 0.153,2)  "Salary after increase"
FROM emp

;



