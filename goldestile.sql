-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/06/2025 às 23:44
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `goldestile`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `ID_Admin` int(40) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Senha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `camisa`
--

CREATE TABLE `camisa` (
  `ID` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `nome` varchar(30) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `ID_Admin_FK` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(255) DEFAULT NULL,
  `CPF` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `Protocolo` int(11) NOT NULL,
  `Valor_Total` int(11) NOT NULL,
  `CPF_Cliente_FK` int(11) NOT NULL,
  `ID_Camisa_FK` int(11) NOT NULL,
  `Data_Compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Índices de tabela `camisa`
--
ALTER TABLE `camisa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Admin_FK` (`ID_Admin_FK`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`Protocolo`),
  ADD KEY `CPF_Cliente_FK` (`CPF_Cliente_FK`),
  ADD KEY `ID_Camisa_FK` (`ID_Camisa_FK`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `camisa`
--
ALTER TABLE `camisa`
  ADD CONSTRAINT `camisa_ibfk_1` FOREIGN KEY (`ID_Admin_FK`) REFERENCES `administrador` (`ID_Admin`);

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`CPF_Cliente_FK`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`ID_Camisa_FK`) REFERENCES `camisa` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
