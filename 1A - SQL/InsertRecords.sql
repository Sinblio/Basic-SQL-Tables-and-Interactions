use p1;


INSERT INTO Students VALUES (1001, 654651234, 'Randy', 'M', '2000-12-01', '301 E Hall', '5152700988', '121 Main', '7083066321');
INSERT INTO Students VALUES (1002, 123097834, 'Victor', 'M', '2000-05-06', '270 W Hall', '5151234578', '702 Walnut', '7080366333');
INSERT INTO Students VALUES (1003, 978012431, 'John', 'M', '1999-07-08', '201 W Hall', '5154132805', '888 University', '5152012011');
INSERT INTO Students VALUES (1004, 746897816, 'Seth', 'M', '1998-12-30', '199 N Hall', '5158891504', '21 Green', '5154132907');
INSERT INTO Students VALUES (1005, 186032894, 'Nicole', 'F', '2001-04-01', '178 S Hall', '5158891155', '13 Gray', '5157162071');
INSERT INTO Students VALUES (1006, 534218752, 'Becky', 'F', '2001-05-16', '12 N Hall', '5157083698', '189 Clark', '2034367632');
INSERT INTO Students VALUES (1007, 432609519, 'Kevin', 'M', '2000-08-12', '75 E Hall', '5157082497', '89 National', '7182340772');

Insert into departments values (401, 'Computer Science', '5152982801', 'LAS');
Insert into departments values (402, 'Mathematics', '5152982802', 'LAS');
Insert into departments values (403, 'Chemical Engineering', '5152982803', 'Engineering');
Insert into departments values (404, 'Landscape Architect', '5152982804', 'Design');

insert into degrees value ('Computer Science', 'BS', 401);
insert into degrees value ('Software Engineering', 'BS', 401);
insert into degrees value ('Computer Science', 'MS', 401);
insert into degrees value ('Computer Science', 'PhD', 401);
insert into degrees value ('Applied Mathematics', 'MS', 402);
insert into degrees value ('Chemical Engineering', 'BS', 403);
insert into degrees value ('Landscape Architect', 'BS', 404);

insert into major value (1001, 'Computer Science', 'BS');
insert into major value (1002, 'Software Engineering', 'BS');
insert into major value (1003, 'Chemical Engineering', 'BS');
insert into major value (1004, 'Landscape Architect', 'BS');
insert into major value (1005, 'Computer Science', 'MS');
insert into major value (1006, 'Applied Mathematics', 'MS');
insert into major value (1007, 'Computer Science', 'PhD');

insert into minor value (1007, 'Applied Mathematics', 'MS');
insert into minor value (1005, 'Applied Mathematics', 'MS');
insert into minor value (1001, 'Software Engineering', 'BS');

insert into courses value (113, 'Spreadsheet', 'Microsoft Excell and Acess', 3, 'Undergraduate', 401);
insert into courses value (311, 'Algorithm', 'Design and Analysis', 3, 'Undergraduate', 401);
insert into courses value (531, 'Theory of Computation', 'Theorem and Probability', 3, 'Graduate', 401);
insert into courses value (363, 'Database', 'Design Principle', 3, 'Undergraduate', 401);
insert into courses value (412, 'Water Management', 'Water Management', 3, 'Undergraduate', 404);
insert into courses value (228, 'Special Topics', 'Interesting Topics about CE', 3, 'Undergraduate', 403);
insert into courses value (101, 'Calculus', 'Limit and Derivative', 4, 'Undergraduate', 402);

insert into register value (1001, 363, 'Fall2020', 3);
insert into register value (1002, 311, 'Fall2020', 4);
insert into register value (1003, 228, 'Fall2020', 4);
insert into register value (1004, 363, 'Spring2021', 3);
insert into register value (1005, 531, 'Spring2021', 4);
insert into register value (1006, 363, 'Fall2020', 3);
insert into register value (1007, 531, 'Spring2021', 4);
