DROP PROCEDURE IF EXISTS populate_publishers;
DELIMITER $$
CREATE PROCEDURE populate_publishers()
BEGIN
  DECLARE i INT DEFAULT 0;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE Publishers; SET FOREIGN_KEY_CHECKS=1;

  WHILE i < 1000000 DO
    INSERT INTO Publishers(Name, Country, Publisher_Desc) 
    VALUES (CONCAT(generate_fname(), i), generate_country_name(), "No Description");
    
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
