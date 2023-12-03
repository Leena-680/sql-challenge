----------- 
-- Module 9 - challenge 
-- Create employee db
-----------

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE titles (
    title_id text UNIQUE NOT NULL,
    title text NOT NULL
);

ALTER TABLE titles OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departments (
    dept_no text UNIQUE NOT NULL,
    dept_name text NOT NULL
);

ALTER TABLE departments OWNER TO postgres;

CREATE SEQUENCE employee_emp_no_seq
    START WITH 500000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employee_emp_no_seq OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE employee (
    emp_no integer DEFAULT nextval('employee_emp_no_seq') PRIMARY KEY,
    emp_title_id text NOT NULL,
    birth_date date DEFAULT ('now'::text)::date NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    sex char(1),
    hire_date date DEFAULT ('now'::text)::date NOT NULL
);

ALTER TABLE employee OWNER TO postgres;

--
-- Name: employee emp_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE salaries (
    emp_no integer PRIMARY KEY,
    salary integer
);

ALTER TABLE salaries OWNER TO postgres;

--
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employee(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dept_manager (
    dept_no text,
    emp_no integer
);

ALTER TABLE dept_manager OWNER TO postgres;

--
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employee(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dept_emp (
    emp_no integer,
    dept_no text
);

ALTER TABLE dept_emp OWNER TO postgres;

--
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employee(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;
