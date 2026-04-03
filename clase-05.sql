
SELECT, WHERE, GROUP BY, HAVING, ORDER BY ✅
INNER JOIN y LEFT JOIN ✅
Subqueries ✅
CASE WHEN ✅
CTEs con WITH ✅
RANK y ROW_NUMBER ✅

CREATE TABLE ventas2 (
  id INTEGER,
  vendedor TEXT,
  mes TEXT,
  monto INTEGER
);

INSERT INTO ventas2 VALUES (1, 'Ana', 'Enero', 1500);
INSERT INTO ventas2 VALUES (2, 'Ana', 'Febrero', 1800);
INSERT INTO ventas2 VALUES (3, 'Ana', 'Marzo', 1200);
INSERT INTO ventas2 VALUES (4, 'Carlos', 'Enero', 900);
INSERT INTO ventas2 VALUES (5, 'Carlos', 'Febrero', 1100);
INSERT INTO ventas2 VALUES (6, 'Carlos', 'Marzo', 1600);
INSERT INTO ventas2 VALUES (7, 'María', 'Enero', 2000);
INSERT INTO ventas2 VALUES (8, 'María', 'Febrero', 1700);
INSERT INTO ventas2 VALUES (9, 'María', 'Marzo', 1900);

SELECT 
  vendedor,
  mes,
  monto,
  RANK() OVER (PARTITION BY mes ORDER BY monto DESC) AS puesto
FROM ventas2;
INSERT INTO ventas2 VALUES (10, 'Luis', 'Enero', 1500);

SELECT vendedor, mes, monto,
  RANK() OVER (PARTITION BY mes ORDER BY monto DESC) AS puesto
FROM ventas2 WHERE mes = 'Enero';

SELECT vendedor, mes, monto,
  ROW_NUMBER() OVER (PARTITION BY mes ORDER BY monto DESC) AS puesto
FROM ventas2 WHERE mes = 'Enero';

WITH pvendedores as (
	SELECT vendedor,mes,monto,
	row_number() OVER (PARTITION by mes ORDER by monto DESC) as puesto
	FROM ventas2)
	SELECT vendedor,mes,monto,puesto FROM pvendedores WHERE
