-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2025 at 07:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'wc2026 Quiniela SQL DB', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"phpmyadmin\",\"test\",\"wc2026\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"wc2026\",\"table\":\"quinielas_control\"},{\"db\":\"wc2026\",\"table\":\"players_awarded\"},{\"db\":\"wc2026\",\"table\":\"quinielas_envios\"},{\"db\":\"wc2026\",\"table\":\"selected_players\"},{\"db\":\"wc2026\",\"table\":\"teams\"},{\"db\":\"wc2026\",\"table\":\"users\"},{\"db\":\"wc2026\",\"table\":\"leaderboard\"},{\"db\":\"wc2026\",\"table\":\"bets\"},{\"db\":\"wc2026\",\"table\":\"partidos\"},{\"db\":\"wc2026\",\"table\":\"players\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('wc2026', 'players', 'name');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'wc2026', 'teams', '{\"CREATE_TIME\":\"2025-03-17 16:01:44\",\"sorted_col\":\"`teams`.`name` ASC\"}', '2025-04-01 18:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-04-02 17:05:54', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `wc2026`
--
CREATE DATABASE IF NOT EXISTS `wc2026` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wc2026`;

-- --------------------------------------------------------

--
-- Table structure for table `bets`
--

CREATE TABLE `bets` (
  `partido_id` int(11) NOT NULL,
  `user_id` char(7) NOT NULL,
  `goles1` int(11) NOT NULL,
  `goles2` int(11) NOT NULL,
  `penales1` int(11) DEFAULT NULL,
  `penales2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favteam`
--

CREATE TABLE `favteam` (
  `user_id` varchar(7) NOT NULL,
  `teamid` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favteam`
--

INSERT INTO `favteam` (`user_id`, `teamid`) VALUES
('0124070', '1000047');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `usuario_id` char(7) NOT NULL,
  `puntos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partidos`
--

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL,
  `team1_id` char(7) NOT NULL,
  `goles1` int(11) DEFAULT 0,
  `penales1` int(11) DEFAULT 0,
  `team2_id` char(7) NOT NULL,
  `goles2` int(11) DEFAULT 0,
  `penales2` int(11) DEFAULT 0,
  `fecha` datetime NOT NULL,
  `stadium` varchar(255) NOT NULL,
  `fase` enum('FDG','16VOS','OCTAVOS','CUARTOS','SEMIS','FINAL','TERCER_PUESTO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partidos`
--

INSERT INTO `partidos` (`id`, `team1_id`, `goles1`, `penales1`, `team2_id`, `goles2`, `penales2`, `fecha`, `stadium`, `fase`) VALUES
(1, '1000001', NULL, NULL, '1000002', NULL, NULL, '2025-06-11 18:00:00', 'Estadio Azteca', 'FDG'),
(2, '1000003', NULL, NULL, '1000004', NULL, NULL, '2025-06-11 21:00:00', 'Estadio Azteca', 'FDG'),
(3, '1000001', NULL, NULL, '1000003', NULL, NULL, '2025-06-13 18:00:00', 'Estadio Azteca', 'FDG'),
(4, '1000002', NULL, NULL, '1000004', NULL, NULL, '2025-06-13 21:00:00', 'Estadio Azteca', 'FDG'),
(5, '1000001', NULL, NULL, '1000004', NULL, NULL, '2025-06-15 18:00:00', 'Estadio Azteca', 'FDG'),
(6, '1000002', NULL, NULL, '1000003', NULL, NULL, '2025-06-15 21:00:00', 'Estadio Azteca', 'FDG'),
(7, '1000005', NULL, NULL, '1000006', NULL, NULL, '2025-06-12 18:00:00', 'Estadio Maracanã', 'FDG'),
(8, '1000007', NULL, NULL, '1000008', NULL, NULL, '2025-06-12 21:00:00', 'Estadio Maracanã', 'FDG'),
(9, '1000005', NULL, NULL, '1000007', NULL, NULL, '2025-06-14 18:00:00', 'Estadio Maracanã', 'FDG'),
(10, '1000006', NULL, NULL, '1000008', NULL, NULL, '2025-06-14 21:00:00', 'Estadio Maracanã', 'FDG'),
(11, '1000005', NULL, NULL, '1000008', NULL, NULL, '2025-06-16 18:00:00', 'Estadio Maracanã', 'FDG'),
(12, '1000006', NULL, NULL, '1000007', NULL, NULL, '2025-06-16 21:00:00', 'Estadio Maracanã', 'FDG'),
(13, '1000009', NULL, NULL, '1000010', NULL, NULL, '2025-06-12 18:00:00', 'Estadio Maracanã', 'FDG'),
(14, '1000011', NULL, NULL, '1000012', NULL, NULL, '2025-06-12 21:00:00', 'Estadio Maracanã', 'FDG'),
(15, '1000009', NULL, NULL, '1000011', NULL, NULL, '2025-06-14 18:00:00', 'Estadio Maracanã', 'FDG'),
(16, '1000010', NULL, NULL, '1000012', NULL, NULL, '2025-06-14 21:00:00', 'Estadio Maracanã', 'FDG'),
(17, '1000009', NULL, NULL, '1000012', NULL, NULL, '2025-06-16 18:00:00', 'Estadio Maracanã', 'FDG'),
(18, '1000010', NULL, NULL, '1000011', NULL, NULL, '2025-06-16 21:00:00', 'Estadio Maracanã', 'FDG'),
(19, '1000013', NULL, NULL, '1000014', NULL, NULL, '2025-06-13 18:00:00', 'Estadio Azteca', 'FDG'),
(20, '1000015', NULL, NULL, '1000016', NULL, NULL, '2025-06-13 21:00:00', 'Estadio Azteca', 'FDG'),
(21, '1000013', NULL, NULL, '1000015', NULL, NULL, '2025-06-15 18:00:00', 'Estadio Azteca', 'FDG'),
(22, '1000014', NULL, NULL, '1000016', NULL, NULL, '2025-06-15 21:00:00', 'Estadio Azteca', 'FDG'),
(23, '1000013', NULL, NULL, '1000016', NULL, NULL, '2025-06-17 18:00:00', 'Estadio Azteca', 'FDG'),
(24, '1000014', NULL, NULL, '1000015', NULL, NULL, '2025-06-17 21:00:00', 'Estadio Azteca', 'FDG'),
(25, '1000017', NULL, NULL, '1000018', NULL, NULL, '2025-06-14 18:00:00', 'Estadio Maracanã', 'FDG'),
(26, '1000019', NULL, NULL, '1000020', NULL, NULL, '2025-06-14 21:00:00', 'Estadio Maracanã', 'FDG'),
(27, '1000017', NULL, NULL, '1000019', NULL, NULL, '2025-06-16 18:00:00', 'Estadio Maracanã', 'FDG'),
(28, '1000018', NULL, NULL, '1000020', NULL, NULL, '2025-06-16 21:00:00', 'Estadio Maracanã', 'FDG'),
(29, '1000017', NULL, NULL, '1000020', NULL, NULL, '2025-06-18 18:00:00', 'Estadio Maracanã', 'FDG'),
(30, '1000018', NULL, NULL, '1000019', NULL, NULL, '2025-06-18 21:00:00', 'Estadio Maracanã', 'FDG'),
(31, '1000021', NULL, NULL, '1000022', NULL, NULL, '2025-06-14 18:00:00', 'Estadio Azteca', 'FDG'),
(32, '1000023', NULL, NULL, '1000024', NULL, NULL, '2025-06-14 21:00:00', 'Estadio Azteca', 'FDG'),
(33, '1000021', NULL, NULL, '1000023', NULL, NULL, '2025-06-16 18:00:00', 'Estadio Azteca', 'FDG'),
(34, '1000022', NULL, NULL, '1000024', NULL, NULL, '2025-06-16 21:00:00', 'Estadio Azteca', 'FDG'),
(35, '1000021', NULL, NULL, '1000024', NULL, NULL, '2025-06-18 18:00:00', 'Estadio Azteca', 'FDG'),
(36, '1000022', NULL, NULL, '1000023', NULL, NULL, '2025-06-18 21:00:00', 'Estadio Azteca', 'FDG'),
(37, '1000025', NULL, NULL, '1000026', NULL, NULL, '2025-06-15 18:00:00', 'Estadio Azteca', 'FDG'),
(38, '1000027', NULL, NULL, '1000028', NULL, NULL, '2025-06-15 21:00:00', 'Estadio Azteca', 'FDG'),
(39, '1000025', NULL, NULL, '1000027', NULL, NULL, '2025-06-17 18:00:00', 'Estadio Azteca', 'FDG'),
(40, '1000026', NULL, NULL, '1000028', NULL, NULL, '2025-06-17 21:00:00', 'Estadio Azteca', 'FDG'),
(41, '1000025', NULL, NULL, '1000028', NULL, NULL, '2025-06-19 18:00:00', 'Estadio Azteca', 'FDG'),
(42, '1000026', NULL, NULL, '1000027', NULL, NULL, '2025-06-19 21:00:00', 'Estadio Azteca', 'FDG'),
(43, '1000029', NULL, NULL, '1000030', NULL, NULL, '2025-06-15 18:00:00', 'Estadio Maracanã', 'FDG'),
(44, '1000031', NULL, NULL, '1000032', NULL, NULL, '2025-06-15 21:00:00', 'Estadio Maracanã', 'FDG'),
(45, '1000029', NULL, NULL, '1000031', NULL, NULL, '2025-06-17 18:00:00', 'Estadio Maracanã', 'FDG'),
(46, '1000030', NULL, NULL, '1000032', NULL, NULL, '2025-06-17 21:00:00', 'Estadio Maracanã', 'FDG'),
(47, '1000029', NULL, NULL, '1000032', NULL, NULL, '2025-06-19 18:00:00', 'Estadio Maracanã', 'FDG'),
(48, '1000030', NULL, NULL, '1000031', NULL, NULL, '2025-06-19 21:00:00', 'Estadio Maracanã', 'FDG'),
(49, '1000033', NULL, NULL, '1000034', NULL, NULL, '2025-06-16 18:00:00', 'Estadio Maracanã', 'FDG'),
(50, '1000035', NULL, NULL, '1000036', NULL, NULL, '2025-06-16 21:00:00', 'Estadio Maracanã', 'FDG'),
(51, '1000033', NULL, NULL, '1000035', NULL, NULL, '2025-06-18 18:00:00', 'Estadio Maracanã', 'FDG'),
(52, '1000034', NULL, NULL, '1000036', NULL, NULL, '2025-06-18 21:00:00', 'Estadio Maracanã', 'FDG'),
(53, '1000033', NULL, NULL, '1000036', NULL, NULL, '2025-06-20 18:00:00', 'Estadio Maracanã', 'FDG'),
(54, '1000034', NULL, NULL, '1000035', NULL, NULL, '2025-06-20 21:00:00', 'Estadio Maracanã', 'FDG'),
(55, '1000037', NULL, NULL, '1000038', NULL, NULL, '2025-06-17 18:00:00', 'Estadio Azteca', 'FDG'),
(56, '1000039', NULL, NULL, '1000040', NULL, NULL, '2025-06-17 21:00:00', 'Estadio Azteca', 'FDG'),
(57, '1000037', NULL, NULL, '1000039', NULL, NULL, '2025-06-19 18:00:00', 'Estadio Azteca', 'FDG'),
(58, '1000038', NULL, NULL, '1000040', NULL, NULL, '2025-06-19 21:00:00', 'Estadio Azteca', 'FDG'),
(59, '1000037', NULL, NULL, '1000040', NULL, NULL, '2025-06-21 18:00:00', 'Estadio Azteca', 'FDG'),
(60, '1000038', NULL, NULL, '1000039', NULL, NULL, '2025-06-21 21:00:00', 'Estadio Azteca', 'FDG'),
(61, '1000041', NULL, NULL, '1000042', NULL, NULL, '2025-06-18 18:00:00', 'Estadio Azteca', 'FDG'),
(62, '1000043', NULL, NULL, '1000044', NULL, NULL, '2025-06-18 21:00:00', 'Estadio Azteca', 'FDG'),
(63, '1000041', NULL, NULL, '1000043', NULL, NULL, '2025-06-20 18:00:00', 'Estadio Azteca', 'FDG'),
(64, '1000042', NULL, NULL, '1000044', NULL, NULL, '2025-06-20 21:00:00', 'Estadio Azteca', 'FDG'),
(65, '1000041', NULL, NULL, '1000044', NULL, NULL, '2025-06-22 18:00:00', 'Estadio Azteca', 'FDG'),
(66, '1000042', NULL, NULL, '1000043', NULL, NULL, '2025-06-22 21:00:00', 'Estadio Azteca', 'FDG'),
(67, '1000045', NULL, NULL, '1000046', NULL, NULL, '2025-06-19 18:00:00', 'Estadio Maracanã', 'FDG'),
(68, '1000047', NULL, NULL, '1000048', NULL, NULL, '2025-06-19 21:00:00', 'Estadio Maracanã', 'FDG'),
(69, '1000045', NULL, NULL, '1000047', NULL, NULL, '2025-06-21 18:00:00', 'Estadio Maracanã', 'FDG'),
(70, '1000046', NULL, NULL, '1000048', NULL, NULL, '2025-06-21 21:00:00', 'Estadio Maracanã', 'FDG'),
(71, '1000045', NULL, NULL, '1000048', NULL, NULL, '2025-06-23 18:00:00', 'Estadio Maracanã', 'FDG'),
(72, '1000046', NULL, NULL, '1000047', NULL, NULL, '2025-06-23 21:00:00', 'Estadio Maracanã', 'FDG'),
(73, '1000001', NULL, NULL, '1000002', NULL, NULL, '2025-06-25 16:00:00', 'Estadio Azteca', '16VOS'),
(74, '1000003', NULL, NULL, '1000004', NULL, NULL, '2025-06-25 19:00:00', 'Estadio Azteca', '16VOS'),
(75, '1000005', NULL, NULL, '1000006', NULL, NULL, '2025-06-26 16:00:00', 'Estadio Maracanã', '16VOS'),
(76, '1000007', NULL, NULL, '1000008', NULL, NULL, '2025-06-26 19:00:00', 'Estadio Maracanã', '16VOS'),
(77, '1000009', NULL, NULL, '1000010', NULL, NULL, '2025-06-27 16:00:00', 'Estadio Azteca', '16VOS'),
(78, '1000011', NULL, NULL, '1000012', NULL, NULL, '2025-06-27 19:00:00', 'Estadio Azteca', '16VOS'),
(79, '1000013', NULL, NULL, '1000014', NULL, NULL, '2025-06-28 16:00:00', 'Estadio Maracanã', '16VOS'),
(80, '1000015', NULL, NULL, '1000016', NULL, NULL, '2025-06-28 19:00:00', 'Estadio Maracanã', '16VOS'),
(81, '1000017', NULL, NULL, '1000018', NULL, NULL, '2025-06-29 16:00:00', 'Estadio Azteca', '16VOS'),
(82, '1000019', NULL, NULL, '1000020', NULL, NULL, '2025-06-29 19:00:00', 'Estadio Azteca', '16VOS'),
(83, '1000021', NULL, NULL, '1000022', NULL, NULL, '2025-06-30 16:00:00', 'Estadio Maracanã', '16VOS'),
(84, '1000023', NULL, NULL, '1000024', NULL, NULL, '2025-06-30 19:00:00', 'Estadio Maracanã', '16VOS'),
(85, '1000025', NULL, NULL, '1000026', NULL, NULL, '2025-07-01 16:00:00', 'Estadio Azteca', '16VOS'),
(86, '1000027', NULL, NULL, '1000028', NULL, NULL, '2025-07-01 19:00:00', 'Estadio Azteca', '16VOS'),
(87, '1000029', NULL, NULL, '1000030', NULL, NULL, '2025-07-02 16:00:00', 'Estadio Maracanã', '16VOS'),
(88, '1000031', NULL, NULL, '1000032', NULL, NULL, '2025-07-02 19:00:00', 'Estadio Maracanã', '16VOS'),
(89, '1000033', NULL, NULL, '1000034', NULL, NULL, '2025-07-03 16:00:00', 'Estadio Azteca', 'OCTAVOS'),
(90, '1000035', NULL, NULL, '1000036', NULL, NULL, '2025-07-03 19:00:00', 'Estadio Azteca', 'OCTAVOS'),
(91, '1000037', NULL, NULL, '1000038', NULL, NULL, '2025-07-04 16:00:00', 'Estadio Maracanã', 'OCTAVOS'),
(92, '1000039', NULL, NULL, '1000040', NULL, NULL, '2025-07-04 19:00:00', 'Estadio Maracanã', 'OCTAVOS'),
(93, '1000041', NULL, NULL, '1000042', NULL, NULL, '2025-07-05 16:00:00', 'Estadio Azteca', 'OCTAVOS'),
(94, '1000043', NULL, NULL, '1000044', NULL, NULL, '2025-07-05 19:00:00', 'Estadio Azteca', 'OCTAVOS'),
(95, '1000045', NULL, NULL, '1000046', NULL, NULL, '2025-07-06 16:00:00', 'Estadio Maracanã', 'OCTAVOS'),
(96, '1000047', NULL, NULL, '1000048', NULL, NULL, '2025-07-06 19:00:00', 'Estadio Maracanã', 'OCTAVOS'),
(97, '1000017', NULL, NULL, '1000020', NULL, NULL, '2025-07-07 16:00:00', 'Estadio Azteca', 'CUARTOS'),
(98, '1000025', NULL, NULL, '1000028', NULL, NULL, '2025-07-07 19:00:00', 'Estadio Azteca', 'CUARTOS'),
(99, '1000033', NULL, NULL, '1000036', NULL, NULL, '2025-07-08 16:00:00', 'Estadio Maracanã', 'CUARTOS'),
(100, '1000041', NULL, NULL, '1000044', NULL, NULL, '2025-07-08 19:00:00', 'Estadio Maracanã', 'CUARTOS'),
(101, '1000017', NULL, NULL, '1000025', NULL, NULL, '2025-07-09 16:00:00', 'Estadio Azteca', 'SEMIS'),
(102, '1000033', NULL, NULL, '1000041', NULL, NULL, '2025-07-09 19:00:00', 'Estadio Maracanã', 'SEMIS'),
(103, '1000025', NULL, NULL, '1000041', NULL, NULL, '2025-07-12 16:00:00', 'Estadio Maracanã', 'TERCER_PUESTO'),
(104, '1000017', NULL, NULL, '1000033', NULL, NULL, '2025-07-13 19:00:00', 'Estadio Azteca', 'FINAL');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dorsal` int(11) DEFAULT NULL,
  `posicion` enum('PORTERO','DEFENSA','MEDIOCAMPISTA','DELANTERO') DEFAULT NULL,
  `team_id` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `dorsal`, `posicion`, `team_id`) VALUES
(2, 'Jugador 1', 1, 'PORTERO', '1000001'),
(3, 'Jugador 2', 2, 'PORTERO', '1000001'),
(4, 'Jugador 3', 3, 'DEFENSA', '1000001'),
(5, 'Jugador 4', 4, 'DEFENSA', '1000001'),
(6, 'Jugador 5', 5, 'DEFENSA', '1000001'),
(7, 'Jugador 6', 6, 'DEFENSA', '1000001'),
(8, 'Jugador 7', 7, 'DEFENSA', '1000001'),
(9, 'Jugador 8', 8, 'DEFENSA', '1000001'),
(10, 'Jugador 9', 9, 'DEFENSA', '1000001'),
(11, 'Jugador 10', 10, 'DEFENSA', '1000001'),
(12, 'Jugador 11', 11, 'MEDIOCAMPISTA', '1000001'),
(13, 'Jugador 12', 12, 'MEDIOCAMPISTA', '1000001'),
(14, 'Jugador 13', 13, 'MEDIOCAMPISTA', '1000001'),
(15, 'Jugador 14', 14, 'MEDIOCAMPISTA', '1000001'),
(16, 'Jugador 15', 15, 'MEDIOCAMPISTA', '1000001'),
(17, 'Jugador 16', 16, 'MEDIOCAMPISTA', '1000001'),
(18, 'Jugador 17', 17, 'MEDIOCAMPISTA', '1000001'),
(19, 'Jugador 18', 18, 'MEDIOCAMPISTA', '1000001'),
(20, 'Jugador 19', 19, 'DELANTERO', '1000001'),
(21, 'Jugador 20', 20, 'DELANTERO', '1000001'),
(22, 'Jugador 21', 21, 'DELANTERO', '1000001'),
(23, 'Jugador 22', 22, 'DELANTERO', '1000001'),
(24, 'Jugador 23', 23, 'DELANTERO', '1000001'),
(25, 'Jugador 24', 24, 'DELANTERO', '1000001'),
(26, 'Jugador 25', 25, 'DELANTERO', '1000001'),
(27, 'Jugador 26', 26, 'DELANTERO', '1000001'),
(28, 'Jugador 27', 1, 'PORTERO', '1000002'),
(29, 'Jugador 28', 2, 'PORTERO', '1000002'),
(30, 'Jugador 29', 3, 'DEFENSA', '1000002'),
(31, 'Jugador 30', 4, 'DEFENSA', '1000002'),
(32, 'Jugador 31', 5, 'DEFENSA', '1000002'),
(33, 'Jugador 32', 6, 'DEFENSA', '1000002'),
(34, 'Jugador 33', 7, 'DEFENSA', '1000002'),
(35, 'Jugador 34', 8, 'DEFENSA', '1000002'),
(36, 'Jugador 35', 9, 'DEFENSA', '1000002'),
(37, 'Jugador 36', 10, 'DEFENSA', '1000002'),
(38, 'Jugador 37', 11, 'MEDIOCAMPISTA', '1000002'),
(39, 'Jugador 38', 12, 'MEDIOCAMPISTA', '1000002'),
(40, 'Jugador 39', 13, 'MEDIOCAMPISTA', '1000002'),
(41, 'Jugador 40', 14, 'MEDIOCAMPISTA', '1000002'),
(42, 'Jugador 41', 15, 'MEDIOCAMPISTA', '1000002'),
(43, 'Jugador 42', 16, 'MEDIOCAMPISTA', '1000002'),
(44, 'Jugador 43', 17, 'MEDIOCAMPISTA', '1000002'),
(45, 'Jugador 44', 18, 'MEDIOCAMPISTA', '1000002'),
(46, 'Jugador 45', 19, 'DELANTERO', '1000002'),
(47, 'Jugador 46', 20, 'DELANTERO', '1000002'),
(48, 'Jugador 47', 21, 'DELANTERO', '1000002'),
(49, 'Jugador 48', 22, 'DELANTERO', '1000002'),
(50, 'Jugador 49', 23, 'DELANTERO', '1000002'),
(51, 'Jugador 50', 24, 'DELANTERO', '1000002'),
(52, 'Jugador 51', 25, 'DELANTERO', '1000002'),
(53, 'Jugador 52', 26, 'DELANTERO', '1000002'),
(54, 'Jugador 53', 1, 'PORTERO', '1000003'),
(55, 'Jugador 54', 2, 'PORTERO', '1000003'),
(56, 'Jugador 55', 3, 'DEFENSA', '1000003'),
(57, 'Jugador 56', 4, 'DEFENSA', '1000003'),
(58, 'Jugador 57', 5, 'DEFENSA', '1000003'),
(59, 'Jugador 58', 6, 'DEFENSA', '1000003'),
(60, 'Jugador 59', 7, 'DEFENSA', '1000003'),
(61, 'Jugador 60', 8, 'DEFENSA', '1000003'),
(62, 'Jugador 61', 9, 'DEFENSA', '1000003'),
(63, 'Jugador 62', 10, 'DEFENSA', '1000003'),
(64, 'Jugador 63', 11, 'MEDIOCAMPISTA', '1000003'),
(65, 'Jugador 64', 12, 'MEDIOCAMPISTA', '1000003'),
(66, 'Jugador 65', 13, 'MEDIOCAMPISTA', '1000003'),
(67, 'Jugador 66', 14, 'MEDIOCAMPISTA', '1000003'),
(68, 'Jugador 67', 15, 'MEDIOCAMPISTA', '1000003'),
(69, 'Jugador 68', 16, 'MEDIOCAMPISTA', '1000003'),
(70, 'Jugador 69', 17, 'MEDIOCAMPISTA', '1000003'),
(71, 'Jugador 70', 18, 'MEDIOCAMPISTA', '1000003'),
(72, 'Jugador 71', 19, 'DELANTERO', '1000003'),
(73, 'Jugador 72', 20, 'DELANTERO', '1000003'),
(74, 'Jugador 73', 21, 'DELANTERO', '1000003'),
(75, 'Jugador 74', 22, 'DELANTERO', '1000003'),
(76, 'Jugador 75', 23, 'DELANTERO', '1000003'),
(77, 'Jugador 76', 24, 'DELANTERO', '1000003'),
(78, 'Jugador 77', 25, 'DELANTERO', '1000003'),
(79, 'Jugador 78', 26, 'DELANTERO', '1000003'),
(80, 'Jugador 79', 1, 'PORTERO', '1000004'),
(81, 'Jugador 80', 2, 'PORTERO', '1000004'),
(82, 'Jugador 81', 3, 'DEFENSA', '1000004'),
(83, 'Jugador 82', 4, 'DEFENSA', '1000004'),
(84, 'Jugador 83', 5, 'DEFENSA', '1000004'),
(85, 'Jugador 84', 6, 'DEFENSA', '1000004'),
(86, 'Jugador 85', 7, 'DEFENSA', '1000004'),
(87, 'Jugador 86', 8, 'DEFENSA', '1000004'),
(88, 'Jugador 87', 9, 'DEFENSA', '1000004'),
(89, 'Jugador 88', 10, 'DEFENSA', '1000004'),
(90, 'Jugador 89', 11, 'MEDIOCAMPISTA', '1000004'),
(91, 'Jugador 90', 12, 'MEDIOCAMPISTA', '1000004'),
(92, 'Jugador 91', 13, 'MEDIOCAMPISTA', '1000004'),
(93, 'Jugador 92', 14, 'MEDIOCAMPISTA', '1000004'),
(94, 'Jugador 93', 15, 'MEDIOCAMPISTA', '1000004'),
(95, 'Jugador 94', 16, 'MEDIOCAMPISTA', '1000004'),
(96, 'Jugador 95', 17, 'MEDIOCAMPISTA', '1000004'),
(97, 'Jugador 96', 18, 'MEDIOCAMPISTA', '1000004'),
(98, 'Jugador 97', 19, 'DELANTERO', '1000004'),
(99, 'Jugador 98', 20, 'DELANTERO', '1000004'),
(100, 'Jugador 99', 21, 'DELANTERO', '1000004'),
(101, 'Jugador 100', 22, 'DELANTERO', '1000004'),
(102, 'Jugador 101', 23, 'DELANTERO', '1000004'),
(103, 'Jugador 102', 24, 'DELANTERO', '1000004'),
(104, 'Jugador 103', 25, 'DELANTERO', '1000004'),
(105, 'Jugador 104', 26, 'DELANTERO', '1000004'),
(106, 'Jugador 105', 1, 'PORTERO', '1000005'),
(107, 'Jugador 106', 2, 'PORTERO', '1000005'),
(108, 'Jugador 107', 3, 'DEFENSA', '1000005'),
(109, 'Jugador 108', 4, 'DEFENSA', '1000005'),
(110, 'Jugador 109', 5, 'DEFENSA', '1000005'),
(111, 'Jugador 110', 6, 'DEFENSA', '1000005'),
(112, 'Jugador 111', 7, 'DEFENSA', '1000005'),
(113, 'Jugador 112', 8, 'DEFENSA', '1000005'),
(114, 'Jugador 113', 9, 'DEFENSA', '1000005'),
(115, 'Jugador 114', 10, 'DEFENSA', '1000005'),
(116, 'Jugador 115', 11, 'MEDIOCAMPISTA', '1000005'),
(117, 'Jugador 116', 12, 'MEDIOCAMPISTA', '1000005'),
(118, 'Jugador 117', 13, 'MEDIOCAMPISTA', '1000005'),
(119, 'Jugador 118', 14, 'MEDIOCAMPISTA', '1000005'),
(120, 'Jugador 119', 15, 'MEDIOCAMPISTA', '1000005'),
(121, 'Jugador 120', 16, 'MEDIOCAMPISTA', '1000005'),
(122, 'Jugador 121', 17, 'MEDIOCAMPISTA', '1000005'),
(123, 'Jugador 122', 18, 'MEDIOCAMPISTA', '1000005'),
(124, 'Jugador 123', 19, 'DELANTERO', '1000005'),
(125, 'Jugador 124', 20, 'DELANTERO', '1000005'),
(126, 'Jugador 125', 21, 'DELANTERO', '1000005'),
(127, 'Jugador 126', 22, 'DELANTERO', '1000005'),
(128, 'Jugador 127', 23, 'DELANTERO', '1000005'),
(129, 'Jugador 128', 24, 'DELANTERO', '1000005'),
(130, 'Jugador 129', 25, 'DELANTERO', '1000005'),
(131, 'Jugador 130', 26, 'DELANTERO', '1000005'),
(132, 'Jugador 131', 1, 'PORTERO', '1000006'),
(133, 'Jugador 132', 2, 'PORTERO', '1000006'),
(134, 'Jugador 133', 3, 'DEFENSA', '1000006'),
(135, 'Jugador 134', 4, 'DEFENSA', '1000006'),
(136, 'Jugador 135', 5, 'DEFENSA', '1000006'),
(137, 'Jugador 136', 6, 'DEFENSA', '1000006'),
(138, 'Jugador 137', 7, 'DEFENSA', '1000006'),
(139, 'Jugador 138', 8, 'DEFENSA', '1000006'),
(140, 'Jugador 139', 9, 'DEFENSA', '1000006'),
(141, 'Jugador 140', 10, 'DEFENSA', '1000006'),
(142, 'Jugador 141', 11, 'MEDIOCAMPISTA', '1000006'),
(143, 'Jugador 142', 12, 'MEDIOCAMPISTA', '1000006'),
(144, 'Jugador 143', 13, 'MEDIOCAMPISTA', '1000006'),
(145, 'Jugador 144', 14, 'MEDIOCAMPISTA', '1000006'),
(146, 'Jugador 145', 15, 'MEDIOCAMPISTA', '1000006'),
(147, 'Jugador 146', 16, 'MEDIOCAMPISTA', '1000006'),
(148, 'Jugador 147', 17, 'MEDIOCAMPISTA', '1000006'),
(149, 'Jugador 148', 18, 'MEDIOCAMPISTA', '1000006'),
(150, 'Jugador 149', 19, 'DELANTERO', '1000006'),
(151, 'Jugador 150', 20, 'DELANTERO', '1000006'),
(152, 'Jugador 151', 21, 'DELANTERO', '1000006'),
(153, 'Jugador 152', 22, 'DELANTERO', '1000006'),
(154, 'Jugador 153', 23, 'DELANTERO', '1000006'),
(155, 'Jugador 154', 24, 'DELANTERO', '1000006'),
(156, 'Jugador 155', 25, 'DELANTERO', '1000006'),
(157, 'Jugador 156', 26, 'DELANTERO', '1000006'),
(158, 'Jugador 157', 1, 'PORTERO', '1000007'),
(159, 'Jugador 158', 2, 'PORTERO', '1000007'),
(160, 'Jugador 159', 3, 'DEFENSA', '1000007'),
(161, 'Jugador 160', 4, 'DEFENSA', '1000007'),
(162, 'Jugador 161', 5, 'DEFENSA', '1000007'),
(163, 'Jugador 162', 6, 'DEFENSA', '1000007'),
(164, 'Jugador 163', 7, 'DEFENSA', '1000007'),
(165, 'Jugador 164', 8, 'DEFENSA', '1000007'),
(166, 'Jugador 165', 9, 'DEFENSA', '1000007'),
(167, 'Jugador 166', 10, 'DEFENSA', '1000007'),
(168, 'Jugador 167', 11, 'MEDIOCAMPISTA', '1000007'),
(169, 'Jugador 168', 12, 'MEDIOCAMPISTA', '1000007'),
(170, 'Jugador 169', 13, 'MEDIOCAMPISTA', '1000007'),
(171, 'Jugador 170', 14, 'MEDIOCAMPISTA', '1000007'),
(172, 'Jugador 171', 15, 'MEDIOCAMPISTA', '1000007'),
(173, 'Jugador 172', 16, 'MEDIOCAMPISTA', '1000007'),
(174, 'Jugador 173', 17, 'MEDIOCAMPISTA', '1000007'),
(175, 'Jugador 174', 18, 'MEDIOCAMPISTA', '1000007'),
(176, 'Jugador 175', 19, 'DELANTERO', '1000007'),
(177, 'Jugador 176', 20, 'DELANTERO', '1000007'),
(178, 'Jugador 177', 21, 'DELANTERO', '1000007'),
(179, 'Jugador 178', 22, 'DELANTERO', '1000007'),
(180, 'Jugador 179', 23, 'DELANTERO', '1000007'),
(181, 'Jugador 180', 24, 'DELANTERO', '1000007'),
(182, 'Jugador 181', 25, 'DELANTERO', '1000007'),
(183, 'Jugador 182', 26, 'DELANTERO', '1000007'),
(184, 'Jugador 183', 1, 'PORTERO', '1000008'),
(185, 'Jugador 184', 2, 'PORTERO', '1000008'),
(186, 'Jugador 185', 3, 'DEFENSA', '1000008'),
(187, 'Jugador 186', 4, 'DEFENSA', '1000008'),
(188, 'Jugador 187', 5, 'DEFENSA', '1000008'),
(189, 'Jugador 188', 6, 'DEFENSA', '1000008'),
(190, 'Jugador 189', 7, 'DEFENSA', '1000008'),
(191, 'Jugador 190', 8, 'DEFENSA', '1000008'),
(192, 'Jugador 191', 9, 'DEFENSA', '1000008'),
(193, 'Jugador 192', 10, 'DEFENSA', '1000008'),
(194, 'Jugador 193', 11, 'MEDIOCAMPISTA', '1000008'),
(195, 'Jugador 194', 12, 'MEDIOCAMPISTA', '1000008'),
(196, 'Jugador 195', 13, 'MEDIOCAMPISTA', '1000008'),
(197, 'Jugador 196', 14, 'MEDIOCAMPISTA', '1000008'),
(198, 'Jugador 197', 15, 'MEDIOCAMPISTA', '1000008'),
(199, 'Jugador 198', 16, 'MEDIOCAMPISTA', '1000008'),
(200, 'Jugador 199', 17, 'MEDIOCAMPISTA', '1000008'),
(201, 'Jugador 200', 18, 'MEDIOCAMPISTA', '1000008'),
(202, 'Jugador 201', 19, 'DELANTERO', '1000008'),
(203, 'Jugador 202', 20, 'DELANTERO', '1000008'),
(204, 'Jugador 203', 21, 'DELANTERO', '1000008'),
(205, 'Jugador 204', 22, 'DELANTERO', '1000008'),
(206, 'Jugador 205', 23, 'DELANTERO', '1000008'),
(207, 'Jugador 206', 24, 'DELANTERO', '1000008'),
(208, 'Jugador 207', 25, 'DELANTERO', '1000008'),
(209, 'Jugador 208', 26, 'DELANTERO', '1000008'),
(210, 'Jugador 209', 1, 'PORTERO', '1000009'),
(211, 'Jugador 210', 2, 'PORTERO', '1000009'),
(212, 'Jugador 211', 3, 'DEFENSA', '1000009'),
(213, 'Jugador 212', 4, 'DEFENSA', '1000009'),
(214, 'Jugador 213', 5, 'DEFENSA', '1000009'),
(215, 'Jugador 214', 6, 'DEFENSA', '1000009'),
(216, 'Jugador 215', 7, 'DEFENSA', '1000009'),
(217, 'Jugador 216', 8, 'DEFENSA', '1000009'),
(218, 'Jugador 217', 9, 'DEFENSA', '1000009'),
(219, 'Jugador 218', 10, 'DEFENSA', '1000009'),
(220, 'Jugador 219', 11, 'MEDIOCAMPISTA', '1000009'),
(221, 'Jugador 220', 12, 'MEDIOCAMPISTA', '1000009'),
(222, 'Jugador 221', 13, 'MEDIOCAMPISTA', '1000009'),
(223, 'Jugador 222', 14, 'MEDIOCAMPISTA', '1000009'),
(224, 'Jugador 223', 15, 'MEDIOCAMPISTA', '1000009'),
(225, 'Jugador 224', 16, 'MEDIOCAMPISTA', '1000009'),
(226, 'Jugador 225', 17, 'MEDIOCAMPISTA', '1000009'),
(227, 'Jugador 226', 18, 'MEDIOCAMPISTA', '1000009'),
(228, 'Jugador 227', 19, 'DELANTERO', '1000009'),
(229, 'Jugador 228', 20, 'DELANTERO', '1000009'),
(230, 'Jugador 229', 21, 'DELANTERO', '1000009'),
(231, 'Jugador 230', 22, 'DELANTERO', '1000009'),
(232, 'Jugador 231', 23, 'DELANTERO', '1000009'),
(233, 'Jugador 232', 24, 'DELANTERO', '1000009'),
(234, 'Jugador 233', 25, 'DELANTERO', '1000009'),
(235, 'Jugador 234', 26, 'DELANTERO', '1000009'),
(236, 'Jugador 235', 1, 'PORTERO', '1000010'),
(237, 'Jugador 236', 2, 'PORTERO', '1000010'),
(238, 'Jugador 237', 3, 'DEFENSA', '1000010'),
(239, 'Jugador 238', 4, 'DEFENSA', '1000010'),
(240, 'Jugador 239', 5, 'DEFENSA', '1000010'),
(241, 'Jugador 240', 6, 'DEFENSA', '1000010'),
(242, 'Jugador 241', 7, 'DEFENSA', '1000010'),
(243, 'Jugador 242', 8, 'DEFENSA', '1000010'),
(244, 'Jugador 243', 9, 'DEFENSA', '1000010'),
(245, 'Jugador 244', 10, 'DEFENSA', '1000010'),
(246, 'Jugador 245', 11, 'MEDIOCAMPISTA', '1000010'),
(247, 'Jugador 246', 12, 'MEDIOCAMPISTA', '1000010'),
(248, 'Jugador 247', 13, 'MEDIOCAMPISTA', '1000010'),
(249, 'Jugador 248', 14, 'MEDIOCAMPISTA', '1000010'),
(250, 'Jugador 249', 15, 'MEDIOCAMPISTA', '1000010'),
(251, 'Jugador 250', 16, 'MEDIOCAMPISTA', '1000010'),
(252, 'Jugador 251', 17, 'MEDIOCAMPISTA', '1000010'),
(253, 'Jugador 252', 18, 'MEDIOCAMPISTA', '1000010'),
(254, 'Jugador 253', 19, 'DELANTERO', '1000010'),
(255, 'Jugador 254', 20, 'DELANTERO', '1000010'),
(256, 'Jugador 255', 21, 'DELANTERO', '1000010'),
(257, 'Jugador 256', 22, 'DELANTERO', '1000010'),
(258, 'Jugador 257', 23, 'DELANTERO', '1000010'),
(259, 'Jugador 258', 24, 'DELANTERO', '1000010'),
(260, 'Jugador 259', 25, 'DELANTERO', '1000010'),
(261, 'Jugador 260', 26, 'DELANTERO', '1000010'),
(262, 'Jugador 261', 1, 'PORTERO', '1000011'),
(263, 'Jugador 262', 2, 'PORTERO', '1000011'),
(264, 'Jugador 263', 3, 'DEFENSA', '1000011'),
(265, 'Jugador 264', 4, 'DEFENSA', '1000011'),
(266, 'Jugador 265', 5, 'DEFENSA', '1000011'),
(267, 'Jugador 266', 6, 'DEFENSA', '1000011'),
(268, 'Jugador 267', 7, 'DEFENSA', '1000011'),
(269, 'Jugador 268', 8, 'DEFENSA', '1000011'),
(270, 'Jugador 269', 9, 'DEFENSA', '1000011'),
(271, 'Jugador 270', 10, 'DEFENSA', '1000011'),
(272, 'Jugador 271', 11, 'MEDIOCAMPISTA', '1000011'),
(273, 'Jugador 272', 12, 'MEDIOCAMPISTA', '1000011'),
(274, 'Jugador 273', 13, 'MEDIOCAMPISTA', '1000011'),
(275, 'Jugador 274', 14, 'MEDIOCAMPISTA', '1000011'),
(276, 'Jugador 275', 15, 'MEDIOCAMPISTA', '1000011'),
(277, 'Jugador 276', 16, 'MEDIOCAMPISTA', '1000011'),
(278, 'Jugador 277', 17, 'MEDIOCAMPISTA', '1000011'),
(279, 'Jugador 278', 18, 'MEDIOCAMPISTA', '1000011'),
(280, 'Jugador 279', 19, 'DELANTERO', '1000011'),
(281, 'Jugador 280', 20, 'DELANTERO', '1000011'),
(282, 'Jugador 281', 21, 'DELANTERO', '1000011'),
(283, 'Jugador 282', 22, 'DELANTERO', '1000011'),
(284, 'Jugador 283', 23, 'DELANTERO', '1000011'),
(285, 'Jugador 284', 24, 'DELANTERO', '1000011'),
(286, 'Jugador 285', 25, 'DELANTERO', '1000011'),
(287, 'Jugador 286', 26, 'DELANTERO', '1000011'),
(288, 'Jugador 287', 1, 'PORTERO', '1000012'),
(289, 'Jugador 288', 2, 'PORTERO', '1000012'),
(290, 'Jugador 289', 3, 'DEFENSA', '1000012'),
(291, 'Jugador 290', 4, 'DEFENSA', '1000012'),
(292, 'Jugador 291', 5, 'DEFENSA', '1000012'),
(293, 'Jugador 292', 6, 'DEFENSA', '1000012'),
(294, 'Jugador 293', 7, 'DEFENSA', '1000012'),
(295, 'Jugador 294', 8, 'DEFENSA', '1000012'),
(296, 'Jugador 295', 9, 'DEFENSA', '1000012'),
(297, 'Jugador 296', 10, 'DEFENSA', '1000012'),
(298, 'Jugador 297', 11, 'MEDIOCAMPISTA', '1000012'),
(299, 'Jugador 298', 12, 'MEDIOCAMPISTA', '1000012'),
(300, 'Jugador 299', 13, 'MEDIOCAMPISTA', '1000012'),
(301, 'Jugador 300', 14, 'MEDIOCAMPISTA', '1000012'),
(302, 'Jugador 301', 15, 'MEDIOCAMPISTA', '1000012'),
(303, 'Jugador 302', 16, 'MEDIOCAMPISTA', '1000012'),
(304, 'Jugador 303', 17, 'MEDIOCAMPISTA', '1000012'),
(305, 'Jugador 304', 18, 'MEDIOCAMPISTA', '1000012'),
(306, 'Jugador 305', 19, 'DELANTERO', '1000012'),
(307, 'Jugador 306', 20, 'DELANTERO', '1000012'),
(308, 'Jugador 307', 21, 'DELANTERO', '1000012'),
(309, 'Jugador 308', 22, 'DELANTERO', '1000012'),
(310, 'Jugador 309', 23, 'DELANTERO', '1000012'),
(311, 'Jugador 310', 24, 'DELANTERO', '1000012'),
(312, 'Jugador 311', 25, 'DELANTERO', '1000012'),
(313, 'Jugador 312', 26, 'DELANTERO', '1000012'),
(314, 'Jugador 313', 1, 'PORTERO', '1000013'),
(315, 'Jugador 314', 2, 'PORTERO', '1000013'),
(316, 'Jugador 315', 3, 'DEFENSA', '1000013'),
(317, 'Jugador 316', 4, 'DEFENSA', '1000013'),
(318, 'Jugador 317', 5, 'DEFENSA', '1000013'),
(319, 'Jugador 318', 6, 'DEFENSA', '1000013'),
(320, 'Jugador 319', 7, 'DEFENSA', '1000013'),
(321, 'Jugador 320', 8, 'DEFENSA', '1000013'),
(322, 'Jugador 321', 9, 'DEFENSA', '1000013'),
(323, 'Jugador 322', 10, 'DEFENSA', '1000013'),
(324, 'Jugador 323', 11, 'MEDIOCAMPISTA', '1000013'),
(325, 'Jugador 324', 12, 'MEDIOCAMPISTA', '1000013'),
(326, 'Jugador 325', 13, 'MEDIOCAMPISTA', '1000013'),
(327, 'Jugador 326', 14, 'MEDIOCAMPISTA', '1000013'),
(328, 'Jugador 327', 15, 'MEDIOCAMPISTA', '1000013'),
(329, 'Jugador 328', 16, 'MEDIOCAMPISTA', '1000013'),
(330, 'Jugador 329', 17, 'MEDIOCAMPISTA', '1000013'),
(331, 'Jugador 330', 18, 'MEDIOCAMPISTA', '1000013'),
(332, 'Jugador 331', 19, 'DELANTERO', '1000013'),
(333, 'Jugador 332', 20, 'DELANTERO', '1000013'),
(334, 'Jugador 333', 21, 'DELANTERO', '1000013'),
(335, 'Jugador 334', 22, 'DELANTERO', '1000013'),
(336, 'Jugador 335', 23, 'DELANTERO', '1000013'),
(337, 'Jugador 336', 24, 'DELANTERO', '1000013'),
(338, 'Jugador 337', 25, 'DELANTERO', '1000013'),
(339, 'Jugador 338', 26, 'DELANTERO', '1000013'),
(340, 'Jugador 339', 1, 'PORTERO', '1000014'),
(341, 'Jugador 340', 2, 'PORTERO', '1000014'),
(342, 'Jugador 341', 3, 'DEFENSA', '1000014'),
(343, 'Jugador 342', 4, 'DEFENSA', '1000014'),
(344, 'Jugador 343', 5, 'DEFENSA', '1000014'),
(345, 'Jugador 344', 6, 'DEFENSA', '1000014'),
(346, 'Jugador 345', 7, 'DEFENSA', '1000014'),
(347, 'Jugador 346', 8, 'DEFENSA', '1000014'),
(348, 'Jugador 347', 9, 'DEFENSA', '1000014'),
(349, 'Jugador 348', 10, 'DEFENSA', '1000014'),
(350, 'Jugador 349', 11, 'MEDIOCAMPISTA', '1000014'),
(351, 'Jugador 350', 12, 'MEDIOCAMPISTA', '1000014'),
(352, 'Jugador 351', 13, 'MEDIOCAMPISTA', '1000014'),
(353, 'Jugador 352', 14, 'MEDIOCAMPISTA', '1000014'),
(354, 'Jugador 353', 15, 'MEDIOCAMPISTA', '1000014'),
(355, 'Jugador 354', 16, 'MEDIOCAMPISTA', '1000014'),
(356, 'Jugador 355', 17, 'MEDIOCAMPISTA', '1000014'),
(357, 'Jugador 356', 18, 'MEDIOCAMPISTA', '1000014'),
(358, 'Jugador 357', 19, 'DELANTERO', '1000014'),
(359, 'Jugador 358', 20, 'DELANTERO', '1000014'),
(360, 'Jugador 359', 21, 'DELANTERO', '1000014'),
(361, 'Jugador 360', 22, 'DELANTERO', '1000014'),
(362, 'Jugador 361', 23, 'DELANTERO', '1000014'),
(363, 'Jugador 362', 24, 'DELANTERO', '1000014'),
(364, 'Jugador 363', 25, 'DELANTERO', '1000014'),
(365, 'Jugador 364', 26, 'DELANTERO', '1000014'),
(366, 'Jugador 365', 1, 'PORTERO', '1000015'),
(367, 'Jugador 366', 2, 'PORTERO', '1000015'),
(368, 'Jugador 367', 3, 'DEFENSA', '1000015'),
(369, 'Jugador 368', 4, 'DEFENSA', '1000015'),
(370, 'Jugador 369', 5, 'DEFENSA', '1000015'),
(371, 'Jugador 370', 6, 'DEFENSA', '1000015'),
(372, 'Jugador 371', 7, 'DEFENSA', '1000015'),
(373, 'Jugador 372', 8, 'DEFENSA', '1000015'),
(374, 'Jugador 373', 9, 'DEFENSA', '1000015'),
(375, 'Jugador 374', 10, 'DEFENSA', '1000015'),
(376, 'Jugador 375', 11, 'MEDIOCAMPISTA', '1000015'),
(377, 'Jugador 376', 12, 'MEDIOCAMPISTA', '1000015'),
(378, 'Jugador 377', 13, 'MEDIOCAMPISTA', '1000015'),
(379, 'Jugador 378', 14, 'MEDIOCAMPISTA', '1000015'),
(380, 'Jugador 379', 15, 'MEDIOCAMPISTA', '1000015'),
(381, 'Jugador 380', 16, 'MEDIOCAMPISTA', '1000015'),
(382, 'Jugador 381', 17, 'MEDIOCAMPISTA', '1000015'),
(383, 'Jugador 382', 18, 'MEDIOCAMPISTA', '1000015'),
(384, 'Jugador 383', 19, 'DELANTERO', '1000015'),
(385, 'Jugador 384', 20, 'DELANTERO', '1000015'),
(386, 'Jugador 385', 21, 'DELANTERO', '1000015'),
(387, 'Jugador 386', 22, 'DELANTERO', '1000015'),
(388, 'Jugador 387', 23, 'DELANTERO', '1000015'),
(389, 'Jugador 388', 24, 'DELANTERO', '1000015'),
(390, 'Jugador 389', 25, 'DELANTERO', '1000015'),
(391, 'Jugador 390', 26, 'DELANTERO', '1000015'),
(392, 'Jugador 391', 1, 'PORTERO', '1000016'),
(393, 'Jugador 392', 2, 'PORTERO', '1000016'),
(394, 'Jugador 393', 3, 'DEFENSA', '1000016'),
(395, 'Jugador 394', 4, 'DEFENSA', '1000016'),
(396, 'Jugador 395', 5, 'DEFENSA', '1000016'),
(397, 'Jugador 396', 6, 'DEFENSA', '1000016'),
(398, 'Jugador 397', 7, 'DEFENSA', '1000016'),
(399, 'Jugador 398', 8, 'DEFENSA', '1000016'),
(400, 'Jugador 399', 9, 'DEFENSA', '1000016'),
(401, 'Jugador 400', 10, 'DEFENSA', '1000016'),
(402, 'Jugador 401', 11, 'MEDIOCAMPISTA', '1000016'),
(403, 'Jugador 402', 12, 'MEDIOCAMPISTA', '1000016'),
(404, 'Jugador 403', 13, 'MEDIOCAMPISTA', '1000016'),
(405, 'Jugador 404', 14, 'MEDIOCAMPISTA', '1000016'),
(406, 'Jugador 405', 15, 'MEDIOCAMPISTA', '1000016'),
(407, 'Jugador 406', 16, 'MEDIOCAMPISTA', '1000016'),
(408, 'Jugador 407', 17, 'MEDIOCAMPISTA', '1000016'),
(409, 'Jugador 408', 18, 'MEDIOCAMPISTA', '1000016'),
(410, 'Jugador 409', 19, 'DELANTERO', '1000016'),
(411, 'Jugador 410', 20, 'DELANTERO', '1000016'),
(412, 'Jugador 411', 21, 'DELANTERO', '1000016'),
(413, 'Jugador 412', 22, 'DELANTERO', '1000016'),
(414, 'Jugador 413', 23, 'DELANTERO', '1000016'),
(415, 'Jugador 414', 24, 'DELANTERO', '1000016'),
(416, 'Jugador 415', 25, 'DELANTERO', '1000016'),
(417, 'Jugador 416', 26, 'DELANTERO', '1000016'),
(418, 'Jugador 417', 1, 'PORTERO', '1000017'),
(419, 'Jugador 418', 2, 'PORTERO', '1000017'),
(420, 'Jugador 419', 3, 'DEFENSA', '1000017'),
(421, 'Jugador 420', 4, 'DEFENSA', '1000017'),
(422, 'Jugador 421', 5, 'DEFENSA', '1000017'),
(423, 'Jugador 422', 6, 'DEFENSA', '1000017'),
(424, 'Jugador 423', 7, 'DEFENSA', '1000017'),
(425, 'Jugador 424', 8, 'DEFENSA', '1000017'),
(426, 'Jugador 425', 9, 'DEFENSA', '1000017'),
(427, 'Jugador 426', 10, 'DEFENSA', '1000017'),
(428, 'Jugador 427', 11, 'MEDIOCAMPISTA', '1000017'),
(429, 'Jugador 428', 12, 'MEDIOCAMPISTA', '1000017'),
(430, 'Jugador 429', 13, 'MEDIOCAMPISTA', '1000017'),
(431, 'Jugador 430', 14, 'MEDIOCAMPISTA', '1000017'),
(432, 'Jugador 431', 15, 'MEDIOCAMPISTA', '1000017'),
(433, 'Jugador 432', 16, 'MEDIOCAMPISTA', '1000017'),
(434, 'Jugador 433', 17, 'MEDIOCAMPISTA', '1000017'),
(435, 'Jugador 434', 18, 'MEDIOCAMPISTA', '1000017'),
(436, 'Jugador 435', 19, 'DELANTERO', '1000017'),
(437, 'Jugador 436', 20, 'DELANTERO', '1000017'),
(438, 'Jugador 437', 21, 'DELANTERO', '1000017'),
(439, 'Jugador 438', 22, 'DELANTERO', '1000017'),
(440, 'Jugador 439', 23, 'DELANTERO', '1000017'),
(441, 'Jugador 440', 24, 'DELANTERO', '1000017'),
(442, 'Jugador 441', 25, 'DELANTERO', '1000017'),
(443, 'Jugador 442', 26, 'DELANTERO', '1000017'),
(444, 'Jugador 443', 1, 'PORTERO', '1000018'),
(445, 'Jugador 444', 2, 'PORTERO', '1000018'),
(446, 'Jugador 445', 3, 'DEFENSA', '1000018'),
(447, 'Jugador 446', 4, 'DEFENSA', '1000018'),
(448, 'Jugador 447', 5, 'DEFENSA', '1000018'),
(449, 'Jugador 448', 6, 'DEFENSA', '1000018'),
(450, 'Jugador 449', 7, 'DEFENSA', '1000018'),
(451, 'Jugador 450', 8, 'DEFENSA', '1000018'),
(452, 'Jugador 451', 9, 'DEFENSA', '1000018'),
(453, 'Jugador 452', 10, 'DEFENSA', '1000018'),
(454, 'Jugador 453', 11, 'MEDIOCAMPISTA', '1000018'),
(455, 'Jugador 454', 12, 'MEDIOCAMPISTA', '1000018'),
(456, 'Jugador 455', 13, 'MEDIOCAMPISTA', '1000018'),
(457, 'Jugador 456', 14, 'MEDIOCAMPISTA', '1000018'),
(458, 'Jugador 457', 15, 'MEDIOCAMPISTA', '1000018'),
(459, 'Jugador 458', 16, 'MEDIOCAMPISTA', '1000018'),
(460, 'Jugador 459', 17, 'MEDIOCAMPISTA', '1000018'),
(461, 'Jugador 460', 18, 'MEDIOCAMPISTA', '1000018'),
(462, 'Jugador 461', 19, 'DELANTERO', '1000018'),
(463, 'Jugador 462', 20, 'DELANTERO', '1000018'),
(464, 'Jugador 463', 21, 'DELANTERO', '1000018'),
(465, 'Jugador 464', 22, 'DELANTERO', '1000018'),
(466, 'Jugador 465', 23, 'DELANTERO', '1000018'),
(467, 'Jugador 466', 24, 'DELANTERO', '1000018'),
(468, 'Jugador 467', 25, 'DELANTERO', '1000018'),
(469, 'Jugador 468', 26, 'DELANTERO', '1000018'),
(470, 'Jugador 469', 1, 'PORTERO', '1000019'),
(471, 'Jugador 470', 2, 'PORTERO', '1000019'),
(472, 'Jugador 471', 3, 'DEFENSA', '1000019'),
(473, 'Jugador 472', 4, 'DEFENSA', '1000019'),
(474, 'Jugador 473', 5, 'DEFENSA', '1000019'),
(475, 'Jugador 474', 6, 'DEFENSA', '1000019'),
(476, 'Jugador 475', 7, 'DEFENSA', '1000019'),
(477, 'Jugador 476', 8, 'DEFENSA', '1000019'),
(478, 'Jugador 477', 9, 'DEFENSA', '1000019'),
(479, 'Jugador 478', 10, 'DEFENSA', '1000019'),
(480, 'Jugador 479', 11, 'MEDIOCAMPISTA', '1000019'),
(481, 'Jugador 480', 12, 'MEDIOCAMPISTA', '1000019'),
(482, 'Jugador 481', 13, 'MEDIOCAMPISTA', '1000019'),
(483, 'Jugador 482', 14, 'MEDIOCAMPISTA', '1000019'),
(484, 'Jugador 483', 15, 'MEDIOCAMPISTA', '1000019'),
(485, 'Jugador 484', 16, 'MEDIOCAMPISTA', '1000019'),
(486, 'Jugador 485', 17, 'MEDIOCAMPISTA', '1000019'),
(487, 'Jugador 486', 18, 'MEDIOCAMPISTA', '1000019'),
(488, 'Jugador 487', 19, 'DELANTERO', '1000019'),
(489, 'Jugador 488', 20, 'DELANTERO', '1000019'),
(490, 'Jugador 489', 21, 'DELANTERO', '1000019'),
(491, 'Jugador 490', 22, 'DELANTERO', '1000019'),
(492, 'Jugador 491', 23, 'DELANTERO', '1000019'),
(493, 'Jugador 492', 24, 'DELANTERO', '1000019'),
(494, 'Jugador 493', 25, 'DELANTERO', '1000019'),
(495, 'Jugador 494', 26, 'DELANTERO', '1000019'),
(496, 'Jugador 495', 1, 'PORTERO', '1000020'),
(497, 'Jugador 496', 2, 'PORTERO', '1000020'),
(498, 'Jugador 497', 3, 'DEFENSA', '1000020'),
(499, 'Jugador 498', 4, 'DEFENSA', '1000020'),
(500, 'Jugador 499', 5, 'DEFENSA', '1000020'),
(501, 'Jugador 500', 6, 'DEFENSA', '1000020'),
(502, 'Jugador 501', 7, 'DEFENSA', '1000020'),
(503, 'Jugador 502', 8, 'DEFENSA', '1000020'),
(504, 'Jugador 503', 9, 'DEFENSA', '1000020'),
(505, 'Jugador 504', 10, 'DEFENSA', '1000020'),
(506, 'Jugador 505', 11, 'MEDIOCAMPISTA', '1000020'),
(507, 'Jugador 506', 12, 'MEDIOCAMPISTA', '1000020'),
(508, 'Jugador 507', 13, 'MEDIOCAMPISTA', '1000020'),
(509, 'Jugador 508', 14, 'MEDIOCAMPISTA', '1000020'),
(510, 'Jugador 509', 15, 'MEDIOCAMPISTA', '1000020'),
(511, 'Jugador 510', 16, 'MEDIOCAMPISTA', '1000020'),
(512, 'Jugador 511', 17, 'MEDIOCAMPISTA', '1000020'),
(513, 'Jugador 512', 18, 'MEDIOCAMPISTA', '1000020'),
(514, 'Jugador 513', 19, 'DELANTERO', '1000020'),
(515, 'Jugador 514', 20, 'DELANTERO', '1000020'),
(516, 'Jugador 515', 21, 'DELANTERO', '1000020'),
(517, 'Jugador 516', 22, 'DELANTERO', '1000020'),
(518, 'Jugador 517', 23, 'DELANTERO', '1000020'),
(519, 'Jugador 518', 24, 'DELANTERO', '1000020'),
(520, 'Jugador 519', 25, 'DELANTERO', '1000020'),
(521, 'Jugador 520', 26, 'DELANTERO', '1000020'),
(522, 'Jugador 521', 1, 'PORTERO', '1000021'),
(523, 'Jugador 522', 2, 'PORTERO', '1000021'),
(524, 'Jugador 523', 3, 'DEFENSA', '1000021'),
(525, 'Jugador 524', 4, 'DEFENSA', '1000021'),
(526, 'Jugador 525', 5, 'DEFENSA', '1000021'),
(527, 'Jugador 526', 6, 'DEFENSA', '1000021'),
(528, 'Jugador 527', 7, 'DEFENSA', '1000021'),
(529, 'Jugador 528', 8, 'DEFENSA', '1000021'),
(530, 'Jugador 529', 9, 'DEFENSA', '1000021'),
(531, 'Jugador 530', 10, 'DEFENSA', '1000021'),
(532, 'Jugador 531', 11, 'MEDIOCAMPISTA', '1000021'),
(533, 'Jugador 532', 12, 'MEDIOCAMPISTA', '1000021'),
(534, 'Jugador 533', 13, 'MEDIOCAMPISTA', '1000021'),
(535, 'Jugador 534', 14, 'MEDIOCAMPISTA', '1000021'),
(536, 'Jugador 535', 15, 'MEDIOCAMPISTA', '1000021'),
(537, 'Jugador 536', 16, 'MEDIOCAMPISTA', '1000021'),
(538, 'Jugador 537', 17, 'MEDIOCAMPISTA', '1000021'),
(539, 'Jugador 538', 18, 'MEDIOCAMPISTA', '1000021'),
(540, 'Jugador 539', 19, 'DELANTERO', '1000021'),
(541, 'Jugador 540', 20, 'DELANTERO', '1000021'),
(542, 'Jugador 541', 21, 'DELANTERO', '1000021'),
(543, 'Jugador 542', 22, 'DELANTERO', '1000021'),
(544, 'Jugador 543', 23, 'DELANTERO', '1000021'),
(545, 'Jugador 544', 24, 'DELANTERO', '1000021'),
(546, 'Jugador 545', 25, 'DELANTERO', '1000021'),
(547, 'Jugador 546', 26, 'DELANTERO', '1000021'),
(548, 'Jugador 547', 1, 'PORTERO', '1000022'),
(549, 'Jugador 548', 2, 'PORTERO', '1000022'),
(550, 'Jugador 549', 3, 'DEFENSA', '1000022'),
(551, 'Jugador 550', 4, 'DEFENSA', '1000022'),
(552, 'Jugador 551', 5, 'DEFENSA', '1000022'),
(553, 'Jugador 552', 6, 'DEFENSA', '1000022'),
(554, 'Jugador 553', 7, 'DEFENSA', '1000022'),
(555, 'Jugador 554', 8, 'DEFENSA', '1000022'),
(556, 'Jugador 555', 9, 'DEFENSA', '1000022'),
(557, 'Jugador 556', 10, 'DEFENSA', '1000022'),
(558, 'Jugador 557', 11, 'MEDIOCAMPISTA', '1000022'),
(559, 'Jugador 558', 12, 'MEDIOCAMPISTA', '1000022'),
(560, 'Jugador 559', 13, 'MEDIOCAMPISTA', '1000022'),
(561, 'Jugador 560', 14, 'MEDIOCAMPISTA', '1000022'),
(562, 'Jugador 561', 15, 'MEDIOCAMPISTA', '1000022'),
(563, 'Jugador 562', 16, 'MEDIOCAMPISTA', '1000022'),
(564, 'Jugador 563', 17, 'MEDIOCAMPISTA', '1000022'),
(565, 'Jugador 564', 18, 'MEDIOCAMPISTA', '1000022'),
(566, 'Jugador 565', 19, 'DELANTERO', '1000022'),
(567, 'Jugador 566', 20, 'DELANTERO', '1000022'),
(568, 'Jugador 567', 21, 'DELANTERO', '1000022'),
(569, 'Jugador 568', 22, 'DELANTERO', '1000022'),
(570, 'Jugador 569', 23, 'DELANTERO', '1000022'),
(571, 'Jugador 570', 24, 'DELANTERO', '1000022'),
(572, 'Jugador 571', 25, 'DELANTERO', '1000022'),
(573, 'Jugador 572', 26, 'DELANTERO', '1000022'),
(574, 'Jugador 573', 1, 'PORTERO', '1000023'),
(575, 'Jugador 574', 2, 'PORTERO', '1000023'),
(576, 'Jugador 575', 3, 'DEFENSA', '1000023'),
(577, 'Jugador 576', 4, 'DEFENSA', '1000023'),
(578, 'Jugador 577', 5, 'DEFENSA', '1000023'),
(579, 'Jugador 578', 6, 'DEFENSA', '1000023'),
(580, 'Jugador 579', 7, 'DEFENSA', '1000023'),
(581, 'Jugador 580', 8, 'DEFENSA', '1000023'),
(582, 'Jugador 581', 9, 'DEFENSA', '1000023'),
(583, 'Jugador 582', 10, 'DEFENSA', '1000023'),
(584, 'Jugador 583', 11, 'MEDIOCAMPISTA', '1000023'),
(585, 'Jugador 584', 12, 'MEDIOCAMPISTA', '1000023'),
(586, 'Jugador 585', 13, 'MEDIOCAMPISTA', '1000023'),
(587, 'Jugador 586', 14, 'MEDIOCAMPISTA', '1000023'),
(588, 'Jugador 587', 15, 'MEDIOCAMPISTA', '1000023'),
(589, 'Jugador 588', 16, 'MEDIOCAMPISTA', '1000023'),
(590, 'Jugador 589', 17, 'MEDIOCAMPISTA', '1000023'),
(591, 'Jugador 590', 18, 'MEDIOCAMPISTA', '1000023'),
(592, 'Jugador 591', 19, 'DELANTERO', '1000023'),
(593, 'Jugador 592', 20, 'DELANTERO', '1000023'),
(594, 'Jugador 593', 21, 'DELANTERO', '1000023'),
(595, 'Jugador 594', 22, 'DELANTERO', '1000023'),
(596, 'Jugador 595', 23, 'DELANTERO', '1000023'),
(597, 'Jugador 596', 24, 'DELANTERO', '1000023'),
(598, 'Jugador 597', 25, 'DELANTERO', '1000023'),
(599, 'Jugador 598', 26, 'DELANTERO', '1000023'),
(600, 'Jugador 599', 1, 'PORTERO', '1000024'),
(601, 'Jugador 600', 2, 'PORTERO', '1000024'),
(602, 'Jugador 601', 3, 'DEFENSA', '1000024'),
(603, 'Jugador 602', 4, 'DEFENSA', '1000024'),
(604, 'Jugador 603', 5, 'DEFENSA', '1000024'),
(605, 'Jugador 604', 6, 'DEFENSA', '1000024'),
(606, 'Jugador 605', 7, 'DEFENSA', '1000024'),
(607, 'Jugador 606', 8, 'DEFENSA', '1000024'),
(608, 'Jugador 607', 9, 'DEFENSA', '1000024'),
(609, 'Jugador 608', 10, 'DEFENSA', '1000024'),
(610, 'Jugador 609', 11, 'MEDIOCAMPISTA', '1000024'),
(611, 'Jugador 610', 12, 'MEDIOCAMPISTA', '1000024'),
(612, 'Jugador 611', 13, 'MEDIOCAMPISTA', '1000024'),
(613, 'Jugador 612', 14, 'MEDIOCAMPISTA', '1000024'),
(614, 'Jugador 613', 15, 'MEDIOCAMPISTA', '1000024'),
(615, 'Jugador 614', 16, 'MEDIOCAMPISTA', '1000024'),
(616, 'Jugador 615', 17, 'MEDIOCAMPISTA', '1000024'),
(617, 'Jugador 616', 18, 'MEDIOCAMPISTA', '1000024'),
(618, 'Jugador 617', 19, 'DELANTERO', '1000024'),
(619, 'Jugador 618', 20, 'DELANTERO', '1000024'),
(620, 'Jugador 619', 21, 'DELANTERO', '1000024'),
(621, 'Jugador 620', 22, 'DELANTERO', '1000024'),
(622, 'Jugador 621', 23, 'DELANTERO', '1000024'),
(623, 'Jugador 622', 24, 'DELANTERO', '1000024'),
(624, 'Jugador 623', 25, 'DELANTERO', '1000024'),
(625, 'Jugador 624', 26, 'DELANTERO', '1000024'),
(626, 'Jugador 625', 1, 'PORTERO', '1000025'),
(627, 'Jugador 626', 2, 'PORTERO', '1000025'),
(628, 'Jugador 627', 3, 'DEFENSA', '1000025'),
(629, 'Jugador 628', 4, 'DEFENSA', '1000025'),
(630, 'Jugador 629', 5, 'DEFENSA', '1000025'),
(631, 'Jugador 630', 6, 'DEFENSA', '1000025'),
(632, 'Jugador 631', 7, 'DEFENSA', '1000025'),
(633, 'Jugador 632', 8, 'DEFENSA', '1000025'),
(634, 'Jugador 633', 9, 'DEFENSA', '1000025'),
(635, 'Jugador 634', 10, 'DEFENSA', '1000025'),
(636, 'Jugador 635', 11, 'MEDIOCAMPISTA', '1000025'),
(637, 'Jugador 636', 12, 'MEDIOCAMPISTA', '1000025'),
(638, 'Jugador 637', 13, 'MEDIOCAMPISTA', '1000025'),
(639, 'Jugador 638', 14, 'MEDIOCAMPISTA', '1000025'),
(640, 'Jugador 639', 15, 'MEDIOCAMPISTA', '1000025'),
(641, 'Jugador 640', 16, 'MEDIOCAMPISTA', '1000025'),
(642, 'Jugador 641', 17, 'MEDIOCAMPISTA', '1000025'),
(643, 'Jugador 642', 18, 'MEDIOCAMPISTA', '1000025'),
(644, 'Jugador 643', 19, 'DELANTERO', '1000025'),
(645, 'Jugador 644', 20, 'DELANTERO', '1000025'),
(646, 'Jugador 645', 21, 'DELANTERO', '1000025'),
(647, 'Jugador 646', 22, 'DELANTERO', '1000025'),
(648, 'Jugador 647', 23, 'DELANTERO', '1000025'),
(649, 'Jugador 648', 24, 'DELANTERO', '1000025'),
(650, 'Jugador 649', 25, 'DELANTERO', '1000025'),
(651, 'Jugador 650', 26, 'DELANTERO', '1000025'),
(652, 'Jugador 651', 1, 'PORTERO', '1000026'),
(653, 'Jugador 652', 2, 'PORTERO', '1000026'),
(654, 'Jugador 653', 3, 'DEFENSA', '1000026'),
(655, 'Jugador 654', 4, 'DEFENSA', '1000026'),
(656, 'Jugador 655', 5, 'DEFENSA', '1000026'),
(657, 'Jugador 656', 6, 'DEFENSA', '1000026'),
(658, 'Jugador 657', 7, 'DEFENSA', '1000026'),
(659, 'Jugador 658', 8, 'DEFENSA', '1000026'),
(660, 'Jugador 659', 9, 'DEFENSA', '1000026'),
(661, 'Jugador 660', 10, 'DEFENSA', '1000026'),
(662, 'Jugador 661', 11, 'MEDIOCAMPISTA', '1000026'),
(663, 'Jugador 662', 12, 'MEDIOCAMPISTA', '1000026'),
(664, 'Jugador 663', 13, 'MEDIOCAMPISTA', '1000026'),
(665, 'Jugador 664', 14, 'MEDIOCAMPISTA', '1000026'),
(666, 'Jugador 665', 15, 'MEDIOCAMPISTA', '1000026'),
(667, 'Jugador 666', 16, 'MEDIOCAMPISTA', '1000026'),
(668, 'Jugador 667', 17, 'MEDIOCAMPISTA', '1000026'),
(669, 'Jugador 668', 18, 'MEDIOCAMPISTA', '1000026'),
(670, 'Jugador 669', 19, 'DELANTERO', '1000026'),
(671, 'Jugador 670', 20, 'DELANTERO', '1000026'),
(672, 'Jugador 671', 21, 'DELANTERO', '1000026'),
(673, 'Jugador 672', 22, 'DELANTERO', '1000026'),
(674, 'Jugador 673', 23, 'DELANTERO', '1000026'),
(675, 'Jugador 674', 24, 'DELANTERO', '1000026'),
(676, 'Jugador 675', 25, 'DELANTERO', '1000026'),
(677, 'Jugador 676', 26, 'DELANTERO', '1000026'),
(678, 'Jugador 677', 1, 'PORTERO', '1000027'),
(679, 'Jugador 678', 2, 'PORTERO', '1000027'),
(680, 'Jugador 679', 3, 'DEFENSA', '1000027'),
(681, 'Jugador 680', 4, 'DEFENSA', '1000027'),
(682, 'Jugador 681', 5, 'DEFENSA', '1000027'),
(683, 'Jugador 682', 6, 'DEFENSA', '1000027'),
(684, 'Jugador 683', 7, 'DEFENSA', '1000027'),
(685, 'Jugador 684', 8, 'DEFENSA', '1000027'),
(686, 'Jugador 685', 9, 'DEFENSA', '1000027'),
(687, 'Jugador 686', 10, 'DEFENSA', '1000027'),
(688, 'Jugador 687', 11, 'MEDIOCAMPISTA', '1000027'),
(689, 'Jugador 688', 12, 'MEDIOCAMPISTA', '1000027'),
(690, 'Jugador 689', 13, 'MEDIOCAMPISTA', '1000027'),
(691, 'Jugador 690', 14, 'MEDIOCAMPISTA', '1000027'),
(692, 'Jugador 691', 15, 'MEDIOCAMPISTA', '1000027'),
(693, 'Jugador 692', 16, 'MEDIOCAMPISTA', '1000027'),
(694, 'Jugador 693', 17, 'MEDIOCAMPISTA', '1000027'),
(695, 'Jugador 694', 18, 'MEDIOCAMPISTA', '1000027'),
(696, 'Jugador 695', 19, 'DELANTERO', '1000027'),
(697, 'Jugador 696', 20, 'DELANTERO', '1000027'),
(698, 'Jugador 697', 21, 'DELANTERO', '1000027'),
(699, 'Jugador 698', 22, 'DELANTERO', '1000027'),
(700, 'Jugador 699', 23, 'DELANTERO', '1000027'),
(701, 'Jugador 700', 24, 'DELANTERO', '1000027'),
(702, 'Jugador 701', 25, 'DELANTERO', '1000027'),
(703, 'Jugador 702', 26, 'DELANTERO', '1000027'),
(704, 'Jugador 703', 1, 'PORTERO', '1000028'),
(705, 'Jugador 704', 2, 'PORTERO', '1000028'),
(706, 'Jugador 705', 3, 'DEFENSA', '1000028'),
(707, 'Jugador 706', 4, 'DEFENSA', '1000028'),
(708, 'Jugador 707', 5, 'DEFENSA', '1000028'),
(709, 'Jugador 708', 6, 'DEFENSA', '1000028'),
(710, 'Jugador 709', 7, 'DEFENSA', '1000028'),
(711, 'Jugador 710', 8, 'DEFENSA', '1000028'),
(712, 'Jugador 711', 9, 'DEFENSA', '1000028'),
(713, 'Jugador 712', 10, 'DEFENSA', '1000028'),
(714, 'Jugador 713', 11, 'MEDIOCAMPISTA', '1000028'),
(715, 'Jugador 714', 12, 'MEDIOCAMPISTA', '1000028'),
(716, 'Jugador 715', 13, 'MEDIOCAMPISTA', '1000028'),
(717, 'Jugador 716', 14, 'MEDIOCAMPISTA', '1000028'),
(718, 'Jugador 717', 15, 'MEDIOCAMPISTA', '1000028'),
(719, 'Jugador 718', 16, 'MEDIOCAMPISTA', '1000028'),
(720, 'Jugador 719', 17, 'MEDIOCAMPISTA', '1000028'),
(721, 'Jugador 720', 18, 'MEDIOCAMPISTA', '1000028'),
(722, 'Jugador 721', 19, 'DELANTERO', '1000028'),
(723, 'Jugador 722', 20, 'DELANTERO', '1000028'),
(724, 'Jugador 723', 21, 'DELANTERO', '1000028'),
(725, 'Jugador 724', 22, 'DELANTERO', '1000028'),
(726, 'Jugador 725', 23, 'DELANTERO', '1000028'),
(727, 'Jugador 726', 24, 'DELANTERO', '1000028'),
(728, 'Jugador 727', 25, 'DELANTERO', '1000028'),
(729, 'Jugador 728', 26, 'DELANTERO', '1000028'),
(730, 'Jugador 729', 1, 'PORTERO', '1000029'),
(731, 'Jugador 730', 2, 'PORTERO', '1000029'),
(732, 'Jugador 731', 3, 'DEFENSA', '1000029'),
(733, 'Jugador 732', 4, 'DEFENSA', '1000029'),
(734, 'Jugador 733', 5, 'DEFENSA', '1000029'),
(735, 'Jugador 734', 6, 'DEFENSA', '1000029'),
(736, 'Jugador 735', 7, 'DEFENSA', '1000029'),
(737, 'Jugador 736', 8, 'DEFENSA', '1000029'),
(738, 'Jugador 737', 9, 'DEFENSA', '1000029'),
(739, 'Jugador 738', 10, 'DEFENSA', '1000029'),
(740, 'Jugador 739', 11, 'MEDIOCAMPISTA', '1000029'),
(741, 'Jugador 740', 12, 'MEDIOCAMPISTA', '1000029'),
(742, 'Jugador 741', 13, 'MEDIOCAMPISTA', '1000029'),
(743, 'Jugador 742', 14, 'MEDIOCAMPISTA', '1000029'),
(744, 'Jugador 743', 15, 'MEDIOCAMPISTA', '1000029'),
(745, 'Jugador 744', 16, 'MEDIOCAMPISTA', '1000029'),
(746, 'Jugador 745', 17, 'MEDIOCAMPISTA', '1000029'),
(747, 'Jugador 746', 18, 'MEDIOCAMPISTA', '1000029'),
(748, 'Jugador 747', 19, 'DELANTERO', '1000029'),
(749, 'Jugador 748', 20, 'DELANTERO', '1000029'),
(750, 'Jugador 749', 21, 'DELANTERO', '1000029'),
(751, 'Jugador 750', 22, 'DELANTERO', '1000029'),
(752, 'Jugador 751', 23, 'DELANTERO', '1000029'),
(753, 'Jugador 752', 24, 'DELANTERO', '1000029'),
(754, 'Jugador 753', 25, 'DELANTERO', '1000029'),
(755, 'Jugador 754', 26, 'DELANTERO', '1000029'),
(756, 'Jugador 755', 1, 'PORTERO', '1000030'),
(757, 'Jugador 756', 2, 'PORTERO', '1000030'),
(758, 'Jugador 757', 3, 'DEFENSA', '1000030'),
(759, 'Jugador 758', 4, 'DEFENSA', '1000030'),
(760, 'Jugador 759', 5, 'DEFENSA', '1000030'),
(761, 'Jugador 760', 6, 'DEFENSA', '1000030'),
(762, 'Jugador 761', 7, 'DEFENSA', '1000030'),
(763, 'Jugador 762', 8, 'DEFENSA', '1000030'),
(764, 'Jugador 763', 9, 'DEFENSA', '1000030'),
(765, 'Jugador 764', 10, 'DEFENSA', '1000030'),
(766, 'Jugador 765', 11, 'MEDIOCAMPISTA', '1000030'),
(767, 'Jugador 766', 12, 'MEDIOCAMPISTA', '1000030'),
(768, 'Jugador 767', 13, 'MEDIOCAMPISTA', '1000030'),
(769, 'Jugador 768', 14, 'MEDIOCAMPISTA', '1000030'),
(770, 'Jugador 769', 15, 'MEDIOCAMPISTA', '1000030'),
(771, 'Jugador 770', 16, 'MEDIOCAMPISTA', '1000030'),
(772, 'Jugador 771', 17, 'MEDIOCAMPISTA', '1000030'),
(773, 'Jugador 772', 18, 'MEDIOCAMPISTA', '1000030'),
(774, 'Jugador 773', 19, 'DELANTERO', '1000030'),
(775, 'Jugador 774', 20, 'DELANTERO', '1000030'),
(776, 'Jugador 775', 21, 'DELANTERO', '1000030'),
(777, 'Jugador 776', 22, 'DELANTERO', '1000030'),
(778, 'Jugador 777', 23, 'DELANTERO', '1000030'),
(779, 'Jugador 778', 24, 'DELANTERO', '1000030'),
(780, 'Jugador 779', 25, 'DELANTERO', '1000030'),
(781, 'Jugador 780', 26, 'DELANTERO', '1000030'),
(782, 'Jugador 781', 1, 'PORTERO', '1000031'),
(783, 'Jugador 782', 2, 'PORTERO', '1000031'),
(784, 'Jugador 783', 3, 'DEFENSA', '1000031'),
(785, 'Jugador 784', 4, 'DEFENSA', '1000031'),
(786, 'Jugador 785', 5, 'DEFENSA', '1000031'),
(787, 'Jugador 786', 6, 'DEFENSA', '1000031'),
(788, 'Jugador 787', 7, 'DEFENSA', '1000031'),
(789, 'Jugador 788', 8, 'DEFENSA', '1000031'),
(790, 'Jugador 789', 9, 'DEFENSA', '1000031'),
(791, 'Jugador 790', 10, 'DEFENSA', '1000031'),
(792, 'Jugador 791', 11, 'MEDIOCAMPISTA', '1000031'),
(793, 'Jugador 792', 12, 'MEDIOCAMPISTA', '1000031'),
(794, 'Jugador 793', 13, 'MEDIOCAMPISTA', '1000031'),
(795, 'Jugador 794', 14, 'MEDIOCAMPISTA', '1000031'),
(796, 'Jugador 795', 15, 'MEDIOCAMPISTA', '1000031'),
(797, 'Jugador 796', 16, 'MEDIOCAMPISTA', '1000031'),
(798, 'Jugador 797', 17, 'MEDIOCAMPISTA', '1000031'),
(799, 'Jugador 798', 18, 'MEDIOCAMPISTA', '1000031'),
(800, 'Jugador 799', 19, 'DELANTERO', '1000031'),
(801, 'Jugador 800', 20, 'DELANTERO', '1000031'),
(802, 'Jugador 801', 21, 'DELANTERO', '1000031'),
(803, 'Jugador 802', 22, 'DELANTERO', '1000031'),
(804, 'Jugador 803', 23, 'DELANTERO', '1000031'),
(805, 'Jugador 804', 24, 'DELANTERO', '1000031'),
(806, 'Jugador 805', 25, 'DELANTERO', '1000031'),
(807, 'Jugador 806', 26, 'DELANTERO', '1000031'),
(808, 'Jugador 807', 1, 'PORTERO', '1000032'),
(809, 'Jugador 808', 2, 'PORTERO', '1000032'),
(810, 'Jugador 809', 3, 'DEFENSA', '1000032'),
(811, 'Jugador 810', 4, 'DEFENSA', '1000032'),
(812, 'Jugador 811', 5, 'DEFENSA', '1000032'),
(813, 'Jugador 812', 6, 'DEFENSA', '1000032'),
(814, 'Jugador 813', 7, 'DEFENSA', '1000032'),
(815, 'Jugador 814', 8, 'DEFENSA', '1000032'),
(816, 'Jugador 815', 9, 'DEFENSA', '1000032'),
(817, 'Jugador 816', 10, 'DEFENSA', '1000032'),
(818, 'Jugador 817', 11, 'MEDIOCAMPISTA', '1000032'),
(819, 'Jugador 818', 12, 'MEDIOCAMPISTA', '1000032'),
(820, 'Jugador 819', 13, 'MEDIOCAMPISTA', '1000032'),
(821, 'Jugador 820', 14, 'MEDIOCAMPISTA', '1000032'),
(822, 'Jugador 821', 15, 'MEDIOCAMPISTA', '1000032'),
(823, 'Jugador 822', 16, 'MEDIOCAMPISTA', '1000032'),
(824, 'Jugador 823', 17, 'MEDIOCAMPISTA', '1000032'),
(825, 'Jugador 824', 18, 'MEDIOCAMPISTA', '1000032'),
(826, 'Jugador 825', 19, 'DELANTERO', '1000032'),
(827, 'Jugador 826', 20, 'DELANTERO', '1000032'),
(828, 'Jugador 827', 21, 'DELANTERO', '1000032'),
(829, 'Jugador 828', 22, 'DELANTERO', '1000032'),
(830, 'Jugador 829', 23, 'DELANTERO', '1000032'),
(831, 'Jugador 830', 24, 'DELANTERO', '1000032'),
(832, 'Jugador 831', 25, 'DELANTERO', '1000032'),
(833, 'Jugador 832', 26, 'DELANTERO', '1000032'),
(834, 'Jugador 833', 1, 'PORTERO', '1000033'),
(835, 'Jugador 834', 2, 'PORTERO', '1000033'),
(836, 'Jugador 835', 3, 'DEFENSA', '1000033'),
(837, 'Jugador 836', 4, 'DEFENSA', '1000033'),
(838, 'Jugador 837', 5, 'DEFENSA', '1000033'),
(839, 'Jugador 838', 6, 'DEFENSA', '1000033'),
(840, 'Jugador 839', 7, 'DEFENSA', '1000033'),
(841, 'Jugador 840', 8, 'DEFENSA', '1000033'),
(842, 'Jugador 841', 9, 'DEFENSA', '1000033'),
(843, 'Jugador 842', 10, 'DEFENSA', '1000033'),
(844, 'Jugador 843', 11, 'MEDIOCAMPISTA', '1000033'),
(845, 'Jugador 844', 12, 'MEDIOCAMPISTA', '1000033'),
(846, 'Jugador 845', 13, 'MEDIOCAMPISTA', '1000033'),
(847, 'Jugador 846', 14, 'MEDIOCAMPISTA', '1000033'),
(848, 'Jugador 847', 15, 'MEDIOCAMPISTA', '1000033'),
(849, 'Jugador 848', 16, 'MEDIOCAMPISTA', '1000033'),
(850, 'Jugador 849', 17, 'MEDIOCAMPISTA', '1000033'),
(851, 'Jugador 850', 18, 'MEDIOCAMPISTA', '1000033'),
(852, 'Jugador 851', 19, 'DELANTERO', '1000033'),
(853, 'Jugador 852', 20, 'DELANTERO', '1000033'),
(854, 'Jugador 853', 21, 'DELANTERO', '1000033'),
(855, 'Jugador 854', 22, 'DELANTERO', '1000033'),
(856, 'Jugador 855', 23, 'DELANTERO', '1000033'),
(857, 'Jugador 856', 24, 'DELANTERO', '1000033'),
(858, 'Jugador 857', 25, 'DELANTERO', '1000033'),
(859, 'Jugador 858', 26, 'DELANTERO', '1000033'),
(860, 'Jugador 859', 1, 'PORTERO', '1000034'),
(861, 'Jugador 860', 2, 'PORTERO', '1000034'),
(862, 'Jugador 861', 3, 'DEFENSA', '1000034'),
(863, 'Jugador 862', 4, 'DEFENSA', '1000034'),
(864, 'Jugador 863', 5, 'DEFENSA', '1000034'),
(865, 'Jugador 864', 6, 'DEFENSA', '1000034'),
(866, 'Jugador 865', 7, 'DEFENSA', '1000034'),
(867, 'Jugador 866', 8, 'DEFENSA', '1000034'),
(868, 'Jugador 867', 9, 'DEFENSA', '1000034'),
(869, 'Jugador 868', 10, 'DEFENSA', '1000034'),
(870, 'Jugador 869', 11, 'MEDIOCAMPISTA', '1000034'),
(871, 'Jugador 870', 12, 'MEDIOCAMPISTA', '1000034'),
(872, 'Jugador 871', 13, 'MEDIOCAMPISTA', '1000034'),
(873, 'Jugador 872', 14, 'MEDIOCAMPISTA', '1000034'),
(874, 'Jugador 873', 15, 'MEDIOCAMPISTA', '1000034'),
(875, 'Jugador 874', 16, 'MEDIOCAMPISTA', '1000034'),
(876, 'Jugador 875', 17, 'MEDIOCAMPISTA', '1000034'),
(877, 'Jugador 876', 18, 'MEDIOCAMPISTA', '1000034'),
(878, 'Jugador 877', 19, 'DELANTERO', '1000034'),
(879, 'Jugador 878', 20, 'DELANTERO', '1000034'),
(880, 'Jugador 879', 21, 'DELANTERO', '1000034'),
(881, 'Jugador 880', 22, 'DELANTERO', '1000034'),
(882, 'Jugador 881', 23, 'DELANTERO', '1000034'),
(883, 'Jugador 882', 24, 'DELANTERO', '1000034'),
(884, 'Jugador 883', 25, 'DELANTERO', '1000034'),
(885, 'Jugador 884', 26, 'DELANTERO', '1000034'),
(886, 'Jugador 885', 1, 'PORTERO', '1000035'),
(887, 'Jugador 886', 2, 'PORTERO', '1000035'),
(888, 'Jugador 887', 3, 'DEFENSA', '1000035'),
(889, 'Jugador 888', 4, 'DEFENSA', '1000035'),
(890, 'Jugador 889', 5, 'DEFENSA', '1000035'),
(891, 'Jugador 890', 6, 'DEFENSA', '1000035'),
(892, 'Jugador 891', 7, 'DEFENSA', '1000035'),
(893, 'Jugador 892', 8, 'DEFENSA', '1000035'),
(894, 'Jugador 893', 9, 'DEFENSA', '1000035'),
(895, 'Jugador 894', 10, 'DEFENSA', '1000035'),
(896, 'Jugador 895', 11, 'MEDIOCAMPISTA', '1000035'),
(897, 'Jugador 896', 12, 'MEDIOCAMPISTA', '1000035'),
(898, 'Jugador 897', 13, 'MEDIOCAMPISTA', '1000035'),
(899, 'Jugador 898', 14, 'MEDIOCAMPISTA', '1000035'),
(900, 'Jugador 899', 15, 'MEDIOCAMPISTA', '1000035'),
(901, 'Jugador 900', 16, 'MEDIOCAMPISTA', '1000035'),
(902, 'Jugador 901', 17, 'MEDIOCAMPISTA', '1000035'),
(903, 'Jugador 902', 18, 'MEDIOCAMPISTA', '1000035'),
(904, 'Jugador 903', 19, 'DELANTERO', '1000035'),
(905, 'Jugador 904', 20, 'DELANTERO', '1000035'),
(906, 'Jugador 905', 21, 'DELANTERO', '1000035'),
(907, 'Jugador 906', 22, 'DELANTERO', '1000035'),
(908, 'Jugador 907', 23, 'DELANTERO', '1000035'),
(909, 'Jugador 908', 24, 'DELANTERO', '1000035'),
(910, 'Jugador 909', 25, 'DELANTERO', '1000035'),
(911, 'Jugador 910', 26, 'DELANTERO', '1000035'),
(912, 'Jugador 911', 1, 'PORTERO', '1000036'),
(913, 'Jugador 912', 2, 'PORTERO', '1000036'),
(914, 'Jugador 913', 3, 'DEFENSA', '1000036'),
(915, 'Jugador 914', 4, 'DEFENSA', '1000036'),
(916, 'Jugador 915', 5, 'DEFENSA', '1000036'),
(917, 'Jugador 916', 6, 'DEFENSA', '1000036'),
(918, 'Jugador 917', 7, 'DEFENSA', '1000036'),
(919, 'Jugador 918', 8, 'DEFENSA', '1000036'),
(920, 'Jugador 919', 9, 'DEFENSA', '1000036'),
(921, 'Jugador 920', 10, 'DEFENSA', '1000036'),
(922, 'Jugador 921', 11, 'MEDIOCAMPISTA', '1000036'),
(923, 'Jugador 922', 12, 'MEDIOCAMPISTA', '1000036'),
(924, 'Jugador 923', 13, 'MEDIOCAMPISTA', '1000036'),
(925, 'Jugador 924', 14, 'MEDIOCAMPISTA', '1000036'),
(926, 'Jugador 925', 15, 'MEDIOCAMPISTA', '1000036'),
(927, 'Jugador 926', 16, 'MEDIOCAMPISTA', '1000036'),
(928, 'Jugador 927', 17, 'MEDIOCAMPISTA', '1000036'),
(929, 'Jugador 928', 18, 'MEDIOCAMPISTA', '1000036'),
(930, 'Jugador 929', 19, 'DELANTERO', '1000036'),
(931, 'Jugador 930', 20, 'DELANTERO', '1000036'),
(932, 'Jugador 931', 21, 'DELANTERO', '1000036'),
(933, 'Jugador 932', 22, 'DELANTERO', '1000036'),
(934, 'Jugador 933', 23, 'DELANTERO', '1000036'),
(935, 'Jugador 934', 24, 'DELANTERO', '1000036'),
(936, 'Jugador 935', 25, 'DELANTERO', '1000036'),
(937, 'Jugador 936', 26, 'DELANTERO', '1000036'),
(938, 'Jugador 937', 1, 'PORTERO', '1000037'),
(939, 'Jugador 938', 2, 'PORTERO', '1000037'),
(940, 'Jugador 939', 3, 'DEFENSA', '1000037'),
(941, 'Jugador 940', 4, 'DEFENSA', '1000037'),
(942, 'Jugador 941', 5, 'DEFENSA', '1000037'),
(943, 'Jugador 942', 6, 'DEFENSA', '1000037'),
(944, 'Jugador 943', 7, 'DEFENSA', '1000037'),
(945, 'Jugador 944', 8, 'DEFENSA', '1000037'),
(946, 'Jugador 945', 9, 'DEFENSA', '1000037'),
(947, 'Jugador 946', 10, 'DEFENSA', '1000037'),
(948, 'Jugador 947', 11, 'MEDIOCAMPISTA', '1000037'),
(949, 'Jugador 948', 12, 'MEDIOCAMPISTA', '1000037'),
(950, 'Jugador 949', 13, 'MEDIOCAMPISTA', '1000037'),
(951, 'Jugador 950', 14, 'MEDIOCAMPISTA', '1000037'),
(952, 'Jugador 951', 15, 'MEDIOCAMPISTA', '1000037'),
(953, 'Jugador 952', 16, 'MEDIOCAMPISTA', '1000037'),
(954, 'Jugador 953', 17, 'MEDIOCAMPISTA', '1000037'),
(955, 'Jugador 954', 18, 'MEDIOCAMPISTA', '1000037'),
(956, 'Jugador 955', 19, 'DELANTERO', '1000037'),
(957, 'Jugador 956', 20, 'DELANTERO', '1000037'),
(958, 'Jugador 957', 21, 'DELANTERO', '1000037'),
(959, 'Jugador 958', 22, 'DELANTERO', '1000037'),
(960, 'Jugador 959', 23, 'DELANTERO', '1000037'),
(961, 'Jugador 960', 24, 'DELANTERO', '1000037'),
(962, 'Jugador 961', 25, 'DELANTERO', '1000037'),
(963, 'Jugador 962', 26, 'DELANTERO', '1000037'),
(964, 'Jugador 963', 1, 'PORTERO', '1000038'),
(965, 'Jugador 964', 2, 'PORTERO', '1000038'),
(966, 'Jugador 965', 3, 'DEFENSA', '1000038'),
(967, 'Jugador 966', 4, 'DEFENSA', '1000038'),
(968, 'Jugador 967', 5, 'DEFENSA', '1000038'),
(969, 'Jugador 968', 6, 'DEFENSA', '1000038'),
(970, 'Jugador 969', 7, 'DEFENSA', '1000038'),
(971, 'Jugador 970', 8, 'DEFENSA', '1000038'),
(972, 'Jugador 971', 9, 'DEFENSA', '1000038'),
(973, 'Jugador 972', 10, 'DEFENSA', '1000038'),
(974, 'Jugador 973', 11, 'MEDIOCAMPISTA', '1000038'),
(975, 'Jugador 974', 12, 'MEDIOCAMPISTA', '1000038'),
(976, 'Jugador 975', 13, 'MEDIOCAMPISTA', '1000038'),
(977, 'Jugador 976', 14, 'MEDIOCAMPISTA', '1000038'),
(978, 'Jugador 977', 15, 'MEDIOCAMPISTA', '1000038'),
(979, 'Jugador 978', 16, 'MEDIOCAMPISTA', '1000038'),
(980, 'Jugador 979', 17, 'MEDIOCAMPISTA', '1000038'),
(981, 'Jugador 980', 18, 'MEDIOCAMPISTA', '1000038'),
(982, 'Jugador 981', 19, 'DELANTERO', '1000038'),
(983, 'Jugador 982', 20, 'DELANTERO', '1000038'),
(984, 'Jugador 983', 21, 'DELANTERO', '1000038'),
(985, 'Jugador 984', 22, 'DELANTERO', '1000038'),
(986, 'Jugador 985', 23, 'DELANTERO', '1000038'),
(987, 'Jugador 986', 24, 'DELANTERO', '1000038'),
(988, 'Jugador 987', 25, 'DELANTERO', '1000038'),
(989, 'Jugador 988', 26, 'DELANTERO', '1000038'),
(990, 'Jugador 989', 1, 'PORTERO', '1000039'),
(991, 'Jugador 990', 2, 'PORTERO', '1000039'),
(992, 'Jugador 991', 3, 'DEFENSA', '1000039'),
(993, 'Jugador 992', 4, 'DEFENSA', '1000039'),
(994, 'Jugador 993', 5, 'DEFENSA', '1000039'),
(995, 'Jugador 994', 6, 'DEFENSA', '1000039'),
(996, 'Jugador 995', 7, 'DEFENSA', '1000039'),
(997, 'Jugador 996', 8, 'DEFENSA', '1000039'),
(998, 'Jugador 997', 9, 'DEFENSA', '1000039'),
(999, 'Jugador 998', 10, 'DEFENSA', '1000039'),
(1000, 'Jugador 999', 11, 'MEDIOCAMPISTA', '1000039'),
(1001, 'Jugador 1000', 12, 'MEDIOCAMPISTA', '1000039'),
(1002, 'Jugador 1001', 13, 'MEDIOCAMPISTA', '1000039'),
(1003, 'Jugador 1002', 14, 'MEDIOCAMPISTA', '1000039'),
(1004, 'Jugador 1003', 15, 'MEDIOCAMPISTA', '1000039'),
(1005, 'Jugador 1004', 16, 'MEDIOCAMPISTA', '1000039'),
(1006, 'Jugador 1005', 17, 'MEDIOCAMPISTA', '1000039'),
(1007, 'Jugador 1006', 18, 'MEDIOCAMPISTA', '1000039'),
(1008, 'Jugador 1007', 19, 'DELANTERO', '1000039'),
(1009, 'Jugador 1008', 20, 'DELANTERO', '1000039'),
(1010, 'Jugador 1009', 21, 'DELANTERO', '1000039'),
(1011, 'Jugador 1010', 22, 'DELANTERO', '1000039'),
(1012, 'Jugador 1011', 23, 'DELANTERO', '1000039'),
(1013, 'Jugador 1012', 24, 'DELANTERO', '1000039'),
(1014, 'Jugador 1013', 25, 'DELANTERO', '1000039'),
(1015, 'Jugador 1014', 26, 'DELANTERO', '1000039'),
(1016, 'Jugador 1015', 1, 'PORTERO', '1000040'),
(1017, 'Jugador 1016', 2, 'PORTERO', '1000040'),
(1018, 'Jugador 1017', 3, 'DEFENSA', '1000040'),
(1019, 'Jugador 1018', 4, 'DEFENSA', '1000040'),
(1020, 'Jugador 1019', 5, 'DEFENSA', '1000040'),
(1021, 'Jugador 1020', 6, 'DEFENSA', '1000040'),
(1022, 'Jugador 1021', 7, 'DEFENSA', '1000040'),
(1023, 'Jugador 1022', 8, 'DEFENSA', '1000040'),
(1024, 'Jugador 1023', 9, 'DEFENSA', '1000040'),
(1025, 'Jugador 1024', 10, 'DEFENSA', '1000040'),
(1026, 'Jugador 1025', 11, 'MEDIOCAMPISTA', '1000040'),
(1027, 'Jugador 1026', 12, 'MEDIOCAMPISTA', '1000040'),
(1028, 'Jugador 1027', 13, 'MEDIOCAMPISTA', '1000040'),
(1029, 'Jugador 1028', 14, 'MEDIOCAMPISTA', '1000040'),
(1030, 'Jugador 1029', 15, 'MEDIOCAMPISTA', '1000040'),
(1031, 'Jugador 1030', 16, 'MEDIOCAMPISTA', '1000040'),
(1032, 'Jugador 1031', 17, 'MEDIOCAMPISTA', '1000040'),
(1033, 'Jugador 1032', 18, 'MEDIOCAMPISTA', '1000040'),
(1034, 'Jugador 1033', 19, 'DELANTERO', '1000040'),
(1035, 'Jugador 1034', 20, 'DELANTERO', '1000040'),
(1036, 'Jugador 1035', 21, 'DELANTERO', '1000040'),
(1037, 'Jugador 1036', 22, 'DELANTERO', '1000040'),
(1038, 'Jugador 1037', 23, 'DELANTERO', '1000040'),
(1039, 'Jugador 1038', 24, 'DELANTERO', '1000040'),
(1040, 'Jugador 1039', 25, 'DELANTERO', '1000040'),
(1041, 'Jugador 1040', 26, 'DELANTERO', '1000040');
INSERT INTO `players` (`id`, `name`, `dorsal`, `posicion`, `team_id`) VALUES
(1042, 'Jugador 1041', 1, 'PORTERO', '1000041'),
(1043, 'Jugador 1042', 2, 'PORTERO', '1000041'),
(1044, 'Jugador 1043', 3, 'DEFENSA', '1000041'),
(1045, 'Jugador 1044', 4, 'DEFENSA', '1000041'),
(1046, 'Jugador 1045', 5, 'DEFENSA', '1000041'),
(1047, 'Jugador 1046', 6, 'DEFENSA', '1000041'),
(1048, 'Jugador 1047', 7, 'DEFENSA', '1000041'),
(1049, 'Jugador 1048', 8, 'DEFENSA', '1000041'),
(1050, 'Jugador 1049', 9, 'DEFENSA', '1000041'),
(1051, 'Jugador 1050', 10, 'DEFENSA', '1000041'),
(1052, 'Jugador 1051', 11, 'MEDIOCAMPISTA', '1000041'),
(1053, 'Jugador 1052', 12, 'MEDIOCAMPISTA', '1000041'),
(1054, 'Jugador 1053', 13, 'MEDIOCAMPISTA', '1000041'),
(1055, 'Jugador 1054', 14, 'MEDIOCAMPISTA', '1000041'),
(1056, 'Jugador 1055', 15, 'MEDIOCAMPISTA', '1000041'),
(1057, 'Jugador 1056', 16, 'MEDIOCAMPISTA', '1000041'),
(1058, 'Jugador 1057', 17, 'MEDIOCAMPISTA', '1000041'),
(1059, 'Jugador 1058', 18, 'MEDIOCAMPISTA', '1000041'),
(1060, 'Jugador 1059', 19, 'DELANTERO', '1000041'),
(1061, 'Jugador 1060', 20, 'DELANTERO', '1000041'),
(1062, 'Jugador 1061', 21, 'DELANTERO', '1000041'),
(1063, 'Jugador 1062', 22, 'DELANTERO', '1000041'),
(1064, 'Jugador 1063', 23, 'DELANTERO', '1000041'),
(1065, 'Jugador 1064', 24, 'DELANTERO', '1000041'),
(1066, 'Jugador 1065', 25, 'DELANTERO', '1000041'),
(1067, 'Jugador 1066', 26, 'DELANTERO', '1000041'),
(1068, 'Jugador 1067', 1, 'PORTERO', '1000042'),
(1069, 'Jugador 1068', 2, 'PORTERO', '1000042'),
(1070, 'Jugador 1069', 3, 'DEFENSA', '1000042'),
(1071, 'Jugador 1070', 4, 'DEFENSA', '1000042'),
(1072, 'Jugador 1071', 5, 'DEFENSA', '1000042'),
(1073, 'Jugador 1072', 6, 'DEFENSA', '1000042'),
(1074, 'Jugador 1073', 7, 'DEFENSA', '1000042'),
(1075, 'Jugador 1074', 8, 'DEFENSA', '1000042'),
(1076, 'Jugador 1075', 9, 'DEFENSA', '1000042'),
(1077, 'Jugador 1076', 10, 'DEFENSA', '1000042'),
(1078, 'Jugador 1077', 11, 'MEDIOCAMPISTA', '1000042'),
(1079, 'Jugador 1078', 12, 'MEDIOCAMPISTA', '1000042'),
(1080, 'Jugador 1079', 13, 'MEDIOCAMPISTA', '1000042'),
(1081, 'Jugador 1080', 14, 'MEDIOCAMPISTA', '1000042'),
(1082, 'Jugador 1081', 15, 'MEDIOCAMPISTA', '1000042'),
(1083, 'Jugador 1082', 16, 'MEDIOCAMPISTA', '1000042'),
(1084, 'Jugador 1083', 17, 'MEDIOCAMPISTA', '1000042'),
(1085, 'Jugador 1084', 18, 'MEDIOCAMPISTA', '1000042'),
(1086, 'Jugador 1085', 19, 'DELANTERO', '1000042'),
(1087, 'Jugador 1086', 20, 'DELANTERO', '1000042'),
(1088, 'Jugador 1087', 21, 'DELANTERO', '1000042'),
(1089, 'Jugador 1088', 22, 'DELANTERO', '1000042'),
(1090, 'Jugador 1089', 23, 'DELANTERO', '1000042'),
(1091, 'Jugador 1090', 24, 'DELANTERO', '1000042'),
(1092, 'Jugador 1091', 25, 'DELANTERO', '1000042'),
(1093, 'Jugador 1092', 26, 'DELANTERO', '1000042'),
(1094, 'Jugador 1093', 1, 'PORTERO', '1000043'),
(1095, 'Jugador 1094', 2, 'PORTERO', '1000043'),
(1096, 'Jugador 1095', 3, 'DEFENSA', '1000043'),
(1097, 'Jugador 1096', 4, 'DEFENSA', '1000043'),
(1098, 'Jugador 1097', 5, 'DEFENSA', '1000043'),
(1099, 'Jugador 1098', 6, 'DEFENSA', '1000043'),
(1100, 'Jugador 1099', 7, 'DEFENSA', '1000043'),
(1101, 'Jugador 1100', 8, 'DEFENSA', '1000043'),
(1102, 'Jugador 1101', 9, 'DEFENSA', '1000043'),
(1103, 'Jugador 1102', 10, 'DEFENSA', '1000043'),
(1104, 'Jugador 1103', 11, 'MEDIOCAMPISTA', '1000043'),
(1105, 'Jugador 1104', 12, 'MEDIOCAMPISTA', '1000043'),
(1106, 'Jugador 1105', 13, 'MEDIOCAMPISTA', '1000043'),
(1107, 'Jugador 1106', 14, 'MEDIOCAMPISTA', '1000043'),
(1108, 'Jugador 1107', 15, 'MEDIOCAMPISTA', '1000043'),
(1109, 'Jugador 1108', 16, 'MEDIOCAMPISTA', '1000043'),
(1110, 'Jugador 1109', 17, 'MEDIOCAMPISTA', '1000043'),
(1111, 'Jugador 1110', 18, 'MEDIOCAMPISTA', '1000043'),
(1112, 'Jugador 1111', 19, 'DELANTERO', '1000043'),
(1113, 'Jugador 1112', 20, 'DELANTERO', '1000043'),
(1114, 'Jugador 1113', 21, 'DELANTERO', '1000043'),
(1115, 'Jugador 1114', 22, 'DELANTERO', '1000043'),
(1116, 'Jugador 1115', 23, 'DELANTERO', '1000043'),
(1117, 'Jugador 1116', 24, 'DELANTERO', '1000043'),
(1118, 'Jugador 1117', 25, 'DELANTERO', '1000043'),
(1119, 'Jugador 1118', 26, 'DELANTERO', '1000043'),
(1120, 'Jugador 1119', 1, 'PORTERO', '1000044'),
(1121, 'Jugador 1120', 2, 'PORTERO', '1000044'),
(1122, 'Jugador 1121', 3, 'DEFENSA', '1000044'),
(1123, 'Jugador 1122', 4, 'DEFENSA', '1000044'),
(1124, 'Jugador 1123', 5, 'DEFENSA', '1000044'),
(1125, 'Jugador 1124', 6, 'DEFENSA', '1000044'),
(1126, 'Jugador 1125', 7, 'DEFENSA', '1000044'),
(1127, 'Jugador 1126', 8, 'DEFENSA', '1000044'),
(1128, 'Jugador 1127', 9, 'DEFENSA', '1000044'),
(1129, 'Jugador 1128', 10, 'DEFENSA', '1000044'),
(1130, 'Jugador 1129', 11, 'MEDIOCAMPISTA', '1000044'),
(1131, 'Jugador 1130', 12, 'MEDIOCAMPISTA', '1000044'),
(1132, 'Jugador 1131', 13, 'MEDIOCAMPISTA', '1000044'),
(1133, 'Jugador 1132', 14, 'MEDIOCAMPISTA', '1000044'),
(1134, 'Jugador 1133', 15, 'MEDIOCAMPISTA', '1000044'),
(1135, 'Jugador 1134', 16, 'MEDIOCAMPISTA', '1000044'),
(1136, 'Jugador 1135', 17, 'MEDIOCAMPISTA', '1000044'),
(1137, 'Jugador 1136', 18, 'MEDIOCAMPISTA', '1000044'),
(1138, 'Jugador 1137', 19, 'DELANTERO', '1000044'),
(1139, 'Jugador 1138', 20, 'DELANTERO', '1000044'),
(1140, 'Jugador 1139', 21, 'DELANTERO', '1000044'),
(1141, 'Jugador 1140', 22, 'DELANTERO', '1000044'),
(1142, 'Jugador 1141', 23, 'DELANTERO', '1000044'),
(1143, 'Jugador 1142', 24, 'DELANTERO', '1000044'),
(1144, 'Jugador 1143', 25, 'DELANTERO', '1000044'),
(1145, 'Jugador 1144', 26, 'DELANTERO', '1000044'),
(1146, 'Jugador 1145', 1, 'PORTERO', '1000045'),
(1147, 'Jugador 1146', 2, 'PORTERO', '1000045'),
(1148, 'Jugador 1147', 3, 'DEFENSA', '1000045'),
(1149, 'Jugador 1148', 4, 'DEFENSA', '1000045'),
(1150, 'Jugador 1149', 5, 'DEFENSA', '1000045'),
(1151, 'Jugador 1150', 6, 'DEFENSA', '1000045'),
(1152, 'Jugador 1151', 7, 'DEFENSA', '1000045'),
(1153, 'Jugador 1152', 8, 'DEFENSA', '1000045'),
(1154, 'Jugador 1153', 9, 'DEFENSA', '1000045'),
(1155, 'Jugador 1154', 10, 'DEFENSA', '1000045'),
(1156, 'Jugador 1155', 11, 'MEDIOCAMPISTA', '1000045'),
(1157, 'Jugador 1156', 12, 'MEDIOCAMPISTA', '1000045'),
(1158, 'Jugador 1157', 13, 'MEDIOCAMPISTA', '1000045'),
(1159, 'Jugador 1158', 14, 'MEDIOCAMPISTA', '1000045'),
(1160, 'Jugador 1159', 15, 'MEDIOCAMPISTA', '1000045'),
(1161, 'Jugador 1160', 16, 'MEDIOCAMPISTA', '1000045'),
(1162, 'Jugador 1161', 17, 'MEDIOCAMPISTA', '1000045'),
(1163, 'Jugador 1162', 18, 'MEDIOCAMPISTA', '1000045'),
(1164, 'Jugador 1163', 19, 'DELANTERO', '1000045'),
(1165, 'Jugador 1164', 20, 'DELANTERO', '1000045'),
(1166, 'Jugador 1165', 21, 'DELANTERO', '1000045'),
(1167, 'Jugador 1166', 22, 'DELANTERO', '1000045'),
(1168, 'Jugador 1167', 23, 'DELANTERO', '1000045'),
(1169, 'Jugador 1168', 24, 'DELANTERO', '1000045'),
(1170, 'Jugador 1169', 25, 'DELANTERO', '1000045'),
(1171, 'Jugador 1170', 26, 'DELANTERO', '1000045'),
(1172, 'Jugador 1171', 1, 'PORTERO', '1000046'),
(1173, 'Jugador 1172', 2, 'PORTERO', '1000046'),
(1174, 'Jugador 1173', 3, 'DEFENSA', '1000046'),
(1175, 'Jugador 1174', 4, 'DEFENSA', '1000046'),
(1176, 'Jugador 1175', 5, 'DEFENSA', '1000046'),
(1177, 'Jugador 1176', 6, 'DEFENSA', '1000046'),
(1178, 'Jugador 1177', 7, 'DEFENSA', '1000046'),
(1179, 'Jugador 1178', 8, 'DEFENSA', '1000046'),
(1180, 'Jugador 1179', 9, 'DEFENSA', '1000046'),
(1181, 'Jugador 1180', 10, 'DEFENSA', '1000046'),
(1182, 'Jugador 1181', 11, 'MEDIOCAMPISTA', '1000046'),
(1183, 'Jugador 1182', 12, 'MEDIOCAMPISTA', '1000046'),
(1184, 'Jugador 1183', 13, 'MEDIOCAMPISTA', '1000046'),
(1185, 'Jugador 1184', 14, 'MEDIOCAMPISTA', '1000046'),
(1186, 'Jugador 1185', 15, 'MEDIOCAMPISTA', '1000046'),
(1187, 'Jugador 1186', 16, 'MEDIOCAMPISTA', '1000046'),
(1188, 'Jugador 1187', 17, 'MEDIOCAMPISTA', '1000046'),
(1189, 'Jugador 1188', 18, 'MEDIOCAMPISTA', '1000046'),
(1190, 'Jugador 1189', 19, 'DELANTERO', '1000046'),
(1191, 'Jugador 1190', 20, 'DELANTERO', '1000046'),
(1192, 'Jugador 1191', 21, 'DELANTERO', '1000046'),
(1193, 'Jugador 1192', 22, 'DELANTERO', '1000046'),
(1194, 'Jugador 1193', 23, 'DELANTERO', '1000046'),
(1195, 'Jugador 1194', 24, 'DELANTERO', '1000046'),
(1196, 'Jugador 1195', 25, 'DELANTERO', '1000046'),
(1197, 'Jugador 1196', 26, 'DELANTERO', '1000046'),
(1198, 'Jugador 1197', 1, 'PORTERO', '1000047'),
(1199, 'Jugador 1198', 2, 'PORTERO', '1000047'),
(1200, 'Jugador 1199', 3, 'DEFENSA', '1000047'),
(1201, 'Jugador 1200', 4, 'DEFENSA', '1000047'),
(1202, 'Jugador 1201', 5, 'DEFENSA', '1000047'),
(1203, 'Jugador 1202', 6, 'DEFENSA', '1000047'),
(1204, 'Jugador 1203', 7, 'DEFENSA', '1000047'),
(1205, 'Jugador 1204', 8, 'DEFENSA', '1000047'),
(1206, 'Jugador 1205', 9, 'DEFENSA', '1000047'),
(1207, 'Jugador 1206', 10, 'DEFENSA', '1000047'),
(1208, 'Jugador 1207', 11, 'MEDIOCAMPISTA', '1000047'),
(1209, 'Jugador 1208', 12, 'MEDIOCAMPISTA', '1000047'),
(1210, 'Jugador 1209', 13, 'MEDIOCAMPISTA', '1000047'),
(1211, 'Jugador 1210', 14, 'MEDIOCAMPISTA', '1000047'),
(1212, 'Jugador 1211', 15, 'MEDIOCAMPISTA', '1000047'),
(1213, 'Jugador 1212', 16, 'MEDIOCAMPISTA', '1000047'),
(1214, 'Jugador 1213', 17, 'MEDIOCAMPISTA', '1000047'),
(1215, 'Jugador 1214', 18, 'MEDIOCAMPISTA', '1000047'),
(1216, 'Jugador 1215', 19, 'DELANTERO', '1000047'),
(1217, 'Jugador 1216', 20, 'DELANTERO', '1000047'),
(1218, 'Jugador 1217', 21, 'DELANTERO', '1000047'),
(1219, 'Jugador 1218', 22, 'DELANTERO', '1000047'),
(1220, 'Jugador 1219', 23, 'DELANTERO', '1000047'),
(1221, 'Jugador 1220', 24, 'DELANTERO', '1000047'),
(1222, 'Jugador 1221', 25, 'DELANTERO', '1000047'),
(1223, 'Jugador 1222', 26, 'DELANTERO', '1000047'),
(1224, 'Jugador 1223', 1, 'PORTERO', '1000048'),
(1225, 'Jugador 1224', 2, 'PORTERO', '1000048'),
(1226, 'Jugador 1225', 3, 'DEFENSA', '1000048'),
(1227, 'Jugador 1226', 4, 'DEFENSA', '1000048'),
(1228, 'Jugador 1227', 5, 'DEFENSA', '1000048'),
(1229, 'Jugador 1228', 6, 'DEFENSA', '1000048'),
(1230, 'Jugador 1229', 7, 'DEFENSA', '1000048'),
(1231, 'Jugador 1230', 8, 'DEFENSA', '1000048'),
(1232, 'Jugador 1231', 9, 'DEFENSA', '1000048'),
(1233, 'Jugador 1232', 10, 'DEFENSA', '1000048'),
(1234, 'Jugador 1233', 11, 'MEDIOCAMPISTA', '1000048'),
(1235, 'Jugador 1234', 12, 'MEDIOCAMPISTA', '1000048'),
(1236, 'Jugador 1235', 13, 'MEDIOCAMPISTA', '1000048'),
(1237, 'Jugador 1236', 14, 'MEDIOCAMPISTA', '1000048'),
(1238, 'Jugador 1237', 15, 'MEDIOCAMPISTA', '1000048'),
(1239, 'Jugador 1238', 16, 'MEDIOCAMPISTA', '1000048'),
(1240, 'Jugador 1239', 17, 'MEDIOCAMPISTA', '1000048'),
(1241, 'Jugador 1240', 18, 'MEDIOCAMPISTA', '1000048'),
(1242, 'Jugador 1241', 19, 'DELANTERO', '1000048'),
(1243, 'Jugador 1242', 20, 'DELANTERO', '1000048'),
(1244, 'Jugador 1243', 21, 'DELANTERO', '1000048'),
(1245, 'Jugador 1244', 22, 'DELANTERO', '1000048'),
(1246, 'Jugador 1245', 23, 'DELANTERO', '1000048'),
(1247, 'Jugador 1246', 24, 'DELANTERO', '1000048'),
(1248, 'Jugador 1247', 25, 'DELANTERO', '1000048'),
(1249, 'Jugador 1248', 26, 'DELANTERO', '1000048');

-- --------------------------------------------------------

--
-- Table structure for table `players_awarded`
--

CREATE TABLE `players_awarded` (
  `player_id` int(11) NOT NULL,
  `titulo` enum('MAX_GOLEADOR','MAX_ASISTIDOR','MEJOR_JUGADOR','MEJOR_PORTERO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quinielas_control`
--

CREATE TABLE `quinielas_control` (
  `fase` enum('FDG','16VOS','OCTAVOS','CUARTOS','SEMIS','FINAL','TERCER_PUESTO') NOT NULL,
  `abierta` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_inicio` datetime NOT NULL,
  `fecha_cierre` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quinielas_control`
--

INSERT INTO `quinielas_control` (`fase`, `abierta`, `fecha_inicio`, `fecha_cierre`) VALUES
('FDG', 1, '2025-06-01 00:00:00', '2025-06-10 23:59:59'),
('16VOS', 1, '2025-07-01 00:00:00', '2025-07-02 23:59:59'),
('OCTAVOS', 1, '2025-07-03 00:00:00', '2025-07-04 23:59:59'),
('CUARTOS', 1, '2025-07-05 00:00:00', '2025-07-06 23:59:59'),
('SEMIS', 0, '2025-07-07 00:00:00', '2025-07-08 23:59:59'),
('FINAL', 0, '2025-07-09 00:00:00', '2025-07-10 23:59:59'),
('TERCER_PUESTO', 0, '2025-03-20 17:40:52', '2025-03-20 17:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `quinielas_envios`
--

CREATE TABLE `quinielas_envios` (
  `usuario_id` char(7) NOT NULL,
  `fase` enum('FDG','16VOS','OCTAVOS','CUARTOS','SEMIS','FINAL','TERCER_PUESTO') NOT NULL,
  `enviado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selected_players`
--

CREATE TABLE `selected_players` (
  `user_id` char(7) NOT NULL,
  `maximo_goleador` int(11) DEFAULT NULL,
  `maximo_asistidor` int(11) DEFAULT NULL,
  `mejor_jugador` int(11) DEFAULT NULL,
  `mejor_portero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selected_players`
--

INSERT INTO `selected_players` (`user_id`, `maximo_goleador`, `maximo_asistidor`, `mejor_jugador`, `mejor_portero`) VALUES
('0124070', 11, 7, 10, 185);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` char(7) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(3) NOT NULL,
  `team_group` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `short_name`, `team_group`) VALUES
('1000001', 'México', 'MEX', 'A'),
('1000002', 'Equipo 2', 'A2', 'A'),
('1000003', 'Equipo 3', 'A3', 'A'),
('1000004', 'Equipo 4', 'A4', 'A'),
('1000005', 'Canadá', 'CAN', 'B'),
('1000006', 'Equipo 5', 'B2', 'B'),
('1000007', 'Equipo 6', 'B3', 'B'),
('1000008', 'Equipo 7', 'B4', 'B'),
('1000009', 'Equipo 8', 'C2', 'C'),
('1000010', 'Equipo 9', 'C3', 'C'),
('1000011', 'Equipo 10', 'C4', 'C'),
('1000012', 'Equipo 11', 'C5', 'C'),
('1000013', 'Estados Unidos', 'USA', 'D'),
('1000014', 'Equipo 12', 'D2', 'D'),
('1000015', 'Equipo 13', 'D3', 'D'),
('1000016', 'Equipo 14', 'D4', 'D'),
('1000017', 'Equipo 15', 'E2', 'E'),
('1000018', 'Equipo 16', 'E3', 'E'),
('1000019', 'Equipo 17', 'E4', 'E'),
('1000020', 'Equipo 18', 'E5', 'E'),
('1000021', 'Equipo 19', 'F2', 'F'),
('1000022', 'Equipo 20', 'F3', 'F'),
('1000023', 'Equipo 21', 'F4', 'F'),
('1000024', 'Equipo 22', 'F5', 'F'),
('1000025', 'Equipo 23', 'G2', 'G'),
('1000026', 'Equipo 24', 'G3', 'G'),
('1000027', 'Equipo 25', 'G4', 'G'),
('1000028', 'Equipo 26', 'G5', 'G'),
('1000029', 'Equipo 27', 'H2', 'H'),
('1000030', 'Equipo 28', 'H3', 'H'),
('1000031', 'Equipo 29', 'H4', 'H'),
('1000032', 'Equipo 30', 'H5', 'H'),
('1000033', 'Equipo 31', 'I2', 'I'),
('1000034', 'Equipo 32', 'I3', 'I'),
('1000035', 'Equipo 33', 'I4', 'I'),
('1000036', 'Equipo 34', 'I5', 'I'),
('1000037', 'Equipo 35', 'J2', 'J'),
('1000038', 'Equipo 36', 'J3', 'J'),
('1000039', 'Equipo 37', 'J4', 'J'),
('1000040', 'Equipo 38', 'J5', 'J'),
('1000041', 'Equipo 39', 'K2', 'K'),
('1000042', 'Equipo 40', 'K3', 'K'),
('1000043', 'Equipo 41', 'K4', 'K'),
('1000044', 'Equipo 42', 'K5', 'K'),
('1000045', 'Equipo 43', 'L2', 'L'),
('1000046', 'Equipo 44', 'L3', 'L'),
('1000047', 'Equipo 45', 'L4', 'L'),
('1000048', 'Equipo 46', 'L5', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(7) NOT NULL,
  `user` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` datetime NOT NULL,
  `reset_token_expires` datetime NOT NULL,
  `account_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `email`, `password`, `reset_token`, `reset_token_expires`, `account_created`) VALUES
('0124070', 'Yoyo', 'cesardommar50@gmail.com', '$2a$08$/CCTdw7WSiAGz..sYuAQ5.U/kS2Vf1jswBtr36DTrh/GK87bSKqBG', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
('0473497', 'Gyuka', 'ggg@gmail.com', '$2a$08$n9rEQ7KWTU0dO4iu0q3UOeNTbxWOzh51mk6L9AcoIVwc9lOh3Xkiu', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
('0613055', 'messi', 'messi@gmail.com', '$2a$08$wNpVaaThs8H3Kx0U7a1KMu.Hw3aWQE9wasywO3OU3QL5YrgO1m0/G', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `favteam`
--
ALTER TABLE `favteam`
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_teamid` (`teamid`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indexes for table `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team1_id` (`team1_id`),
  ADD KEY `team2_id` (`team2_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`) USING BTREE;

--
-- Indexes for table `players_awarded`
--
ALTER TABLE `players_awarded`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `quinielas_control`
--
ALTER TABLE `quinielas_control`
  ADD PRIMARY KEY (`fase`);

--
-- Indexes for table `quinielas_envios`
--
ALTER TABLE `quinielas_envios`
  ADD PRIMARY KEY (`usuario_id`,`fase`);

--
-- Indexes for table `selected_players`
--
ALTER TABLE `selected_players`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `mejor_jugador` (`mejor_jugador`),
  ADD KEY `maximo_goleador` (`maximo_goleador`),
  ADD KEY `maximo_asistidor` (`maximo_asistidor`),
  ADD KEY `mejor_portero` (`mejor_portero`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1250;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bets`
--
ALTER TABLE `bets`
  ADD CONSTRAINT `bets_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bets_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favteam`
--
ALTER TABLE `favteam`
  ADD CONSTRAINT `fk_teamid` FOREIGN KEY (`teamid`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`team1_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`team2_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players_awarded`
--
ALTER TABLE `players_awarded`
  ADD CONSTRAINT `players_awarded_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quinielas_envios`
--
ALTER TABLE `quinielas_envios`
  ADD CONSTRAINT `quinielas_envios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selected_players`
--
ALTER TABLE `selected_players`
  ADD CONSTRAINT `selected_players_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `selected_players_ibfk_2` FOREIGN KEY (`mejor_jugador`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `selected_players_ibfk_3` FOREIGN KEY (`maximo_goleador`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `selected_players_ibfk_4` FOREIGN KEY (`maximo_asistidor`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `selected_players_ibfk_5` FOREIGN KEY (`mejor_portero`) REFERENCES `players` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
