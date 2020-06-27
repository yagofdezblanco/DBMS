/*****************************************************************************************************/

/*1/ Si el jugador nacio en el año 2001 su posicion ha de ser Pivot*/

DELIMITER //

CREATE TRIGGER cambiaPosicion
	BEFORE UPDATE ON jugador
    FOR EACH ROW
    BEGIN
		IF NEW.anho = 2001 THEN
			SET NEW.posicion = 'Pivot';
		END IF;
	END //
    
DELIMITER ;

/*****************************************************************************************************/

/*2/ Si un jugador es eliminado ha de insertarse en la tabla historico_jugador*/

DELIMITER //

CREATE TRIGGER eliminarJugador
	BEFORE DELETE ON jugador 
	FOR EACH ROW
	BEGIN
		INSERT INTO historico_jugador VALUES(OLD.codigo,OLD.nombre,OLD.posicion,OLD.anho,CURDATE());
	END //

DELIMITER ;

/*****************************************************************************************************/

/*3/ Aplica descuento automatico al cambiar el descuento*/

DELIMITER //

CREATE TRIGGER cambiarDescuento
	BEFORE UPDATE ON producto
    FOR EACH ROW
    BEGIN
		SET NEW.precio = OLD.precio - (OLD.precio*NEW.descuento/100);
	END //
    
DELIMITER ;


#al eliminar una asignatura se añade a la base datos historicoAsigs
DELIMITER //

CREATE TRIGGER eliminarAsig
	BEFORE DELETE ON asignatura 
	FOR EACH ROW
	BEGIN
		INSERT INTO historicoAsigs VALUES(OLD.codigo,OLD.nombre,OLD.codCiclo);
	END //

DELIMITER ;
