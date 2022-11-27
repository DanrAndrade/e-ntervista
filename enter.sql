-- MySQL Script generated by MySQL Workbench
-- Sun Nov 27 17:07:10 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema entervista
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entervista
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entervista` DEFAULT CHARACTER SET utf8mb3 ;
USE `entervista` ;

-- -----------------------------------------------------
-- Table `entervista`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`area` (
  `nome` VARCHAR(80) NULL DEFAULT NULL,
  `id_area` BIGINT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`candidato` (
  `id_candidato` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `cumpleanos` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `numero_de_telefono` VARCHAR(255) NULL DEFAULT NULL,
  `ocupacion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_candidato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`perguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`perguntas` (
  `idPeguntas` INT NOT NULL AUTO_INCREMENT,
  `Perguntas` VARCHAR(200) NULL DEFAULT NULL,
  `id_peguntas` BIGINT NOT NULL,
  PRIMARY KEY (`idPeguntas`),
  UNIQUE INDEX `idPeguntas_UNIQUE` (`idPeguntas` ASC) ,
  UNIQUE INDEX `Perguntas_UNIQUE` (`Perguntas` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`questionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`questionario` (
  `idQuestionario` INT NOT NULL,
  `idArea` INT NOT NULL,
  PRIMARY KEY (`idQuestionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`questionariopergunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`questionariopergunta` (
  `idQuestionarioPergunta` INT NOT NULL,
  `idPeguntas` INT NULL DEFAULT NULL,
  `idQuestionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idQuestionarioPergunta`),
  INDEX `fk_perguntas_has_Questionario_Questionario1_idx` (`idQuestionario` ASC) ,
  INDEX `fk_perguntas_has_Questionario_perguntas1_idx` (`idPeguntas` ASC) ,
  CONSTRAINT `fk_perguntas_has_Questionario_perguntas1`
    FOREIGN KEY (`idPeguntas`)
    REFERENCES `entervista`.`perguntas` (`idPeguntas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_perguntas_has_Questionario_Questionario1`
    FOREIGN KEY (`idQuestionario`)
    REFERENCES `entervista`.`questionario` (`idQuestionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`user` (
  `idUser` INT NOT NULL,
  `nombreDeUsuario` VARCHAR(16) NOT NULL,
  `contrasena` VARCHAR(32) NULL DEFAULT NULL,
  `email` VARCHAR(190) NULL DEFAULT NULL,
  `idEntrevistador` INT NULL DEFAULT NULL,
  `id_user` BIGINT NOT NULL,
  `id_entrevistador` BIGINT NULL DEFAULT NULL,
  `nombre_de_usuario` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC) ,
  UNIQUE INDEX `nombreDeUsuario_UNIQUE` (`nombreDeUsuario` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`entrevista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`entrevista` (
  `idEntrevista` INT NOT NULL,
  `idUser` INT NULL DEFAULT NULL,
  `idCandidato` INT NULL DEFAULT NULL,
  `idArea` INT NULL DEFAULT NULL,
  `DataEntrevista` DATE NULL DEFAULT NULL,
  `IdQuestionarioPergunta` INT NOT NULL,
  `candidato_id_candidato` BIGINT NOT NULL,
  PRIMARY KEY (`idEntrevista`),
  INDEX `fk_Entrevista_user1_idx` (`idUser` ASC) ,
  INDEX `fk_Entrevista_perguntas_has_Questionario1_idx` (`IdQuestionarioPergunta` ASC) ,
  INDEX `fk_entrevista_candidato1_idx` (`candidato_id_candidato` ASC) ,
  CONSTRAINT `fk_entrevista_candidato1`
    FOREIGN KEY (`candidato_id_candidato`)
    REFERENCES `entervista`.`candidato` (`id_candidato`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Entrevista_perguntas_has_Questionario1`
    FOREIGN KEY (`IdQuestionarioPergunta`)
    REFERENCES `entervista`.`questionariopergunta` (`idQuestionarioPergunta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Entrevista_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `entervista`.`user` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`entrevistador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`entrevistador` (
  `id_entrevistador` BIGINT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `CPF` VARCHAR(11) NULL DEFAULT NULL,
  `RG` VARCHAR(9) NULL DEFAULT NULL,
  `dataNascimento` DATE NULL DEFAULT NULL,
  `matricula` INT NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_entrevistador`),
  UNIQUE INDEX `Matricula_UNIQUE` (`matricula` ASC) ,
  UNIQUE INDEX `RG_UNIQUE` (`RG` ASC) ,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entervista`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entervista`.`hibernate_sequence` (
  `next_val` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
