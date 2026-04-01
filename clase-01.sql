CREATE TABLE ventas (
  id INTEGER,
  vendedor TEXT,
  region TEXT,
  producto TEXT,
  monto INTEGER,
  mes TEXT
);

INSERT INTO ventas VALUES (1, 'Ana', 'Norte', 'Laptop', 1500, 'Enero');
INSERT INTO ventas VALUES (2, 'Carlos', 'Sur', 'Mouse', 200, 'Enero');
INSERT INTO ventas VALUES (3, 'Ana', 'Norte', 'Teclado', 350, 'Febrero');
INSERT INTO ventas VALUES (4, 'Luis', 'Norte', 'Laptop', 1800, 'Febrero');
INSERT INTO ventas VALUES (5, 'Carlos', 'Sur', 'Laptop', 1600, 'Marzo');
INSERT INTO ventas VALUES (6, 'Ana', 'Norte', 'Mouse', 180, 'Marzo');
INSERT INTO ventas VALUES (7, 'Luis', 'Sur', 'Teclado', 400, 'Enero');
INSERT INTO ventas VALUES (8, 'María', 'Norte', 'Laptop', 1700, 'Febrero');
INSERT INTO ventas VALUES (9, 'María', 'Sur', 'Mouse', 220, 'Marzo');
INSERT INTO ventas VALUES (10, 'Carlos', 'Norte', 'Teclado', 300, 'Marzo');

SELECT vendedor,sum(monto) as Total_ventas FROM ventas GROUP by vendedor HAVING sum(monto)>1500 ORDER by sum(monto) DESC;

SELECT vendedor,region,sum(monto) as total_ventas FROM ventas WHERE region = 'Norte' GROUP by vendedor HAVING sum(monto)>1000;
