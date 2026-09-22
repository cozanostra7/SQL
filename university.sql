DROP table  if exists department;

CREATE TABLE IF NOT EXISTS department(
	id int generated always as identity (START WITH 1 INCREMENT BY 10),
	title varchar(200) not null,
	location varchar(50),
	budget numeric(12,2),
	
	constraint pk_department_id
		primary key(id),
	constraint uq_department_title
		unique(title),
	constraint ck_department_budget
		check(budget >= 0) 
);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
	id int GENERATED ALWAYS AS IDENTITY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	dob date,
	email varchar(100) NOT NULL,
	phone varchar(20),
	salary numeric(10,2),
	active boolean NOT NULL DEFAULT TRUE,
	hired_at timestamptz NOT NULL  DEFAULT now(),
	department_id int,

	constraint pk_employee_id
		PRIMARY KEY(id),
	constraint uq_employee_email
		UNIQUE (email),
	constraint fk_department_id
		FOREIGN KEY(department_id)
		REFERENCES department(id)
	
	);

CREATE TABLE IF NOT EXISTS department2(
	id int GENERATED ALWAYS AS IDENTITY,
	title varchar(100),
	location varchar(50),

	constraint pk_department2 PRIMARY KEY(title,location)
);

DROP TABLE IF EXISTS department;

ALTER TABLE department2 RENAME TO department3;
ALTER TABLE department3 RENAME COLUMN location TO loc;
ALTER TABLE employee ALTER COLUMN last_name TYPE varchar(60);
ALTER TABLE employee ALTER COLUMN dob DROP NOT NULL;
ALTER TABLE employee DROP COLUMN last_name;
ALTER TABLE employee DROP constraint pk_employee_id;
ALTER TABLE employee DROP constraint uq_employee_email;

ALTER TABLE employee ADD constraint pk_employee_id PRIMARY KEY(id);
ALTER TABLE employee ADD constraint uq_employee_email UNIQUE(email);

ALTER TABLE employee
DROP CONSTRAINT fk_employee_department_id;

ALTER TABLE employee
ADD CONSTRAINT fk_employee_id
    FOREIGN KEY (department_id)
    REFERENCES department(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE employee ADD constraint ck_employee_salary_gt_zero CHECK(salary between 0 AND 5000);

ALTER TABLE employee ALter COLUMN last_name SET NOT NULL;

INSERT INTO employee(first_name,last_name,email)
VALUES ('Bekhzod','Muminov', 'dasdasd@gmail.com');

INSERT INTO department(title)
VALUES('IT') RETURNING id;

INSERT INTO employee(first_name,last_name,email,department_id)
VALUES ('Mumin','Behzodov','mmnv_bgzd@gmail.com',1);

SELECT * FROM employee;
DELETE from employee WHERE id=2;

UPDATE employee SET department_id = NULL WHERE department_id = 2;