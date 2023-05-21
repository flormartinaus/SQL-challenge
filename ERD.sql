



CREATE TABLE "employees" (
  "emp_no" INT,
  "emp_title" VARCHAR,
  "birth_date" DATE,
  "first_name" VARCHAR,
  "last_name" VARCHAR,
  "gender" VARCHAR,
  "hire_date" DATE,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "titles" (
  "title_id" VARCHAR,
  "title" VARCHAR,
  PRIMARY KEY ("title_id")
);

CREATE TABLE "dept_emp" (
  "emp_no" INT,
  "dept_no" VARCHAR,
  PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
  "dept_no" VARCHAR,
  "emp_no" INT,
  PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE "salaries" (
  "emp_no" INT,
  "salary" BIGINT,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "departments" (
  "dept_no" VARCHAR,
  "dept_name" VARCHAR,
  PRIMARY KEY ("dept_no")
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);



