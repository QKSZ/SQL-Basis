-- CASE WHEN: clasificar ventas por monto
SELECT vendedor, monto,
  CASE 
    WHEN monto > 1000 THEN 'Venta Alta'
    WHEN monto BETWEEN 300 AND 1000 THEN 'Venta Media'
    ELSE 'Venta Baja'
  END AS categoria
FROM ventas;

-- CASE WHEN + GROUP BY: contar por categoría
SELECT 
  CASE 
    WHEN monto > 1000 THEN 'Venta Alta'
    WHEN monto BETWEEN 300 AND 1000 THEN 'Venta Media'
    ELSE 'Venta Baja'
  END AS categoria,
  COUNT(*) AS cantidad
FROM ventas
GROUP BY categoria;

-- CTE: misma lógica más legible
WITH Formula AS (
  SELECT CASE 
    WHEN monto > 1000 THEN 'Venta Alta'
    WHEN monto BETWEEN 300 AND 1000 THEN 'Venta Media'
    ELSE 'Venta Baja'
  END AS categoria
  FROM ventas
)
SELECT categoria, COUNT(categoria) AS cantidad
FROM Formula
GROUP BY categoria;
