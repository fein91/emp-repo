DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
                     
CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      VARCHAR(10)  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
); 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
); 

INSERT INTO departments VALUES ('d001','Marketing');
INSERT INTO departments VALUES('d002','Finance');
INSERT INTO departments VALUES('d003','Human Resources');
INSERT INTO departments VALUES('d004','Production');
INSERT INTO departments VALUES('d005','Development');
INSERT INTO departments VALUES('d006','Quality Management');
INSERT INTO departments VALUES('d007','Sales');
INSERT INTO departments VALUES('d008','Research');
INSERT INTO departments VALUES('d009','Customer Service');

INSERT INTO employees VALUES (10001,'1953-09-02','Georgi','Facello','M','1986-06-26');
INSERT INTO employees VALUES (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21');
INSERT INTO employees VALUES (10003,'1959-12-03','Parto','Bamford','M','1986-08-28');
INSERT INTO employees VALUES (10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01');
INSERT INTO employees VALUES (10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12');
INSERT INTO employees VALUES (10006,'1953-04-20','Anneke','Preusig','F','1989-06-02');
INSERT INTO employees VALUES (10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10');
INSERT INTO employees VALUES (10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15');
INSERT INTO employees VALUES (10009,'1952-04-19','Sumant','Peac','F','1985-02-18');
INSERT INTO employees VALUES (10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24');

INSERT INTO titles VALUES(10001,'Senior Engineer','1986-06-26','9999-01-01');
INSERT INTO titles VALUES(10002,'Staff','1996-08-03','9999-01-01');
INSERT INTO titles VALUES(10003,'Senior Engineer','1995-12-03','9999-01-01');
INSERT INTO titles VALUES(10004,'Engineer','1986-12-01','1995-12-01');
INSERT INTO titles VALUES(10004,'Senior Engineer','1995-12-01','9999-01-01');
INSERT INTO titles VALUES(10005,'Senior Staff','1996-09-12','9999-01-01');
INSERT INTO titles VALUES(10005,'Staff','1989-09-12','1996-09-12');
INSERT INTO titles VALUES(10006,'Senior Engineer','1990-08-05','9999-01-01');
INSERT INTO titles VALUES(10007,'Senior Staff','1996-02-11','9999-01-01');
INSERT INTO titles VALUES(10007,'Staff','1989-02-10','1996-02-11');
INSERT INTO titles VALUES(10008,'Assistant Engineer','1998-03-11','2000-07-31');
INSERT INTO titles VALUES(10009,'Assistant Engineer','1985-02-18','1990-02-18');
INSERT INTO titles VALUES(10009,'Engineer','1990-02-18','1995-02-18');
INSERT INTO titles VALUES(10009,'Senior Engineer','1995-02-18','9999-01-01');
INSERT INTO titles VALUES(10010,'Engineer','1996-11-24','9999-01-01');

INSERT INTO dept_emp VALUES (10001,'d005','1986-06-26','9999-01-01');
INSERT INTO dept_emp VALUES (10002,'d007','1996-08-03','9999-01-01');
INSERT INTO dept_emp VALUES (10003,'d004','1995-12-03','9999-01-01');
INSERT INTO dept_emp VALUES (10004,'d004','1986-12-01','9999-01-01');
INSERT INTO dept_emp VALUES (10005,'d003','1989-09-12','9999-01-01');
INSERT INTO dept_emp VALUES (10006,'d005','1990-08-05','9999-01-01');
INSERT INTO dept_emp VALUES (10007,'d008','1989-02-10','9999-01-01');
INSERT INTO dept_emp VALUES (10008,'d005','1998-03-11','2000-07-31');
INSERT INTO dept_emp VALUES (10009,'d006','1985-02-18','9999-01-01');
INSERT INTO dept_emp VALUES (10010,'d004','1996-11-24','2000-06-26');
INSERT INTO dept_emp VALUES (10010,'d006','2000-06-26','9999-01-01');

INSERT INTO salaries VALUES (10001,60117,'1986-06-26','1987-06-26');
INSERT INTO salaries VALUES (10001,62102,'1987-06-26','1988-06-25');
INSERT INTO salaries VALUES (10001,66074,'1988-06-25','1989-06-25');
INSERT INTO salaries VALUES (10001,66596,'1989-06-25','1990-06-25');
INSERT INTO salaries VALUES (10001,66961,'1990-06-25','1991-06-25');
INSERT INTO salaries VALUES (10001,71046,'1991-06-25','1992-06-24');
INSERT INTO salaries VALUES (10001,74333,'1992-06-24','1993-06-24');
INSERT INTO salaries VALUES (10001,75286,'1993-06-24','1994-06-24');
INSERT INTO salaries VALUES (10001,75994,'1994-06-24','1995-06-24');
INSERT INTO salaries VALUES (10001,76884,'1995-06-24','1996-06-23');
INSERT INTO salaries VALUES (10001,80013,'1996-06-23','1997-06-23');
INSERT INTO salaries VALUES (10001,81025,'1997-06-23','1998-06-23');
INSERT INTO salaries VALUES (10001,81097,'1998-06-23','1999-06-23');
INSERT INTO salaries VALUES (10001,84917,'1999-06-23','2000-06-22');
INSERT INTO salaries VALUES (10001,85112,'2000-06-22','2001-06-22');
INSERT INTO salaries VALUES (10001,85097,'2001-06-22','2002-06-22');
INSERT INTO salaries VALUES (10001,88958,'2002-06-22','9999-01-01');
INSERT INTO salaries VALUES (10002,65828,'1996-08-03','1997-08-03');
INSERT INTO salaries VALUES (10002,65909,'1997-08-03','1998-08-03');
INSERT INTO salaries VALUES (10002,67534,'1998-08-03','1999-08-03');
INSERT INTO salaries VALUES (10002,69366,'1999-08-03','2000-08-02');
INSERT INTO salaries VALUES (10002,71963,'2000-08-02','2001-08-02');
INSERT INTO salaries VALUES (10002,72527,'2001-08-02','9999-01-01');
INSERT INTO salaries VALUES (10003,40006,'1995-12-03','1996-12-02');
INSERT INTO salaries VALUES (10003,43616,'1996-12-02','1997-12-02');
INSERT INTO salaries VALUES (10003,43466,'1997-12-02','1998-12-02');
INSERT INTO salaries VALUES (10003,43636,'1998-12-02','1999-12-02');
INSERT INTO salaries VALUES (10003,43478,'1999-12-02','2000-12-01');
INSERT INTO salaries VALUES (10003,43699,'2000-12-01','2001-12-01');
INSERT INTO salaries VALUES (10003,43311,'2001-12-01','9999-01-01');
INSERT INTO salaries VALUES (10004,40054,'1986-12-01','1987-12-01');
INSERT INTO salaries VALUES (10004,42283,'1987-12-01','1988-11-30');
INSERT INTO salaries VALUES (10004,42542,'1988-11-30','1989-11-30');
INSERT INTO salaries VALUES (10004,46065,'1989-11-30','1990-11-30');
INSERT INTO salaries VALUES (10004,48271,'1990-11-30','1991-11-30');
INSERT INTO salaries VALUES (10004,50594,'1991-11-30','1992-11-29');
INSERT INTO salaries VALUES (10004,52119,'1992-11-29','1993-11-29');
INSERT INTO salaries VALUES (10004,54693,'1993-11-29','1994-11-29');
INSERT INTO salaries VALUES (10004,58326,'1994-11-29','1995-11-29');
INSERT INTO salaries VALUES (10004,60770,'1995-11-29','1996-11-28');
INSERT INTO salaries VALUES (10004,62566,'1996-11-28','1997-11-28');
INSERT INTO salaries VALUES (10004,64340,'1997-11-28','1998-11-28');
INSERT INTO salaries VALUES (10004,67096,'1998-11-28','1999-11-28');
INSERT INTO salaries VALUES (10004,69722,'1999-11-28','2000-11-27');
INSERT INTO salaries VALUES (10004,70698,'2000-11-27','2001-11-27');
INSERT INTO salaries VALUES (10004,74057,'2001-11-27','9999-01-01');
INSERT INTO salaries VALUES (10005,78228,'1989-09-12','1990-09-12');
INSERT INTO salaries VALUES (10005,82621,'1990-09-12','1991-09-12');
INSERT INTO salaries VALUES (10005,83735,'1991-09-12','1992-09-11');
INSERT INTO salaries VALUES (10005,85572,'1992-09-11','1993-09-11');
INSERT INTO salaries VALUES (10005,85076,'1993-09-11','1994-09-11');
INSERT INTO salaries VALUES (10005,86050,'1994-09-11','1995-09-11');
INSERT INTO salaries VALUES (10005,88448,'1995-09-11','1996-09-10');
INSERT INTO salaries VALUES (10005,88063,'1996-09-10','1997-09-10');
INSERT INTO salaries VALUES (10005,89724,'1997-09-10','1998-09-10');
INSERT INTO salaries VALUES (10005,90392,'1998-09-10','1999-09-10');
INSERT INTO salaries VALUES (10005,90531,'1999-09-10','2000-09-09');
INSERT INTO salaries VALUES (10005,91453,'2000-09-09','2001-09-09');
INSERT INTO salaries VALUES (10005,94692,'2001-09-09','9999-01-01');
INSERT INTO salaries VALUES (10006,40000,'1990-08-05','1991-08-05');
INSERT INTO salaries VALUES (10006,42085,'1991-08-05','1992-08-04');
INSERT INTO salaries VALUES (10006,42629,'1992-08-04','1993-08-04');
INSERT INTO salaries VALUES (10006,45844,'1993-08-04','1994-08-04');
INSERT INTO salaries VALUES (10006,47518,'1994-08-04','1995-08-04');
INSERT INTO salaries VALUES (10006,47917,'1995-08-04','1996-08-03');
INSERT INTO salaries VALUES (10006,52255,'1996-08-03','1997-08-03');
INSERT INTO salaries VALUES (10006,53747,'1997-08-03','1998-08-03');
INSERT INTO salaries VALUES (10006,56032,'1998-08-03','1999-08-03');
INSERT INTO salaries VALUES (10006,58299,'1999-08-03','2000-08-02');
INSERT INTO salaries VALUES (10006,60098,'2000-08-02','2001-08-02');
INSERT INTO salaries VALUES (10006,59755,'2001-08-02','9999-01-01');
INSERT INTO salaries VALUES (10007,56724,'1989-02-10','1990-02-10');
INSERT INTO salaries VALUES (10007,60740,'1990-02-10','1991-02-10');
INSERT INTO salaries VALUES (10007,62745,'1991-02-10','1992-02-10');
INSERT INTO salaries VALUES (10007,63475,'1992-02-10','1993-02-09');
INSERT INTO salaries VALUES (10007,63208,'1993-02-09','1994-02-09');
INSERT INTO salaries VALUES (10007,64563,'1994-02-09','1995-02-09');
INSERT INTO salaries VALUES (10007,68833,'1995-02-09','1996-02-09');
INSERT INTO salaries VALUES (10007,70220,'1996-02-09','1997-02-08');
INSERT INTO salaries VALUES (10007,73362,'1997-02-08','1998-02-08');
INSERT INTO salaries VALUES (10007,75582,'1998-02-08','1999-02-08');
INSERT INTO salaries VALUES (10007,79513,'1999-02-08','2000-02-08');
INSERT INTO salaries VALUES (10007,80083,'2000-02-08','2001-02-07');
INSERT INTO salaries VALUES (10007,84456,'2001-02-07','2002-02-07');
INSERT INTO salaries VALUES (10007,88070,'2002-02-07','9999-01-01');
INSERT INTO salaries VALUES (10008,46671,'1998-03-11','1999-03-11');
INSERT INTO salaries VALUES (10008,48584,'1999-03-11','2000-03-10');
INSERT INTO salaries VALUES (10008,52668,'2000-03-10','2000-07-31');
INSERT INTO salaries VALUES (10009,60929,'1985-02-18','1986-02-18');
INSERT INTO salaries VALUES (10009,64604,'1986-02-18','1987-02-18');
INSERT INTO salaries VALUES (10009,64780,'1987-02-18','1988-02-18');
INSERT INTO salaries VALUES (10009,66302,'1988-02-18','1989-02-17');
INSERT INTO salaries VALUES (10009,69042,'1989-02-17','1990-02-17');
INSERT INTO salaries VALUES (10009,70889,'1990-02-17','1991-02-17');
INSERT INTO salaries VALUES (10009,71434,'1991-02-17','1992-02-17');
INSERT INTO salaries VALUES (10009,74612,'1992-02-17','1993-02-16');
INSERT INTO salaries VALUES (10009,76518,'1993-02-16','1994-02-16');
INSERT INTO salaries VALUES (10009,78335,'1994-02-16','1995-02-16');
INSERT INTO salaries VALUES (10009,80944,'1995-02-16','1996-02-16');
INSERT INTO salaries VALUES (10009,82507,'1996-02-16','1997-02-15');
INSERT INTO salaries VALUES (10009,85875,'1997-02-15','1998-02-15');
INSERT INTO salaries VALUES (10009,89324,'1998-02-15','1999-02-15');
INSERT INTO salaries VALUES (10009,90668,'1999-02-15','2000-02-15');
INSERT INTO salaries VALUES (10009,93507,'2000-02-15','2001-02-14');
INSERT INTO salaries VALUES (10009,94443,'2001-02-14','2002-02-14');
INSERT INTO salaries VALUES (10009,94409,'2002-02-14','9999-01-01');
INSERT INTO salaries VALUES (10010,72488,'1996-11-24','1997-11-24');
INSERT INTO salaries VALUES (10010,74347,'1997-11-24','1998-11-24');
INSERT INTO salaries VALUES (10010,75405,'1998-11-24','1999-11-24');
INSERT INTO salaries VALUES (10010,78194,'1999-11-24','2000-11-23');
INSERT INTO salaries VALUES (10010,79580,'2000-11-23','2001-11-23');
INSERT INTO salaries VALUES (10010,80324,'2001-11-23','9999-01-01');
