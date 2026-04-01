-- Subquery con IN: clientes que compraron Laptop
SELECT nombre, ciudad FROM clientes
WHERE id IN (SELECT cliente_id FROM pedidos WHERE producto = 'Laptop');

-- Subquery con AVG: clientes que gastaron más que el promedio
SELECT clientes.nombre, clientes.ciudad
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre
HAVING SUM(pedidos.monto) > (SELECT AVG(monto) FROM pedidos);
