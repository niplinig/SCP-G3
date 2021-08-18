USE G3P1_contador_personas;

-- Procedimientos almacenados
-- Insert

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

-- Modificar por su ID

-- Asiste

DROP PROCEDURE IF EXISTS update_Asiste;
DELIMITER //
CREATE PROCEDURE update_Asiste(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Asiste
    SET set_condition = _set_argument
    WHERE id_usuario_A = where_argument;
END//
DELIMITER ;

-- Chip_Wireless

DROP PROCEDURE IF EXISTS update_Chip_Wireless;
DELIMITER //
CREATE PROCEDURE update_Chip_Wireless(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Chip_Wireless
    SET set_condition = _set_argument
    WHERE mac_address_disp = where_argument;
END//
DELIMITER ;

-- Ciudad

DROP PROCEDURE IF EXISTS update_Ciudad;
DELIMITER //
CREATE PROCEDURE update_Ciudad(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Ciudad
    SET set_condition = _set_argument
    WHERE Nombre = where_argument;
END//
DELIMITER ;

-- Cliente

DROP PROCEDURE IF EXISTS update_Cliente;
DELIMITER //
CREATE PROCEDURE update_Cliente(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Cliente
    SET set_condition = _set_argument
    WHERE RUC = where_argument;
END//
DELIMITER ;

-- Grupos_Puntos_Comunicacion

DROP PROCEDURE IF EXISTS update_Grupos_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE update_Grupos_Puntos_Comunicacion(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Grupos_Puntos_Comunicacion
    SET set_condition = _set_argument
    WHERE id_grupo = where_argument;
END//
DELIMITER ;

-- Lugar

DROP PROCEDURE IF EXISTS update_Lugar;
DELIMITER //
CREATE PROCEDURE update_Lugar(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Lugar
    SET set_condition = _set_argument
    WHERE codigo_area = where_argument;
END//
DELIMITER ;

-- Puntos_Comunicacion

DROP PROCEDURE IF EXISTS update_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE update_Puntos_Comunicacion(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Puntos_Comunicacion
    SET set_condition = _set_argument
    WHERE mac_adrress_bcn = where_argument;
END//
DELIMITER ;

-- Registra

DROP PROCEDURE IF EXISTS update_Registra;
DELIMITER //
CREATE PROCEDURE update_Registra(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Registra
    SET set_condition = _set_argument
    WHERE id_usuario = where_argument;
END//
DELIMITER ;

-- Registra_Observacion

DROP PROCEDURE IF EXISTS update_Registra_Observacion;
DELIMITER //
CREATE PROCEDURE update_Registra_Observacion(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Registra_Observacion
    SET set_condition = _set_argument
    WHERE id_observacion = where_argument;
END//
DELIMITER ;

-- Usuario

DROP PROCEDURE IF EXISTS update_Usuario;
DELIMITER //
CREATE PROCEDURE update_Usuario(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Usuario
    SET set_condition = _set_argument
    WHERE id_usuario = where_argument;
END//
DELIMITER ;

-- Modificar por su ID

-- Asiste

DROP PROCEDURE IF EXISTS delete_Asiste;
DELIMITER //
CREATE PROCEDURE delete_Asiste(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Asiste
    WHERE id_usuario_A = where_argument;
END//
DELIMITER ;

-- Chip_Wireless

DROP PROCEDURE IF EXISTS delete_Chip_Wireless;
DELIMITER //
CREATE PROCEDURE delete_Chip_Wireless(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Chip_Wireless
    WHERE mac_address_disp = where_argument;
END//
DELIMITER ;

-- Ciudad

DROP PROCEDURE IF EXISTS delete_Ciudad;
DELIMITER //
CREATE PROCEDURE delete_Ciudad(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Ciudad
    WHERE Nombre = where_argument;
END//
DELIMITER ;

-- Cliente

DROP PROCEDURE IF EXISTS delete_Cliente;
DELIMITER //
CREATE PROCEDURE delete_Cliente(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Cliente
    WHERE RUC = where_argument;
END//
DELIMITER ;

-- Grupos_Puntos_Comunicacion

DROP PROCEDURE IF EXISTS delete_Grupos_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE delete_Grupos_Puntos_Comunicacion(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Grupos_Puntos_Comunicacion
    WHERE id_grupo = where_argument;
END//
DELIMITER ;

-- Lugar

DROP PROCEDURE IF EXISTS delete_Lugar;
DELIMITER //
CREATE PROCEDURE delete_Lugar(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Lugar
    WHERE codigo_area = where_argument;
END//
DELIMITER ;

-- Puntos_Comunicacion

DROP PROCEDURE IF EXISTS delete_Puntos_Comunicacion;
DELIMITER //
CREATE PROCEDURE delete_Puntos_Comunicacion(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Puntos_Comunicacion
    WHERE mac_adrress_bcn = where_argument;
END//
DELIMITER ;

-- Registra

DROP PROCEDURE IF EXISTS delete_Registra;
DELIMITER //
CREATE PROCEDURE delete_Registra(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Registra
    WHERE id_usuario = where_argument;
END//
DELIMITER ;

-- Registra_Observacion

DROP PROCEDURE IF EXISTS delete_Registra_Observacion;
DELIMITER //
CREATE PROCEDURE delete_Registra_Observacion(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Registra_Observacion
    WHERE id_observacion = where_argument;
END//
DELIMITER ;

-- Usuario

DROP PROCEDURE IF EXISTS delete_Usuario;
DELIMITER //
CREATE PROCEDURE delete_Usuario(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Usuario
    WHERE id_usuario = where_argument;
END//
DELIMITER ;

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

-- trigger para ingresar los datos de la tabla Asiste

DROP TRIGGER IF EXISTS auto_insertar_Asiste;
delimiter //

CREATE TRIGGER auto_insertar_Asiste BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    DECLARE id_usuario_en_tabla_asiste VARCHAR(10);
    SELECT id_usuario INTO id_usuario_en_tabla_asiste FROM Asiste WHERE id_usuario LIKE NEW.id_usuario;

	IF id_usuario_en_tabla_asiste IS NULL THEN
		INSERT INTO Asiste(id_usuario, codigo_area) VALUES (NEW.id_usuario, (SELECT codigo_area FROM Lugar WHERE ciudad LIKE "Guayaquil" LIMIT 1));
	END IF;

END; //
delimiter ;

-- trigger para ingresar los datos en la tabla Registra

delimiter %%

CREATE TRIGGER auto_insertar_Registra BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
	DECLARE _mac_adrress_bcn VARCHAR(48);
    SELECT mac_adrress_bcn INTO _mac_adrress_bcn FROM Puntos_Comunicacion WHERE mac_adrress_bcn LIKE (SELECT mac_address_disp FROM Chip_Wireless WHERE id_usuario LIKE NEW.id_usuario LIMIT 1);

    IF _mac_adrress_bcn IS NULL THEN
		INSERT INTO Registra(id_usuario, mac_address_bcn) VALUES (NEW.id_usuario, (SELECT mac_address_disp FROM Chip_Wireless WHERE id_usuario LIKE NEW.id_usuario LIMIT 1));
	END IF;

END; %%
delimiter ;

-- CON STORED PROCEDURES

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
