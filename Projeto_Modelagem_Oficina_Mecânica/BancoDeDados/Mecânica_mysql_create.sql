CREATE TABLE `Clientes` (
	`Id Cliente` INT NOT NULL AUTO_INCREMENT,
	`Nome Cliente` varchar(255) NOT NULL,
	`CPF ou CNPJ` VARCHAR(255) NOT NULL,
	`Endereço` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`CPF ou CNPJ`)
);

CREATE TABLE `Ordem de Serviço` (
	`Número da OS` INT NOT NULL AUTO_INCREMENT,
	`Descrição Serviço` VARCHAR(255) NOT NULL,
	`Data Emissão` DATE NOT NULL,
	`Valor da OS` DECIMAL NOT NULL,
	`Status de Conclusão` VARCHAR(255) NOT NULL,
	`Data Conclusão` DATE NOT NULL,
	`Autorização` VARCHAR(255) NOT NULL,
	`Id Equipe` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Número da OS`)
);

CREATE TABLE `Carros` (
	`Placa Carro` VARCHAR(255) NOT NULL,
	`Nome Cliente` varchar(255) NOT NULL,
	`Modelo Carro` VARCHAR(255) NOT NULL,
	`Número de OS` INT NOT NULL,
	PRIMARY KEY (`Placa Carro`)
);

CREATE TABLE `Mecânicos` (
	`Id Mêcanico` INT NOT NULL AUTO_INCREMENT,
	`Nome Mecânico` varchar(255) NOT NULL,
	`Especialidade Mecânico` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Endereço` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id Mêcanico`,`Especialidade Mecânico`)
);

CREATE TABLE `Equipe Mecânica` (
	`Nome Equipe` VARCHAR(255) NOT NULL,
	`Descrição Equipe` VARCHAR(255) NOT NULL,
	`Integrantes Equipe` VARCHAR(255) NOT NULL,
	`Id Equipe` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id Equipe`)
);

ALTER TABLE `Ordem de Serviço` ADD CONSTRAINT `Ordem de Serviço_fk0` FOREIGN KEY (`Descrição Serviço`) REFERENCES `Carros`(`Descrição Serviço`);

ALTER TABLE `Ordem de Serviço` ADD CONSTRAINT `Ordem de Serviço_fk1` FOREIGN KEY (`Id Equipe`) REFERENCES `Equipe Mecânica`(`Id Equipe`);

ALTER TABLE `Carros` ADD CONSTRAINT `Carros_fk0` FOREIGN KEY (`Placa Carro`) REFERENCES `Clientes`(`Nome Cliente`);

ALTER TABLE `Carros` ADD CONSTRAINT `Carros_fk1` FOREIGN KEY (`Nome Cliente`) REFERENCES `Clientes`(``);

ALTER TABLE `Carros` ADD CONSTRAINT `Carros_fk2` FOREIGN KEY (`Número de OS`) REFERENCES `Ordem de Serviço`(`Número da OS`);

ALTER TABLE `Mecânicos` ADD CONSTRAINT `Mecânicos_fk0` FOREIGN KEY (`Especialidade Mecânico`) REFERENCES `Mecânicos`(`Id Mêcanico`);

ALTER TABLE `Equipe Mecânica` ADD CONSTRAINT `Equipe Mecânica_fk0` FOREIGN KEY (`Integrantes Equipe`) REFERENCES `Mecânicos`(`Nome Mecânico`);






