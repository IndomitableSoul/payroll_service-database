//UC-1

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create database payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> use payroll_service;
Database changed


//UC2

mysql> create table employee_payroll
    -> (EmpId int,
    -> Ename varchar,
    -> salary int,
    -> start_date DATE);
Query OK, 0 rows affected (0.04 sec)


//UC3

insert into employee_payroll
    -> (EmpId, Ename, salary, start_date)
    -> values('1', 'Adam', '4000', '2021-12-01');
Query OK, 1 row affected (0.01 sec)


//UC4

mysql> insert into employee_payroll
    -> (EmpId, Ename, salary, start_date)
    -> values ('2', 'King', '6000', '2021-08-01');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_payroll
    -> (EmpId, Ename, salary, start_date)
    -> values ('3', 'Martin', '5000', '2021-09-12');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_payroll;
+-------+--------+--------+------------+
| EmpId | Ename  | salary | start_date |
+-------+--------+--------+------------+
|     1 | Adam   |   4000 | 2021-12-01 |
|     2 | King   |   6000 | 2021-08-01 |
|     3 | Martin |   5000 | 2021-09-12 |
+-------+--------+--------+------------+
3 rows in set (0.00 sec)


//UC5

mysql> select salary from employee_payroll
    -> where Ename = 'Adam';
+--------+
| salary |
+--------+
|   4000 |
+--------+
1 row in set (0.00 sec)

mysql> select * from employee_payroll
    -> where start_date between cast('2021-09-01' as DATE) and DATE(NOW());
+-------+--------+--------+------------+
| EmpId | Ename  | salary | start_date |
+-------+--------+--------+------------+
|     1 | Adam   |   4000 | 2021-12-01 |
|     3 | Martin |   5000 | 2021-09-12 |
+-------+--------+--------+------------+
2 rows in set (0.01 sec)


//UC6

mysql> alter table employee_payroll
    -> add (gender varchar(8));
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+
| EmpId | Ename  | salary | start_date | gender |
+-------+--------+--------+------------+--------+
|     1 | Adam   |   4000 | 2021-12-01 | NULL   |
|     2 | King   |   6000 | 2021-08-01 | NULL   |
|     3 | Martin |   5000 | 2021-09-12 | NULL   |
+-------+--------+--------+------------+--------+

mysql> update employee_payroll set gender='Male';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+
| EmpId | Ename  | salary | start_date | gender |
+-------+--------+--------+------------+--------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |
|     2 | King   |   6000 | 2021-08-01 | Male   |
|     3 | Martin |   5000 | 2021-09-12 | Male   |
+-------+--------+--------+------------+--------+
3 rows in set (0.00 sec)

//UC7

mysql> insert into employee_payroll (EmpId, Ename, salary, start_date, gender) values('4','Julie','3300','2021-09-12','Female');
Query OK, 1 row affected (0.01 sec)

mysql> select *from employee_payroll;
+-------+--------+--------+------------+--------+
| EmpId | Ename  | salary | start_date | gender |
+-------+--------+--------+------------+--------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |
|     2 | King   |   6000 | 2021-08-01 | Male   |
|     3 | Martin |   5000 | 2021-09-12 | Male   |
|     4 | Julie  |   3300 | 2021-09-12 | Female |
+-------+--------+--------+------------+--------+
4 rows in set (0.00 sec)

//SUM(SALARY) for females

mysql> select sum(salary) from employee_payroll where gender='Female' group by gender;
+-------------+
| sum(salary) |
+-------------+
|        3300 |
+-------------+
1 row in set (0.00 sec)

//SUM(SALARY) for males
mysql> select sum(salary) from employee_payroll where gender='Male' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       15000 |
+-------------+
1 row in set (0.00 sec)

//AVG(SALARY) for females
mysql> select avg(salary) from employee_payroll where gender='female' group by gender;
+-------------+
| avg(salary) |
+-------------+
|   3300.0000 |
+-------------+
1 row in set (0.00 sec)

//AVG(SALARY) for females
mysql> select avg(salary) from employee_payroll where gender='Male' group by gender;
+-------------+
| avg(salary) |
+-------------+
|   5000.0000 |
+-------------+
1 row in set (0.00 sec)

//MAX(SALARY) for females
mysql> select max(salary) from employee_payroll where gender='female' group by gender;
+-------------+
| max(salary) |
+-------------+
|        3300 |
+-------------+
1 row in set (0.00 sec)

//MAX(SALARY) for males
mysql> select max(salary) from employee_payroll where gender='Male' group by gender;
+-------------+
| max(salary) |
+-------------+
|        6000 |
+-------------+
1 row in set (0.00 sec)

//MIN(SALARY) for females
mysql> select min(salary) from employee_payroll where gender='female' group by gender;
+-------------+
| min(salary) |
+-------------+
|        3300 |
+-------------+
1 row in set (0.00 sec)

//MIN(SALARY) for males
mysql> select min(salary) from employee_payroll where gender='Male' group by gender;
+-------------+
| min(salary) |
+-------------+
|        4000 |
+-------------+
1 row in set (0.00 sec)

//COUNT for males
mysql> select count(salary) from employee_payroll where gender='Male' group by gender;
+---------------+
| count(salary) |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

//COUNT for females
mysql> select count(salary) from employee_payroll where gender='Female' group by gender;
+---------------+
| count(salary) |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)


//UC7

mysql> alter table employee_payroll add (EmpPhone int, address varchar(200) default 'BAngalore', department varchar(15) not null);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+----------+-----------+------------+
| EmpId | Ename  | salary | start_date | gender | EmpPhone | address   | department |
+-------+--------+--------+------------+--------+----------+-----------+------------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |     NULL | BAngalore |            |
|     2 | King   |   6000 | 2021-08-01 | Male   |     NULL | BAngalore |            |
|     3 | Martin |   5000 | 2021-09-12 | Male   |     NULL | BAngalore |            |
|     4 | Julie  |   3300 | 2021-09-12 | Female |     NULL | BAngalore |            |
+-------+--------+--------+------------+--------+----------+-----------+------------+
4 rows in set (0.00 sec)

mysql> update employee_payroll set EmpPhone=9988, address='Jainagar, Bangalore',department='Sales' where EmpId=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set EmpPhone=9977, address='Vijaynagar, Bangalore',department='Finance' where EmpId=2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set EmpPhone=9966, address='Indiranagar, Bangalore',department='Marketing' where EmpId=3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set EmpPhone=9955, address='Indiranagar, Bangalore',department='Sales' where EmpId=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+----------+------------------------+------------+
| EmpId | Ename  | salary | start_date | gender | EmpPhone | address                | department |
+-------+--------+--------+------------+--------+----------+------------------------+------------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |     9988 | Jainagar, Bangalore    | Sales      |
|     2 | King   |   6000 | 2021-08-01 | Male   |     9977 | Vijaynagar, Bangalore  | Finance    |
|     3 | Martin |   5000 | 2021-09-12 | Male   |     9966 | Indiranagar, Bangalore | Marketing  |
|     4 | Julie  |   3300 | 2021-09-12 | Female |     9955 | Indiranagar, Bangalore | Sales      |
+-------+--------+--------+------------+--------+----------+------------------------+------------+
4 rows in set (0.00 sec)


//UC9

mysql> alter table employee_payroll add (basic_pay int, deductions int, income_tax int, net_apy int);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
| EmpId | Ename  | salary | start_date | gender | EmpPhone | address                | department | basic_pay | deductions | income_tax | net_apy |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |     9988 | Jainagar, Bangalore    | Sales      |      NULL |       NULL |       NULL |    NULL |
|     2 | King   |   6000 | 2021-08-01 | Male   |     9977 | Vijaynagar, Bangalore  | Finance    |      NULL |       NULL |       NULL |    NULL |
|     3 | Martin |   5000 | 2021-09-12 | Male   |     9966 | Indiranagar, Bangalore | Marketing  |      NULL |       NULL |       NULL |    NULL |
|     4 | Julie  |   3300 | 2021-09-12 | Female |     9955 | Indiranagar, Bangalore | Sales      |      NULL |       NULL |       NULL |    NULL |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
4 rows in set (0.00 sec)

mysql> update employee_payroll set basic_pay='4000', deductions='100', income_tax='500', net_apy='3400'  where EmpId=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set basic_pay='6000', deductions='200', income_tax='500', net_apy='5300'  where EmpId=2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set basic_pay='5000', deductions='100', income_tax='450', net_apy='4450'  where EmpId=3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set basic_pay='3300', deductions='100', income_tax='200', net_apy='3000'  where EmpId=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
| EmpId | Ename  | salary | start_date | gender | EmpPhone | address                | department | basic_pay | deductions | income_tax | net_apy |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |     9988 | Jainagar, Bangalore    | Sales      |      4000 |        100 |        500 |    3400 |
|     2 | King   |   6000 | 2021-08-01 | Male   |     9977 | Vijaynagar, Bangalore  | Finance    |      6000 |        200 |        500 |    5300 |
|     3 | Martin |   5000 | 2021-09-12 | Male   |     9966 | Indiranagar, Bangalore | Marketing  |      5000 |        100 |        450 |    4450 |
|     4 | Julie  |   3300 | 2021-09-12 | Female |     9955 | Indiranagar, Bangalore | Sales      |      3300 |        100 |        200 |    3000 |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
4 rows in set (0.00 sec)


//UC10

mysql> insert into employee_payroll
    -> (Ename, salary, start_date, gender, EmpPhone, address, department, basic_pay, deductions, income_tax, net_apy)
    -> values ('Terisa', '6000', '2021-12-11', 'Female','9944', 'Indiranagar, Bangalore','Sales','6000','100','500','5400');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_payroll
    -> (Ename, salary, start_date, gender, EmpPhone, address, department, basic_pay, deductions, income_tax, net_apy)
    -> values ('Terisa', '6000', '2021-12-11', 'Female','9944', 'Indiranagar, Bangalore','Marketing','6000','100','500','5400');
Query OK, 1 row affected (0.02 sec)

mysql> select * from employee_payroll;
mysql> select * from employee_payroll;
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
| EmpId | Ename  | salary | start_date | gender | EmpPhone | address                | department | basic_pay | deductions | income_tax | net_apy |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
|     1 | Adam   |   4000 | 2021-12-01 | Male   |     9988 | Jainagar, Bangalore    | Sales      |      4000 |        100 |        500 |    3400 |
|     2 | King   |   6000 | 2021-08-01 | Male   |     9977 | Vijaynagar, Bangalore  | Finance    |      6000 |        200 |        500 |    5300 |
|     3 | Martin |   5000 | 2021-09-12 | Male   |     9966 | Indiranagar, Bangalore | Marketing  |      5000 |        100 |        450 |    4450 |
|     4 | Julie  |   3300 | 2021-09-12 | Female |     9955 | Indiranagar, Bangalore | Sales      |      3300 |        100 |        200 |    3000 |
|     5 | Terisa |   6000 | 2021-12-11 | Female |     9944 | Indiranagar, Bangalore | Marketing  |      6000 |        100 |        500 |    5400 |
|     6 | Terisa |   6000 | 2021-12-11 | Female |     9944 | Indiranagar, Bangalore | Sales      |      6000 |        100 |        500 |    5400 |
+-------+--------+--------+------------+--------+----------+------------------------+------------+-----------+------------+------------+---------+
6 rows in set (0.01 sec)





