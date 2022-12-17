-- Creating the first table
CREATE TABLE marcas (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    pais VARCHAR(20)
);
-- Changing the data type of the columns in the 'marcas' table
ALTER TABLE `drums`.`marcas` 
CHARACTER SET = utf8 ,
CHANGE COLUMN `nombre` `nombre` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `pais` `pais` VARCHAR(150) NULL DEFAULT NULL ;

-- Creating the 'distribuidor' table
CREATE TABLE `drums`.`distribuidor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `numero_telefono` VARCHAR(150) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(150) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`)) -- Primary key of this table
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE distribuidor RENAME TO distribuidores;

-- Creating the next table named 'piezas'
CREATE TABLE `drums`.`piezas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(150) NOT NULL,
  `distribuidor` VARCHAR(150) NOT NULL,
  `numero_serie` VARCHAR(40) NOT NULL,
  `material` VARCHAR(100) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `piezascol` VARCHAR(15) NOT NULL, -- This column was created by mistake
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  -- All the columns in this table but 'id' has the constrain 'NOT NULL'
  
  ALTER TABLE `drums`.`piezas` 
DROP COLUMN `piezascol`, -- In here I delete this column 
CHANGE COLUMN `peso` `peso` VARCHAR(15) NOT NULL ; -- And reduce the length of this column from 45 to 15

-- First foreign key 'marca_id' in the 'piezas' table
ALTER TABLE `drums`.`piezas` 
ADD CONSTRAINT `marca_pieza`
  FOREIGN KEY (`marca_id`)
  REFERENCES `drums`.`marcas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `drums`.`piezas`
ADD COLUMN `nombre` VARCHAR(100) NOT NULL AFTER `id`,
DROP COLUMN `marca`;

-- Changing the table 'piezas' to add a foreign key'
ALTER TABLE `drums`.`piezas` 
CHANGE COLUMN `distribuidor` `distribuidor_id` INT NOT NULL AFTER `marca_id`,
ADD INDEX `distribuidor_pieza_idx` (`distribuidor_id` ASC) VISIBLE;

ALTER TABLE `drums`.`piezas` 
ADD CONSTRAINT `distribuidor_pieza`
  FOREIGN KEY (`distribuidor_id`)
  REFERENCES `drums`.`distribuidores` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

-- Next table 'baterias'
CREATE TABLE `drums`.`baterias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(150) NOT NULL,
  `marca` VARCHAR(150) NOT NULL,
  `numero_serie` VARCHAR(40) NOT NULL,
  `peso` VARCHAR(15) NOT NULL,
  `distribuidor` VARCHAR(150) NOT NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id`)); -- The primary key

-- Making some adjustments to the table 
ALTER TABLE `drums`.`baterias` 
ADD INDEX `marca_bateria_idx` (`marca_id` ASC) VISIBLE; -- Foreign key for table 'marcas'

ALTER TABLE `drums`.`baterias` 
ADD CONSTRAINT `marca_bateria`
  FOREIGN KEY (`marca_id`)
  REFERENCES `drums`.`marcas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
ALTER TABLE `drums`.`baterias` 
DROP COLUMN `marca`, -- Drop this column because it already has the 'marca_id' column
CHANGE COLUMN `distribuidor` `distribuidor_id` INT NOT NULL , -- Rename this column to make it a foreign key
ADD INDEX `distribuidor_bateria_idx` (`distribuidor_id` ASC) VISIBLE;
;
ALTER TABLE `drums`.`baterias` 
ADD CONSTRAINT `distribuidor_bateria`
  FOREIGN KEY (`distribuidor_id`) 
  REFERENCES `drums`.`distribuidores` (`id`) -- Asigning the foreign key
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
-- This is the connection between the tables 'distribuidor' and 'baterias'
CREATE TABLE `drums`.`distribuidores_baterias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  /*This column*/ `bateria_id` INT NOT NULL,
  /*and this column*/ `distribuidor_id` INT NOT NULL, /*are the foreign keys*/
  PRIMARY KEY (`id`));

ALTER TABLE `drums`.`distribuidores_baterias` 
ADD INDEX `distribuidorbateria_bateria_idx` (`bateria_id` ASC) VISIBLE,
ADD INDEX `distribuidorbateria_distribuidor_idx` (`distribuidor_id` ASC) VISIBLE;

-- Asigning the references to the tables
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