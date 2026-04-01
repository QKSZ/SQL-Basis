CREATE TABLE clientes (
  id INTEGER,
  nombre TEXT,
  ciudad TEXT
);

CREATE TABLE pedidos (
  id INTEGER,
  cliente_id INTEGER,
  producto TEXT,
  monto INTEGER
);

INSERT INTO clientes VALUES (1, 'Ana', 'San José');
INSERT INTO clientes VALUES (2, 'Carlos', 'Heredia');
INSERT INTO clientes VALUES (3, 'María', 'Cartago');
INSERT INTO clientes VALUES (4, 'Luis', 'Heredia');

INSERT INTO pedidos VALUES (1, 1, 'Laptop', 1500);
INSERT INTO pedidos VALUES (2, 1, 'Mouse', 200);
INSERT INTO pedidos VALUES (3, 2, 'Teclado', 350);
INSERT INTO pedidos VALUES (4, 3, 'Laptop', 1800);
INSERT INTO pedidos VALUES (5, 1, 'Monitor', 900);

SELECT clientes.nombre,pedidos.producto from clientes LEFT JOIN pedidos on clientes.id=pedidos.cliente_id;

SELECT clientes.nombre,sum(pedidos.monto) as total_gastado FROM clientes INNER JOIN pedidos on clientes.id=pedidos.cliente_id GROUP by clientes.nombre HAVING sum(pedidos.monto)> 500 ORDER by sum(pedidos.monto) DESC;
