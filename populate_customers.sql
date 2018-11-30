DROP PROCEDURE IF EXISTS populate_customers;
DELIMITER $$
CREATE PROCEDURE populate_customers()
BEGIN
  DECLARE i INT DEFAULT 0;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE Customers; SET FOREIGN_KEY_CHECKS=1;

  WHILE i < 1000000 DO
    INSERT INTO Customers(First_Name, Last_Name, Contact_Number, Email, Address) 
    VALUES (
    	generate_fname(),
    	generate_lname(),
    	i+1,
      CONCAT("randomEmail_", i+1, "@gmail.com"),
      CONCAT("Street ", i+1)
    	);
    
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
