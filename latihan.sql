CREATE TABLE teachers (
    id integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );

   INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
       
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
          
          
CREATE TABLE courses (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );

INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);

select *from teachers;
select *from courses;

-- case 1.1 (Who is the teacher with the highest salary for each university ?)
select id, first_name , last_name ,max(salary) as salary, school  from teachers 
group by school 

-- case 1.2 (Who is the teacher with the highest salary from Standford University ?)
select id, first_name , last_name ,max(salary) as salary, school  from teachers 
where  school='standford univeristy'

-- case 2.1 (Display all courses with teacher's identity)
select teachers.first_name , teachers.last_name , courses.name 
from teachers join courses on teachers.id = courses.teachers_id 

-- case 2.2 (Display how many courses per universities)
select count(c.name) as courses_count, t.school from courses as c
inner join teachers as t
on(c.teachers_id = t.id)
group by t.school;

-- case 2.3 (Display how many total_students per teachers)
select sum(c.total_students) as total_students, t.first_name, t.last_name from courses as c
inner join teachers as t
on(c.teachers_id = t.id)
group by t.id;

-- case 2.4 (Display how many courses per teachers)
select count(c.name), t.first_name  
from courses as c
inner join teachers as t 
on(c.teachers_id = t.id)
group by t.id;

-- case 
SELECT *, max(teachers.salary) FROM teachers
inner JOIN courses ON
teachers.id = courses.teachers_id
GROUP BY courses.name 
ORDER BY courses.name


-- case Carilah dosen yang memiliki gaji tertinggi per masing-masing mata kuliah. Tampilkan semua atribut dosen dan semua atribut mata kuliahnya. 
-- Urutkan hasilnya berdasarkan nama mata kuliahnya secara ascending (A-Z).
SELECT * FROM teachers
RIGHT JOIN courses ON 
teachers.id = courses.teachers_id
WHERE (courses.name, salary)
IN (SELECT name, max(salary) FROM teachers
RIGHT JOIN courses ON teachers.id = courses.teachers_id
GROUP BY courses.name)
order by courses.name ASC;
