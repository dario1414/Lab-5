CREATE VIEW ShoppingList AS
SELECT IngredientID, IngdName, MeasurementUnit, Quantity, Location
FROM Ingredient
WHERE Quantity < 1 OR Quantity IS NULL;
SELECT S.*
FROM ShoppingList S
JOIN Ingredient I ON S.IngdName = I.IngdName
JOIN RecipeIngredient RI ON I.IngredientID = RI.IngredientID
WHERE RI.RecipeID = 2;
