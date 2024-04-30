create database SISDB;
use SISDB;
create table Students(student_id int PRIMARY KEY,first_name varchar(20),last_name varchar(20),date_of_birth date,email varchar(100),phone_number int);
desc Students;
insert into Students values(1,"Bloom","Sky","2000-01-11","bloomsky@gmail.com",123456789);
insert into Students values(2,"Stella","Brandon","2002-10-07","stellabrandon@gmail.com",987654321);
insert into Students values(3,"Larissa","Smith","2003-09-08","larissasmith@gmail.com",23455678);
insert into Students values(4,"Peaches","Puddles","2003-08-08","peachespuddles@gmail.com",123554);
insert into Students values(5,"Harshitha","Lanke","2003-03-13","harshithalanke@gmail.com",2341589);
insert into Students values(6,"Priyanka","Chopra","2002-04-05","priyankachopra@gmail.com",25346189);
insert into Students values(7,"Vibha","Ewig","2000-11-17","vibhaewig@gmail.com",711783292);
insert into Students values(8,"Lakshmi","Nageswararao","2000-02-18","lakshminageswararao@gmail.com",218992);
insert into Students values(9,"Deepika","Padukone","2001-08-04","deepikapadukone@gmail.com",345289);
insert into Students values(10,"Anushka","Shetty","2000-05-03","anushkashetty@gmail.com",4253589);
select * from Students;

create table Teacher(teacher_id varchar(50) primary key,first_name varchar(20),last_name varchar(20),email varchar(100));
insert into Teacher values("A101","John","Werner","jw@gmail.com");
insert into Teacher values("B102","Emily","Johnson","ej@gmail.com");
insert into Teacher values("C103","Michal","Davis","md@gmail.com");
insert into Teacher values("D104","Sarah","Brown","sb@gmail.com");
insert into Teacher values("E105","Jennifer","Martinez","jm@gmail.com");
insert into Teacher values("F106","Christopher","Taylor","ct@gmail.com");
insert into Teacher values("G107","Amanda","Thompson","at@gmail.com");
insert into Teacher values("H108","Matthew","Gracia","mg@gmail.com");
insert into Teacher values("I109","Jessica","Anderson","ja@gmail.com");
insert into Teacher values("J110","Jennifer","Windget","jw@gmail.com");
select * from Teacher;

create table Courses(course_id int PRIMARY KEY,course_name varchar(30),credits int,teacher_id varchar(50),foreign key(teacher_id) references Teacher(teacher_id));
insert into Courses values(111,"English",5,"A101");
insert into Courses values(112,"Math",10,"B102");
insert into Courses values(113,"Science",15,"C103");
insert into Courses values(114,"Social",20,"D104");
insert into Courses values(115,"Economics",25,"E105");
insert into Courses values(116,"Geography",30,"F106");
insert into Courses values(117,"Calculus",35,"G107");
insert into Courses values(118,"History",40,"H108");
insert into Courses values(119,"Biology",45,"I109");
insert into Courses values(120,"Algebra",50,"J110");
select * from Courses;

create table Enrollments(enrollment_id int primary key,student_id int,foreign key(student_id) references Students(student_id),
course_id int,foreign key (course_id) references Courses(course_id),enrollment_date date);
insert into Enrollments values(11,1,111,"2024-01-01");
insert into Enrollments values(12,2,112,"2024-01-02");
insert into Enrollments values(13,3,113,"2024-01-03");
insert into Enrollments values(14,4,114,"2024-01-04");
insert into Enrollments values(15,5,115,"2024-01-05");
insert into Enrollments values(16,6,116,"2024-01-06");
insert into Enrollments values(17,7,117,"2024-01-07");
insert into Enrollments values(18,8,118,"2024-01-08");
insert into Enrollments values(19,9,119,"2024-01-09");
insert into Enrollments values(20,10,120,"2024-01-10");
select * from Enrollments;

create table Payments(payment_id varchar(100) primary key,student_id int,foreign key(student_id) references Students(student_id),
amount int,payment date);
insert into Payments values("P01",1,1000,"2024-02-01");
insert into Payments values("P02",2,2000,"2024-02-02");
insert into Payments values("P03",3,3000,"2024-02-03");
insert into Payments values("P04",4,4000,"2024-02-04");
insert into Payments values("P05",5,5000,"2024-02-05");
insert into Payments values("P06",6,6000,"2024-02-06");
insert into Payments values("P07",7,7000,"2024-02-07");
insert into Payments values("P08",8,8000,"2024-02-08");
insert into Payments values("P09",9,9000,"2024-02-09");
insert into Payments values("P10",10,10000,"2024-02-10");
select * from Payments;


insert into Students values(11,"John","Doe","1995-08-15","john.doe@gmail.com",1234567890);
select* from Students;

insert into Enrollments values(21,7,111,"2024-01-11");
select * from Enrollments; 

update Teacher set email="bs@gmail.com " where email="sb@gmail.com";
select * from Teacher;

delete from  Enrollments where student_id=10 and course_id=120;
select * from Enrollments;

update Courses set teacher_id="B102" where course_name="Calculus";
select * from Courses;

delete from Enrollments where student_id=4;
delete from Payments where student_id=4;
delete from Students where student_id=4;
select* from Students;

update Payments set amount=7500 where payment_id="P05";
select* from Payments;



select s.student_id,s.first_name,s.last_name,sum(amount) from Students s  join Payments p on s.student_id=p.student_id 
where s.student_id=5 group by s.student_id=p.student_id;

select c.course_id,c.course_name,count(student_id) from Enrollments e join Courses c 
on c.course_id=e.course_id  group by c.course_id,c.course_name;

select s.first_name,s.last_name,e.course_id,s.student_id  from Students s left join Enrollments e
on s.student_id=e.student_id where e.student_id is null;

select s.first_name,s.last_name,c.course_name from Students s join  Enrollments e  on s.student_id=e.student_id
join  Courses c on e.course_id=c.course_id;

select t.first_name,t.last_name,c.course_name from Teacher t join Courses c on t.teacher_id=c.teacher_id;

select s.first_name,s.last_name,c.course_name,e.enrollment_date from Students s join Enrollments e on 
s.student_id=e.student_id join Courses c on c.course_id=e.course_id where c.course_name="Calculus";

select s.first_name,s.last_name,p.amount from Students s left join Payments p on s.student_id=p.student_id
where p.amount is null;

select c.course_name,c.course_id,e.enrollment_id from Courses c left join Enrollments e
on c.course_id=e.course_id where e.course_id is null;

select Students.first_name, Students.last_name
from Students
join Enrollments e1 on Students.student_id = e1.student_id
join Enrollments e2 on Students.student_id = e2.student_id and e1.course_id <> e2.course_id
group by Students.student_id
having count(distinct e1.course_id)>1;

select t.first_name,t.last_name,c.course_name from Courses c left join Teacher t on 
t.teacher_id=c.course_id where c.course_name is null;



SELECT AVG(student_id) FROM (SELECT COUNT(student_id) FROM Enrollments GROUP BY course_id);

select student_id,amount from Payments where amount=(select max(amount) from Payments);

select course_id ,enrollment_id from Enrollments where enrollment_id=(
select max(enrollment_id ) from Enrollments where enrollment_id= (select count(enrollment_id) from Enrollments));

select student_id, first_name,last_name
from Students where (select COUNT(distinct course_id) from Courses) = (select COUNT(distinct course_id) 
from Enrollments where Students.student_id = Enrollments.student_id);

select t.first_name,t.last_name from Teacher t where teacher_id not in (select teacher_id from Courses);

select avg(age) as average_age from (select timestampdiff(YEAR, date_of_birth, CURDATE()) as age from Students) as student_ages;

select course_id,enrollment_id from Enrollments where enrollment_id not in (select course_name from Courses);

select e.student_id,e.course_id,SUM(p.amount) as total_payments from Enrollments e join Payments p on 
e.student_id = p.student_id group by e.student_id, e.course_id;

select student_id from Payments group by student_id having count(*)>1;

select s.student_id,s.first_name,s.last_name,sum(amount) from Students s left join Payments p on
p.student_id=s.student_id group by s.student_id,s.last_name,s.first_name;

select c.course_name,count(e.student_id) from Courses c left join Enrollments e on
e.course_id=c.course_id group by c.course_name;

select avg(amount) from Payments p join Students s on
s.student_id=p.student_id group by p.student_id;













