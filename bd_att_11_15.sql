-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Nov-2017 às 02:28
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
-- Database: `crudslim`
--
CREATE DATABASE IF NOT EXISTS `crudslim` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `crudslim`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `senha` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `nome`, `senha`) VALUES
(42, NULL, NULL),
(43, NULL, NULL),
(44, NULL, NULL),
(45, NULL, NULL),
(46, NULL, NULL),
(47, NULL, '12'),
(48, NULL, '12'),
(49, NULL, '12'),
(50, NULL, NULL),
(51, NULL, '12'),
(52, NULL, '12'),
(53, NULL, NULL),
(54, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Extraindo dados da tabela `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tearmcom_earmb_db\",\"table\":\"rotina\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"nota_diaria\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"testes\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"teste_vol\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"cadastro\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"teste_stc\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"resposta_stc\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"resposta_vol\"},{\"db\":\"tearmcom_earmb_db\",\"table\":\"medicamentos\"},{\"db\":\"crudslim\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-10-07 16:47:54', '{\"lang\":\"pt\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
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
(1, 7, 25, 25, 25, '2017-11-13', 46),
(2, 7, 25, 12, 10, '2017-11-14', 46),
(3, 7, 12, 5, 7, '2017-11-15', 46),
(4, 7, 0, 26, 30, '2017-11-16', 46),
(5, 7, 10, 15, 20, '2017-11-17', 46),
(6, 7, 5, 9, 12, '2017-11-18', 46),
(8, 7, 18, 15, 19, '2017-11-19', 46),
(9, 7, 19, 30, 25, '2017-11-06', 45),
(10, 7, 20, 27, 23, '2017-11-07', 45),
(11, 7, 15, 18, 18, '2017-11-08', 45),
(12, 7, 17, 20, 18, '2017-11-09', 45),
(13, 7, 13, 22, 22, '2017-11-10', 45),
(14, 7, 16, 20, 15, '2017-11-11', 45),
(15, 7, 15, 21, 27, '2017-11-12', 45);

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
  `data` date NOT NULL,
  `clima` varchar(50) NOT NULL
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
(16, 'Jogar PS3', 7, 'Qualquer', 'Jogar ate esquecer q tem q jogar de novo', 'Em casa', '00:00', '10:07', '2017-10-25'),
(22, 'FAzer TCC', 7, 'Ensolarado', NULL, 'ETEC', '03:00', '05:00', '2017-11-14'),
(23, 'Jogar R6', 7, 'Ensolarado', '', 'PC', '15:00', '17:00', '2017-11-06'),
(24, 'Jogar LOL', 7, 'Triste', '', 'PC', '15:00', '17:00', '2017-11-13'),
(25, 'Assistir Live', 7, 'Ensolarado', NULL, 'PC', '14:00', '15:00', '2017-11-15'),
(26, 'Andar', 7, 'Ensolarado', 'Andou ouvindo Musica', 'Avenida Principal', '12:00', '14:00', '2017-11-13'),
(27, 'Fazer TCC', 7, 'Estranho', NULL, 'PC', '06:00', '08:00', '2017-11-15');

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
  MODIFY `id_nota_diaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `permissao`
--
ALTER TABLE `permissao`
  MODIFY `cod_permissao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resposta_stc`
--
ALTER TABLE `resposta_stc`
  MODIFY `id_resposta_stc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `resposta_vol`
--
ALTER TABLE `resposta_vol`
  MODIFY `id_resposta_vol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rotina`
--
ALTER TABLE `rotina`
  MODIFY `id_atividade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `teste_stc`
--
ALTER TABLE `teste_stc`
  MODIFY `id_pergunta_stc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teste_vol`
--
ALTER TABLE `teste_vol`
  MODIFY `id_perguta_vol` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
