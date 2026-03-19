-- 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre from producto;

-- 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre,precio from producto;

-- 3. Llista totes les columnes de la taula producto.
SELECT * from producto;

-- 4. Llista el nom dels productes, el preu en euros (precio_eur) i el preu en dòlars estatunidencs (precio_usd) amb un tipus de canvi de 1 € = 1 $.
SELECT nombre, precio as precio_eur, (precio*1) as precio_usd FROM producto;

-- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (amb un tipus de canvi de 1 € = 1,1 $ i arrodonint el resultat a dues xifres decimals). Utilitza els següents àlies per a les columnes: nom del producte, euros, dòlars.
SELECT nombre as "nom del producte", precio as euros, round(precio*1.1,2) as dòlars FROM producto;

-- 6. Llista els noms (nombre) i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UCASE(nombre) as nombre, precio FROM producto;

-- 7. Llista els noms (nombre) i els preus (precio) dels productes de la taula producto, convertint els noms a minúscula.
SELECT LCASE(nombre) as nombre, precio FROM producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant (iniciales).
SELECT nombre, UCASE(LEFT(nombre,2)) AS iniciales FROM fabricante;

-- 9. Llista els noms i els preus dels productes, arrodonint el valor del preu (precio)
SELECT nombre, ROUND(precio) AS precio FROM producto;

-- 10. Llista els noms i els preus de tots els productes (precio truncado) de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio,0) as "precio truncado" FROM producto;

-- 11. Mostra una llista amb els codis dels fabricants que apareixen a la taula producto, incloent possibles repeticions.
SELECT codigo_fabricante FROM producto;

-- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT(codigo_fabricante) AS codigo_fabricante FROM producto;

-- 13. Llista els noms dels fabricants ordenats de manera ascendent
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Llista els noms dels fabricants ordenats de manera descendent
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Llista els noms i els preus dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant (nombre del fabricante) de tots els productes de la base de dades.
SELECT p.nombre as nombre, p.precio, f.nombre AS 'nombre del fabricante' FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 22. Llista tots els productes amb nom, preu i nom del fabricant (nombre del fabricante) ordenats alfabèticament.
SELECT p.nombre as nombre, p.precio, f.nombre AS 'nombre del fabricante' FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante ORDER BY f.nombre;

-- 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricant (codigo fabricante) i nom del fabricant (nombre fabricante), de tots els productes de la base de dades.
SELECT p.codigo, p.nombre, f.codigo as 'codigo fabricante', f.nombre AS 'nombre fabricante' FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 24. Retorna el nom, el preu i el nom del fabricant (fabricante), del producte més barat.
SELECT p.nombre, p.precio, f.nombre AS fabricant FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante ORDER BY p.precio ASC LIMIT 1;

-- 25. Retorna el nom del producte, el preu i el nom del seu fabricant (fabricante), del producte més car.
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1;

-- 26. Retorna una llista amb nom i preu de tots els productes del fabricant Lenovo.
SELECT p.nombre,p.precio FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Lenovo';

-- 27. Retorna una llista amb nom i preu de tots els productes del fabricant Crucial que tinguin un preu major que 200 €
SELECT p.nombre,p.precio FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Crucial' AND p.precio>200;

-- 28. Retorna un llistat amb nom, preu i nom del fabricant (fabricante) de tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT p.nombre,p.precio,f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre ='Seagate';

-- 29. Retorna un llistat amb nom, preu i nom del fabricant (fabricante) de tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Fent servir l'operador IN.
SELECT p.nombre,p.precio,f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN('Asus','Hewlett-Packard','Seagate');

-- 30. Retorna un llistat amb el nom, el preu i el nom del fabricant (fabricante) dels productes, on el nom del fabricant acabi en la lletra 'e'.
SELECT p.nombre,p.precio,f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE SUBSTRING(f.nombre,-1) = 'e';

-- 31. Retorna un llistat amb el nom del producte, el seu preu i el nom del fabricant (fabricante), per a tots aquells productes els fabricants dels quals contenen la lletra 'w' en el seu nom.
SELECT p.nombre,p.precio,f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';

-- 32. Retorna un llistat amb el nom del producte, el seu preu i el nom del fabricant (fabricante), per a tots els productes amb un preu igual o superior a 180 €. Ordena els resultats, primer pel preu en ordre descendent i després pel nom del producte en ordre ascendent.
SELECT p.nombre,p.precio,f.nombre AS fabricante FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE p.precio>=180  ORDER BY p.precio DESC, p.nombre ASC;

-- 33. Retorna un llistat amb el codi i el nom de fabricant (fabricante), solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT f.codigo,f.nombre FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. Inclou també els fabricants que no tenen cap producte. Mostra el nom del fabricant (fabricante) i el nom del producte (producto).
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante AS f LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante;

-- 35. Retorna un llistat on només apareguin els noms dels fabricants (fabricante) que no tenen cap producte associat.
SELECT f.nombre AS fabricante FROM fabricante AS f LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36. Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT * FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre='Lenovo');

-- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT * from producto WHERE precio=(SELECT precio FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre='Lenovo') ORDER BY precio DESC LIMIT 1);

-- 38. Llista el nom del producte més car del fabricant Lenovo.
SELECT p.nombre FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Lenovo' ORDER BY p.precio DESC LIMIT 1;

-- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

-- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT codigo,nombre,precio,codigo_fabricante FROM producto WHERE precio>=(SELECT p.precio FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre='Lenovo' ORDER BY p.precio DESC LIMIT 1);

-- 41. Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT p.codigo,p.nombre,p.precio,p.codigo_fabricante FROM producto AS p JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre='Asus' AND p.precio>(SELECT AVG(p.precio) FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre='Asus');
