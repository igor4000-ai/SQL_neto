
 
CREATE TABLE IF NOT EXISTS department (
	department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	department_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee (
	employee_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	boss_id INTEGER,
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,
	FOREIGN KEY (boss_id) REFERENCES employee(employee_id) ON DELETE SET NULL
); 

CREATE TABLE IF NOT EXISTS employee_department (
	employee_id INTEGER NOT NULL,
	department_id INTEGER NOT NULL,
	PRIMARY KEY (employee_id, department_id),
	FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

