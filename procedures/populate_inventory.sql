DROP PROCEDURE IF EXISTS populate_inventory;
DELIMITER $$
CREATE PROCEDURE populate_inventory()
BEGIN
  DECLARE i INT DEFAULT 0;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE inventory; SET FOREIGN_KEY_CHECKS=1;

  WHILE i < 1000000 DO
    INSERT INTO inventory(Barcode, Game_ID) 
    VALUES (CONCAT("Gaming_", i, "_BAR"), i+1);
    
    IF i % 1000 = 0
      THEN 
        COMMIT;
    END IF;

    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
