-- Create VIEW          (1)Simplify code (2)Security Reason, different User see different data
-- -----------------------------------------------------------------------------------------------

-- create [or replace]
-- view (viewname)
-- as (select statement) <-----package 

use DB_portfolio; 

create or replace
view view1_student
as select name,race from student;


-- Show the created view;
show tables; -- Only show the name of view and tables
show full tables; -- show also the data tyles

select * from view1_student;

-- --------------------
-- alter view
-- --------------------
-- Just use create or replace



-- --------------------
-- Remane view
-- --------------------




-- --------------------
-- drop  view
-- --------------------
drop view if exists view1_student;



-- ---------------------------------
Explain Create View

-- View just take the data from original table and create another virtual table, 
-- so later if I want to do the same query, then I just go directly to the View table, 
-- I dont need to do the query again. It helps alot if queries are complicates.
-- Also when the data in original table changed, we dont need to update the view table, 
-- it will retrieve data from original table everytime you view.
-- Another thing is you can restrict some information in one table from some 
-- people by giving them view table that doesn't doesnt contain that information 















