use p1;

select ssn
from students s
where s.name='Becky';

select major.name, major.level
from major join students using (snum)
where students.ssn=123097834;

select courses.name
from courses join departments
where department_code=code and departments.name='Computer Science';

select degrees.name, degrees.level
from degrees join departments
where department_code=code and departments.name='Computer Science';

select students.name
from minor join students using (snum);

select count(*)
from minor join students using (snum);

select s.name
from register r, students s, courses c
where r.snum=s.snum and r.course_number=c.number and c.name='Algorithm';

select students.name, students.snum
from students
order by students.dob limit 1;

select students.name
from students
where students.dob=(select max(students.dob) from students);

select students.name, students.snum, students.ssn
from students
where students.name like '%n%' 
and students.name like '%N%';

select students.name, students.snum, students.ssn
from students
where students.name not like '%n%' 
and students.name not like '%N%';

select c.number, c.name, count(*)
from courses c, register r
where c.number = r.course_number
group by r.course_number;

select students.name
from students join register using (snum)
where register.regtime='Fall2020';

select courses.number, courses.name
from courses join departments
where department_code=code and departments.name='Computer Science';

select courses.number, courses.name
from courses join departments
where department_code=code and (departments.name='Computer Science' or departments.name='Landscape Architect');