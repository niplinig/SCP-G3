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