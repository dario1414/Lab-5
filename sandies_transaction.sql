START TRANSACTION;

-- This is the select to view the Ingredient quantities after subtraction (for testing)
SELECT I.IngdName, (I.Quantity - RI.Amount) AS NewQuantity
FROM Ingredient I
JOIN RecipeIngredient RI ON I.IngredientID = RI.IngredientID
WHERE RI.RecipeID = 1;

-- Update to subtract the amounts from the Ingredient quantities (making sure Quantity >= 0)
UPDATE Ingredient I
JOIN RecipeIngredient RI ON I.IngredientID = RI.IngredientID
SET I.Quantity = I.Quantity - RI.Amount
WHERE RI.RecipeID = 1
AND I.Quantity >= RI.Amount;

-- Rollback to ensure no changes are made for now
ROLLBACK;

-- Uncomment the line below and comment out ROLLBACK to commit changes once verified
-- COMMIT;
