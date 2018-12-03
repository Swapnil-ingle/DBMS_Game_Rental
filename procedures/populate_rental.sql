DROP PROCEDURE IF EXISTS populate_rental;
DELIMITER $$
CREATE PROCEDURE populate_rental()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE rented_on_date_var DATE;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE rental; SET FOREIGN_KEY_CHECKS=1;

  WHILE i < 1000000 DO
    SET rented_on_date_var = FROM_UNIXTIME(UNIX_TIMESTAMP('2014-01-01 01:00:00')+FLOOR(RAND()*31536000));
    INSERT INTO Rental(Inventory_Item_ID, Customer_ID, Payment, Rented_On_Date, Returned_Date) 
    VALUES (
      i+1,
      i+1,
      ROUND(RAND()*100,2),
      rented_on_date_var,
      DATE_ADD(rented_on_date_var, INTERVAL FLOOR(ROUND(RAND()*100,2)) DAY)
      );

    IF i % 1000 = 0
      THEN 
        COMMIT;
    END IF;
    
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
