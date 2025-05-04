 CREATE DATABASE IF NOT EXISTS Kitchen;
USE Kitchen;

START TRANSACTION;

CREATE TABLE Tool (
    ToolID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ToolName VARCHAR(100) NOT NULL,
    Note VARCHAR(1000) NULL
);

CREATE TABLE Ingredient (
    IngredientID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    IngdName VARCHAR(100) NOT NULL,
    MeasurementUnit VARCHAR(50) NULL,
    Quantity DECIMAL(5,2) NULL,
    Location VARCHAR(100) NULL,
    CONSTRAINT CHK_Quantity CHECK (Quantity >= 0)
);

CREATE TABLE Recipe (
    RecipeID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    RcpName VARCHAR(100) NOT NULL,
    RcpNote VARCHAR(5000) NULL
);

CREATE TABLE RecipeIngredient (
    RecipeID INT NOT NULL,
    IngredientID INT NOT NULL,
    Amount DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

CREATE TABLE RecipeTool (
    RecipeID INT NOT NULL,
    ToolID INT NOT NULL,
    PRIMARY KEY (RecipeID, ToolID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (ToolID) REFERENCES Tool(ToolID)
);

CREATE TABLE RecipeInstruction (
    RecipeID INT NOT NULL,
    Number INT NOT NULL,
    Instruction VARCHAR(5000) NOT NULL,
    PRIMARY KEY (RecipeID, Number),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)
);

COMMIT;

-- ✅ INSERTS

INSERT INTO Tool (ToolName, Note) VALUES
('Large Frying Pan', 'non-stick; left cabinet'),
('Small Frying Pan', 'non-stick; left cabinet'),
('Large mixing bowl', 'left island cabinet'),
('Medium mixing bowl', 'left island cabinet'),
('Small mixing bowl', 'left island cabinet'),
('Whisk', 'middle drawer'),
('Scraper', 'middle drawer'),
('1 cup measure', 'left drawer'),
('1/2 cup measure', 'left drawer'),
('1/3 cup measure', 'left drawer'),
('1/4 cup measure', 'left drawer'),
('1 tablespoon measure', 'left drawer'),
('1/2 tablespoon measure', 'left drawer'),
('1 teaspoon measure', 'left drawer'),
('1/2 teaspoon measure', 'left drawer'),
('1/4 teaspoon measure', 'left drawer'),
('liquid measure', 'pyrex; 2 cups; top left cabinet'),
('cookie pan', 'blue; cooks fast; middle bottom cabinet'),
('dutch oven', 'iron; 100 yrs old; right bottom cabinet'),
('pie pan', 'pyrex; left bottom cabinet'),
('fork', 'cutlery drawer'),
('mixing spoon', 'right drawer'),
('spring-form pan', 'left bottom cabinet');

INSERT INTO Ingredient (IngdName, MeasurementUnit, Quantity, Location) VALUES
('Sugar', 'cups', 10.00, 'upper cabinet'),
('Brown sugar', 'cups', 7.00, 'upper cabinet'),
('Flour', 'cups', 12.00, 'upper cabinet'),
('Walnuts', 'cups', 3.00, 'freezer'),
('Yeast', 'teaspoons', 15.00, 'freezer'),
('Baking powder', 'teaspoons', 25.00, 'upper cabinet'),
('Baking soda', 'teaspoons', 24.00, 'upper cabinet'),
('salt', 'teaspoons', 40.00, 'upper cabinet'),
('peanut butter', 'cups', 2.50, 'refrigerator'),
('butter', 'lbs', 5.00, 'freezer'),
('vanilla', 'teaspoons', 14.00, 'small cabinet'),
('eggs', NULL, 12.00, 'refrigerator'),
('shortening', 'cups', 13.00, 'upper cabinet'),
('graham crackers', 'cups', NULL, NULL),
('cream cheese', 'oz', 24.00, 'refrigerator'),
('sour cream', 'oz', 16.00, 'refrigerator');

INSERT INTO Recipe (RcpName, RcpNote) VALUES
('Sandies Cookies', NULL),
('Peanut Butter Cookies', 'delicious'),
('Cheese Cake', 'the best');

INSERT INTO RecipeTool (RecipeID, ToolID) VALUES
(1,3), (1,8), (1,14), (1,18), (1,22),
(2,3), (2,4), (2,8), (2,9), (2,14),
(2,16), (2,18), (2,21), (2,22),
(3,3), (3,5), (3,6), (3,8), (3,9), (3,12),
(3,14), (3,16), (3,23);

INSERT INTO RecipeIngredient (RecipeID, IngredientID, Amount) VALUES
(1,1,0.50), (1,3,2.00), (1,4,1.00), (1,10,0.50), (1,11,1.00),
(2,1,1.00), (2,2,1.00), (2,3,3.00), (2,7,2.00), (2,8,0.13),
(2,9,1.00), (2,10,0.50), (2,11,1.00), (2,12,2.00), (2,13,0.50),
(3,1,1.87), (3,8,0.13), (3,10,0.50), (3,11,2.00), (3,12,4.00),
(3,14,1.50), (3,15,24.00), (3,16,16.00);

INSERT INTO RecipeInstruction (RecipeID, Number, Instruction) VALUES
(1,1,'Cream butter and sugar'),
(1,2,'Add vanilla and flour, mix well'),
(1,3,'Add nuts, mix'),
(1,4,'Drop by teaspoon onto ungreased cookie sheet'),
(1,5,'Cook at 325 F for 18-20 mins. Do not brown'),
(2,1,'Preheat oven to 350 F'),
(2,2,'Thoroughly cream shortening, vanilla, sugar, brown sugar'),
(2,3,'Add eggs and beat well'),
(2,4,'Stir in peanut butter'),
(2,5,'In a separate bowl, mix together flour, salt, baking soda'),
(2,6,'Add flour mixture to peanut butter mixture, combine thoroughly'),
(2,7,'Form into tiny balls and place on cookie sheets'),
(2,8,'Press each cookie twice with the back of a fork to make a crisscross design'),
(2,9,'Bake 8-10 mins'),
(3,1,'Crumb crust: Mix graham cracker crumbs, 1/4 c sugar (scant), butter. Press firmly over the bottom and up the sides 2 1/2 inches of a heavily buttered spring-form pan. Chill.'),
(3,2,'Filling: Let cream cheese soften in a bowl'),
(3,3,'Blend 1 1/2 c sugar with cream cheese'),
(3,4,'Add salt. Beat until fluffy'),
(3,5,'Add eggs one at a time beating well at low speed after each addition'),
(3,6,'Beat in 1 tsp. vanilla and 8 oz sour cream'),
(3,7,'Pour into crumb crust'),
(3,8,'Bake at 350 F for 50 mins or more until up to the rim of the pan and slightly browned'),
(3,9,'Remove from oven and let stand for 15 mins'),
(3,10,'Topping: Mix remaining 8 oz. sour cream with 1 tsp vanilla and 2 tblsp sugar'),
(3,11,'Spead topping on cake. Return to oven for 10 minutes'),
(3,12,'CHILL completely');
