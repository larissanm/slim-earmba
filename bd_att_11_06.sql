-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Set-2017 às 20:07
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `earmb_db`
--
CREATE DATABASE IF NOT EXISTS `earmb_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `earmb_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id_cad` int(11) NOT NULL,
  `id_neuro` int(11) DEFAULT NULL,
  `nome` varchar(75) NOT NULL,
  `email` varchar(75) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `permissao` int(2) NOT NULL,
  `datanasc` int(8) NOT NULL,
  `rg` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_clima`
--

CREATE TABLE `data_clima` (
  `id_dataclima` int(11) NOT NULL,
  `data` date NOT NULL,
  `clima` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_remedio` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `dosagem` int(11) NOT NULL,
  `miligramagem` int(11) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `principio_ativo` int(11) NOT NULL,
  `intervalo` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_diaria`
--

CREATE TABLE `nota_diaria` (
  `id_nota_diaria` int(11) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `resultadommes` int(11) NOT NULL,
  `resultadotp` int(11) NOT NULL,
  `resultadotf` int(11) NOT NULL,
  `data` date NOT NULL,
  `semana` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE `permissao` (
  `cod_permissao` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta_src`
--

CREATE TABLE `resposta_stc` (
  `id_resposta_stc` int(11) NOT NULL,
  `id_pergunta_stc` int(11) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `observacao` varchar(300) DEFAULT NULL,
  `id_dataclima` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta_vol`
--

CREATE TABLE `resposta_vol` (
  `id_resposta_vol` int(11) NOT NULL,
  `id_pergunta_vol` int(11) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `observacao` varchar(300) DEFAULT NULL,
  `id_data_clima` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotina`
--

CREATE TABLE `rotina` (
  `id_atividade` int(11) NOT NULL,
  `nome` varchar(72) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `clima` varchar(20) NOT NULL,
  `observacao` varchar(350) NOT NULL,
  `local` varchar(72) NOT NULL,
  `duracao` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_stc`
--

CREATE TABLE `teste_stc` (
  `id_pergunta_stc` int(11) NOT NULL,
  `pergunta_stc` varchar(250) NOT NULL,
  `tipo_stc` int(11) NOT NULL,
  `valor_peso` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_vol`
--

CREATE TABLE `teste_vol` (
  `id_perguta_vol` int(11) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `pergunta_vol` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id_cad`);

--
-- Indexes for table `data_clima`
--
ALTER TABLE `data_clima`
  ADD PRIMARY KEY (`id_dataclima`);

--
-- Indexes for table `nota_diaria`
--
ALTER TABLE `nota_diaria`
  ADD PRIMARY KEY (`id_nota_diaria`);

--
-- Indexes for table `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`cod_permissao`);

--
-- Indexes for table `resposta_src`
--
ALTER TABLE `resposta_stc`
  ADD PRIMARY KEY (`id_resposta_stc`);

--
-- Indexes for table `resposta_vol`
--
ALTER TABLE `resposta_vol`
  ADD PRIMARY KEY (`id_resposta_vol`);

--
-- Indexes for table `rotina`
--
ALTER TABLE `rotina`
  ADD PRIMARY KEY (`id_atividade`);

--
-- Indexes for table `teste_stc`
--
ALTER TABLE `teste_stc`
  ADD PRIMARY KEY (`id_pergunta_stc`);

--
-- Indexes for table `teste_vol`
--
ALTER TABLE `teste_vol`
  ADD PRIMARY KEY (`id_perguta_vol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id_cad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_clima`
--
ALTER TABLE `data_clima`
  MODIFY `id_dataclima` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nota_diaria`
--
ALTER TABLE `nota_diaria`
  MODIFY `id_nota_diaria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissao`
--
ALTER TABLE `permissao`
  MODIFY `cod_permissao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resposta_src`
--
ALTER TABLE `resposta_stc`
  MODIFY `id_resposta_stc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resposta_vol`
--
ALTER TABLE `resposta_vol`
  MODIFY `id_resposta_vol` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rotina`
--
ALTER TABLE `rotina`
  MODIFY `id_atividade` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teste_stc`
--
ALTER TABLE `teste_stc`
  MODIFY `id_pergunta_stc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teste_vol`
--
ALTER TABLE `teste_vol`
  MODIFY `id_perguta_vol` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
