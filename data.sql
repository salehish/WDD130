-- 
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art_gallery` ;

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `art_gallery` ;

-- -----------------------------------------------------
-- Table `art_gallery`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artist` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(20) NOT NULL,
  `mname` VARCHAR(20) NULL DEFAULT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `dob` INT NOT NULL,
  `dod` INT NULL DEFAULT NULL,
  `country` VARCHAR(25) NOT NULL,
  `local_artist` ENUM('y', 'n') NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork` (
  `artwork_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `artyear` INT NOT NULL,
  `period` VARCHAR(25) NULL DEFAULT NULL,
  `arttype` VARCHAR(20) NULL DEFAULT NULL,
  `artfile` VARCHAR(25) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`),
  INDEX `fk_artwork_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art_gallery`.`artist` (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`keyword` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`artwork_has_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork_has_keyword` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork_has_keyword` (
  `artwork_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`, `keyword_id`),
  INDEX `fk_artwork_has_keyword_keyword1_idx` (`keyword_id` ASC) VISIBLE,
  INDEX `fk_artwork_has_keyword_artwork1_idx` (`artwork_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_has_keyword_artwork1`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `art_gallery`.`artwork` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_keyword1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `art_gallery`.`keyword` (`keyword_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO artist VALUES
    (1,'Vincent van Gogh'),
    (2,'Rembrandt Harmenszoon Van Rijn'), 
    (3,'Leonardo da Vinci'), 
    (4,'Venture Lonzo Coy'), 
    (5,'Deborah Gill'), 
    (6,'Claude Monet'),
    (7,'Pablo Picasso'), 
    (8,'Michelangelo di Lodovico Simoni');
    
SELECT * FROM artist;
    
INSERT INTO artwork VALUES
	(1, 'Irises', 1889, 'Impressionism', 'Oil', 'irises.jpg', 'flowers', 1),
    (2, 'The Starry Night', 1889, 'Post-Impressionism', 'Oil', 'starrynight.jpg', 'blue, landscape', 1),
    (3, 'Sunflowers', 1888, 'Post-Impressionism', 'Oil', 'sunflowers.jpg', 'flowers', 1),
    (4, 'Night Watch', 1642, 'Baroque', 'Oil', 'nightwatch.jpg', 'girl,people,battle', 2),
    (5, 'Storm on the sea of Galilee', 1633, 'Dutch Golden Age', 'Oil', 'stormgalilee.jpg', 'boat,water,peaple, Christ', 2),
    (6, 'Head of a Woman', 1508, 'High Renaissance', 'Oil', 'headwoman.jpg', 'girl, people', 3),
    (7, 'Last Supper', 1498, 'Renaissance', 'Tempra', 'lastsupper.jpg', 'food, people, Christ', 3),
    (8, 'Mona Lisa', 1517, 'Renaissance', 'Oil', 'monalisa.jpg', 'girl, people', 3),
    (9, 'Hillside Stream', 2005, 'Modern', 'Oil', 'hillsidestream.jpg', 'water, landscape', 4),
    (10, 'Old Barn', 1992, 'Modern', 'Oil', 'Oldbarn.jpg', 'landscape', 4),
    (11, 'Beach Baby', 1999, 'Modern', 'Watercolor', 'beachbaby.jpg', 'water,people,baby', 5),
    (12, 'Women in the Garden', 1904, 'Impressionism', 'Oil', 'landscape, people, flowers', 7),
    (13, 'Old Guitarist', 1904, ' Modern', 'Oil', 'guitarist.jpg', 'blue, people', 8);
    
    

INSERT INTO keyword VALUES
(1, 'flowers'),
(2, 'blue'),
(3, 'landscape'),
(4, 'girl'),
(5, 'people'),
(6, 'battle'),
(7, 'boat'),
(8, 'water'),
(9, 'Christ'),
(10, 'food'),
(11, 'baby');

INSERT INTO artwork_has_keyword VALUES
	(1, 1),
    (1, 2),
    (3, 2),
    (4, 1);
	

  --