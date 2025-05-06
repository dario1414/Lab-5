use Kitchen;
DELIMITER \\

create or replace procedure getRecipeInstructions(
    rid int,
    out recipeText VARCHAR(10000)
)
begin
    declare done int default false;
    declare instrNum varchar(10);
    declare instr varchar(5000);

    declare instr_cursor cursor for
        select Number, Instruction from RecipeInstruction where RecipeID = rid order by Number;

    declare continue handler for not found set done = true;

    select CONCAT(RcpName, Char(10)) into recipeText
    from Recipe where RecipeID = rid;

    -- loop through the cursor and add each numbered instruction to the recipe variable

end; \\

call getRecipeInstructions(2, @response);
select @response;