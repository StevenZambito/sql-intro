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

 CREATE TABLE "Departments" ("Id" SERIAL PRIMARY KEY,"DepartmentName" TEXT NOT NULL,"Building" TEXT);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

CREATE TABLE "Products" ("Id" SERIAL PRIMARY KEY, "Price" FLOAT, "Name" TEXT, "Description" TEXT, "QuantityInStock" INT);

CREATE TABLE "Orders" ("Id" SERIAL PRIMARY KEY, "OrderNumber" TEXT, "DatePlaced" TEXT, "Email" TEXT);

CREATE TABLE "ProductOrders" ("Id" SERIAL PRIMARY KEY, "ProductId" INTEGER REFERENCES "Products" ("Id"), "OrderId" INTEGER REFERENCES "Orders" ("Id"));
ALTER TABLE "ProductOrders" ADD COLUMN "OrderQuantity" INTEGER;

INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Development', 'Main');
INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension", "DepartmentId") VALUES ('Todd Smith', 40000, 'Programmer', false, 123, 1);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension", "DepartmentId") VALUES ('Barbara Ramsey', 80000, 'Manager', false, 234, 1);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "IsPartTime", "PhoneExtension", "DepartmentId") VALUES ('Tom Jones', 32000, 'Admin', true, 456, 2);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (12.45, 'Widget', 'The Original Widget', 100);
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (99.99	, 'Flowbee', 'Perfect for haircuts', 3);

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email") VALUES ('X529', 'Jan 1st, 2020 at 4:55PM', 'person@example.com');

INSERT INTO "ProductOrders" ("ProductId", "OrderId", "OrderQuantity") VALUES (1,1,3);
INSERT INTO "ProductOrders" ("ProductId", "OrderId", "OrderQuantity") VALUES (2, 1, 2);

SELECT "Employees"."FullName" FROM "Employees" JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId" WHERE "Departments"."Building" = 'North Side';
SELECT "Employees"."FullName" FROM "Employees" JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId" WHERE "Departments"."Building" = 'East Side';
SELECT "Employees"."FullName" FROM "Employees" JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId" WHERE "Departments"."Building" = 'Main';

SELECT * FROM "Orders" JOIN "ProductOrders" ON "ProductOrders"."OrderId" = "Orders"."Id" JOIN "Products" ON "Products"."Id" = "ProductOrders"."ProductId" WHERE "ProductOrders"."ProductId" = 2;

SELECT "OrderQuantity" FROM "ProductOrders" JOIN "Products" ON "ProductOrders"."ProductId" = "Products"."Id" JOIN "Orders" ON "ProductOrders"."OrderId" = "Orders"."Id" WHERE "Name" = 'Flowbee' AND "OrderNumber" = 'X529';