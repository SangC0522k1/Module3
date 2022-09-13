use classicmodels;
-- Tham số loại IN
DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(17))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;

-- Tham số loại OUT
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
-- Tham số loại INOUT
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
