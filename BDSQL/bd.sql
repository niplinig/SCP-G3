
CREATE TABLE `Lugar` (
  `codigo_area` varchar(6) NOT NULL,
  `ubicacion` varchar(30) DEFAULT 'desconocido',
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `radio` float(5,2) NOT NULL,
  `sector` varchar(30) DEFAULT 'desconocido',
  `codigo_postal` varchar(6) NOT NULL,
  `cantidad_personas` int NOT NULL,
  `ciudad` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo_area`),
  UNIQUE KEY `codigo_area_UNIQUE` (`codigo_area`),
  KEY `ciudad _idx` (`ciudad`),
  CONSTRAINT `ciudad ` FOREIGN KEY (`ciudad`) REFERENCES `Ciudad` (`Nombre`)
);


CREATE TABLE `Asiste` (
  `id_usuario_A` varchar(10) NOT NULL,
  `codigo_area_A` varchar(6) NOT NULL,
  KEY `id_usuario_idx` (`id_usuario_A`),
  KEY `codigo_area_A_idx` (`codigo_area_A`),
  CONSTRAINT `codigo_area_A` FOREIGN KEY (`codigo_area_A`) REFERENCES `Lugar` (`codigo_area`),
  CONSTRAINT `id_usuario_A` FOREIGN KEY (`id_usuario_A`) REFERENCES `Usuario` (`id_usuario`)
);

CREATE TABLE `Chip_Wireless` (
  `mac_address_disp` int NOT NULL,
  `Cedula` varchar(45) NOT NULL,
  PRIMARY KEY (`mac_address_disp`),
  UNIQUE KEY `mac_address_disp_UNIQUE` (`mac_address_disp`),
  KEY `Cedula_idx` (`Cedula`),
  CONSTRAINT `Cedula` FOREIGN KEY (`Cedula`) REFERENCES `Usuario` (`id_usuario`)
);

CREATE TABLE `Ciudad` (
  `Nombre` varchar(45) NOT NULL,
  `Sectores` varchar(45) NOT NULL,
  `Poblacion` varchar(45) NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
);

CREATE TABLE `Grupos_Puntos_Comunicacion` (
  `id_grupo` int NOT NULL,
  `g_operativo` tinyint(1) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `rango_cubierto` double(5,2) NOT NULL,
  PRIMARY KEY (`id_grupo`)
);

CREATE TABLE `Cliente` (
  `RUC` varchar(10) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`RUC`),
  UNIQUE KEY `RUC_UNIQUE` (`RUC`)
);

CREATE TABLE `Puntos_Comunicacion` (
  `mac_address_bcn` varchar(48) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `mensaje` varchar(20) NOT NULL,
  `operativo` varchar(20) NOT NULL,
  `rango` float(5,2) NOT NULL,
  PRIMARY KEY (`mac_address_bcn`),
  UNIQUE KEY `mac_address_bcn_UNIQUE` (`mac_address_bcn`)
);

CREATE TABLE `Registra` (
  `id_usuario` varchar(48) NOT NULL,
  `mac_addres_bcn` varchar(48) NOT NULL,
  PRIMARY KEY (`id_usuario`,`mac_addres_bcn`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `mac_address_bcn_idx` (`mac_addres_bcn`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `mac_address_bcn` FOREIGN KEY (`mac_addres_bcn`) REFERENCES `Puntos_Comunicacion` (`mac_address_bcn`)
);

CREATE TABLE `Registra_Observacion` (
  `id_observacion` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `ubicacion_observador` varchar(30) NOT NULL,
  `mac_address_punto` varchar(48) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  UNIQUE KEY `id_observacion_UNIQUE` (`id_observacion`),
  KEY `mac_address_punto_idx` (`mac_address_punto`),
  CONSTRAINT `mac_address_punto` FOREIGN KEY (`mac_address_punto`) REFERENCES `Puntos_Comunicacion` (`mac_address_bcn`)
);

CREATE TABLE `Usuario` (
  `id_usuario` varchar(10) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `Cedula_UNIQUE` (`id_usuario`)
);





