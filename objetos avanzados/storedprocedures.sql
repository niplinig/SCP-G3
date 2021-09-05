USE G3P1_contador_personas;

-- Procedi	mientos almacenados

-- INSERTS

DROP PROCEDURE IF EXISTS ingresar_ciudad;
DELIMITER //
CREATE PROCEDURE ingresar_ciudad(IN nombre varchar(45), IN sector varchar(45), IN poblacion INT)
BEGIN
	INSERT INTO Ciudad (Nombre, Sectores, Poblacion) VALUES (nombre, sector, poblacion);
END //
DELIMITER ;

call ingresar_ciudad("Napo", "Oeste", 45933);
/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_usuario;
DELIMITER //
CREATE PROCEDURE ingresar_usuario(IN idusuario varchar(10), IN telefono varchar(10))
BEGIN
	INSERT INTO Usuario (id_usuario, Telefono) VALUES (idusuario, telefono);
END //
DELIMITER ;

call ingresar_usuario("0706389510", "0992361009");
/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_cliente;
DELIMITER //
CREATE PROCEDURE ingresar_cliente(IN ruc varchar(13), IN nombreclie varchar(45))
BEGIN
	INSERT INTO Cliente (RUC, Nombre) VALUES (ruc, nombreclie);
END //
DELIMITER ;

call ingresar_cliente("1779238284567", "Juan Pueblo");
/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_grupos_puntoscomunicacion;
DELIMITER //
CREATE PROCEDURE ingresar_grupos_puntoscomunicacion(IN idgrupo INT,
IN operatividad TINYINT(1), IN cantidad INT, IN rango double(5,2))
BEGIN
	INSERT INTO Grupos_Puntos_Comunicacion (id_grupo, g_operativo, cantidad, rango_cubierto)
    VALUES (idgrupo, operatividad, cantidad, rango);
END //
DELIMITER ;

call ingresar_grupos_puntoscomunicacion(78961, 1, 996, 600.65);
/*-------------------------------------------------------*/


DROP PROCEDURE IF EXISTS ingresar_puntos_comunicacion;
DELIMITER //
CREATE PROCEDURE ingresar_puntos_comunicacion(IN mac varchar(48), IN p_latitud varchar(20), IN p_longitud varchar(20),
IN p_mensaje varchar(100), IN p_operativo varchar(20), IN p_rango float(5,2))
BEGIN
	INSERT INTO Puntos_Comunicacion (mac_address_bcn, latitud, longitud, mensaje, operativo, rango)
    VALUES (mac, p_latitud, p_longitud, p_mensaje, p_operativo, p_rango);
END //
DELIMITER ;

call ingresar_puntos_comunicacion('8E-59-F8-6B-95-B6', '-33.3871', '-24.2467', 'The notebooks for school', '1', '592.74'
);

/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_lugar;
DELIMITER //
CREATE PROCEDURE ingresar_lugar(IN L_codigoarea varchar(6), IN L_ubicacion varchar(30), IN L_latitud varchar(20),
IN L_longitud varchar(20), IN L_radio float(5,2), IN L_sector varchar(30), IN L_codpostal varchar(6), IN L_cant_personas INT,
IN L_ciudad varchar(10))
BEGIN
declare variable_ciudad varchar(10);
	SELECT Nombre INTO variable_ciudad FROM Ciudad WHERE Ciudad.Nombre = L_ciudad;

    if variable_ciudad is not null then
		INSERT INTO Lugar (codigo_area, ubicacion, latitud, longitud, radio, sector, codigo_postal, cantidad_personas, ciudad)
		VALUES (L_codigoarea, L_ubicacion, L_latitud, L_longitud, L_radio, L_sector, L_codpostal, L_cant_personas, L_ciudad);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error de ciudad';
	end if;

END //
DELIMITER ;

call ingresar_lugar('EQI389', 'Rotonda', '-84.7648', '-165.6275', '630.12', 'norte', '090106', '420', 'Guayaquil'
);

/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_registrode_observacion;
DELIMITER //
CREATE PROCEDURE ingresar_registrode_observacion(IN R_idobservacion INT, IN R_fecharegistro DATE, IN R_horaregistro TIME,
IN R_ubiobservador varchar(30), IN R_macaddress varchar(48))
BEGIN
declare variable_mac_address varchar(48);
	SELECT mac_address_bcn INTO variable_mac_address FROM Puntos_Comunicacion
    WHERE Puntos_Comunicacion.mac_address_bcn = R_macaddress;

    if variable_mac_address is not null then
		INSERT INTO Registra_Observacion (id_observacion, fecha_registro, hora_registro, ubicacion_observador, mac_address_punto)
		VALUES (R_idobservacion, R_fecharegistro, R_horaregistro, R_ubiobservador, R_macaddress);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error de MAC ADDRESS';
	end if;

END //
DELIMITER ;

call ingresar_registrode_observacion(9999, '2021-08-15', '22:20:55', 'PlazaVolare', '4E-03-FB-D1-A8-B5');

/*-------------------------------------------------------*/

DROP PROCEDURE IF EXISTS ingresar_chip_wireless;
DELIMITER //
CREATE PROCEDURE ingresar_chip_wireless(IN C_mac_address varchar(48), IN C_cedula varchar(10))
BEGIN
declare variable_cedula varchar(10);
	SELECT id_usuario INTO variable_cedula FROM Usuario
    WHERE Usuario.id_usuario = C_cedula;

    if variable_cedula is not null then
		INSERT INTO Chip_Wireless (mac_address_disp, Cedula)
		VALUES (C_mac_address, C_cedula);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error cedula inexistente';
	end if;

END //
DELIMITER ;

call ingresar_chip_wireless('43-9A-5E-38-9C-79', '0942343233');

/*-------------------------------------------------------*/

-- UPDATES

-- No se puede actualizar la tabla Asiste ni la tabla Registra
-- Debido a que cuentan con solo claves foraneas o claves primarias.

-- Tabla Chip_Wireless
-- Modificar el valor de Cedula
-- Recibe el id de la tabla y el nuevo valor para la Cedula

DROP PROCEDURE IF EXISTS update_Chip_Wireless_Cedula;
DELIMITER //
CREATE PROCEDURE update_Chip_Wireless_Cedula(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE mac_address_disp_resultante VARCHAR(48);
	DECLARE cedula_nueva VARCHAR(10);

	SET mac_address_disp_resultante = (SELECT mac_address_disp FROM Chip_Wireless WHERE mac_address_disp LIKE id_tabla);
	SET cedula_nueva = (SELECT id_usuario FROM Usuario WHERE id_usuario LIKE nuevo_valor);

	IF (mac_address_disp_resultante IS NOT NULL) THEN

		IF (cedula_nueva IS NOT NULL) THEN

			UPDATE Chip_Wireless
		    SET Cedula = cedula_nueva
		    WHERE mac_address_disp = mac_address_disp_resultante;
			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de id_usuario(Cedula) no existe en la talba Usuario';

		END IF;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_disp no existe en la tabla Chip_Wireless';

	END IF;
END//
DELIMITER ;

CALL update_Chip_Wireless_Cedula('73-97-C2-7D-E3-E8', '0706389510');

SELECT * FROM Chip_Wireless WHERE mac_addres_disp LIKE '73-97-C2-7D-E3-E8';

CALL update_Chip_Wireless_Cedula('73-97-C2-7D-E3-E8', '0656456546');

SELECT * FROM Chip_Wireless WHERE mac_addres_disp LIKE '73-97-C2-7D-E3-E8';

/*-------------------------------------------------------*/

-- Tabla Ciudad
-- Modificar el valor de Sectores
-- Recibe el id de la tabla y el nuevo valor para el Sector

DROP PROCEDURE IF EXISTS update_Ciudad_Sectores;
DELIMITER //
CREATE PROCEDURE update_Ciudad_Sectores(IN id_tabla VARCHAR(45), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE nombre_resultante VARCHAR(45);

	SET nombre_resultante  = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE id_tabla);

	IF (nombre_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('Norte', 'Sur', 'Este', 'Oeste', 'Noreste', 'Sureste', 'Suroeste', 'Noroeste')) THEN
			UPDATE Ciudad
		    SET Sectores = nuevo_valor
		    WHERE Nombre = nombre_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Sector no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Nombre no existe en la tabla Ciudad';

	END IF;
END//
DELIMITER ;

CALL update_Ciudad_Sectores('Ambato', 'Sur');

SELECT * FROM Ciudad WHERE Nombre LIKE 'Ambato';

CALL update_Ciudad_Sectores('Ambato', 'Norte');

SELECT * FROM Ciudad WHERE Nombre LIKE 'Ambato';

/*-------------------------------------------------------*/

-- Tabla Ciudad
-- Modificar el valor de Poblacion
-- Recibe el id de la tabla y el nuevo valor para la Poblacion

DROP PROCEDURE IF EXISTS update_Ciudad_Poblacion;
DELIMITER //
CREATE PROCEDURE update_Ciudad_Poblacion(IN id_tabla VARCHAR(45), IN nuevo_valor INT)
BEGIN

	DECLARE nombre_resultante VARCHAR(45);

	SET nombre_resultante  = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE id_tabla);

	IF (nombre_resultante IS NOT NULL) THEN

		IF (nuevo_valor > 0) THEN
			UPDATE Ciudad
		    SET Poblacion = nuevo_valor
		    WHERE Nombre = nombre_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Poblacion no permitido';

		END IF;
	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Nombre no existe en la tabla Ciudad';

	END IF;
END//
DELIMITER ;

CALL update_Ciudad_Poblacion('Ambato', 10);

SELECT * FROM Ciudad WHERE Nombre LIKE 'Ambato';

CALL update_Ciudad_Poblacion('Ambato', 165185);

SELECT * FROM Ciudad WHERE Nombre LIKE 'Ambato';

/*-------------------------------------------------------*/

-- Tabla Cliente
-- Modificar el valor de Nombre
-- Recibe el id de la tabla y el nuevo valor para el Nombre

DROP PROCEDURE IF EXISTS update_Cliente_Nombre;
DELIMITER //
CREATE PROCEDURE update_Cliente_Nombre(IN id_tabla VARCHAR(13), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE RUC_resultante VARCHAR(13);

	SET RUC_resultante = (SELECT RUC FROM Cliente WHERE RUC LIKE id_tabla);

	IF (RUC_resultante IS NOT NULL) THEN

		UPDATE Cliente
	    SET Nombre = nuevo_valor
	    WHERE RUC LIKE RUC_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de RUC no existe en la tabla Cliente';

	END IF;

END//
DELIMITER ;

CALL update_Cliente_Nombre('1711109093001', 'Nicolás Plaza');

SELECT * FROM CLiente WHERE RUC LIKE '1711109093001';

CALL update_Cliente_Nombre('1711109093001', 'Felicidad Cardenas');

SELECT * FROM CLiente WHERE RUC LIKE '1711109093001';

/*-------------------------------------------------------*/

-- Tabla Grupos_Puntos_Comunicacion
-- Modificar el valor de g_operativo
-- Recibe el id de la tabla y el nuevo valor para el Nombre

DROP PROCEDURE IF EXISTS update_GPC_g_operativo;
DELIMITER //
CREATE PROCEDURE update_GPC_g_operativo(IN id_tabla INT)
BEGIN

	DECLARE id_grupo_resultante INT;
	DECLARE g_operativo_anterior TINYINT;

	SET g_operativo_anterior = (SELECT g_operativo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);
	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN
		IF (g_operativo_anterior = 0) THEN

			UPDATE Grupos_Puntos_Comunicacion
			SET g_operativo = 1
			WHERE id_grupo = id_tabla;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			UPDATE Grupos_Puntos_Comunicacion
			SET g_operativo = 0
			WHERE id_grupo = id_tabla;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_GPC_g_operativo(10594);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

CALL update_GPC_g_operativo(10594);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

/*-------------------------------------------------------*/

-- Tabla Grupos_Puntos_Comunicacion
-- Modificar el valor de cantidad
-- Recibe el id de la tabla y el nuevo valor para la cantidad

DROP PROCEDURE IF EXISTS update_GPC_cantidad;
DELIMITER //
CREATE PROCEDURE update_GPC_cantidad(IN id_tabla INT, IN nuevo_valor INT)
BEGIN

	DECLARE id_grupo_resultante INT;

	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN

		UPDATE Grupos_Puntos_Comunicacion
		SET cantidad = nuevo_valor
		WHERE id_grupo = id_grupo_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_GPC_cantidad(10594, 10);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

CALL update_GPC_cantidad(10594, 586);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

/*-------------------------------------------------------*/

-- Tabla Grupos_Puntos_Comunicacion
-- Modificar el valor de cantidad
-- Recibe el id de la tabla y el nuevo valor para la cantidad

DROP PROCEDURE IF EXISTS update_GPC_rango_cubierto;
DELIMITER //
CREATE PROCEDURE update_GPC_rango_cubierto(IN id_tabla INT, IN nuevo_valor DOUBLE)
BEGIN

	DECLARE id_grupo_resultante INT;

	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN

		UPDATE Grupos_Puntos_Comunicacion
		SET rango_cubierto = nuevo_valor
		WHERE id_grupo = id_grupo_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_GPC_rango_cubierto(10594, 10.0);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

CALL update_GPC_rango_cubierto(10594, 919.91);

SELECT * FROM Grupos_Puntos_Comunicacion WHERE id_grupo = 10594;

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de longitud
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para la longitud

DROP PROCEDURE IF EXISTS update_Lugar_longitud;
DELIMITER //
CREATE PROCEDURE update_Lugar_longitud(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET longitud = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_longitud('AAA100', '0');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_longitud('AAA100', '89.1919');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de latitud
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para la latitud

DROP PROCEDURE IF EXISTS update_Lugar_latitud;
DELIMITER //
CREATE PROCEDURE update_Lugar_latitud(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET latitud = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_latitud('AAA100', '0');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_latitud('AAA100', '-79.3223');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de radio
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para el radio

DROP PROCEDURE IF EXISTS update_Lugar_radio;
DELIMITER //
CREATE PROCEDURE update_Lugar_radio(IN id_tabla VARCHAR(6), IN nuevo_valor FLOAT)
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET radio = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_radio('AAA100', '0');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_radio('AAA100', '200.12');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de sector
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para el sector

DROP PROCEDURE IF EXISTS update_Lugar_sector;
DELIMITER //
CREATE PROCEDURE update_Lugar_sector(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('norte', 'centro', 'sur', 'este', 'oeste', 'centronorte')) THEN

			UPDATE Lugar
		    SET sector = nuevo_valor
		    WHERE codigo_area LIKE codigo_area_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de sector no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_sector('AAA100', 'sur');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_sector('AAA100', 'centro');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de codigo_postal
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para el codigo_postal

DROP PROCEDURE IF EXISTS update_Lugar_codigo_postal;
DELIMITER //
CREATE PROCEDURE update_Lugar_codigo_postal(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(6))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET codigo_postal = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_codigo_postal('AAA100', '000000');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_codigo_postal('AAA100', '090101');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de cantidad_personas
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para la cantidad_personas

DROP PROCEDURE IF EXISTS update_Lugar_cantidad_personas;
DELIMITER //
CREATE PROCEDURE update_Lugar_cantidad_personas(IN id_tabla VARCHAR(6), IN nuevo_valor INT)
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET cantidad_personas = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_cantidad_personas('AAA100', '0');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_cantidad_personas('AAA100', '20');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de ciudad
-- Recibe el id (codigo_area) de la tabla y el nuevo valor para la ciudad

DROP PROCEDURE IF EXISTS update_Lugar_ciudad;
DELIMITER //
CREATE PROCEDURE update_Lugar_ciudad(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);
	DECLARE ciudad_resultante VARCHAR(45);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);
	SET ciudad_resultante = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE nuevo_valor);

	IF (codigo_area_resultante IS NOT NULL) THEN

		IF (ciudad_resultante IS NOT NULL) THEN

			UPDATE Lugar
		    SET ciudad = nuevo_valor
		    WHERE codigo_area LIKE codigo_area_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ciudad(Nombre) no existe en la tabla Ciudad';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL update_Lugar_ciudad('AAA100', 'Quito');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

CALL update_Lugar_ciudad('AAA100', 'Guayaquil');

SELECT * FROM Lugar WHERE codigo_area LIKE 'AAA100';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de longitud
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para la longitud

DROP PROCEDURE IF EXISTS _2update_Lugar_longitud;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_longitud(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET longitud = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_longitud('Av.9Octubre', '0');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_longitud('Av.9Octubre', '89.1919');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de latitud
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para la latitud

DROP PROCEDURE IF EXISTS _2update_Lugar_latitud;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_latitud(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET latitud = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_latitud('Av.9Octubre', '0');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_latitud('Av.9Octubre', '-79.3223');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de radio
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para el radio

DROP PROCEDURE IF EXISTS _2update_Lugar_radio;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_radio(IN id_tabla VARCHAR(30), IN nuevo_valor FLOAT)
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET radio = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_radio('Av.9Octubre', '0');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_radio('Av.9Octubre', '200.12');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de sector
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para el sector

DROP PROCEDURE IF EXISTS _2update_Lugar_sector;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_sector(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('norte', 'centro', 'sur', 'este', 'oeste', 'centronorte')) THEN

			UPDATE Lugar
		    SET sector = nuevo_valor
		    WHERE ubicacion LIKE ubicacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de sector no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_sector('Av.9Octubre', 'sur');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_sector('Av.9Octubre', 'centro');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de codigo_postal
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para el codigo_postal

DROP PROCEDURE IF EXISTS _2update_Lugar_codigo_postal;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_codigo_postal(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET codigo_postal = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_codigo_postal('Av.9Octubre', '000000');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_codigo_postal('Av.9Octubre', '090101');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de cantidad_personas
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para la cantidad_personas

DROP PROCEDURE IF EXISTS _2update_Lugar_cantidad_personas;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_cantidad_personas(IN id_tabla VARCHAR(30), IN nuevo_valor INT)
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET cantidad_personas = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_cantidad_personas('Av.9Octubre', '0');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_cantidad_personas('Av.9Octubre', '20');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Modificar el valor de ciudad
-- Recibe el id (ubicacion) de la tabla y el nuevo valor para la ciudad

DROP PROCEDURE IF EXISTS _2update_Lugar_ciudad;
DELIMITER //
CREATE PROCEDURE _2update_Lugar_ciudad(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);
	DECLARE ciudad_resultante VARCHAR(45);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);
	SET ciudad_resultante = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE nuevo_valor);

	IF (ubicacion_resultante IS NOT NULL) THEN

		IF (ciudad_resultante IS NOT NULL) THEN

			UPDATE Lugar
		    SET ciudad = nuevo_valor
		    WHERE ubicacion LIKE ubicacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ciudad(Nombre) no existe en la tabla Ciudad';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END//
DELIMITER ;

CALL _2update_Lugar_ciudad('Av.9Octubre', 'Quito');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

CALL _2update_Lugar_ciudad('Av.9Octubre', 'Guayaquil');

SELECT * FROM Lugar WHERE ubicacion LIKE 'Av.9Octubre';

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Modificar el valor de latitud
-- Recibe el id de la tabla y el nuevo valor para la latitud

DROP PROCEDURE IF EXISTS update_PC_latitud;
DELIMITER //
CREATE PROCEDURE update_PC_latitud(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET latitud = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_PC_latitud('0B-72-39-F2-D9-E0', '0');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

CALL update_PC_latitud('0B-72-39-F2-D9-E0', '49.4394');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Modificar el valor de longitud
-- Recibe el id de la tabla y el nuevo valor para la longitud

DROP PROCEDURE IF EXISTS update_PC_longitud;
DELIMITER //
CREATE PROCEDURE update_PC_longitud(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET longitud = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_PC_longitud('0B-72-39-F2-D9-E0', '0');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

CALL update_PC_longitud('0B-72-39-F2-D9-E0', '-83.8382');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Modificar el valor de mensaje
-- Recibe el id de la tabla y el nuevo valor para el mensaje

DROP PROCEDURE IF EXISTS update_PC_mensaje;
DELIMITER //
CREATE PROCEDURE update_PC_mensaje(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(100))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET mensaje = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_PC_mensaje('0B-72-39-F2-D9-E0', 'NEW MESSAGE');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

CALL update_PC_mensaje('0B-72-39-F2-D9-E0', 'We know');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Modificar el valor de operativo
-- Recibe el id de la tabla y el nuevo valor para el operativo

DROP PROCEDURE IF EXISTS update_PC_operativo;
DELIMITER //
CREATE PROCEDURE update_PC_operativo(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('1', '0')) THEN

			UPDATE Puntos_Comunicacion
		    SET operativo = nuevo_valor
		    WHERE mac_address_bcn = mac_address_bcn_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de opreativo no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_PC_operativo('0B-72-39-F2-D9-E0', '0');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

CALL update_PC_operativo('0B-72-39-F2-D9-E0', '1');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Modificar el valor de rango
-- Recibe el id de la tabla y el nuevo valor para el rango

DROP PROCEDURE IF EXISTS update_PC_rango;
DELIMITER //
CREATE PROCEDURE update_PC_rango(IN id_tabla VARCHAR(48), IN nuevo_valor FLOAT)
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET rango = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END//
DELIMITER ;

CALL update_PC_rango('0B-72-39-F2-D9-E0', '0');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

CALL update_PC_rango('0B-72-39-F2-D9-E0', '573.48');

SELECT * FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE '0B-72-39-F2-D9-E0';

/*-------------------------------------------------------*/

-- Tabla Registra_Observacion
-- Modificar el valor de fecha_registro
-- Recibe el id de la tabla y el nuevo valor para la fecha_registro

DROP PROCEDURE IF EXISTS update_RO_fecha_registro;
DELIMITER //
CREATE PROCEDURE update_RO_fecha_registro(IN id_tabla INT, IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE fecha_registro_resultante DATE;

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET fecha_registro_resultante = (SELECT DATE(nuevo_valor));

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (fecha_registro_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET fecha_registro = fecha_registro_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de fecha_registro no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END//
DELIMITER ;

CALL update_RO_fecha_registro(1111, '2026-01-01');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

CALL update_RO_fecha_registro(1111, '2021-12-09');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

/*-------------------------------------------------------*/

-- Tabla Registra_Observacion
-- Modificar el valor de hora_registro
-- Recibe el id de la tabla y el nuevo valor para la hora_registro

DROP PROCEDURE IF EXISTS update_RO_hora_registro;
DELIMITER //
CREATE PROCEDURE update_RO_hora_registro(IN id_tabla INT, IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE hora_registro_resultante TIME;

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET hora_registro_resultante = (SELECT TIME(nuevo_valor));

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (hora_registro_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET hora_registro = hora_registro_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de hora_registro no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END//
DELIMITER ;

CALL update_RO_hora_registro(1111, '01:00:00');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

CALL update_RO_hora_registro(1111, '12:33:33');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

/*-------------------------------------------------------*/

-- Tabla Registra_Observacion
-- Modificar el valor de ubicacion_observador
-- Recibe el id de la tabla y el nuevo valor para la ubicacion_observador

DROP PROCEDURE IF EXISTS update_RO_ubicacion_observador;
DELIMITER //
CREATE PROCEDURE update_RO_ubicacion_observador(IN id_tabla INT, IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE ubicacion_observador_resultante VARCHAR(30);

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET ubicacion_observador_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE nuevo_valor LIMIT 1);

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (ubicacion_observador_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET ubicacion_observador = ubicacion_observador_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion_observador no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END//
DELIMITER ;

CALL update_RO_ubicacion_observador('1111', 'MallDelSol');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

CALL update_RO_ubicacion_observador('1111', 'MallDelRio');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

/*-------------------------------------------------------*/

-- Tabla Registra_Observacion
-- Modificar el valor de mac_address_punto
-- Recibe el id de la tabla y el nuevo valor para la mac_address_punto

DROP PROCEDURE IF EXISTS update_RO_mac_address_punto;
DELIMITER //
CREATE PROCEDURE update_RO_mac_address_punto(IN id_tabla INT, IN nuevo_valor VARCHAR(48))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE mac_address_punto_resultante VARCHAR(48);

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET mac_address_punto_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE nuevo_valor);

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (mac_address_punto_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET mac_address_punto = mac_address_punto_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_punto no existe en tabla Puntos_Comunicacion';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END//
DELIMITER ;

CALL update_RO_mac_address_punto('1111', 'F2-65-52-46-B7-A6');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

CALL update_RO_mac_address_punto('1111', 'F2-0C-5B-E8-4A-0C');

SELECT * FROM Registra_Observacion WHERE id_observacion = 1111;

/*-------------------------------------------------------*/

-- Tabla Usuario
-- Modificar el valor de Telefono
-- Recibe el id de la tabla y el nuevo valor para el Telefono

DROP PROCEDURE IF EXISTS update_Usuario_Telefono;
DELIMITER //
CREATE PROCEDURE update_Usuario_Telefono(IN id_tabla VARCHAR(10), IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_usuario_resultante VARCHAR(10);
	DECLARE Telefono_nuevo VARCHAR(10);

	SET id_usuario_resultante = (SELECT id_usuario FROM Usuario WHERE id_usuario LIKE id_tabla);
	SET Telefono_nuevo = nuevo_valor;

	IF (id_usuario_resultante IS NOT NULL) THEN

		UPDATE Usuario
	    SET Telefono = Telefono_nuevo
	    WHERE id_usuario LIKE id_usuario_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, id_usuario no existe en la tabla Usuario';

END IF;

END//
DELIMITER ;

CALL update_Usuario_Telefono('0656456546', '5555555555');

SELECT * FROM Usuario WHERE id_usuario LIKE '0656456546';

CALL update_Usuario_Telefono('0656456546', '0987878666');

SELECT * FROM Usuario WHERE id_usuario LIKE '0656456546';

/*-------------------------------------------------------*/

-- DELETES

-- Tabla Asiste
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Asiste;
DELIMITER //
CREATE PROCEDURE delete_Asiste(IN id_tabla VARCHAR(10))
BEGIN

	DECLARE id_usuario_A_resultante VARCHAR(10);
	SET id_usuario_A_resultante = (SELECT id_usuario FROM Asiste WHERE id_usuario LIKE id_tabla);

	IF (id_usuario_A_resultante IS NOT NULL) THEN

		DELETE FROM Asiste
	    WHERE id_usuario_A = id_tabla;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;
END//
DELIMITER ;

SELECT * FROM Asiste WHERE id_usuario LIKE '0865672738';

CALL delete_Asiste('0865672738');

SELECT * FROM Asiste WHERE id_usuario LIKE '0865672738';

/*-------------------------------------------------------*/

-- Tabla Chip_Wireless
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Chip_Wireless;
DELIMITER //
CREATE PROCEDURE delete_Chip_Wireless(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Chip_Wireless
    WHERE mac_address_disp = id_tabla;
END//
DELIMITER ;

CALL delete_Chip_Wireless();

/*-------------------------------------------------------*/

-- Tabla Ciudad
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Ciudad;
DELIMITER //
CREATE PROCEDURE delete_Ciudad(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Ciudad
    WHERE Nombre = id_tabla;
END//
DELIMITER ;

CALL delete_Ciudad();

/*-------------------------------------------------------*/

-- Tabla Cliente
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Cliente;
DELIMITER //
CREATE PROCEDURE delete_Cliente(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Cliente
    WHERE RUC = id_tabla;
END//
DELIMITER ;

CALL delete_Cliente();

/*-------------------------------------------------------*/

-- Tabla Grupos_Puntos_Comunicacion
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Grupos_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE delete_Grupos_Puntos_Comunicacion(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Grupos_Puntos_Comunicacion
    WHERE id_grupo = id_tabla;
END//
DELIMITER ;

CALL delete_Grupos_Puntos_Comunicacion();

/*-------------------------------------------------------*/

-- Tabla Lugar
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Lugar;
DELIMITER //
CREATE PROCEDURE delete_Lugar(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Lugar
    WHERE codigo_area = id_tabla;
END//
DELIMITER ;

CALL delete_Lugar();

/*-------------------------------------------------------*/

-- Tabla Puntos_Comunicacion
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE delete_Puntos_Comunicacion(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Puntos_Comunicacion
    WHERE mac_adrress_bcn = id_tabla;
END//
DELIMITER ;

CALL delete_Puntos_Comunicacion();

/*-------------------------------------------------------*/

-- Tabla Registra
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Registra;
DELIMITER //
CREATE PROCEDURE delete_Registra(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Registra
    WHERE id_usuario = id_tabla;
END//
DELIMITER ;

CALL delete_Registra();

/*-------------------------------------------------------*/

-- Tabla Registra_Observacion
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Registra_Observacion;
DELIMITER //
CREATE PROCEDURE delete_Registra_Observacion(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Registra_Observacion
    WHERE id_observacion = id_tabla;
END//
DELIMITER ;

CALL delete_Registra_Observacion();

/*-------------------------------------------------------*/

-- Tabla Usuario
-- Borrar la fila o el registro
-- Recibe el id de la fila la cual se quiere borrar

DROP PROCEDURE IF EXISTS delete_Usuario;
DELIMITER //
CREATE PROCEDURE delete_Usuario(IN id_tabla VARCHAR(10))
BEGIN
	DELETE FROM Usuario
    WHERE id_usuario = id_tabla;
END//
DELIMITER ;

CALL delete_Usuario();

/*-------------------------------------------------------*/

-- Procemidimientos no CRUD

-- Establecer Monitoreo por rangos de fechas

DROP PROCEDURE IF EXISTS monitoreo_por_fechas;
DELIMITER //
CREATE PROCEDURE monitoreo_por_fechas(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
BEGIN
    IF FECHA_INICIO < FECHA_FIN THEN
        SELECT RO.mac_address_punto AS mac_address, RO.fecha_registro AS fecha, RO.hora_registro AS hora, PC.Operativo AS operativo, PC.Rango AS rango_cubierto
        FROM Puntos_Comunicacion AS PC, Registra_Observacion AS RO
        WHERE mac_address_punto = mac_address_bcn
        AND RO.fecha_registro > FECHA_INICIO
        AND RO.fecha_registro < FECHA_FIN;
	END IF;
END //
DELIMITER ;

CALL monitoreo_por_fechas('2021-02-14', '2040-02-14');

/*-------------------------------------------------------*/

--  Consultar el aforo actual de una ubicacion determinada

DROP PROCEDURE IF EXISTS aforo_actual;
DELIMITER //
CREATE PROCEDURE aforo_actual(IN in_ubicacion VARCHAR(30))
BEGIN
    SELECT L.ciudad AS ciudad, RO.ubicacion_observador AS ubicacion, RO.fecha_registro AS fecha_consultada, L.cantidad_personas AS cantidad_personas
    FROM Lugar AS L, Registra_Observacion AS RO
    WHERE L.ubicacion = RO.ubicacion_observador
    AND RO.ubicacion_observador LIKE in_ubicacion
    AND RO.fecha_registro = CURRENT_DATE();
END //
DELIMITER ;

CALL aforo_actual('Urdesa');

/*-------------------------------------------------------*/

-- SELECTS

DROP PROCEDURE IF EXISTS mostrar_datos_por_ciudad;
DELIMITER //
CREATE PROCEDURE mostrar_datos_por_ciudad(IN nomCiudad VARCHAR(40))
BEGIN
	SELECT * FROM CIUDAD WHERE nomCiudad LIKE nomCiudad;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS mayor_a_rango;
DELIMITER //
CREATE PROCEDURE mayor_a_rango(IN rango int)
BEGIN
	SELECT * FROM GRUPOS_PUNTOS_COMUNICACION WHERE RANGO_CUBIERTO > rango;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS observaciones_por_fecha;
DELIMITER //
CREATE PROCEDURE observaciones_por_fecha(IN fecha DATE)
BEGIN
	SELECT * FROM REGISTRA_OBSERVACION WHERE FECHA_REGISTRO = fecha;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS prom_veces_user;
DELIMITER //
CREATE PROCEDURE prom_veces_user(IN IDUSER VARCHAR(10))
BEGIN
	SELECT ID_USUARIO_A , AVG(ID_USUARIO_A) AS PROMEDIO_VECES
	FROM ASISTE
    WHERE ID_USUARIO_A LIKE IDUSER
	GROUP BY ID_USUARIO_A
	ORDER BY ID_USUARIO_A;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS cant_users_hora_lugar;
DELIMITER //
CREATE PROCEDURE cant_users_hora_lugar(IN lugar VARCHAR(40) , IN hora time)
BEGIN
	SELECT LUGAR.UBICACION, COUNT (CANTIDAD_USUARIOS) AS NUMERO_USUARIOS
	FROM LUGAR,REGISTRA_OBSERVACION
	WHERE REGISTRA_OBSERVACION.HORA_REGISTRO = hora AND LUGAR.UBICACION = lugar;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS observaciones_por_dias;
DELIMITER //
CREATE PROCEDURE observaciones_por_dias(IN primerafecha DATE, IN segundafecha DATE)
BEGIN
	SELECT LUGAR.UBICACION , REGISTRA_OBSERVACION.FECHA_REGISTRO
	FROM LUGAR,REGISTRA_OBSERVACION
	WHERE Registrar_Observacion.fecha_registro < segundafecha AND Registrar_Observacion.fecha_registro > primerafecha;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS lugares_por_usuario;
DELIMITER //
CREATE PROCEDURE lugares_por_usuario(IN cedula VARCHAR(10))
BEGIN
	SELECT LUGAR.UBICACION , ASISTE.ID_USUARIO
	FROM LUGAR,ASISTE
	WHERE ASISTE.ID_CODIGO_AREA - LUGAR.CODIGO_AREA AND ASISTE.ID_USUARIO = cedula;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS cant_personas_por_lugar;
DELIMITER //
CREATE PROCEDURE cant_personas_por_lugar(IN lugar VARCHAR(40))
BEGIN
	SELECT LUGAR.CANTIDAD_PERSONAS, LUGAR.UBICACION
	FROM LUGAR
	WHERE LUGAR.UBICACION = lugar;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS lugares_por_sector;
DELIMITER //
CREATE PROCEDURE lugares_por_sector(IN sector VARCHAR(40))
BEGIN
	SELECT LUGAR.UBICACION
	FROM LUGAR
	WHERE LUGAR.SECTOR = sector;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS mostrar_lugares_por_ciudad;
DELIMITER //
CREATE PROCEDURE mostrar_lugares(IN nomCiudad VARCHAR(40))
BEGIN
	SELECT LUGAR.UBICACION
	FROM LUGAR,CIUDAD
	WHERE CIUDAD.NOMBRE = LUGAR.CIUDAD AND LUGAR.CIUDAD = nomCiudad;
END //
DELIMITER ;
