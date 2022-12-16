CREATE TABLE marcas (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    pais VARCHAR(20)
);

ALTER TABLE `drums`.`marcas` 
CHARACTER SET = utf8 ,
CHANGE COLUMN `nombre` `nombre` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `pais` `pais` VARCHAR(150) NULL DEFAULT NULL ;

CREATE TABLE `drums`.`distribuidor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `numero_telefono` VARCHAR(150) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(150) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `drums`.`piezas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(150) NOT NULL,
  `distribuidor` VARCHAR(150) NOT NULL,
  `numero_serie` VARCHAR(40) NOT NULL,
  `material` VARCHAR(100) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `piezascol` VARCHAR(15) NOT NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  ALTER TABLE `drums`.`piezas` 
DROP COLUMN `piezascol`,
CHANGE COLUMN `peso` `peso` VARCHAR(15) NOT NULL ;

ALTER TABLE `drums`.`piezas` 
ADD CONSTRAINT `marca_pieza`
  FOREIGN KEY (`marca_id`)
  REFERENCES `drums`.`marcas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

CREATE TABLE `drums`.`baterias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(150) NOT NULL,
  `marca` VARCHAR(150) NOT NULL,
  `numero_serie` VARCHAR(40) NOT NULL,
  `peso` VARCHAR(15) NOT NULL,
  `distribuidor` VARCHAR(150) NOT NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `drums`.`baterias` 
ADD INDEX `marca_bateria_idx` (`marca_id` ASC) VISIBLE;


ALTER TABLE `drums`.`baterias` 
ADD CONSTRAINT `marca_bateria`
  FOREIGN KEY (`marca_id`)
  REFERENCES `drums`.`marcas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
CREATE TABLE `drums`.`distribuidores_baterias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bateria_id` INT NOT NULL,
  `distribuidor_id` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `drums`.`distribuidores_baterias` 
ADD INDEX `distribuidorbateria_bateria_idx` (`bateria_id` ASC) VISIBLE,
ADD INDEX `distribuidorbateria_distribuidor_idx` (`distribuidor_id` ASC) VISIBLE;

ALTER TABLE `drums`.`distribuidores_baterias` 
ADD CONSTRAINT `distribuidorbateria_bateria`
  FOREIGN KEY (`bateria_id`)
  REFERENCES `drums`.`baterias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `distribuidorbateria_distribuidor`
  FOREIGN KEY (`distribuidor_id`)
  REFERENCES `drums`.`distribuidor` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
