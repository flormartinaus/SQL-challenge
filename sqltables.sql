
-- Table: public.dept_emp

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(10) NOT NULL COLLATE "default",
    CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no),
    CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_emp
    OWNER TO postgres;


-- Table: public.employees

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    emp_title varchar(5) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(20) NOT NULL COLLATE "default",
    last_name character varying(20) NOT NULL COLLATE "default",
    gender character varying(2) NOT NULL COLLATE "default",
    hire_date date NOT NULL,
    CONSTRAINT fk_emp_title FOREIGN KEY (emp_title)
        REFERENCES public.titles (title_id),
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER TO postgres;


-- Table: public.salaries

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no bigint NOT NULL,
    salary bigint NOT NULL,
    CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.salaries
    OWNER TO postgres;


-- Table: public.dept_manager

CREATE TABLE IF NOT EXISTS public.dept_manager
(
    dept_no character varying(10) COLLATE "default",
    emp_no integer,
    CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no),
    CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_manager
    OWNER TO postgres;


-- Table: public.titles

CREATE TABLE IF NOT EXISTS public.titles
(
    title_id varchar(5) NOT NULL,
    title character varying(20) NOT NULL COLLATE "default",
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.titles
    OWNER TO postgres;


ALTER DATABASE "SQL-challenge" SET datestyle TO "ISO, MDY";
