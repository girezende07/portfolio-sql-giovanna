CREATE TABLE `ordemservico` (
  `IdOrdemServico` int NOT NULL AUTO_INCREMENT,
  `DataAbertura` datetime NOT NULL,
  `Equipamento` varchar(50) DEFAULT NULL,
  `Problema` varchar(100) DEFAULT NULL,
  `Observacao` varchar(200) DEFAULT NULL,
  `Prioridade` enum('Baixa','Média','Alta') DEFAULT NULL,
  `Estado` enum('Aberta','Em execução','Concluída') DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `IdTecnico` int DEFAULT NULL,
  `IdFinalizacao` int DEFAULT NULL,
  PRIMARY KEY (`IdOrdemServico`),
  KEY `IdTecnico` (`IdTecnico`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `ordemservico_ibfk_1` FOREIGN KEY (`IdTecnico`) REFERENCES `tecnico` (`IdTecnico`),
  CONSTRAINT `ordemservico_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
