-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2020 at 04:11 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mentorski_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add predmeti', 6, 'add_predmeti'),
(22, 'Can change predmeti', 6, 'change_predmeti'),
(23, 'Can delete predmeti', 6, 'delete_predmeti'),
(24, 'Can view predmeti', 6, 'view_predmeti'),
(25, 'Can add user', 7, 'add_korisnici'),
(26, 'Can change user', 7, 'change_korisnici'),
(27, 'Can delete user', 7, 'delete_korisnici'),
(28, 'Can view user', 7, 'view_korisnici'),
(29, 'Can add upisi', 8, 'add_upisi'),
(30, 'Can change upisi', 8, 'change_upisi'),
(31, 'Can delete upisi', 8, 'delete_upisi'),
(32, 'Can view upisi', 8, 'view_upisi');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-01-22 17:42:05.480219', '5', 'mentor', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 7, 1),
(2, '2020-01-22 21:30:38.737430', '5', 'mentor Profile', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(3, '2020-01-22 21:40:30.618502', '5', 'mentor Profile', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'korisnici', 'korisnici'),
(6, 'mentorski', 'predmeti'),
(8, 'mentorski', 'upisi'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-01-22 17:15:09.587771'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-01-22 17:15:09.623675'),
(3, 'auth', '0001_initial', '2020-01-22 17:15:09.672544'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-01-22 17:15:09.827131'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-01-22 17:15:09.831120'),
(6, 'auth', '0004_alter_user_username_opts', '2020-01-22 17:15:09.835109'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-01-22 17:15:09.839099'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-01-22 17:15:09.841094'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-01-22 17:15:09.845083'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-01-22 17:15:09.849072'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-01-22 17:15:09.853062'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-01-22 17:15:09.915894'),
(13, 'auth', '0011_update_proxy_permissions', '2020-01-22 17:15:09.920880'),
(14, 'korisnici', '0001_initial', '2020-01-22 17:15:09.964763'),
(15, 'admin', '0001_initial', '2020-01-22 17:15:10.132315'),
(16, 'admin', '0002_logentry_remove_auto_add', '2020-01-22 17:15:10.202128'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-22 17:15:10.207115'),
(18, 'mentorski', '0001_initial', '2020-01-22 17:15:10.225067'),
(19, 'sessions', '0001_initial', '2020-01-22 17:15:10.238032'),
(20, 'mentorski', '0002_upisi', '2020-01-22 17:16:31.265881'),
(21, 'korisnici', '0002_korisnici_image', '2020-01-22 21:26:21.780650'),
(22, 'korisnici', '0003_auto_20200122_2310', '2020-01-22 22:10:47.328867'),
(23, 'korisnici', '0004_auto_20200123_0017', '2020-01-22 23:17:40.031552'),
(24, 'mentorski', '0003_auto_20200123_1648', '2020-01-23 15:48:33.580564'),
(25, 'mentorski', '0004_auto_20200123_2326', '2020-01-23 22:26:57.204065'),
(26, 'mentorski', '0005_auto_20200123_2354', '2020-01-23 22:54:28.888905'),
(27, 'mentorski', '0006_auto_20200125_0039', '2020-01-24 23:39:27.387684'),
(28, 'korisnici', '0005_auto_20200125_1138', '2020-01-25 10:38:50.167570');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5tkjcd4d5nyb86gzom2t6lvgabgxm4ms', 'YzIxZmJmMWNiMjJjYWJmZTY4NjFhMDFjNmVkNDdmMWQzZTJmNGUxNzp7fQ==', '2020-02-05 23:51:46.887746'),
('8kx0mpo18to3wi9wpokjgd4edc8fpgsx', 'YzIxZmJmMWNiMjJjYWJmZTY4NjFhMDFjNmVkNDdmMWQzZTJmNGUxNzp7fQ==', '2020-02-05 23:55:23.018617'),
('hocapgsor3iwqy15mrwgkxyqvq6hhl2e', 'YzIxZmJmMWNiMjJjYWJmZTY4NjFhMDFjNmVkNDdmMWQzZTJmNGUxNzp7fQ==', '2020-02-05 23:52:49.998497');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici_korisnici`
--

CREATE TABLE `korisnici_korisnici` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(7) NOT NULL,
  `status` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici_korisnici`
--

INSERT INTO `korisnici_korisnici` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `status`, `image`) VALUES
(1, 'pbkdf2_sha256$180000$aLlpDOkUQGM6$SpMKQM0BRaSmRyQWCBQlkzcRJG0ivnSN8p/g8xACmbg=', '2020-01-26 15:10:30.371330', 1, 'marko', '', '', '', 1, 1, '2020-01-22 17:20:32.051055', '', '', 'default.jpg'),
(5, 'pbkdf2_sha256$180000$I6N61TTRNUPz$01qpFQ/++GjSsX5YbsfiwWflZxyvFd3UKBxdPPsrt8w=', '2020-01-26 15:09:34.952498', 0, 'mentor', '', '', 'mentor@oss.hr', 1, 1, '2020-01-22 17:40:00.000000', 'mentor', 'none', 'profile_pics/avatar-default_OhvPBbo.png'),
(12, 'pbkdf2_sha256$180000$ojAL6u62RaTz$eV/VoiOoGTYn+vA1TJbJMoSI1lldEhW/vGWyv+EClb0=', '2020-01-26 15:09:54.423440', 0, 'student_r', '', '', 'red@oss.hr', 0, 1, '2020-01-25 16:59:00.109936', 'student', 'redovni', 'default.png'),
(13, 'pbkdf2_sha256$180000$XN0VvxZRUHd5$/zLlQZhfmQnXbS/EttdqMMLmjTz6v5I0JZlpVVWBbTM=', '2020-01-26 15:09:48.628933', 0, 'student_i', '', '', 'izv@oss.hr', 0, 1, '2020-01-25 17:00:07.363128', 'student', 'izvanredni', 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici_korisnici_groups`
--

CREATE TABLE `korisnici_korisnici_groups` (
  `id` int(11) NOT NULL,
  `korisnici_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici_korisnici_user_permissions`
--

CREATE TABLE `korisnici_korisnici_user_permissions` (
  `id` int(11) NOT NULL,
  `korisnici_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mentorski_predmeti`
--

CREATE TABLE `mentorski_predmeti` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `kod` varchar(6) NOT NULL,
  `program` longtext NOT NULL,
  `bodovi` int(10) UNSIGNED NOT NULL,
  `sem_redovni` int(10) UNSIGNED NOT NULL,
  `sem_izvanredni` int(10) UNSIGNED NOT NULL,
  `izborni` varchar(2) NOT NULL
) ;

--
-- Dumping data for table `mentorski_predmeti`
--

INSERT INTO `mentorski_predmeti` (`id`, `ime`, `kod`, `program`, `bodovi`, `sem_redovni`, `sem_izvanredni`, `izborni`) VALUES
(1, 'Linearna algebra', 'SIT001', 'Program nije unesen', 5, 1, 1, 'ne'),
(2, 'Fizika', 'SIT002', 'Program nije unesen', 6, 1, 3, 'ne'),
(3, 'Osnove elektrotehnike', 'SIT003', 'Program nije unesen', 6, 1, 1, 'ne'),
(4, 'Digitalna i mikroprocesorska tehnika', 'SIT004', 'Program nije unesen', 7, 1, 2, 'ne'),
(5, 'Uporaba računala', 'SIT005', 'Program nije unesen', 4, 1, 1, 'ne'),
(6, 'Engleski jezik 1', 'SIT006', 'Program nije unesen', 2, 1, 1, 'ne'),
(7, 'Analiza 1', 'SIT007', 'Program nije unesen', 7, 2, 2, 'ne'),
(8, 'Osnove elektronike', 'SIT008', 'Program nije unesen', 6, 2, 2, 'ne'),
(9, 'Arhitektura i organizacija digitalnih računala', 'SIT009', 'Program nije unesen', 7, 2, 3, 'ne'),
(10, 'Uvod u programiranje', 'SIT010', 'Program nije unesen', 8, 2, 3, 'ne'),
(11, 'Engleski jezik 2', 'SIT011', 'Program nije unesen', 2, 2, 2, 'ne'),
(12, 'Primijenjena i numerička matematika', 'SIT012', 'Program nije unesen', 6, 3, 4, 'ne'),
(13, 'Programske metode i apstrakcije', 'SIT013', 'Program nije unesen', 8, 3, 4, 'ne'),
(14, 'Baze podataka', 'SIT014', 'Program nije unesen', 6, 3, 5, 'ne'),
(15, 'Informacijski sustavi', 'SIT015', 'Program nije unesen', 6, 3, 4, 'ne'),
(16, 'Tehnički Engleski jezik', 'SIT016', 'Program nije unesen', 4, 3, 5, 'ne'),
(17, 'Računalne mreže', 'SIT017', 'Program nije unesen', 5, 4, 5, 'ne'),
(18, 'Operacijski sustavi', 'SIT018', 'Program nije unesen', 5, 4, 5, 'ne'),
(19, 'Strukture podataka i algoritmi', 'SIT019', 'Program nije unesen', 5, 4, 6, 'da'),
(20, 'Objektno programiranje', 'SIT020', 'Program nije unesen', 5, 4, 6, 'da'),
(21, 'Baze podataka 2', 'SIT021', 'Program nije unesen', 5, 4, 6, 'da'),
(22, 'Mrežne usluge i programiranje', 'SIT022', 'Program nije unesen', 5, 4, 6, 'da'),
(23, 'Arhitektura osobnih računala', 'SIT023', 'Program nije unesen', 5, 4, 6, 'da'),
(24, 'Projektiranje i upravljanje računalnim mrežama', 'SIT024', 'Program nije unesen', 5, 4, 6, 'da'),
(25, 'Projektiranje informacijskih sustava', 'SIT025', 'Program nije unesen', 5, 4, 6, 'da'),
(26, 'Informatizacija poslovanja', 'SIT026', 'Program nije unesen', 5, 4, 6, 'da'),
(27, 'Ekonomika i organizacija poduzeća', 'SIT027', 'Program nije unesen', 2, 5, 7, 'ne'),
(28, 'Analiza 2', 'SIT028', 'Program nije unesen', 6, 5, 7, 'ne'),
(29, 'Industrijska praksa', 'SIT029', 'Program nije unesen', 2, 5, 7, 'ne'),
(30, 'Arhitektura poslužiteljskih računala', 'SIT030', 'Program nije unesen', 5, 5, 7, 'da'),
(31, 'Sigurnost računala i podataka', 'SIT031', 'Program nije unesen', 5, 5, 7, 'da'),
(32, 'Programski alati na UNIX računalima', 'SIT032', 'Program nije unesen', 5, 5, 7, 'da'),
(33, 'Napredno Windows programiranje', 'SIT033', 'Program nije unesen', 5, 5, 7, 'da'),
(34, 'Objektno orijentirano modeliranje', 'SIT034', 'Program nije unesen', 5, 5, 7, 'da'),
(35, 'Programiranje u Javi', 'SIT035', 'Program nije unesen', 5, 5, 7, 'da'),
(36, 'Programiranje na Internetu', 'SIT036', 'Program nije unesen', 5, 5, 7, 'da'),
(37, 'Elektroničko poslovanje', 'SIT037', 'Program nije unesen', 5, 5, 7, 'da'),
(38, 'Diskretna matematika', 'SIT038', 'Program nije unesen', 6, 6, 8, 'ne'),
(39, 'Upravljanje poslužiteljskim računalima', 'SIT039', 'Program nije unesen', 5, 6, 8, 'da'),
(40, 'Programiranje u C#', 'SIT040', 'Program nije unesen', 5, 6, 8, 'da'),
(41, 'Društveni informacijski sustavi', 'SIT041', 'Program nije unesen', 5, 6, 8, 'da'),
(42, 'Oblikovanje Web stranica', 'SIT042', 'Program nije unesen', 5, 6, 8, 'da'),
(43, 'Vođenje projekata i dokumentacija', 'SIT043', 'Program nije unesen', 5, 6, 8, 'da'),
(44, 'Informatizacija proizvodnje', 'SIT044', 'Program nije unesen', 5, 6, 8, 'da'),
(45, 'Analiza i obrada podataka', 'SIT045', 'Program nije unesen', 5, 6, 8, 'da'),
(46, 'Njemački jezik', 'SSZP40', 'Program nije unesen', 4, 6, 8, 'da'),
(47, 'Talijanski jezik', 'SSZP50', 'Program nije unesen', 4, 6, 8, 'da'),
(48, 'Završni rad', 'SIT046', 'Program nije unesen', 8, 6, 8, 'ne');

-- --------------------------------------------------------

--
-- Table structure for table `mentorski_upisi`
--

CREATE TABLE `mentorski_upisi` (
  `id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `predmet_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `korisnici_korisnici`
--
ALTER TABLE `korisnici_korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `korisnici_korisnici_groups`
--
ALTER TABLE `korisnici_korisnici_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnici_korisnici_groups_korisnici_id_group_id_1093cd4c_uniq` (`korisnici_id`,`group_id`),
  ADD KEY `korisnici_korisnici_groups_group_id_12f1e7af_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `korisnici_korisnici_user_permissions`
--
ALTER TABLE `korisnici_korisnici_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnici_korisnici_user_korisnici_id_permission__6bcba702_uniq` (`korisnici_id`,`permission_id`),
  ADD KEY `korisnici_korisnici__permission_id_66d3adc4_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `mentorski_predmeti`
--
ALTER TABLE `mentorski_predmeti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kod` (`kod`);

--
-- Indexes for table `mentorski_upisi`
--
ALTER TABLE `mentorski_upisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentorski_upisi_predmet_id_5882894e_fk_mentorski_predmeti_id` (`predmet_id`),
  ADD KEY `mentorski_upisi_student_id_3dba873f_fk_korisnici_korisnici_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `korisnici_korisnici`
--
ALTER TABLE `korisnici_korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `korisnici_korisnici_groups`
--
ALTER TABLE `korisnici_korisnici_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnici_korisnici_user_permissions`
--
ALTER TABLE `korisnici_korisnici_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mentorski_predmeti`
--
ALTER TABLE `mentorski_predmeti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mentorski_upisi`
--
ALTER TABLE `mentorski_upisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `korisnici_korisnici_groups`
--
ALTER TABLE `korisnici_korisnici_groups`
  ADD CONSTRAINT `korisnici_korisnici__korisnici_id_0e54fb41_fk_korisnici` FOREIGN KEY (`korisnici_id`) REFERENCES `korisnici_korisnici` (`id`),
  ADD CONSTRAINT `korisnici_korisnici_groups_group_id_12f1e7af_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `korisnici_korisnici_user_permissions`
--
ALTER TABLE `korisnici_korisnici_user_permissions`
  ADD CONSTRAINT `korisnici_korisnici__korisnici_id_35e60d23_fk_korisnici` FOREIGN KEY (`korisnici_id`) REFERENCES `korisnici_korisnici` (`id`),
  ADD CONSTRAINT `korisnici_korisnici__permission_id_66d3adc4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `mentorski_upisi`
--
ALTER TABLE `mentorski_upisi`
  ADD CONSTRAINT `mentorski_upisi_predmet_id_5882894e_fk_mentorski_predmeti_id` FOREIGN KEY (`predmet_id`) REFERENCES `mentorski_predmeti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mentorski_upisi_student_id_3dba873f_fk_korisnici_korisnici_id` FOREIGN KEY (`student_id`) REFERENCES `korisnici_korisnici` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
