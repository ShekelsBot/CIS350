-- Andrew Bruckbauer
-- 12/12/2021
-- ParkingBot DB

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema parkingspots
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parkingspots
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parkingspots` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `parkingspots` ;

-- -----------------------------------------------------
-- Table `parkingspots`.`rate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parkingspots`.`rate` (
  `Start` INT NULL DEFAULT NULL,
  `End` INT NULL DEFAULT NULL,
  `Fee` INT NOT NULL,
  `RateTimePeriod` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Fee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parkingspots`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parkingspots`.`customers` (
  `CustomerID` INT NOT NULL,
  `FName` VARCHAR(30) NULL DEFAULT NULL,
  `LName` VARCHAR(30) NULL DEFAULT NULL,
  `Address` VARCHAR(30) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  `Phone` VARCHAR(30) NULL DEFAULT NULL,
  `Fee` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `Fee` (`Fee` ASC) VISIBLE,
  CONSTRAINT `customers_ibfk_1`
    FOREIGN KEY (`Fee`)
    REFERENCES `parkingspots`.`rate` (`Fee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parkingspots`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parkingspots`.`address` (
  `Street` VARCHAR(30) NULL DEFAULT NULL,
  `City` VARCHAR(30) NULL DEFAULT NULL,
  `State` VARCHAR(30) NULL DEFAULT NULL,
  `Zip` INT NULL DEFAULT NULL,
  `customers_CustomerID` INT NOT NULL,
  INDEX `fk_address_customers1_idx` (`customers_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_address_customers1`
    FOREIGN KEY (`customers_CustomerID`)
    REFERENCES `parkingspots`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parkingspots`.`spot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parkingspots`.`spot` (
  `SpotID` INT NOT NULL,
  `SpotNum` INT NULL DEFAULT NULL,
  `SpotFloor` INT NULL DEFAULT NULL,
  `SpotStat` VARCHAR(30) NULL DEFAULT NULL,
  `customers_CustomerID` INT NOT NULL,
  PRIMARY KEY (`SpotID`),
  INDEX `fk_spot_customers1_idx` (`customers_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_spot_customers1`
    FOREIGN KEY (`customers_CustomerID`)
    REFERENCES `parkingspots`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parkingspots`.`parking_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parkingspots`.`parking_event` (
  `SpotID` INT NULL DEFAULT NULL,
  `Date` INT NULL DEFAULT NULL,
  `Start` INT NULL DEFAULT NULL,
  `End` INT NULL DEFAULT NULL,
  `PicID` INT NOT NULL,
  PRIMARY KEY (`PicID`),
  INDEX `SpotID` (`SpotID` ASC) VISIBLE,
  CONSTRAINT `parking_event_ibfk_1`
    FOREIGN KEY (`SpotID`)
    REFERENCES `parkingspots`.`spot` (`SpotID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
