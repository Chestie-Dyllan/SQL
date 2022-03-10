	Create Table Employee(
	emp_id bigserial ,
		first_name varchar(20),
		last_name varchar(30),
		gender varchar(1),
		adress varchar(50),
		email varchar(20),
		Constraint emp_email UNIQUE (email),
		Constraint pk_emp_id Primary key (emp_id),
		depart_id integer References Departments(depart_id),
		role_id integer References Role(role_id),
		salary_id integer References Salary(salary_id),
		overtime_id integer References Overtime_Hour(overtime_id)
	);
	
	Create Table Departments(
	depart_id integer,
	depart_name varchar(10),
	depart_city varchar (10),
	constraint pk_depart_id Primary Key (depart_id)
	);
	
		Create Table Role (
	role_id integer,
	role_name varchar(20),
	constraint pk_role_id Primary Key (role_id)
	);
	
	Create Table Salary (
	salary_id integer,
	salary_pay numeric (6, 2),
	Constraint pk_salary_id Primary Key (salary_id)
	);
	
	Create Table Overtime_Hour (
	overtime_id integer,
	overtime_hours smallint ,
	Constraint pk_overtime_id Primary Key (overtime_id)
	);
	
	Insert into Departments (depart_id, depart_name, depart_city)
	Values (12, 'sales', 'krugerdorp'),
	(15, 'it', 'Cenurion'),
	(56, 'risk', 'durban'),
	(28, 'it', 'maryland'),
	(50, 'finance', 'durban'),
	(92, 'sales', 'cape town');
	
	Insert into Role (role_id, role_name)
	Values (91, 'sales agent'),
	(98, 'junior'),
	(9, 'risk agent'),
	(45, 'junior'),
	(36, 'clerk'),
	(84, 'sales agent');
	
	Insert into Salary (salary_id, salary_pay)
	Values (52, 1200.00),
	(70, 1000.00),
	(31, 1000.00),
	(63, 2000.00),
	(62, 6000.00),
	(44, 1400.00);
	
	Insert into Overtime_Hour (overtime_id, overtime_hours)
	Values (76, 44),
	(54, 9),
	(66, 4),
	(39, 16),
	(87, 12),
	(22, 25);
	
	Insert into Employee (first_name,last_name, gender, adress, email, depart_id, role_id, salary_id, overtime_id)
	Values ('dyllan', 'van_den_heever', 'm', '18a wagtial crest', 'dyllnvdh@gmail.com', 12, 91, 52, 76),
    ('armand', 'ooztuizen', 'm', '27 owl street', 'armando@gmail.com', 15, 98, 70, 54),
    ('andrea', 'fick', 'f',' 90 redback road', 'andreafk@yahoo.com', 56, 9, 31, 66),
	('Brent', 'Lombaard', 'm', '13 van der merwe str', 'lmbrdbrnt@gmail.com', 28, 45, 63, 39),
        ('Zelda', 'Boshof', 'f', '24 livingstone str', 'zeldabshf@gmail.com', 50, 36, 62, 87),
        ('Dian', 'Reinecke', 'm', '5 enghelbrecght str', 'dnrnk@gmail.com', 92, 84, 44, 22);
		
SELECT e.emp_id, e.first_name, e.last_name, e.gender, e.adress, e.email, d.depart_id as Departments, r.role_id as Role,
s.salary_id as Salary, o.overtime_id as Overtime_Hour
FROM Employee e
LEFT JOIN Departments d
ON e.emp_id = d.depart_id
LEFT JOIN Role r
ON e.emp_id = r.role_id
LEFT JOIN  Salary s
ON e.emp_id = s.salary_id
LEFT JOIN  Overtime_Hour o
ON e.emp_id = o.overtime_id;