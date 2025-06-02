USE CATALOG sunmin_catalog;
USE SCHEMA default;

CREATE OR REPLACE TABLE test_identifier_clause AS
(
SELECT CAST(1 AS TINYINT) id
);


DECLARE v_source STRING DEFAULT 'sunmin_catalog.default.test_identifier_clause';
------- Use the variable in the IDENTIFIER in a FROM statement in a CACHE TABLE --------
CACHE TABLE cache_table_v1 AS
(
SELECT
a.id
FROM IDENTIFIER(v_source) a
);

------- This throws the error --------
SELECT *
FROM cache_table_v1 a;
