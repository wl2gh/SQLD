-- 1. REGIONS 테이블 생성 및 데이터 삽입
CREATE TABLE regions (
    region_id NUMBER(4) PRIMARY KEY,
    region_name VARCHAR2(25)
);

INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asia');
INSERT INTO regions VALUES (4, 'Middle East and Africa');
COMMIT;

-- 2. COUNTRIES 테이블 생성 및 데이터 삽입
CREATE TABLE countries (
    country_id VARCHAR2(2) PRIMARY KEY,
    country_name VARCHAR2(40),
    region_id NUMBER(4)
);

INSERT INTO countries VALUES ('US', 'United States', 2);
INSERT INTO countries VALUES ('CA', 'Canada', 2);
INSERT INTO countries VALUES ('JP', 'Japan', 3);
INSERT INTO countries VALUES ('CN', 'China', 3);
INSERT INTO countries VALUES ('IN', 'India', 3);
COMMIT;

-- 3. LOCATIONS 테이블 생성 및 데이터 삽입
CREATE TABLE locations (
    location_id NUMBER(4) PRIMARY KEY,
    street_address VARCHAR2(40),
    postal_code VARCHAR2(12),
    city VARCHAR2(30) NOT NULL,
    state_province VARCHAR2(25),
    country_id VARCHAR2(2)
);

INSERT INTO locations VALUES (1400, '2011 Interiors Blvd', '99236', 'South San Francisco', 'CA', 'US');
INSERT INTO locations VALUES (1500, '2014 Jabberwocky Rd', '26192', 'St. Petersburg', 'FL', 'US');
INSERT INTO locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'WA', 'US');
INSERT INTO locations VALUES (1800, '2001 Maple St', '98199', 'Seattle', 'WA', 'US');
INSERT INTO locations VALUES (1900, '1961 4th Ave', '98101', 'Seattle', 'WA', 'US');
INSERT INTO locations VALUES (2000, '1234 Elm St', '44022', 'Bentonville', 'AR', 'US');
COMMIT;

-- 4. JOBS 테이블 생성 및 데이터 삽입
CREATE TABLE jobs (
    job_id VARCHAR2(10) PRIMARY KEY,
    job_title VARCHAR2(35) NOT NULL,
    min_salary NUMBER(6),
    max_salary NUMBER(6)
);

INSERT INTO jobs VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES ('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO jobs VALUES ('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO jobs VALUES ('FI_MGR', 'Finance Manager', 8200, 16000);
INSERT INTO jobs VALUES ('FI_ACCOUNT', 'Accountant', 4200, 9000);
INSERT INTO jobs VALUES ('HR_REP', 'Human Resources Representative', 4000, 9000);
INSERT INTO jobs VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO jobs VALUES ('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO jobs VALUES ('MK_REP', 'Marketing Representative', 4000, 9000);
INSERT INTO jobs VALUES ('PR_REP', 'Public Relations Representative', 4500, 10500);
INSERT INTO jobs VALUES ('PU_MAN', 'Purchasing Manager', 8000, 15000);
INSERT INTO jobs VALUES ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
INSERT INTO jobs VALUES ('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO jobs VALUES ('ST_CLERK', 'Stock Clerk', 2200, 5000);
INSERT INTO jobs VALUES ('SH_CLERK', 'Shipping Clerk', 2200, 5500);
INSERT INTO jobs VALUES ('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO jobs VALUES ('SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO jobs VALUES ('CR_MAN', 'Credit Manager', 7000, 14000);
INSERT INTO jobs VALUES ('CR_REP', 'Credit Representative', 4500, 10500);
INSERT INTO jobs VALUES ('AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO jobs VALUES ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
COMMIT;

-- 5. DEPARTMENTS 테이블 생성 및 데이터 삽입
CREATE TABLE departments (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    manager_id NUMBER(6),
    location_id NUMBER(4)
);

INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO departments VALUES (50, 'Shipping', 121, 1500);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (70, 'Public Relations', 204, 2700);
INSERT INTO departments VALUES (80, 'Sales', 145, 2500);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (100, 'Finance', 108, 1700);
COMMIT;

-- 6. EMPLOYEES 테이블 생성 및 일부 데이터 삽입
CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25) NOT NULL UNIQUE,
    phone_number VARCHAR2(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4),
    CONSTRAINT fk_job FOREIGN KEY (job_id)
        REFERENCES jobs(job_id),
    CONSTRAINT fk_manager FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('17-JUN-03', 'DD-MON-YY'), 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('21-SEP-05', 'DD-MON-YY'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('13-JAN-01', 'DD-MON-YY'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('03-JAN-06', 'DD-MON-YY'), 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('21-MAY-07', 'DD-MON-YY'), 'IT_PROG', 6000, NULL, 103, 60);
INSERT INTO employees VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', TO_DATE('25-JUN-05', 'DD-MON-YY'), 'IT_PROG', 4800, NULL, 103, 60);
COMMIT;

-- 7. JOB_HISTORY 테이블 생성 및 데이터 삽입
CREATE TABLE job_history (
    employee_id NUMBER(6),
    start_date DATE,
    end_date DATE,
    job_id VARCHAR2(10),
    department_id NUMBER(4),
    CONSTRAINT pk_job_history PRIMARY KEY (employee_id, start_date),
    CONSTRAINT fk_jh_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),
    CONSTRAINT fk_jh_job FOREIGN KEY (job_id)
        REFERENCES jobs(job_id),
    CONSTRAINT fk_jh_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO job_history VALUES (102, TO_DATE('13-JAN-01', 'DD-MON-YY'), TO_DATE('15-DEC-03', 'DD-MON-YY'), 'AD_VP', 90);
INSERT INTO job_history VALUES (105, TO_DATE('25-JUN-05', 'DD-MON-YY'), TO_DATE('10-JAN-07', 'DD-MON-YY'), 'IT_PROG', 60);
COMMIT;

-- 8. DEPENDENTS 테이블 생성 및 데이터 삽입
CREATE TABLE dependents (
    dependent_id NUMBER(6) PRIMARY KEY,
    employee_id NUMBER(6) NOT NULL,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    relationship VARCHAR2(25),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

INSERT INTO dependents VALUES (1, 101, 'Alice', 'Kochhar', 'Spouse');
INSERT INTO dependents VALUES (2, 101, 'Bob', 'Kochhar', 'Child');
COMMIT;
