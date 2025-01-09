Create database Kitchen;
Use Kitchen;
START TRANSACTION;

CREATE TABLE Tool (
    ToolID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ToolName varchar(100)  NOT NULL ,
    Note varchar(1000)  NULL
);

CREATE TABLE Ingredient (
    IngredientID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    IngdName varchar(100)  NOT NULL ,
    MeasurementUnit varchar(50)  NULL ,
    Quantity decimal(5,2)  NULL ,
    Location varchar(100)  NULL ,
	CONSTRAINT CHK_Quantity check (Quantity >= 0)
);


CREATE TABLE Recipe (
    RecipeID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    RcpName varchar(100)  NOT NULL ,
    RcpNote varchar(5000)  NULL
);

CREATE TABLE RecipeIngredient (
    RecipeID int  NOT NULL ,
    IngredientID int  NOT NULL ,
    Amount decimal(5,2)  NOT NULL ,
	PRIMARY KEY(RecipeID, IngredientID),
	FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
	FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)

);

CREATE TABLE RecipeTool (
    RecipeID int  NOT NULL ,
    ToolID int  NOT NULL ,
	PRIMARY KEY(RecipeID, ToolID),
	FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
	FOREIGN KEY (ToolID) REFERENCES Tool(ToolID)
);

CREATE TABLE RecipeInstruction (
    RecipeID int  NOT NULL ,
    Number int  NOT NULL ,
    Instruction varchar(5000)  NOT NULL ,
    PRIMARY KEY (RecipeID,Number),
	FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)

);

COMMIT;

INSERT INTO Kitchen.Tool (ToolName,Note) VALUES
	 (N'Large Frying Pan',N'non-stick; left cabinet'),
	 (N'Small Frying Pan',N'non-stick; left cabinet'),
	 (N'Large mixing bowl',N'left island cabinet'),
	 (N'Medium mixing bowl',N'left island cabinet'),
	 (N'Small mixing bowl',N'left island cabinet'),
	 (N'Whisk',N'middle drawer'),
	 (N'Scraper',N'middle drawer'),
	 (N'1 cup measure',N'left drawer'),
	 (N'1/2 cup measure',N'left drawer'),
	 (N'1/3 cup measure',N'left drawer');
INSERT INTO Kitchen.Tool (ToolName,Note) VALUES
	 (N'1/4 cup measure',N'left drawer'),
	 (N'1 tablespoon measure',N'left drawer'),
	 (N'1/2 tablespoon measure',N'left drawer'),
	 (N'1 teaspoon measure',N'left drawer'),
	 (N'1/2 teaspoon measure',N'left drawer'),
	 (N'1/4 teaspoon measure',N'left drawer'),
	 (N'liquid measure',N'pyrex; 2 cups; top left cabinet'),
	 (N'cookie pan',N'blue; cooks fast; middle bottom cabinet'),
	 (N'dutch oven',N'iron; 100 yrs old; right bottom cabinet'),
	 (N'pie pan',N'pyrex; left bottom cabinet');
INSERT INTO Kitchen.Tool (ToolName,Note) VALUES
	 (N'fork',N'cutlery drawer'),
	 (N'mixing spoon',N'right drawer'),
	 (N'spring-form pan',N'left bottom cabinet');

INSERT INTO Kitchen.Ingredient (IngdName,MeasurementUnit,Quantity,Location) VALUES
	 (N'Sugar',N'cups',10.00,N'upper cabinet'),
	 (N'Brown sugar',N'cups',7.00,N'upper cabinet'),
	 (N'Flour',N'cups',12.00,N'upper cabinet'),
	 (N'Walnuts',N'cups',3.00,N'freezer'),
	 (N'Yeast',N'teaspoons',15.00,N'freezer'),
	 (N'Baking powder',N'teaspoons',25.00,N'upper cabinet'),
	 (N'Baking soda',N'teaspoons',24.00,N'upper cabinet'),
	 (N'salt',N'teaspoons',40.00,N'upper cabinet'),
	 (N'peanut butter',N'cups',2.50,N'refrigerator'),
	 (N'butter',N'lbs',5.00,N'freezer');
INSERT INTO Kitchen.Ingredient (IngdName,MeasurementUnit,Quantity,Location) VALUES
	 (N'vanilla',N'teaspoons',14.00,N'small cabinet'),
	 (N'eggs',NULL,12.00,N'refrigerator'),
	 (N'shortening',N'cups',13.00,N'upper cabinet'),
	 (N'graham crackers',N'cups',NULL,NULL),
	 (N'cream cheese',N'oz',24.00,N'refrigerator'),
	 (N'sour cream',N'oz',16.00,N'refrigerator');

INSERT INTO Kitchen.Recipe (RcpName,RcpNote) VALUES
	 (N'Sandies Cookies',NULL),
	 (N'Peanut Butter Cookies',N'delicious'),
	 (N'Cheese Cake',N'the best');
    
INSERT INTO Kitchen.RecipeTool (RecipeID,ToolID) VALUES
	 (1,3),
	 (1,8),
	 (1,14),
	 (1,18),
	 (1,22),
	 (2,3),
	 (2,4),
	 (2,8),
	 (2,9),
	 (2,14);
INSERT INTO Kitchen.RecipeTool (RecipeID,ToolID) VALUES
	 (2,16),
	 (2,18),
	 (2,21),
	 (2,22),
	 (3,3),
	 (3,5),
	 (3,6),
	 (3,8),
	 (3,9),
	 (3,12);
INSERT INTO Kitchen.RecipeTool (RecipeID,ToolID) VALUES
	 (3,14),
	 (3,16),
	 (3,23);

INSERT INTO Kitchen.RecipeIngredient (RecipeID,IngredientID,Amount) VALUES
	 (1,1,0.50),
	 (1,3,2.00),
	 (1,4,1.00),
	 (1,10,0.50),
	 (1,11,1.00),
	 (2,1,1.00),
	 (2,2,1.00),
	 (2,3,3.00),
	 (2,7,2.00),
	 (2,8,0.13);
INSERT INTO Kitchen.RecipeIngredient (RecipeID,IngredientID,Amount) VALUES
	 (2,9,1.00),
	 (2,10,0.50),
	 (2,11,1.00),
	 (2,12,2.00),
	 (2,13,0.50),
	 (3,1,1.87),
	 (3,8,0.13),
	 (3,10,0.50),
	 (3,11,2.00),
	 (3,12,4.00);
INSERT INTO Kitchen.RecipeIngredient (RecipeID,IngredientID,Amount) VALUES
	 (3,14,1.50),
	 (3,15,24.00),
	 (3,16,16.00);

INSERT INTO Kitchen.RecipeInstruction (RecipeID,Number,Instruction) VALUES
	 (1,1,N'Cream butter and sugar'),
	 (1,2,N'Add vanilla and flour, mix well'),
	 (1,3,N'Add nuts, mix'),
	 (1,4,N'Drop by teaspoon onto ungreesed cookie sheet'),
	 (1,5,N'Cook at 325 F for 18-20 mins. Do not brown'),
	 (2,1,N'Preheat oven to 350 F'),
	 (2,2,N'Thoroughly cream shortening, vanilla, sugar, brown sugar'),
	 (2,3,N'Add eggs and beat well'),
	 (2,4,N'Stir in peanut butter'),
	 (2,5,N'In a separate bowl, mix together flour, salt, baking soda');
INSERT INTO Kitchen.RecipeInstruction (RecipeID,Number,Instruction) VALUES
	 (2,6,N'Add flour mixture to peanut butter mixture, combine thoroughly'),
	 (2,7,N'Form into tiny balls and place on cookie sheets'),
	 (2,8,N'Press each cookie twice with the back of a fork to make a crisscross design'),
	 (2,9,N'Bake 8-10 mins'),
	 (3,1,N'Crumb crust: Mix graham cracker crumbs, 1/4 c sugar (scant), butter. Press firmly over the bottom and up the sides 2 1/2 inches of a heavily buttered spring-form pan. Chill.'),
	 (3,2,N'Filling: Let cream cheese soften in a bowl'),
	 (3,3,N'Blend 1 1/2 c sugar with cream cheese'),
	 (3,4,N'Add salt. Beat until fluffy'),
	 (3,5,N'Add eggs one at a time beating well at low speed after each addition'),
	 (3,6,N'Beat in 1 tsp. vanilla and 8 oz sour cream');
INSERT INTO Kitchen.RecipeInstruction (RecipeID,Number,Instruction) VALUES
	 (3,7,N'Pour into crumb crust'),
	 (3,8,N'Bake at 350 F for 50 mins or more until up to the rim of the pan and slightly browned'),
	 (3,9,N'Remove from oven and let stand for 15 mins'),
	 (3,10,N'Topping: Mix remaining 8 oz. sour cream with 1 tsp vanilla and 2 tblsp sugar'),
	 (3,11,N'Spead topping on cake. Return to oven for 10 minutes'),
	 (3,12,N'CHILL completely');