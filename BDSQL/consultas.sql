/*
-- Consultas generales 
select * from Lugar;
select * from Registra_Observacion;
select * from Asiste;

-- Consultas de 1 atributo
select codigo_area from Lugar;
select id_observacion from Registra_Observacion;
select id_usuario_A from Asiste;

-- Consultas con Where
select ubicacion, radio
from Lugar
where radio > 200;

select id_observacion, fecha_registro
from Registra_Observacion
where fecha_registro between "2021-10-22" and "2021-12-09";

select id_usuario_A, codigo_area_A
from Asiste
where codigo_area_A = "ACC300";
*/

/*
-- Usuario
SELECT * FROM Usuario;
SELECT Usuario.id_usuario FROM Usuario;
SELECT Usuario.id_usuario FROM Usuario WHERE Usuario.Telefono = "0985272556";

-- Registra

SELECT * FROM Registra;
SELECT Registra.mac_address_bcn FROM Registra;
SELECT Registra.id_usuario FROM Registra WHERE Registra.mac_address_bcn = "42-D1-3A-70-21-DE";


-- Chip

SELECT * FROM Chip_Wireless;
SELECT Chip_Wireless.Cedula FROM Chip_Wireless;
SELECT Chip_Wireless.Cedula FROM Chip_Wireless WHERE Chip_Wireless.mac_address_disp = "53-9B-36-93-2C-C8";

-- Cliente
SELECT * FROM Cliente;
SELECT Cliente.RUC FROM Cliente;
SELECT Cliente.RUC FROM Cliente WHERE Cliente.Nombre = "Sandra Huertas";
*/
/*
-- Consulta general
SELECT * FROM Puntos_Comunicacion;

SELECT * FROM Ciudad;

SELECT * FROM Grupos_Puntos_Comunicacion;

-- Consulta identificadores
SELECT mac_address_bcn AS Codigo, operativo
FROM Puntos_Comunicacion
GROUP BY mac_address_bcn
ORDER BY mac_address_bcn ASC;

SELECT Nombre, Poblacion
FROM Ciudad
GROUP BY Nombre
ORDER BY Poblacion ASC;

SELECT id_grupo AS ID, cantidad, rango_cubierto
FROM Grupos_Puntos_Comunicacion
GROUP BY id_grupo
ORDER BY id_grupo ASC;

-- Consultas tipo de busqueda
SELECT mac_address_bcn AS Codigo, operativo
FROM  Puntos_Comunicacion
WHERE mac_address_bcn = '6C-5C-47-EF-96-65'
AND mensaje LIKE 'W%';

SELECT Nombre, Poblacion
FROM Ciudad
WHERE Sectores IN ('Norte', 'Sur')
AND Poblacion > 100;

SELECT id_grupo, g_operativo, cantidad
FROM Grupos_Puntos_Comunicacion
WHERE cantidad > 100
AND g_operativo = 1
GROUP BY id_grupo;
*/

-- Reportes de documentacion
-- 1er reporte Definir area
-- select * from Lugar;

-- 2do reporte Establecer monitoreo
/*
select mac_address_bcn, fecha_registro, hora_registro, operativo, rango
from Registra_Observacion INNER JOIN Puntos_Comunicacion
ON Registra_Observacion.mac_address_punto = Puntos_Comunicacion.mac_address_bcn;
*/
-- 3er reporte Registrar observacion
/*
select id_usuario_A AS usuario, fecha_registro AS Fecha, hora_registro AS Hora, mac_address_punto AS Observador, codigo_area
AS Area
from Lugar, Asiste, Registra_Observacion
where Lugar.ubicacion = Registra_Observacion.ubicacion_observador and Lugar.codigo_area = Asiste.codigo_area_A;
*/
-- 4to reporte Digitalizar datos
/*
select id_usuario AS Usuario, Telefono, mac_address_disp AS MAC_ADDRESS_Dispositivo, fecha_registro AS Fecha, hora_registro
AS Hora, codigo_area AS Area
from Usuario, Asiste, Lugar, Registra_Observacion, Chip_Wireless
where Usuario.id_usuario = Asiste.id_usuario_A and Chip_Wireless.Cedula = Usuario.id_usuario and Asiste.codigo_area_A = Lugar.codigo_area
and Lugar.ubicacion = Registra_Observacion.ubicacion_observador;
*/




