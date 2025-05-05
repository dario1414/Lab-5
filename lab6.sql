USE Kitchen;

-- 1. Select Number and Instruction from RecipeInstruction for Recipes with RcpName that includes ‘Sandies’
SELECT Number, Instruction
FROM RecipeInstruction
WHERE RecipeID = (
    SELECT RecipeID
    FROM Recipe
    WHERE RcpName LIKE '%Sandies%'
) LIMIT 100;

-- 2. Get names of all the tools needed to make Sandies (RecipeID 1)
SELECT Tool.ToolName
FROM RecipeTool
INNER JOIN Tool ON RecipeTool.ToolID = Tool.ToolID
WHERE RecipeTool.RecipeID = 1;

-- 3. FULL JOIN on Ingredient and RecipeIngredient to find unused ingredients
SELECT Ingredient.IngredientID, IngdName, Amount
FROM Ingredient
LEFT JOIN RecipeIngredient ON Ingredient.IngredientID = RecipeIngredient.IngredientID
UNION
SELECT Ingredient.IngredientID, IngdName, Amount
FROM Ingredient
RIGHT JOIN RecipeIngredient ON Ingredient.IngredientID = RecipeIngredient.IngredientID;

-- 4. Average quantity in stock for Ingredients measured in cups
SELECT AVG(Quantity) AS AvgCupsQuantity
FROM Ingredient
WHERE MeasurementUnit = 'cups';

-- 5. How many recipes use each tool (include tools used 0 times)
SELECT Tool.ToolName, COUNT(RecipeTool.RecipeID) AS RecipeCount
FROM Tool
LEFT JOIN RecipeTool ON Tool.ToolID = RecipeTool.ToolID
GROUP BY Tool.ToolName
LIMIT 100;
