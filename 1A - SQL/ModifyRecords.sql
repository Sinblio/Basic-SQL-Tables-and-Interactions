use p1;

update students
set students.name = 'Scott'
where students.ssn = 746897816;

update major, students
set major.level='MS', major.name = 'Computer Science'
where students.snum=major.snum and students.ssn = 746897816;

delete from register
where register.regtime='Spring2021';