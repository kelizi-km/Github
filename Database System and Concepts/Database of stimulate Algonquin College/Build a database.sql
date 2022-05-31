create database if not exists Db_portfolio;

-- delete / Drop database
DROP DATABASE Db_portfolio;



use DB_portfolio;

create table if not exists program (
pg_id varchar(20) primary key, 
pg_name varchar(100),
pg_campus varchar(20)
);

create table if not exists course (
course_id varchar(20) primary key,
pg_id_course varchar(20),

constraint fkey_course_pg_id foreign key(pg_id_course) references program(pg_id)
);

create table if not exists student (
sid int primary key auto_increment,
name varchar(20),
gender varchar(15),
age int,
race varchar(20),
City varchar(20),
pg_id_student varchar(20),
constraint fkey_student_pg_id foreign key(pg_id_student) references program(pg_id)
);

create table if not exists teacher (
tid int primary key auto_increment,
name varchar(20),
gender varchar(15),
age int,
race varchar(20),
City varchar(20),
pg_id_teacher varchar(20)
);

create table if not exists course_enrolled (
course_enrolled_sid int not null,
course_course_enrolled varchar(20),

constraint fkey_course_enrolled_sid foreign key (course_enrolled_sid) references student(sid),
constraint fkey_course_enrolled_course_id foreign key (course_course_enrolled) references course(course_id)
);



create table if not exists score_term1_2030 (
sid int,
course_id_score_term1_2030 varchar(20),
score int,

constraint fkey_score_term1_sid foreign key (sid) references student(sid),
constraint fkey_score_term1_course_id foreign key (course_id_score_term1_2030) references course(course_id)
);

create table if not exists score_term2_2030 (
sid int,
course_id_score_term2_2030 varchar(20),
score int,

constraint fkey_score_term2_sid foreign key (sid) references student(sid),
constraint fkey_score_term2_course_id foreign key (course_id_score_term2_2030) references course(course_id)
);

-- drop/ delete table
drop table student;


-- insert values
insert into program value ('CST_arch0', 'Architectural Technician', 'Ottawa')
-- delete all value in the table
delete from program stu;

-- insert values to program
insert into program value ('CST_arch01', 'Architectural Technician', 'CDI '),
                          ('CST_AuRo01', 'Automation and Robotics', 'CDI '),
                          ('EAS_BT01', 'Biotechnology - Advanced', 'Perth'),
                          ('AT_CS01', 'Computer Programming', 'Perth'),
                          ('AT_wd01', 'Web Development and Internet Applications', 'Ottawa'),
                          ('AT_mb01', 'Mobile Application Design and Development', 'Ottawa');
                      
											
-- I want to add a colume (coursename) to course
alter table course add course_name varchar(30);
-- error - data too long for column course_name at row 2, then make it varchar longer
alter table course change course_name course_name varchar(100);


-- insert values to course (courseid(primary key), pgid, coursename)
insert into course value ('ARC8401', 'CST_arch01', 'Working Drawings I'),
											   ('ARC8421', 'CST_arch01', 'Construction Methods and Materials I'),
												 ('CAD8407', 'CST_arch01', 'Architectural CAD I'),
												 ('GED2012', 'CST_arch01', 'Achieving Success in the 21st Century'),
												 ('ENL1813T', 'CST_arch01', 'Communications I'),
												 ('CAD8300', 'CST_AuRo01', 'Computer Aided Design/Drafting (CAD/D)'),
												 ('ELN9104', 'CST_AuRo01', 'DC and AC Electronics'),
												 ('ENG8307', 'CST_AuRo01', 'Statics'),
												 ('ENL1814T', 'CST_AuRo01', 'Communications I'),
												 ('GEN0351', 'CST_AuRo01', 'Strategies for Learning'),
												 ('BIO1300', 'EAS_BT01', 'Cellular Biology'),
												 ('BIO1301', 'EAS_BT01', 'Biology Laboratory'),
												 ('BTC1304', 'EAS_BT01', 'Biosafety'),
												 ('BTC1305', 'EAS_BT01', 'Understanding Biotechnology'),
												 ('CHE1302', 'EAS_BT01', 'General Chemistry'),
												 ('CST7101', 'AT_CS01', 'Computer Essentials'),
												 ('CST7116', 'AT_CS01', 'Introduction to Computer Programming'),
												 ('CST7215', 'AT_CS01', 'Introduction to Database'),
												 ('ENL7777', 'AT_CS01', 'Communications I'),
												 ('MAT7100', 'AT_CS01', 'Technical Mathematics for Computer Science'),
												 ('CST8117', 'AT_wd01', 'Cross-Platform Web Design'),
												 ('CST8209', 'AT_wd01', 'Web Programming I'),
												 ('CST8260', 'AT_wd01', 'Database System and Concepts'),
												 ('CST8279', 'AT_wd01', 'Introduction Computer Programming Using Python'),
												 ('MAD7100', 'AT_wd01', 'Technical Mathematics for Computer Science'),
												 ('MAD8010', 'AT_mb01', 'Digital Citizenship'),
												 ('MAD9011', 'AT_mb01', 'Mobile Design Fundamentals'),
												 ('MAD8117', 'AT_mb01', 'Cross-Platform Web Design'),
												 ('MAD9014', 'AT_mb01', 'Cross-Platform App Development'),
												 ('MAD9112', 'AT_mb01', 'Essential Tools for Mobile Development');
												 
-- insert values to student (sid int primary key,name varchar(20),gender varchar(1),age int,race varchar(20),City varchar(20),pg_id varchar(20),)

insert into student value ('a', 'm', 20, 'South-Asian', 'Ranchi','EAS_BT01');
delete from student;

-- I need to set auto increment for sid
alter table student auto_increment = 2030000;

insert into student value (null, 'Ayat Curtis', 'Male', 20, 'South-Asian', 'Ranchi','EAS_BT01'),
                          (null, 'Alanna Mcphee', 'Female', 21, 'South-Asian', 'Delhi','AT_CS01'),
													(null, 'Tallulah Lister', 'Female', 19, 'Caucasian', 'Quebec City','AT_wd01'),
													(null, 'Fiona Davie', 'Female', 25, 'East-Asian', 'Beijing','AT_mb01'),
													(null, 'Milli Watson', 'Male', 31, 'Caucasian', 'Ottowa','CST_arch01'),
													(null, 'Khloe Talley', 'Male', 21, 'South-Asian', 'Ottawa','AT_CS01'),
													(null, 'Kirby Bryan', 'Male', 19, 'Black', 'Ottawa','AT_wd01'),
													(null, 'Felicia Walter', 'Female', 20, 'Caucasian', 'Ottawa','AT_mb01'),
													(null, 'Arielle Novak', 'Male', 18, 'Caucasian', 'Ottawa','AT_CS01'),
													(null, 'Guto Donaldson', 'Female', 18, 'East-Asian', 'HK','AT_CS01'),
													(null, 'Syed Zavala', 'Female', 18, 'Caucasian', 'Ottawa','EAS_BT01'),
													(null, 'Mairead Parrish', 'Female', 30, 'South-Asian', 'Delhi','EAS_BT01'),
													(null, 'White Blair', 'Male', 23, 'Caucasian', 'Ottawa','AT_CS01'),
													(null, 'Carlos Golden', 'Male', 26, 'South-Asian', 'Delhi','EAS_BT01'),
													(null, 'Winifred Broadhurst', 'Female', 23, 'Black', 'Lagos','CST_arch01'),
													(null, 'Jadine Frederick', 'Female', 27, 'Black', 'Edmonton','EAS_BT01'),
													(null, 'Sol Howells', 'Female', 33, 'East-Asian', 'Tokyo','AT_wd01'),
													(null, 'Asha Mackay', 'Male', 33, 'South-Asian', 'Mumbai','AT_CS01'),
													(null, 'Raheem Talbot', 'Other', 17, 'Latino', 'Ottawa','CST_arch01'),
													(null, 'Poppy Morse', 'Male', 16, 'Caucasian', 'Ottawa','EAS_BT01'),
													(null, 'Elias Wall', 'Male', 21, 'Caucasian', 'France','AT_CS01'),
													(null, 'Walid Pace', 'Male', 29, 'Native-American', 'Ottawa','AT_wd01'),
													(null, 'Amin Sharma', 'Female', 19, 'South-Asian', 'Delhi','AT_mb01'),
													(null, 'Joan Emerson', 'Other', 18, 'Black', 'Ottawa','AT_wd01'),
													(null, 'Loui Rayner', 'Female', 25, 'Caucasian', 'Ottawa','AT_wd01'),
													(null, 'Jad O Quinn', 'Male', 39, 'Caucasian', 'Ottawa','AT_mb01'),
													(null, 'Jaidan Parkes', 'Other', 28, 'Latino', 'Ottawa','CST_arch01'),
													(null, 'David Whittle', 'Male', 20, 'Caucasian', 'Ottawa','EAS_BT01'),
													(null, 'Julie Chavez', 'Other', 27, 'Caucasian', 'Ottawa','AT_mb01'),
													(null, 'Blanka Sims', 'Female', 21, 'East-Asian', 'Beijing','CST_arch01');
													


insert into course_enrolled value (2030000, 'BIO1301'),(2030000, 'BIO1300'),(2030001, 'CST7101'),(2030002, 'CST8117'),(2030003, 'MAD8117'),(2030003, 'MAD8010'),(2030004, 'ARC8401'),(2030004, 'ARC8421'),(2030005, 'CST7101'),(2030005, 'CST7116'),(2030006, 'CST8117'),(2030006, 'CST8209'),(2030007, 'MAD8010'),(2030007, 'MAD8117'),(2030007, 'MAD9011'),(2030008, 'CST7101'),(2030008, 'CST7116'),(2030009, 'CST7101'),(2030009, 'CST7116'),(2030009, 'CST7215'),(2030010, 'BIO1300'),(2030010, 'BIO1301'),(2030011, 'BIO1300'),(2030011, 'BIO1301'),(2030012, 'CST7215'),(2030012, 'ENL7777'),(2030013, 'BIO1300'),(2030013, 'ENL7777'),(2030014, 'ARC8401'),(2030014, 'ARC8421'),(2030015, 'CHE1302'),(2030015, 'BIO1300'),(2030016, 'CST8209'),(2030016, 'CST8260'),(2030017, 'CST7215'),(2030017, 'CST7116'),(2030018, 'CST7116'),(2030018, 'ARC8421'),(2030019, 'BIO1300'),(2030019, 'BTC1304'),(2030020, 'CST7101'),(2030020, 'CST7116'),(2030021, 'CST8117'),(2030021, 'CST8209'),(2030021, 'CST8260'),(2030022, 'MAD9014'),(2030023, 'CST8117'),(2030023, 'CST8209'),(2030024, 'CST8117'),(2030024, 'CST8279'),(2030025, 'MAD8010'),(2030025, 'MAD8117'),(2030026, 'ARC8401'),(2030026, 'ARC8421'),(2030027, 'BIO1301'),(2030027, 'BIO1300'),(2030028, 'MAD9011'),(2030028, 'MAD8117'),(2030029, 'ARC8401');
																	


-- add COLUMN
alter table course_enrolled add score int;
																	
			
-- Update
update student set name = 'Blanket Sims' where sid = 2030029;

-- delete data
insert into program value ('CST_arch0', 'Architectural Technician', 'Ottawa')
delete from program where pg_id = 'CST_arch0'

-- Select statement (Simple)
select * from program;
select pg_id from program;
select pg_id, pg_name from program;

-- Select Where clause
select age from student where age > 30; -- only show age not other information
select sid from student where age > 30;  -- show student ID of age > 30
select * from student where age > 30;  

-- Select AND, OR, NOT
-- And
select * from student where age < 20 and gender = 'female' and city = 'ottawa';
-- or
select * from student where age < 20 or gender = 'female';
-- not
select * from course where not pg_id_course = 'AT-wd01';
select * from course where not pg_id_course = 'AT-wd01' and not pg_id_course = 'CST_arch01';

-- And + or
select * from student where age < 20 and (race = 'Black' or race = 'Caucasian');

-- ORDER BY clause
select * from student order by age;
select * from student order by age asc;
select * from student order by gender desc;

select * from student order by pg_id_student asc, age desc ;

select distinct city from student order by city;

-- 	-------------------------------------------------
-- 	Group By  (How many program in each campus)
-- 	-------------------------------------------------
select pg_campus, count(pg_id) from program group by pg_campus;
-- 	-------------------------------------------------
-- 	Group By  (How many people enrolled in each course)
-- 	-------------------------------------------------
select course_course_enrolled, count(course_course_enrolled) from course_enrolled group by course_course_enrolled;
-- 	-------------------------------------------------
-- 	Group By - HAVING
-- 	-------------------------------------------------
select city, COUNT(sid) csid from student group by city having csid = 1;
select city, COUNT(sid) csid from student group by city having csid > 1;


-- sum() ,query the sum of score of certain student 
select sum(score) from course_enrolled where course_enrolled_sid = 2030004;

-- min() ,query the min score of all student
select min(score) as minscore from course_enrolled;
-- min() ,query the min age of student from Ottawa
select city, min(age) from student where city = 'ottawa';

-- max() ,query the max score of all student
select max(score) as maxscore from course_enrolled;

-- average() ,query the average score of student from certain course
select avg(score) as AvgScore from course_enrolled where course_course_enrolled = 'BIO1301' ;
-- average() ,query the average score of certain student.
select avg(score) as AvgScoreStudent from course_enrolled where course_enrolled_sid = 2030010 ;

-- count()
select count(city) from student where city = 'ottawa';

-- having()
select city, COUNT(sid) csid from student group by city having csid = 1;


 
 
 

-- innerjoin
          -- 1) Inner Join the student and program table ( IN wont show the program where there 
					       -- sql92 standard
select * from student, program where  student.pg_id_student = program.pg_id;
                 -- sql99 standard
select * from student inner join program on student.pg_id_student = program.pg_id;

          -- 2) Inner Join the student and program table (cpomputer programming
select * from student inner join program on student.pg_id_student = program.pg_id and program.pg_id = 'AT_CS01';

          -- 3) Inner Join the student and program table (other gender student in Architectural Technician)
select * from student inner join program on student.pg_id_student = program.pg_id and program.pg_id = 'CST_arch01' and student.gender = 'Other';
          
					-- 4) Inner Join, and count the number of the student number of all program
select student.pg_id_student,count(100) from student, program where  student.pg_id_student = program.pg_id group by student.pg_id_student;
          -- Inner Join, and count the number of the student number of certain program (AT_CS01)
select student.pg_id_student,count(100) from student, program where  student.pg_id_student = program.pg_id and program.pg_id = 'AT_CS01' group by student.pg_id_student;

          -- 5)The program that has student > than 6
-- 					??????

-- -------------------------------------------------------------------------------
--     outerjoin (left, right, full(use union better to replace full)
	-- -------------------------------------------------------------------------------
	
-- 	left outer JOIN (the program and course table)
select * from program left join course on pg_id = pg_id_course;
-- 	right outer JOIN (the program and course table)
select * from course right join program on pg_id_course = pg_id ;

select * from program right join course on pg_id = pg_id_course;
select * from course left join program on pg_id_course = pg_id ;



-- union
SELECT name  FROM teacher
where city = 'ottawa'
UNION
SELECT name  FROM student
where city = 'ottawa';

-- union multiple result set
select tid as id, age, gender, City from teacher
UNION
select sid as id, age, gender, city from student;


-- Use subqueries to perform complex queries (nested select)

-- 1
select * from student where age = (select max(age) from student);

-- 2 
select * from student where pg_id_student in ( SELECT pg_id from program where pg_name = 'Computer Programming' or pg_name = 'Mobile Application Design and Development');




