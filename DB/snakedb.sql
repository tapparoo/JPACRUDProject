-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema snakedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `snakedb` ;

-- -----------------------------------------------------
-- Schema snakedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `snakedb` DEFAULT CHARACTER SET utf8 ;
USE `snakedb` ;

-- -----------------------------------------------------
-- Table `species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `species` ;

CREATE TABLE IF NOT EXISTS `species` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `default_image_url` TEXT NOT NULL,
  `species` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `snake`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `snake` ;

CREATE TABLE IF NOT EXISTS `snake` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `length_in_cm` DOUBLE NULL,
  `weight_in_grams` DECIMAL(20,1) NULL,
  `date_of_birth` DATE NOT NULL,
  `morph` VARCHAR(105) NULL,
  `image_url` TEXT NULL COMMENT 'URL',
  `purchased_from` TEXT NULL COMMENT 'URL',
  `species_id` SMALLINT NULL,
  PRIMARY KEY (`id`),
  INDEX `species_id_idx` (`species_id` ASC),
  CONSTRAINT `species_id`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS snakeuser;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'snakeuser' IDENTIFIED BY 'snakeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'snakeuser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `species`
-- -----------------------------------------------------
START TRANSACTION;
USE `snakedb`;
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'Black-Headed Bushmaster', 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Lachesis_melanocephala.JPG', 'Lachesis melanocephala');
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'King Cobra', 'https://upload.wikimedia.org/wikipedia/commons/9/98/Ophiophagus-hannah-kaeng-krachan-national-park.jpg', 'Ophiophagus hannah');
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'Boa Constrictor', 'https://upload.wikimedia.org/wikipedia/commons/9/90/Boa_constrictor%2C_Va%C5%88kovka%2C_Brno_%282%29.jpg', 'Boa constrictor');
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'Green Anaconda', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Anaconda_Loreto_Peru.jpg', 'Eunectes murinus');
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'Ball Python', 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Ball_python_lucy.JPG', 'Python regius');
INSERT INTO `species` (`id`, `name`, `default_image_url`, `species`) VALUES (DEFAULT, 'Green Tree Python', 'https://upload.wikimedia.org/wikipedia/commons/f/ff/Morelia-viridis.jpg', 'Morelia viridis');

COMMIT;


-- -----------------------------------------------------
-- Data for table `snake`
-- -----------------------------------------------------
START TRANSACTION;
USE `snakedb`;
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Bertha', 157, 6950, '2010-03-14', 'Piebald', 'https://ballpython.ca/wp-content/uploads/2013/06/piebald-leopard-col.jpg', 'https://www.bhbreptiles.com/collections/ball-pythons', 5);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Smalls', 25, 375, '2019-01-03', 'Clown', 'http://www.worldofballpythons.com/files/morphs/clown/019.jpg', 'http://snakesatsunset.com/snakes/ball-pythons-for-sale/', 5);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Steve', 170, 37500, '1980-12-13', NULL, NULL, NULL, 5);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Thor', 633.3, 210456.99, '1999-03-03', NULL, 'http://www.animalspot.net/wp-content/uploads/2017/06/Green-Anaconda.jpg', 'https://www.backwaterreptiles.com/snakes/green-anaconda-for-sale.html', 4);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Thor Jr.', 242.2, 88199.76, '2010-07-14', NULL, NULL, NULL, 4);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Sticky', 22, 45, '2019-01-09', NULL, 'https://www.snaketype.com/wp-content/uploads/green-python_200-623x200.jpg', 'https://undergroundreptiles.com/product-category/animals/snakes/green-tree-pythons/', 6);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Slithers', 160, 225, '2016-01-02', NULL, NULL, NULL, 6);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Bitey', 456, 7899, '2008-04-30', NULL, 'https://i.pinimg.com/originals/97/01/bd/9701bd7a702a880901afa4072c6160ea.jpg', NULL, 1);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Demon', 321, 9876, '2013-08-09', NULL, NULL, NULL, 1);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Fangs', 1113, 2224, '2015-06-07', NULL, 'https://animals.net/wp-content/uploads/2018/09/King-Cobra-5-650x425.jpg', NULL, 2);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Fangs Two', 3331, 4442, '2007-06-15', NULL, NULL, NULL, 2);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Thumper', 4212, 75000, '2009-09-09', NULL, 'https://crees-manu.org/wp-content/uploads/2017/03/boa-manu-amazon-rainforest-crees-deigo-sanchez4.jpg', NULL, 3);
INSERT INTO `snake` (`id`, `name`, `length_in_cm`, `weight_in_grams`, `date_of_birth`, `morph`, `image_url`, `purchased_from`, `species_id`) VALUES (DEFAULT, 'Sleepy', 5313, 69000, '2006-08-08', NULL, NULL, NULL, 3);

COMMIT;

