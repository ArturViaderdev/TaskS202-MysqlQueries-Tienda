# 📌 Sprint 2.2: SQL Evaluator (Tienda)

## How to Use the SQL Query Evaluator

1. **Create a repository on GitHub**
    - Use this repository as a _template_ and copy it to your account using the "Use this template" button.
2. **Edit your queries directly on GitHub**
    - In your repository, navigate to `queries/queries.sql`.
    - Click **“Edit this file”** (the pencil icon) and paste each query below its corresponding statement.
    - When you’re done, save the changes using “Commit changes” with a clear message.
3. **Check the execution**
    - The changes will be automatically applied to the main branch.
    - GitHub Actions will detect the new commit and launch the workflow.
4. **Review the results**
    - Once the workflow has finished, a file named `RESULTADOS.md` will be generated in the main branch.
    - Open it to see which queries passed or failed the tests.
5. **Fix the issues**
    - If any query is incorrect, edit `queries/queries.sql` again via GitHub’s web interface.
    - Commit again and wait for `RESULTADOS.md` to regenerate.
6. **Submit the link**
    - Once all queries have been validated, copy and share your repository’s URL on Moodle.

***
Data alone doesn't explain anything. With SQL, you learn to ask the questions that reveal what really matters.

## Task Overview

This task invites you to practice the art of formulating precise and useful questions to a database, an essential skill in backend development and data analysis. You'll work with two databases, **Tienda** and **Universidad**, allowing you to tackle everything from basic queries to more advanced operations with multiple tables, filtering, sorting, and aggregations. The goal isn't just to get the correct result, but to understand what you're asking, how you're doing it, and why.

Think of each query as a small logical thinking challenge: how to access relevant information, how to relate tables, and how to structure the query to get exactly what you need in the clearest and most optimized way possible.

## How to Complete the Task

- Import the two provided database schemas (**Tienda** and **Universidad**) into your MySQL environment.
- Each query is numbered. Write it, execute it, and verify it works correctly.
- Once you think a query is correct, reflect on whether it can be improved: Is there a clearer way? Can it be optimized? Research SQL best practices and optimization techniques.
- For submission, copy all queries to the corresponding automatic correction repository, following the instructions in the **README.md**.
- Review your results files to ensure everything is well-written and returns the expected output.
- When ready, add the links to your automatic correction repositories to Moodle and submit the task to your mentor.


## Tienda Database

**Auto-evaluation:** [Link to auto-evaluation repository](https://github.com/IT-Academy-Back/shop-sql-queries-evaluator)

We have two tables: **producto** and **fabricante**, with the following fields:


| Table | Fields |
| :-- | :-- |
| **producto** | codigo, nombre, precio, codigo_fabricante |
| **fabricante** | codigo, nombre |

The `codigo_fabricante` column in the **producto** table acts as a foreign key and relates to the `codigo` column in the **fabricante** table. This defines a **1:N** (one-to-many) relationship, where each manufacturer can have multiple associated products, but each product can only be linked to a single manufacturer.

**Solve the following queries on the database.**

If a name is indicated in parentheses, that must be the **alias** (column name) that the query result should have.

```sql
-- 1. List the name of all products in the producto table.
-- 2. List the names and prices of all products in the producto table.
-- 3. List all columns from the producto table.
-- 4. List the product names, price in euros (precio_eur) and price in US dollars (precio_usd) with an exchange rate of 1 € = 1 $.
-- 5. List the product names, price in euros and price in US dollars (with an exchange rate of 1 € = 1.1 $ and rounding the result to two decimal places). Use the following aliases for the columns: product name, euros, dollars.
-- 6. List the names (nombre) and prices of all products in the producto table, converting names to uppercase.
-- 7. List the names (nombre) and prices (precio) of products in the producto table, converting names to lowercase.
-- 8. List the name of all manufacturers in one column, and in another column get the first two characters of the manufacturer name in uppercase (iniciales).
-- 9. List the names and prices of products, rounding the price value (precio).
-- 10. List the names and prices of all products (truncated price) in the producto table, truncating the price value to display it without any decimal places.
-- 11. Show a list with the manufacturer codes that appear in the producto table, including possible repetitions.
-- 12. List the manufacturer codes that have products in the producto table, removing repeated codes.
-- 13. List the manufacturer names sorted in ascending order.
-- 14. List the manufacturer names sorted in descending order.
-- 15. List the product names and prices sorted, first by name in ascending order and second by price in descending order.
-- 16. Return a list with the first 5 rows of the fabricante table.
-- 17. Return a list with 2 rows starting from the fourth row of the fabricante table. The fourth row must also be included in the response.
-- 18. List the name and price of the cheapest product. (Use only ORDER BY and LIMIT clauses).
-- 19. List the name and price of the most expensive product. (Use only ORDER BY and LIMIT clauses).
-- 20. List the name of all products from the manufacturer whose manufacturer code is 2.
-- 21. Return a list with the product name, price, and manufacturer name (fabricante name) of all products in the database.
-- 22. List all products with name, price, and manufacturer name (fabricante name) sorted alphabetically.
-- 23. Return a list with the product code, product name, manufacturer code (codigo fabricante), and manufacturer name (nombre fabricante) of all products in the database.
-- 24. Return the name, price, and manufacturer name (fabricante) of the cheapest product.
-- 25. Return the product name, price, and its manufacturer name (fabricante) of the most expensive product.
-- 26. Return a list with name and price of all Lenovo manufacturer products.
-- 27. Return a list with name and price of all Crucial manufacturer products that have a price greater than 200 €.
-- 28. Return a list with name, price, and manufacturer name (fabricante) of all products from Asus, Hewlett-Packard, and Seagate manufacturers. Without using the IN operator.
-- 29. Return a list with name, price, and manufacturer name (fabricante) of all products from Asus, Hewlett-Packard, and Seagate manufacturers. Using the IN operator.
-- 30. Return a list with the name, price, and manufacturer name (fabricante) of products where the manufacturer name ends with the letter 'e'.
-- 31. Return a list with the product name, its price, and manufacturer name (fabricante) for all products whose manufacturers contain the letter 'w' in their name.
-- 32. Return a list with the product name, its price, and manufacturer name (fabricante) for all products with a price equal to or greater than 180 €. Sort results first by price in descending order and then by product name in ascending order.
-- 33. Return a list with the manufacturer code and name (fabricante) only of those manufacturers that have associated products in the database.
-- 34. Return a list of all manufacturers that exist in the database, along with the products each one has. Also include manufacturers that have no products. Show the manufacturer name (fabricante) and product name (producto).
-- 35. Return a list showing only the names of manufacturers (fabricante) that have no associated products.
-- 36. Return all Lenovo manufacturer products. (Without using INNER JOIN).
-- 37. Return all data from products that have the same price as the most expensive product from Lenovo manufacturer. (Without using INNER JOIN).
-- 38. List the name of the most expensive product from Lenovo manufacturer.
-- 39. List the name of the cheapest product from Hewlett-Packard manufacturer.
-- 40. Return all products in the database that have a price greater than or equal to the most expensive product from Lenovo manufacturer.
-- 41. List all Asus manufacturer products that have a price higher than the average price of all their products.
```

