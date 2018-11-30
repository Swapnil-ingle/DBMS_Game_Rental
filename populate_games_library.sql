DELIMITER $$
CREATE PROCEDURE populate_games_library()
BEGIN
  DECLARE i INT DEFAULT 0;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE games_library; SET FOREIGN_KEY_CHECKS=1;
  WHILE i < 1000000 DO
    INSERT INTO Games_Library(Title, Release_Date, Size_In_MB, Publisher_ID, Copies_Available, Price) 
    VALUES (
    	CONCAT("Gaming_Title_",i), 
    	FROM_UNIXTIME(UNIX_TIMESTAMP('2014-01-01 01:00:00')+FLOOR(RAND()*31536000)),
    	FLOOR(ROUND(RAND()*100,2)),
    	i+1,
	FLOOR(ROUND(RAND()*100,2)),
	ROUND(RAND()*100,2));
    
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
