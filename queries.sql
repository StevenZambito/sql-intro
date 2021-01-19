 createdb CompanyDatabase
 pgcli CompanyDatabase

 CREATE TABLE "Employees" 
 ("FullName" TEXT NOT NULL,
 "Salary" INT,
 "JobPosition" TEXT NOT NULL,
 "PhoneExtension" INT,
 "IsPartTime" BOOL,
 "Id" SERIAL PRIMARY KEY);


 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Lazy Larry', 200, 'Soldier', true, 478);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Darth Vader', 900, 'Sith', false, 666);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Boba Fett', 600, 'Bounty Hunter', false, 500);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Emperor Palpatine', 1000, 'Emperor', false, 667);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Stormtrooper', 200, 'Soldier', true, 211);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Luke Skywalker', 1000, 'Jedi', false, 344);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Han Solo', 600, 'Smuggler', true, 399);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('JarJar Binks', 150, 'Cook', true, 299);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Chewbacca', 600, 'Smuggler', true, 478);

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Little Annie', 100, 'Cook', true, 108);

 
 SELECT * FROM "Employees";

 SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = False;

 INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension") VALUES ('Leia Organa', 450, 'Software Developer', true, 396);

 UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';

 DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

 ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);