-- 1. Select all columns from the Ingredient table
SELECT * FROM Ingredient;

-- 2. Select only the IngdName and Quantity columns from the Ingredient table
SELECT IngdName, Quantity FROM Ingredient;

-- 3. Select all columns for Ingredients that are stored in the upper cabinet
SELECT * FROM Ingredient
WHERE Location = 'upper cabinet';

-- 4. Select all columns for Ingredients that are stored in the upper cabinet and have a quantity greater than 15
SELECT * FROM Ingredient
WHERE Location = 'upper cabinet' AND Quantity > 15;

-- 5. Select ToolName and Note from Tools that have a name ending with “measure”
SELECT ToolName, Note FROM Tool
WHERE ToolName LIKE '%measure';

-- 6. Repeat the query above but change the name of the “ToolName” column in the result to “Implement”
SELECT ToolName AS Implement, Note FROM Tool
WHERE ToolName LIKE '%measure';

-- 7. Select the IngdName and Quantity from the Ingredient table. Organize the results by quantity from least to greatest
SELECT IngdName, Quantity FROM Ingredient
ORDER BY Quantity ASC;

-- 8. Repeat the above query but limit the results to 10 rows
SELECT IngdName, Quantity FROM Ingredient
ORDER BY Quantity ASC
LIMIT 10;

-- 9. Select only distinct measurement units from the Ingredient table
SELECT DISTINCT MeasurementUnit FROM Ingredient;
