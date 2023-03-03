-- Drop tables--
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


-- Creating Tables--
-- Titles Table
CREATE TABLE titles (
	title_id VARCHAR(20) NOT NULL PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);

-- Employees Table
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY, 
	emp_title_id VARCHAR(20),
	birth_date DATE NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(2),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Salaries Table
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Departments Table
CREATE TABLE departments (
	dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

-- Dept_emp Table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Dept_manager Table
CREATE TABLE dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);







