USE G3P1_contador_personas;

-- Vistas creadas a partir de los reportes

CREATE VIEW Definir_area AS (SELECT * FROM Lugar);

CREATE VIEW Establecer_monitoreo AS (select mac_address_bcn, fecha_registro, hora_registro, operativo, rango
from Registra_Observacion INNER JOIN Puntos_Comunicacion
ON Registra_Observacion.mac_address_punto = Puntos_Comunicacion.mac_address_bcn);

CREATE VIEW Registrar_observacion AS (select id_usuario_A AS usuario, fecha_registro AS Fecha, hora_registro AS Hora, mac_address_punto AS Observador, codigo_area
AS Area
from Lugar, Asiste, Registra_Observacion
where Lugar.ubicacion = Registra_Observacion.ubicacion_observador and Lugar.codigo_area = Asiste.codigo_area_A);

CREATE VIEW Digitalizar_datos AS (select id_usuario AS Usuario, Telefono, mac_address_disp AS MAC_ADDRESS_Dispositivo, fecha_registro AS Fecha, hora_registro
AS Hora, codigo_area AS Area
from Usuario, Asiste, Lugar, Registra_Observacion, Chip_Wireless
where Usuario.id_usuario = Asiste.id_usuario_A and Chip_Wireless.Cedula = Usuario.id_usuario and Asiste.codigo_area_A = Lugar.codigo_area
and Lugar.ubicacion = Registra_Observacion.ubicacion_observador);

-- observaciones
-- DROP TABLE Asiste;
DROP VIEW IF EXISTS Asistencias;
CREATE VIEW Asistencias AS (SELECT * from Asiste);
select * from Asistencias;
