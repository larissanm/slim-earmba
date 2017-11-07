-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Nov-2017 às 20:18
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tearmcom_earmb_db`
--
CREATE DATABASE IF NOT EXISTS `tearmcom_earmb_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tearmcom_earmb_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id_cad` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `id_neuro` int(11) DEFAULT NULL,
  `nome` varchar(75) NOT NULL,
  `email` varchar(75) NOT NULL,
  `senha` varchar(16) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `permissao` int(2) NOT NULL,
  `datanasc` date NOT NULL,
  `rg` int(9) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cadastro`
--

INSERT INTO `cadastro` (`id_cad`, `login`, `id_neuro`, `nome`, `email`, `senha`, `sexo`, `permissao`, `datanasc`, `rg`, `telefone`, `imagem`) VALUES
(1, 'rafael', NULL, 'Rafael de Vasconcelos', 'fael.vasconcelloz@gmail.com', 'r123r123', 'Masculino', 0, '0000-00-00', 12358, '', ''),
(2, 'laura', NULL, 'Laura Arissa', 'moromisato.arissa@gmail.com', '123456', 'Masculino', 0, '0000-00-00', 81238, '(11) 92848-372', ''),
(3, 'mateus', NULL, 'Mateus Lara', 'm.lins98@hotmail.com', '123456', 'Masculino', 0, '1998-12-25', 12342, '(11) 92831-772', ''),
(4, 'pedro', NULL, 'Pedro Luiz', 'pedroluiz921@hotmail.com', 'p123p123', 'Masculino', 0, '2000-12-23', 19293, '(11) 40239-281', ''),
(5, 'raj', NULL, 'Rajnoia', 'rajnoia@raj.com', 'raj123', 'Feminino', 0, '2017-10-04', 11111, '(11) 11111-111', ''),
(6, 'medico', NULL, 'medico', 'medico@medico', 'medico123', 'Masculino', 11, '1980-11-11', 123456, '44444444', ''),
(7, 'paciente', 6, 'paciente', 'paciente@paceinte', 'paciente', 'Masculino', 33, '1960-03-03', 333333, '33333333', '');

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
  `dosagem` varchar(25) NOT NULL,
  `miligramagem` varchar(25) NOT NULL,
  `id_cad` int(11) NOT NULL,
  `principio_ativo` varchar(100) NOT NULL,
  `intervalo` varchar(5) NOT NULL
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

--
-- Extraindo dados da tabela `nota_diaria`
--

INSERT INTO `nota_diaria` (`id_nota_diaria`, `id_cad`, `resultadommes`, `resultadotp`, `resultadotf`, `data`, `semana`) VALUES
(1, 7, 25, 25, 25, '2017-11-06', 45),
(2, 7, 25, 12, 10, '2017-11-07', 45),
(3, 7, 12, 5, 7, '2017-11-08', 45),
(4, 7, 0, 26, 30, '2017-11-09', 45),
(5, 7, 10, 15, 20, '2017-11-10', 45),
(6, 7, 5, 9, 12, '2017-11-11', 45),
(7, 7, 15, 10, 7, '2017-11-12', 45);

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
-- Estrutura da tabela `resposta_stc`
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
  `observacao` varchar(350) DEFAULT NULL,
  `local` varchar(72) NOT NULL,
  `hora_inicio` varchar(5) NOT NULL,
  `hora_termino` varchar(5) NOT NULL,
  `data` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rotina`
--

INSERT INTO `rotina` (`id_atividade`, `nome`, `id_cad`, `clima`, `observacao`, `local`, `hora_inicio`, `hora_termino`, `data`) VALUES
(13, 'Andar', 7, 'Ensolarado', 'Andou ouvindo Musica', 'Avenida Principal', '12:00', '14:00', '2017-10-22'),
(14, 'Nadar', 7, 'ensolarado', 'Fez Atividades no Clube AAP', 'Clube AAP', '14:00', '14:30', '2017-10-22'),
(15, 'Andar', 7, 'Ensolarado', NULL, 'Praia', '04:04', '05:00', '2017-10-25'),
(16, 'Jogar PS3', 7, 'Qualquer', 'Jogar ate esquecer q tem q jogar de novo', 'Em casa', '00:00', '10:07', '2017-10-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `testes`
--

CREATE TABLE `testes` (
  `login` varchar(10) NOT NULL,
  `senha` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `testes`
--

INSERT INTO `testes` (`login`, `senha`) VALUES
('asdasds', ''),
('567', ''),
('rfa', ''),
('rafa', 'r123r123'),
('rafaeee', '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_stc`
--

CREATE TABLE `teste_stc` (
  `id_pergunta_stc` int(11) NOT NULL,
  `pergunta_stc` varchar(250) NOT NULL
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
-- Indexes for table `resposta_stc`
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
  MODIFY `id_cad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_clima`
--
ALTER TABLE `data_clima`
  MODIFY `id_dataclima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nota_diaria`
--
ALTER TABLE `nota_diaria`
  MODIFY `id_nota_diaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissao`
--
ALTER TABLE `permissao`
  MODIFY `cod_permissao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resposta_stc`
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
  MODIFY `id_atividade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `teste_stc`
--
ALTER TABLE `teste_stc`
  MODIFY `id_pergunta_stc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teste_vol`
--
ALTER TABLE `teste_vol`
  MODIFY `id_perguta_vol` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
