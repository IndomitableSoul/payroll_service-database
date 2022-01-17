
//UC11- Implementation of ER Diagram for
//Entities- Employee, Department, Company,Payroll
CREATE TABLE  employee (Employee_ID int(10), EmployeeName varchar(255) NOT NULL, Date_Of_Brith varchar(20) NOT NULL, PRIMARY KEY(Employee_ID));


mysql> INSERT INTO employee VALUES (1,'Nikita Amar,'1994-03-09'),(2,'Gouthum G','1997-12-01'),(3,'Raja Reddy','1995-10-05'),(4,'Deepthi Reddy','1993-8-10');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
alter table employee add gender char(1) not null after EmployeeName;
mysql> SELECT * FROM employee;
+-------------+---------------+--------+---------------+
| Employee_ID | EmployeeName  | gender | Date_Of_Brith |
+-------------+---------------+--------+---------------+
|           1 | Nikita Amar   | F      | 1994-03-09    |
|           2 | Gouthum G     | M      | 1997-12-01    |
|           3 | Raja Reddy    | M      | 1995-10-05    |
|           4 | Ashwath       | M     | 1993-8-10     |
+-------------+---------------+--------+---------------+
4 rows in set (0.00 sec)

CREATE TABLE  employee_Contacts (Employee_ID int(10), PhoneNumber varchar(200) NOT NULL, Address varchar(200) NOT NULL,foreign key (Employee_ID) references employee (Employee_ID));

mysql> INSERT INTO employee_contacts VALUES (1,'9008622627','near sai baba tmeple road kudhanahalli gate'),(1,'852147963','nandhi halli near post office'),(1,'5647893211','BTM layout kudhanahalli gate'),
    -> (2,'7415468222','KR Puram 4th stage'),
    -> (3,'9632587536','RT nagar'),
    -> (4,'9008622627','Whitefeild,near bus station');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0
mysql> desc employee_Contacts;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| Employee_ID | int          | YES  | MUL | NULL    |       |
| PhoneNumber | varchar(200) | NO   |     | NULL    |       |
| Address     | varchar(200) | NO   |     | NULL    |       |
| City        | varchar(50)  | NO   |     | NULL    |       |
| State       | varchar(50)  | NO   |     | NULL    |       |
| Country     | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)


mysql> SELECT * FROM employee_Contacts;
+-------------+-------------+---------------------------------------------+-----------+-------------+---------+
| Employee_ID | PhoneNumber | Address                                     | City      | State       | Country |
+-------------+-------------+---------------------------------------------+-----------+-------------+---------+
|           1 | 9008622627  | near sai baba tmeple road kudhanahalli gate | Bengaluru | Karnataka   | India   |
|           1 | 852147963   | nandhi halli near post office               | Bengaluru | Karnataka   | India   |
|           1 | 5647893211  | BTM layout kudhanahalli gate                | Bengaluru | Karnataka   | India   |
|           2 | 7415468222  | KR Puram 4th stage                          | Kurnool   | Telangana   | India   |
|           3 | 9632587536  | RT nagar                                    | Mumbai    | Maharashtra | India   |
|           4 | 9008622627  | Whitefeild,near bus station                 | Chennai   | Tamil Nadu  | India   |
+-------------+-------------+---------------------------------------------+-----------+-------------+---------+
6 rows in set (0.00 sec)

alter table employee_Contacts add City varchar(50) not null after Address;

CREATE TABLE  employee_Department (Employee_ID int(10),Department varchar(255),foreign key (Employee_ID) references employee (Employee_ID));

mysql> desc employee_Department;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| Employee_ID | int          | YES  | MUL | NULL    |       |
| Department  | varchar(255) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> INSERT INTO employee_Department VALUES (1,'Sales'),(1,'Marketting'),(2,'Sales'),(3,'HR'),(4,'CRM');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_Department;
+-------------+------------+
| Employee_ID | Department |
+-------------+------------+
|           1 | Sales      |
|           1 | Marketting |
|           2 | Sales      |
|           3 | HR         |
|           4 | CRM        |
+-------------+------------+
5 rows in set (0.00 sec)

alter table employee_Department add Department_ID varchar(50) not null PRIMARY KEY after Employee_ID;

CREATE TABLE  employee_Salary (Salary_ID int,Employee_ID int(10) not null,Basic_Pay float not null,Deducation float not null,Taxable_Pay float not null,Tax float not null,Net_Pay float not null, Salary int not null,PRIMARY KEY(Salary_ID),
foreign key (Employee_ID) references employee (Employee_ID),foreign key (Employee_ID) references employee_Department(Employee_ID));

mysql> CREATE TABLE  employee_Salary (Salary_ID int,Employee_ID int(10) not null,Basic_Pay float not null,Deducation float not null,Taxable_Pay float not null,Tax float not null,Net_Pay float not null, Salary int not null,PRIMARY KEY(Salary_ID),
    -> foreign key (Employee_ID) references employee (Employee_ID),foreign key (Employee_ID) references employee_Department(Employee_ID));
Query OK, 0 rows affected, 1 warning (0.18 sec)

mysql> desc  employee_Salary ;
+-------------+-------+------+-----+---------+-------+
| Field       | Type  | Null | Key | Default | Extra |
+-------------+-------+------+-----+---------+-------+
| Salary_ID   | int   | NO   | PRI | NULL    |       |
| Employee_ID | int   | NO   | MUL | NULL    |       |
| Basic_Pay   | float | NO   |     | NULL    |       |
| Deducation  | float | NO   |     | NULL    |       |
| Taxable_Pay | float | NO   |     | NULL    |       |
| Tax         | float | NO   |     | NULL    |       |
| Net_Pay     | float | NO   |     | NULL    |       |
| Salary      | int   | NO   |     | NULL    |       |
+-------------+-------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> INSERT INTO  employee_Salary VALUES (1,1,5000,2500,1000,2000,3000,30000),(2,1,5000,1000,3000,500,8000,4+0000),
    -> (3,2,4000,3000,2000,5500,2000,50050),(4,3,3500,200,5000,4500,6000,85600);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM  employee_Salary ;
+-----------+-------------+-----------+------------+-------------+------+---------+--------+
| Salary_ID | Employee_ID | Basic_Pay | Deducation | Taxable_Pay | Tax  | Net_Pay | Salary |
+-----------+-------------+-----------+------------+-------------+------+---------+--------+
|         1 |           1 |      5000 |       2500 |        1000 | 2000 |    3000 |  30000 |
|         2 |           1 |      5000 |       1000 |        3000 |  500 |    8000 |  40000 |
|         3 |           2 |      4000 |       3000 |        2000 | 5500 |    2000 |  50050 |
|         4 |           3 |      3500 |        200 |        5000 | 4500 |    6000 |  85600 |
+-----------+-------------+-----------+------------+-------------+------+---------+--------+
4 rows in set (0.00 sec)

-- UC12 :- Ensure all retrieve queries done especially in UC 4, UC 5 and UC 7 are working with new table structure

mysql> SELECT salary FROM employee_Salary WHERE  Employee_ID=1;
+--------+
| salary |
+--------+
|  30000 |
|  40000 |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT SUM(salary) FROM employee_Salary WHERE  Employee_ID=1 GROUP BY  Salary_ID;
+-------------+
| SUM(salary) |
+-------------+
|       30000 |
|       40000 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT SUM(salary) FROM employee_Salary WHERE  Employee_ID=1;
+-------------+
| SUM(salary) |
+-------------+
|       70000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_Salary;
+-------------+
| AVG(salary) |
+-------------+
|  51412.5000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_Salary;
+-------------+
| MIN(salary) |
+-------------+
|       30000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_Salary;
+-------------+
| MAX(salary) |
+-------------+
|       85600 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(salary) FROM employee_Salary;
+---------------+
| COUNT(salary) |
+---------------+
|             4 |
+---------------+
1 row in set (0.00 sec)