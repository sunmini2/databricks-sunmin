USE CATALOG raw_trn_000;
USE SCHEMA andy_test;

CREATE OR REPLACE TABLE test_identifier_clause AS
    (
        SELECT CAST(1 AS TINYINT) id
    )
    ;

DECLARE OR REPLACE VARIABLE v_source STRING = 'test_identifier_clause';
CACHE TABLE tblsource1 AS
    (
        SELECT
            a.id
            ,'The CACHE TABLE is working properly' example_description
        FROM test_identifier_clause a
    );
select * from tblsource1;
    SELECT
        a.id
        ,'The IDENTIFIER clause working properly' example_description
    FROM IDENTIFIER(v_source) a;

--It errors out when create the below
DECLARE OR REPLACE VARIABLE v_source STRING = 'test_identifier_clause'; --Specifying a 2nd time just to show it's not working on this section
CACHE TABLE tblsource2 AS --This does not work
--CREATE TEMPORARY VIEW tblsource2 AS --This does not work
--CREATE VIEW tblsource2 AS --This does not work
--CREATE OR REPLACE TABLE tblsource2 AS --This does work
    (
        SELECT
            a.id
            ,'The IDENTIFIER clause is NOT working inside the CREATE TEMPORARY VIEW, CREATE VIEW, or CACHE TABLE' example_description
        FROM IDENTIFIER(v_source) a
    );
select * from tblsource2;
