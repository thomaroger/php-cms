SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `cms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `cms`;

-- -----------------------------------------------------
-- Table `cms`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`category` (
  `id` INT NOT NULL ,
  `category_id` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`page` (
  `id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `author` VARCHAR(255) NULL ,
  `date_publish` DATETIME NULL ,
  `title` VARCHAR(255) NULL ,
  `content` TEXT NULL ,
  `count_view` INT NULL ,
  PRIMARY KEY (`id`, `category_id`) ,
  INDEX `fk_page_category1` (`category_id` ASC) ,
  CONSTRAINT `fk_page_category1`
    FOREIGN KEY (`category_id` )
    REFERENCES `cms`.`category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`tag` (
  `id` INT NOT NULL ,
  `value` VARCHAR(255) NULL ,
  `weight` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`comment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`comment` (
  `id` INT NOT NULL ,
  `page_id` INT NOT NULL ,
  `author` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL ,
  `content` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comment_page` (`page_id` ASC) ,
  CONSTRAINT `fk_comment_page`
    FOREIGN KEY (`page_id` )
    REFERENCES `cms`.`page` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`page_has_tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`page_has_tag` (
  `page_id` INT NOT NULL ,
  `tag_id` INT NOT NULL ,
  PRIMARY KEY (`page_id`, `tag_id`) ,
  INDEX `fk_page_has_tag_page1` (`page_id` ASC) ,
  INDEX `fk_page_has_tag_tag1` (`tag_id` ASC) ,
  CONSTRAINT `fk_page_has_tag_page1`
    FOREIGN KEY (`page_id` )
    REFERENCES `cms`.`page` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_page_has_tag_tag1`
    FOREIGN KEY (`tag_id` )
    REFERENCES `cms`.`tag` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`meta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`meta` (
  `id` INT NOT NULL ,
  `model_id` INT NULL ,
  `record_id` INT NULL ,
  `created_At` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`log` (
  `id` INT NOT NULL ,
  `model_id` INT NULL ,
  `record_id` VARCHAR(45) NULL ,
  `criticity` INT NULL ,
  `value` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
