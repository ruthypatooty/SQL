CREATE DEFINER=`root`@`localhost` PROCEDURE `add_edit_record`(
    IN inId INT,
    IN inFirst_name VARCHAR(45),
    IN inLast_name VARCHAR(45),
    IN inDepartment VARCHAR(45),
    IN inNotes VARCHAR(45)
)

BEGIN 
    if inId = 0 then
        INSERT INTO record_table(first_name, last_name, department, notes)
        VALUES(inFirst_name, inLast_name, inDepartment, inNotes);
    else
        UPDATE record_table
        SET
        first_name = inFirst_name,
        last_name = inLast_name,
        department = inDepartment,
        notes =  inNotes
        WHERE id = inId;
    END IF;

    SELECT ROW_COUNT() AS 'affectedRows';

END