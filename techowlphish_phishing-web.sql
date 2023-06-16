-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2023 at 12:19 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techowlphish_phishing-web`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_access_ctrl`
--

CREATE TABLE `tb_access_ctrl` (
  `tk_id` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `ctrl_ids` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_config`
--

CREATE TABLE `tb_core_mailcamp_config` (
  `mconfig_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mconfig_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mconfig_data` mediumtext COLLATE utf8mb4_general_ci,
  `date` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_core_mailcamp_config`
--

INSERT INTO `tb_core_mailcamp_config` (`mconfig_id`, `mconfig_name`, `mconfig_data`, `date`) VALUES
('default', 'Default Configuration', '{\"mail_sign\":{\"cert\":[],\"pvk\":[]},\"mail_enc\":{\"cert\":[]},\"peer_verification\":true,\"recipient_type\":\"to\",\"signed_mail\":false,\"encrypted_mail\":false,\"antiflood\":{\"limit\":\"50\",\"pause\":\"30\"},\"msg_priority\":\"3\"}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_list`
--

CREATE TABLE `tb_core_mailcamp_list` (
  `campaign_id` varchar(50) NOT NULL,
  `userid` bigint NOT NULL,
  `campaign_name` varchar(50) NOT NULL,
  `campaign_data` varchar(1111) NOT NULL,
  `date` varchar(111) NOT NULL,
  `scheduled_time` varchar(111) NOT NULL,
  `scheduled_date` varchar(255) DEFAULT NULL,
  `stop_time` varchar(111) DEFAULT NULL,
  `camp_status` int NOT NULL DEFAULT '0',
  `employees` varchar(255) DEFAULT NULL,
  `camp_lock` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_list`
--

INSERT INTO `tb_core_mailcamp_list` (`campaign_id`, `userid`, `campaign_name`, `campaign_data`, `date`, `scheduled_time`, `scheduled_date`, `stop_time`, `camp_status`, `employees`, `camp_lock`) VALUES
('1z0z6c', 2, 'landing page canpagin', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 06:12 AM', '13-06-2023 05:30 AM', '13-06-2023 05:30 AM - 14-06-2023 01:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('2pkvhc', 2, 'gmaildefault', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '08-06-2023 04:31 AM', '08-06-2023 04:30 AM', '08-06-2023 04:30 AM - 09-06-2023 12:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('5q43ov', 3, 'a', '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '16-06-2023 06:01 AM', '16-06-2023 05:30 AM', '16-06-2023 05:30 AM - 17-06-2023 01:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retr', 1),
('6hfs3q', 2, 'abca', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '14-06-2023 07:17 AM', '14-06-2023 06:30 AM', '14-06-2023 06:30 AM - 15-06-2023 02:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('6ndxe2', 3, 'g', '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '15-06-2023 11:20 AM', '15-06-2023 10:30 AM', '15-06-2023 10:30 AM - 16-06-2023 06:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retr', 1),
('9bdr6g', 2, 'sdjfdsf', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 06:32 AM', '13-06-2023 06:30 AM', '13-06-2023 06:30 AM - 14-06-2023 02:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('b3uqfz', 2, 'abg', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 06:37 AM', '13-06-2023 06:30 AM', '13-06-2023 06:30 AM - 14-06-2023 02:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('ekkhgq', 2, 'demo', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '15-06-2023 06:04 AM', '15-06-2023 05:30 AM', '15-06-2023 05:30 AM - 16-06-2023 01:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('fph58k', 2, 'logintrack', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '14-06-2023 07:02 AM', '14-06-2023 06:30 AM', '14-06-2023 06:30 AM - 15-06-2023 02:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('l2ierg', 2, 'mailtrack', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '12-06-2023 06:43 AM', '12-06-2023 06:30 AM', '12-06-2023 06:30 AM - 13-06-2023 02:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', 1),
('o86vqh', 2, 'Lacy Patterson', '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"1037-1037\",\"msg_fail_retry\":\"8\"}', '13-06-2023 04:30 AM', '13-06-2023 03:30 AM', '13-06-2023 03:30 AM - 14-06-2023 12:30 PM', NULL, 2, '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"1037-1037\",\"msg_fail_re', 1),
('o8hqz9', 3, 'Farrah Talley', '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"um15xi\",\"name\":\"Track me\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0691-1475\",\"msg_fail_retry\":\"9\"}', '15-06-2023 11:16 AM', '15-06-2023 11:30 AM', '15-06-2023 11:30 AM - 16-06-2023 06:30 PM', NULL, 2, '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"um15xi\",\"name\":\"Track me\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0691-1475\",\"msg_fail_ret', 1),
('rwb6v6', 2, 'mailuser', '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '12-06-2023 12:37 PM', '12-06-2023 12:30 PM', '12-06-2023 12:30 PM - 13-06-2023 08:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"zadz2y\",\"name\":\"abhishek\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_re', 1),
('ssxjzg', 2, 'newcanp', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 07:57 AM', '13-06-2023 07:30 AM', '13-06-2023 07:30 AM - 14-06-2023 03:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('t0w4n3', 3, 'Cheyenne Castaneda', '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"um15xi\",\"name\":\"Track me\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0225-0225\",\"msg_fail_retry\":\"1\"}', '15-06-2023 11:17 AM', '05-06-2023 05:30 PM', '05-06-2023 05:30 PM - 05-06-2023 06:30 PM', NULL, 2, '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"um15xi\",\"name\":\"Track me\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0225-0225\",\"msg_fail_retry\":\"1\"}', 1),
('te8vuo', 2, 'jsadhashd', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 07:31 AM', '13-06-2023 07:30 AM', '13-06-2023 07:30 AM - 14-06-2023 03:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('ukjn9e', 3, 'mycamp', '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '15-06-2023 11:15 AM', '15-06-2023 10:30 AM', '15-06-2023 10:30 AM - 16-06-2023 06:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"l81jt1\",\"name\":\"mygoup\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retr', 1),
('wxapgl', 2, 'demologin', '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '15-06-2023 04:55 AM', '15-06-2023 04:30 AM', '15-06-2023 04:30 AM - 16-06-2023 12:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz\",\"name\":\"gmail\"},\"mail_template\":{\"id\":\"jvm0qf\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry', 1),
('yznxir', 2, 'pdf track', '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '13-06-2023 05:30 AM', '13-06-2023 04:30 AM', '13-06-2023 04:30 AM - 14-06-2023 12:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"bz6hvz,ctvhyv\",\"name\":\"gmail,test\"},\"mail_template\":{\"id\":\"kaehjg\",\"name\":\"My Bank\"},\"mail_sender\":{\"id\":\"kj6xmf\",\"name\":\"default (DEFAULT)\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"ms', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_sender_list`
--

CREATE TABLE `tb_core_mailcamp_sender_list` (
  `sender_list_id` varchar(111) NOT NULL,
  `userid` bigint NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_smtp_server` varchar(50) NOT NULL,
  `sender_from` varchar(111) NOT NULL,
  `sender_acc_username` varchar(111) NOT NULL,
  `sender_acc_pwd` varchar(50) NOT NULL,
  `auto_mailbox` tinyint(1) DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `sender_mailbox` varchar(1111) DEFAULT NULL,
  `cust_headers` varchar(1111) DEFAULT NULL,
  `dsn_type` varchar(111) DEFAULT NULL,
  `date` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_sender_list`
--

INSERT INTO `tb_core_mailcamp_sender_list` (`sender_list_id`, `userid`, `sender_name`, `sender_smtp_server`, `sender_from`, `sender_acc_username`, `sender_acc_pwd`, `auto_mailbox`, `status`, `sender_mailbox`, `cust_headers`, `dsn_type`, `date`) VALUES
('kj6xmf', 1, 'default', 'smtp.mailgun.org:587', 'mamta01.img@gmail.com', 'no-reply@dreamprize11.com', 'ecf970b62fc7205f6e13f38fb5d232da-70c38fed-3b21dad1', 0, 1, '{smtp.mailgun.org:993/imap/ssl}INBOX', '[]', 'custome', '02-06-2023 04:31 AM'),
('zadz2f', 2, 'mamta', 'smtp.sendgrid.net:587', 'mamta01.img@gmail.com', 'apikey', 'SG.RdBFyuBGR22Fv-jC449lYA.dkf2y_r8AeXS0Eh8qCyp4ih9', 0, 1, '{smtp.sendgrid.net:993/imap/ssl}INBOX', '[]', 'custom', '02-06-2023 04:32 AM'),
('zadz2y', 2, 'abhishek', 'smtp.gmail.com:587', 'mamta01.img@gmail.com', 'abhishek@techowl.in', 'Ilovegirtiger@5831', 0, 0, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '02-06-2023 04:32 AM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_template_list`
--

CREATE TABLE `tb_core_mailcamp_template_list` (
  `mail_template_id` varchar(111) NOT NULL,
  `userid` bigint NOT NULL,
  `mail_template_name` varchar(111) DEFAULT NULL,
  `mail_template_subject` varchar(1111) DEFAULT NULL,
  `mail_template_content` mediumtext,
  `timage_type` tinyint(1) NOT NULL DEFAULT '0',
  `mail_content_type` varchar(111) DEFAULT '{}',
  `attachment` varchar(1111) DEFAULT NULL,
  `date` varchar(111) NOT NULL,
  `domain` int DEFAULT NULL,
  `landing_page` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_template_list`
--

INSERT INTO `tb_core_mailcamp_template_list` (`mail_template_id`, `userid`, `mail_template_name`, `mail_template_subject`, `mail_template_content`, `timage_type`, `mail_content_type`, `attachment`, `date`, `domain`, `landing_page`) VALUES
('jvm0qf', 2, 'My Bank', 'Important! Your consent is required', '<br><div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td><br></td></tr></tbody></table></div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody><tr><td bgcolor=\"#dcddde\" style=\"line-height:0px;background-color:#dcddde; border-left:1px solid #dcddde;\" valign=\"top\"><div><a data-original-title=\"Mark as smart link\" href=\"https://myphishingsite.com/page?rid={{RID}}\" rel=\"tooltip\" target=\"_blank\"><img src=\"https://user-images.githubusercontent.com/15928266/105949193-4518f300-60a7-11eb-87a9-6bb241003d92.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"100%\" border=\"0\"></a></div></td></tr><tr><td style=\"border-bottom:1px solid #cccccc;border-left:1px solid #cccccc;border-right:1px solid #cccccc;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td align=\"center\" valign=\"top\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td width=\"4%\"><br></td><td valign=\"top\" width=\"92%\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\" valign=\"top\"><div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100% !important;\" width=\"100%\"><tbody><tr><td height=\"20\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">Dear {{NAME}},</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">We value our association with you and look forward to enhancing this relationship at every step.</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">We are delighted to inform you that you are a part of Platinum Banking Programme and to continue enjoying programme benefits, kindly provide your consent.</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">Here are few privileges of the programme, exclusively for you.</td></tr><tr><td style=\"text-align:center;\" valign=\"top\"><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949203-46e2b680-60a7-11eb-9a7f-c7a078cc4ca6.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"48\" height=\"48\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"75\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">Personalized attention from a dedicated Platinum Relationship Manager</td></tr></tbody></table></td></tr></tbody></table></div><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949204-46e2b680-60a7-11eb-8b0a-b175a65b5018.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"56\" height=\"52\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"110\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">ZERO cost on locker<br>rental</td></tr></tbody></table></td></tr></tbody></table></div><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949205-477b4d00-60a7-11eb-9d32-41427f2c1601.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"53\" height=\"45\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"110\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">Special relationship rates for Loans and Forex transactions</td></tr></tbody></table></td></tr></tbody></table></div></td></tr><tr><td align=\"center\" valign=\"top\"><table align=\"center\" bgcolor=\"#0d4c8b\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:230px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\" width=\"230\"><tbody><tr><td align=\"center\" style=\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\" valign=\"middle\"><a data-original-title=\"Mark as smart link\" href=\"https://cisco-webex.co.in/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" rel=\"tooltip\" style=\"text-decoration:none; color:#fff; font-weight:500;\" target=\"_blank\">Platinum Banking Benefits</a></td></tr></tbody></table></td></tr><tr><td height=\"20\"><br></td></tr><tr><td align=\"center\" valign=\"top\"><table align=\"center\" bgcolor=\"#0d4c8b\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:200px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\" width=\"200\"><tbody><tr><td align=\"center\" style=\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\" valign=\"middle\"><a data-original-title=\"Mark as smart link\" href=\"https://cisco-webex.co.in/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" rel=\"tooltip\" style=\"text-decoration:none; color:#fff; font-weight:500;\" target=\"_blank\">Yes, I want to Continue</a></td></tr></tbody></table></td></tr><tr><td height=\"15\"><br></td></tr><tr><td height=\"20\"><br></td></tr></tbody></table></div></td></tr><tr><td height=\"30\"><br></td></tr><tr><td align=\"left\" style=\"font-family:Arial; font-size:16px; letter-spacing: 1px; line-height:28px; color:#000000;\" valign=\"top\">Warm regards,<br><br><div><span style=\"font-weight: bold !important;\">Aaron Murakami</span><br>Programme Manager<br>Platinum Premium Banking</div></td></tr><tr><td height=\"15\"><br></td></tr></tbody></table></td><td width=\"4%\"><br></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align=\"left\" style=\"font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:16px; padding:10px 5px 5px 18px; color:#201d1e; text-align:left;\" valign=\"top\">*Terms &amp; Conditions apply | <a data-original-title=\"Mark as smart link\" href=\"https://myphishingsite.com/unsubscribe\" rel=\"tooltip\" style=\"text-decoration:underline; color:#0000ff;\" target=\"_blank\">Unsubscribe</a></td></tr><tr><td style=\"font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; padding:10px 0 5px 18px; color:#000000;\">*Based on Retail Loan book size (excluding mortgages). Source: Annual Reports as on 31<sup>st</sup> March 2018 and No.1 on market capitalisation based on BSE data as on 22<sup>nd</sup> May, 2018.</td></tr></tbody></table><div><br></div><br>{{TRACKER}}', 1, 'text/html', '[]', '15-06-2023 04:55 AM', 2, 'efe1fk'),
('p3v2v6', 1, 'My Bank', 'Important! Your consent is required', '<br><div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td><br></td></tr></tbody></table></div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody><tr><td bgcolor=\"#dcddde\" style=\"line-height:0px;background-color:#dcddde; border-left:1px solid #dcddde;\" valign=\"top\"><div><a data-original-title=\"Mark as smart link\" href=\"https://myphishingsite.com/page?rid={{RID}}\" rel=\"tooltip\" target=\"_blank\"><img src=\"https://user-images.githubusercontent.com/15928266/105949193-4518f300-60a7-11eb-87a9-6bb241003d92.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"100%\" border=\"0\"></a></div></td></tr><tr><td style=\"border-bottom:1px solid #cccccc;border-left:1px solid #cccccc;border-right:1px solid #cccccc;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td align=\"center\" valign=\"top\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td width=\"4%\"><br></td><td valign=\"top\" width=\"92%\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\" valign=\"top\"><div><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100% !important;\" width=\"100%\"><tbody><tr><td height=\"20\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">Dear {{NAME}},</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">We value our association with you and look forward to enhancing this relationship at every step.</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">We are delighted to inform you that you are a part of Platinum Banking Programme and to continue enjoying programme benefits, kindly provide your consent.</td></tr><tr><td height=\"10\"><br></td></tr><tr><td style=\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\">Here are few privileges of the programme, exclusively for you.</td></tr><tr><td style=\"text-align:center;\" valign=\"top\"><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949203-46e2b680-60a7-11eb-9a7f-c7a078cc4ca6.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"48\" height=\"48\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"75\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">Personalized attention from a dedicated Platinum Relationship Manager</td></tr></tbody></table></td></tr></tbody></table></div><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949204-46e2b680-60a7-11eb-8b0a-b175a65b5018.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"56\" height=\"52\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"110\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">ZERO cost on locker<br>rental</td></tr></tbody></table></td></tr></tbody></table></div><div align=\"center\" style=\"width:180px; display:inline-block; vertical-align:top;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse!important;width:100%!important;\" width=\"100%\"><tbody><tr><td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td height=\"5\"><br></td></tr><tr><td align=\"center\" height=\"87\" style=\"vertical-align:middle !important;\" valign=\"middle\"><img src=\"https://user-images.githubusercontent.com/15928266/105949205-477b4d00-60a7-11eb-9d32-41427f2c1601.jpg\" alt=\"\" class=\"fr-fic fr-dii\" width=\"53\" height=\"45\" border=\"0\"></td></tr><tr><td align=\"center\" height=\"110\" style=\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\" valign=\"top\">Special relationship rates for Loans and Forex transactions</td></tr></tbody></table></td></tr></tbody></table></div></td></tr><tr><td align=\"center\" valign=\"top\"><table align=\"center\" bgcolor=\"#0d4c8b\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:230px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\" width=\"230\"><tbody><tr><td align=\"center\" style=\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\" valign=\"middle\"><a data-original-title=\"Mark as smart link\" href=\"https://cisco-webex.co.in/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" rel=\"tooltip\" style=\"text-decoration:none; color:#fff; font-weight:500;\" target=\"_blank\">Platinum Banking Benefits</a></td></tr></tbody></table></td></tr><tr><td height=\"20\"><br></td></tr><tr><td align=\"center\" valign=\"top\"><table align=\"center\" bgcolor=\"#0d4c8b\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:200px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\" width=\"200\"><tbody><tr><td align=\"center\" style=\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\" valign=\"middle\"><a data-original-title=\"Mark as smart link\" href=\"https://cisco-webex.co.in/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" rel=\"tooltip\" style=\"text-decoration:none; color:#fff; font-weight:500;\" target=\"_blank\">Yes, I want to Continue</a></td></tr></tbody></table></td></tr><tr><td height=\"15\"><br></td></tr><tr><td height=\"20\"><br></td></tr></tbody></table></div></td></tr><tr><td height=\"30\"><br></td></tr><tr><td align=\"left\" style=\"font-family:Arial; font-size:16px; letter-spacing: 1px; line-height:28px; color:#000000;\" valign=\"top\">Warm regards,<br><br><div><span style=\"font-weight: bold !important;\">Aaron Murakami</span><br>Programme Manager<br>Platinum Premium Banking</div></td></tr><tr><td height=\"15\"><br></td></tr></tbody></table></td><td width=\"4%\"><br></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align=\"left\" style=\"font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:16px; padding:10px 5px 5px 18px; color:#201d1e; text-align:left;\" valign=\"top\">*Terms &amp; Conditions apply | <a data-original-title=\"Mark as smart link\" href=\"https://myphishingsite.com/unsubscribe\" rel=\"tooltip\" style=\"text-decoration:underline; color:#0000ff;\" target=\"_blank\">Unsubscribe</a></td></tr><tr><td style=\"font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; padding:10px 0 5px 18px; color:#000000;\">*Based on Retail Loan book size (excluding mortgages). Source: Annual Reports as on 31<sup>st</sup> March 2018 and No.1 on market capitalisation based on BSE data as on 22<sup>nd</sup> May, 2018.</td></tr></tbody></table><div><br></div><br>{{TRACKER}}', 1, 'text/html', '[]', '15-06-2023 06:04 AM', 1, 'efe1fk'),
('um15xi', 1, 'Track me', 'Thanks!', 'Hi {{FNAME}},<br><br>Thank you for your email. We will meet soon.<br><br>Thanks &amp; Regards<br>Rose<br><br>\n<button type=\"button\" class=\"btn btn-success\" data-original-title=\"Mark as smart link\" href=\"https://cisco-webex.co.in/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" rel=\"tooltip\" style=\"text-decoration:none; color:#fff; font-weight:500;\" target=\"_blank\">Yes, I want to Continue</button>\n{{TRACKER}}', 1, 'text/html', '[]', '15-06-2023 05:15 AM', 2, 'efe1fk');

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_user_group`
--

CREATE TABLE `tb_core_mailcamp_user_group` (
  `user_group_id` varchar(111) NOT NULL,
  `userid` bigint NOT NULL,
  `user_group_name` varchar(50) NOT NULL,
  `user_data` mediumtext,
  `date` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_user_group`
--

INSERT INTO `tb_core_mailcamp_user_group` (`user_group_id`, `userid`, `user_group_name`, `user_data`, `date`) VALUES
('bz6hvz', 2, 'gmail', '[{\"uid\":\"6qzobifte0\",\"fname\":\"mamta\",\"lname\":\"suthar\",\"email\":\"sutharmamta630@gmail.com\",\"company\":\"ad\",\"job\":\"php\"}]', '06-06-2023 05:12 AM'),
('ctvhyv', 2, 'test', '[{\"uid\":\"zaf7ci1wqm\",\"fname\":\"ds\",\"lname\":\"asd\",\"email\":\"mamtatech@yopmail.com\",\"company\":\"sad\",\"job\":\"asd\"},{\"uid\":\"5cz90oe2t8\",\"fname\":\"jgj\",\"lname\":\"jhg\",\"email\":\"jdhdc@yopmail.com\",\"company\":\"asd\",\"job\":\"sds\"}]', '01-06-2023 06:15 AM'),
('l81jt1', 3, 'mygoup', '[{\"uid\":\"46cjvsfbz5\",\"fname\":\"joe\",\"lname\":\"domn\",\"email\":\"sutharmamta630@gmail.com\",\"company\":\"img\",\"job\":\"php\"}]', '15-06-2023 11:14 AM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_quick_tracker_list`
--

CREATE TABLE `tb_core_quick_tracker_list` (
  `tracker_id` varchar(11) NOT NULL,
  `tracker_name` varchar(111) NOT NULL,
  `date` varchar(111) NOT NULL,
  `start_time` varchar(111) DEFAULT NULL,
  `stop_time` varchar(111) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_web_tracker_list`
--

CREATE TABLE `tb_core_web_tracker_list` (
  `tracker_id` varchar(111) NOT NULL,
  `tracker_name` varchar(111) NOT NULL,
  `content_html` varchar(1111) DEFAULT NULL,
  `content_js` varchar(11111) DEFAULT NULL,
  `tracker_step_data` mediumtext,
  `date` varchar(111) DEFAULT NULL,
  `start_time` varchar(111) DEFAULT NULL,
  `stop_time` varchar(111) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_mailcamp_live`
--

CREATE TABLE `tb_data_mailcamp_live` (
  `rid` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `campaign_id` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sending_status` tinyint NOT NULL DEFAULT '0',
  `send_time` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_email` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_error` varchar(1111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_open_times` mediumtext COLLATE utf8mb4_general_ci,
  `mail_replies` int DEFAULT NULL,
  `payloads_clicked` mediumtext COLLATE utf8mb4_general_ci,
  `employees_compromised` mediumtext COLLATE utf8mb4_general_ci,
  `emails_reported` mediumtext COLLATE utf8mb4_general_ci,
  `public_ip` mediumtext COLLATE utf8mb4_general_ci,
  `ip_info` mediumtext COLLATE utf8mb4_general_ci,
  `user_agent` mediumtext COLLATE utf8mb4_general_ci,
  `mail_client` mediumtext COLLATE utf8mb4_general_ci,
  `platform` mediumtext COLLATE utf8mb4_general_ci,
  `device_type` mediumtext COLLATE utf8mb4_general_ci,
  `all_headers` mediumtext COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_data_mailcamp_live`
--

INSERT INTO `tb_data_mailcamp_live` (`rid`, `campaign_id`, `campaign_name`, `sending_status`, `send_time`, `user_name`, `user_email`, `send_error`, `mail_open_times`, `mail_replies`, `payloads_clicked`, `employees_compromised`, `emails_reported`, `public_ip`, `ip_info`, `user_agent`, `mail_client`, `platform`, `device_type`, `all_headers`) VALUES
('10t26hd8zq', 'te8vuo', 'jsadhashd', 2, '1686641508936', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686641520551,1686662509354]', NULL, '[[1686641520551,1686662509354]]', '[null,1686642150469,1686642163051]', NULL, '[\"66.249.84.137\",\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('1zjgmsk4lr', 'yznxir', 'pdf track', 2, '1686634214035', 'ds asd', 'mamtatech@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3oepmi5r6u', '9bdr6g', 'sdjfdsf', 2, '1686637927937', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686637939634,1686641451653]', NULL, '[[1686637939634,1686641451653]]', NULL, NULL, '[\"66.249.84.138\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('3tvskfw5o0', 'ssxjzg', 'newcanp', 2, '1686643073483', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686643088421,1686661441177,1686662507096,1686662509216]', NULL, '[[1686643088421,1686661441177,1686662507096,1686662509216]]', '[1686643113343,1686662528267]', NULL, '[\"66.249.84.136\",\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.136\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\"]'),
('4q9z1i3xlm', '6hfs3q', 'abca', 2, '1686727021762', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686727031711]', NULL, '[1686727031711]', NULL, NULL, '[\"66.249.84.136\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\"]', '[\"Windows XP\"]', '[\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\"]'),
('4qv6reyj10', 'yznxir', 'pdf track', 2, '1686634219859', 'jgj jhg', 'jdhdc@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('57fwo4ge2u', 'yznxir', 'pdf track', 2, '1686634207980', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686634240300]', NULL, '[1686634240300]', NULL, NULL, '[\"66.249.84.136\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\"]', '[\"Windows XP\"]', '[\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\"]'),
('64pc8yd2za', 'fph58k', 'logintrack', 2, '1686726170476', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686726199266]', NULL, '[1686726199266]', NULL, NULL, '[\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\"]', '[\"Windows XP\"]', '[\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('6l3sm2vfzx', 'b3uqfz', 'abg', 2, '1686638272287', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686641449350,1686641451269]', NULL, '[[1686641449350,1686641451269]]', NULL, NULL, '[\"66.249.84.136\",\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('6z5jp0fia2', '1z0z6c', 'landing page canpagin', 2, '1686636771812', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686636782885,1686636789346,1686637909833]', NULL, '[[1686636782885,1686636789346,1686637909833]]', NULL, NULL, '[\"66.249.84.137\",\"66.249.84.138\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('ak15c420d3', 'o8hqz9', 'Farrah Talley', 2, '1686828600010', 'joe domn', 'sutharmamta630@gmail.com', NULL, '[1686834103852]', NULL, '[1686834103852]', NULL, NULL, '[\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\"]', '[\"Windows XP\"]', '[\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('b1o06f7hrg', 'ekkhgq', 'demo', 2, '1686809075761', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686809170272,1686811005336,1686813228448,1686813246540]', NULL, '[[1686809170272,1686811005336,1686813228448,1686813246540]]', '[1686809139320,1686809193482,1686810275126,1686810315450]', NULL, '[\"66.249.84.136\",\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('cixg8nbpqr', '6ndxe2', 'g', 2, '1686828029023', 'joe domn', 'sutharmamta630@gmail.com', NULL, '[1686828050294,1686828070979]', NULL, '[[1686828050294,1686828070979]]', '[1686828086502]', NULL, '[\"66.249.84.138\",\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]'),
('if9bawl2y3', 'o86vqh', 'Lacy Patterson', 2, '1686630629663', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686634214916,1686634222197,1686634238053]', 0, '[[1686634214916,1686634222197,1686634238053]]', NULL, NULL, '[\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.136\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\"]'),
('jrewk7cqzg', '2pkvhc', 'gmaildefault', 2, '1686198660525', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686202373998,1686202417689,1686202576703,1686202598884,1686202628340,1686202776051,1686202828428,1686202889966,1686205593882,1686286309007,1686289285087,1686289294440]', NULL, '[[1686202373998,1686202417689,1686202576703,1686202598884,1686202628340,1686202776051,1686202828428,1686202889966,1686205593882,1686286309007,1686289285087,1686289294440]]', NULL, NULL, '[\"66.249.84.151\",\"66.249.84.149\",\"66.249.84.151\",\"66.249.84.149\",\"66.249.84.149\",\"66.249.84.149\",\"66.249.84.147\",\"66.249.84.151\",\"66.249.84.149\",\"66.249.84.138\",\"66.249.84.136\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\",\"Gmail\",\"Gmail\",\"Firefox\",\"Gmail\",\"Gmail\",false,{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"}]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.151\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.151\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.149\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.149\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.151\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.151\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.149\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.149\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.149\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.149\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.149\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.149\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.147\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.147\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.151\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.151\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.149\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.149\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('jz97n5pyhi', 'ukjn9e', 'mycamp', 2, '1686827704866', 'joe domn', 'sutharmamta630@gmail.com', NULL, '[1686827719821,1686827737255]', NULL, '[[1686827719821,1686827737255]]', NULL, NULL, '[\"66.249.84.138\",\"66.249.84.137\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\"]');
INSERT INTO `tb_data_mailcamp_live` (`rid`, `campaign_id`, `campaign_name`, `sending_status`, `send_time`, `user_name`, `user_email`, `send_error`, `mail_open_times`, `mail_replies`, `payloads_clicked`, `employees_compromised`, `emails_reported`, `public_ip`, `ip_info`, `user_agent`, `mail_client`, `platform`, `device_type`, `all_headers`) VALUES
('lda35xwg0r', 'l2ierg', 'mailtrack', 2, '1686552198471', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686552266951,1686552268939,1686552283697,1686552291090,1686552293368,1686552304396,1686552384366,1686552411149,1686552486991,1686552489102,1686552493938,1686552987750,1686553953119,1686553965973,1686554046160,1686554261838,1686554299905,1686554693052,1686554699064,1686554701216,1686558112157,1686558185874,1686563146359,1686568848571,1686627641292,1686632615571,1686632827734]', 1, '[[1686552266951,1686552268939,1686552283697,1686552291090,1686552293368,1686552304396,1686552384366,1686552411149,1686552486991,1686552489102,1686552493938,1686552987750,1686553953119,1686553965973,1686554046160,1686554261838,1686554299905,1686554693052,1686554699064,1686554701216,1686558112157,1686558185874,1686563146359,1686568848571,1686627641292,1686632615571,1686632827734]]', NULL, NULL, '[\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.138\",\"66.249.84.138\",\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.138\",\"66.249.84.136\",\"66.249.84.136\",\"66.249.84.137\",\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.136\",\"66.249.84.136\",\"66.249.84.137\",\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.138\",\"66.249.84.138\",\"66.249.84.136\",\"66.249.84.137\",\"66.249.84.136\",\"66.249.84.136\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('ukjm9wtg2x', 't0w4n3', 'Cheyenne Castaneda', 2, '1686827836085', 'joe domn', 'sutharmamta630@gmail.com', NULL, '[1686827849181,1686827851426,1686827862160]', NULL, '[[1686827849181,1686827851426,1686827862160]]', '[1686827890925]', NULL, '[\"66.249.84.138\",\"66.249.84.138\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('uzlonhrdpc', 'rwb6v6', 'mailuser', 2, '1686573442871', 'jgj jhg', 'jdhdc@yopmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('xg5bw8s2k6', 'rwb6v6', 'mailuser', 2, '1686573439564', 'ds asd', 'mamtatech@yopmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('yuka823gmt', '5q43ov', 'a', 2, '1686895294965', 'joe domn', 'sutharmamta630@gmail.com', NULL, '[1686895328698,1686895349897,1686895420333]', NULL, '[[1686895328698,1686895349897,1686895420333]]', NULL, NULL, '[\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]'),
('zak0gswot5', 'wxapgl', 'demologin', 2, '1686804943855', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686804968385,1686809051738,1686809053108]', NULL, '[[1686804968385,1686809051738,1686809053108]]', '[1686804987739]', NULL, '[\"66.249.84.136\",\"66.249.84.138\",\"66.249.84.138\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[\"Gmail\",\"Gmail\",\"Gmail\"]', '[\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\"]');
INSERT INTO `tb_data_mailcamp_live` (`rid`, `campaign_id`, `campaign_name`, `sending_status`, `send_time`, `user_name`, `user_email`, `send_error`, `mail_open_times`, `mail_replies`, `payloads_clicked`, `employees_compromised`, `emails_reported`, `public_ip`, `ip_info`, `user_agent`, `mail_client`, `platform`, `device_type`, `all_headers`) VALUES
('ztw61vkhmq', 'rwb6v6', 'mailuser', 2, '1686573435781', 'mamta suthar', 'sutharmamta630@gmail.com', NULL, '[1686573475252,1686573511157,1686573518736,1686573520666,1686573523342,1686573524883,1686573536084,1686573648620,1686573911449,1686573915540,1686578915696]', 1, '[[1686573475252,1686573511157,1686573518736,1686573520666,1686573523342,1686573524883,1686573536084,1686573648620,1686573911449,1686573915540,1686578915696]]', NULL, NULL, '[\"66.249.84.136\",\"157.50.47.87\",\"49.44.84.231\",\"66.249.84.137\",\"66.249.84.137\",\"66.249.84.136\",\"66.249.84.136\",\"157.50.47.87\",\"66.249.84.138\",\"66.249.84.136\",\"66.249.84.136\"]', '{\"country\":\"United States\",\"city\":\"Mountain View\",\"zip\":\"94041\",\"isp\":\"GOOGLE\",\"timezone\":\"America\\/Los_Angeles (-0700)\",\"coordinates\":\"37.3897(lat)\\/-122.0832(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36\",\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/113.0.0.0 Safari\\/537.36\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\",\"Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\"]', '[{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"},{\"\\/msie|trident\\/i\":\"Internet Explorer\",\"\\/firefox\\/i\":\"Firefox\",\"\\/safari\\/i\":\"Safari\",\"\\/Macintosh.*AppleWebKit\\/i\":\"Apple Mail\",\"\\/chrome\\/i\":\"Chrome\",\"\\/edge\\/i\":\"Edge\",\"\\/opera\\/i\":\"Opera\",\"\\/netscape\\/i\":\"Netscape\",\"\\/maxthon\\/i\":\"Maxthon\",\"\\/konqueror\\/i\":\"Konqueror\",\"\\/mobile\\/i\":\"Handheld Browser\",\"\\/Microsoft Outlook|MSOffice\\/i\":\"Microsoft Outlook\",\"\\/GoogleImageProxy\\/i\":\"Gmail\",\"\\/Thunderbird\\/i\":\"Thunderbird\",\"\\/YahooMobile\\/i\":\"Yahoo Mobile Mail\",\"\\/Lotus-Notes\\/i\":\"IBM Lotus Notes\",\"\\/Roundcube\\/i\":\"Roundcube\",\"\\/Horde\\/i\":\"Horde\"}]', '[\"Windows XP\",\"Windows 10\",\"Windows 10\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows XP\",\"Windows 10\",\"Windows XP\",\"Windows XP\",\"Windows XP\"]', '[\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\",\"Desktop\"]', '[\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Accept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\\r\\nAccept-Language: en-US,en;q=0.9\\r\\nHost: techowlphish.com\\r\\nSec-Ch-Ua: &quot;Not.A\\/Brand&quot;;v=&quot;8&quot;, &quot;Chromium&quot;;v=&quot;114&quot;, &quot;Google Chrome&quot;;v=&quot;114&quot;\\r\\nSec-Ch-Ua-Mobile: ?0\\r\\nSec-Ch-Ua-Platform: &quot;Windows&quot;\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: cross-site\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 157.50.47.87\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 157.50.47.87\\r\\n\",\"Accept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\\r\\nAccept-Language: en-US,en;q=0.9\\r\\nHost: techowlphish.com\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: none\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/113.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 49.44.84.231\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 49.44.84.231\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.137\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.137\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Accept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\\r\\nAccept-Language: en-US,en;q=0.9\\r\\nHost: techowlphish.com\\r\\nSec-Ch-Ua: &quot;Not.A\\/Brand&quot;;v=&quot;8&quot;, &quot;Chromium&quot;;v=&quot;114&quot;, &quot;Google Chrome&quot;;v=&quot;114&quot;\\r\\nSec-Ch-Ua-Mobile: ?0\\r\\nSec-Ch-Ua-Platform: &quot;Windows&quot;\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: cross-site\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 157.50.47.87\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 157.50.47.87\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.138\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.138\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\",\"Host: techowlphish.com\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 5.1; rv:11.0) Gecko Firefox\\/11.0 (via ggpht.com GoogleImageProxy)\\r\\nX-Forwarded-For: 66.249.84.136\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 66.249.84.136\\r\\n\"]');

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_quick_tracker_live`
--

CREATE TABLE `tb_data_quick_tracker_live` (
  `id` int NOT NULL,
  `tracker_id` varchar(111) DEFAULT NULL,
  `rid` varchar(111) DEFAULT NULL,
  `public_ip` varchar(111) DEFAULT NULL,
  `ip_info` varchar(2222) DEFAULT NULL,
  `user_agent` varchar(222) DEFAULT NULL,
  `mail_client` varchar(222) DEFAULT NULL,
  `platform` varchar(222) DEFAULT NULL,
  `all_headers` varchar(2222) DEFAULT NULL,
  `time` varchar(222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_webform_submit`
--

CREATE TABLE `tb_data_webform_submit` (
  `id` int NOT NULL,
  `tracker_id` varchar(111) DEFAULT NULL,
  `rid` varchar(222) DEFAULT NULL,
  `session_id` varchar(222) DEFAULT NULL,
  `public_ip` varchar(222) DEFAULT NULL,
  `ip_info` varchar(2222) DEFAULT NULL,
  `user_agent` varchar(222) DEFAULT NULL,
  `screen_res` varchar(22) DEFAULT NULL,
  `time` varchar(222) DEFAULT NULL,
  `browser` varchar(222) DEFAULT NULL,
  `platform` varchar(222) DEFAULT NULL,
  `device_type` varchar(11) DEFAULT NULL,
  `page` int DEFAULT NULL,
  `form_field_data` varchar(22222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_webpage_visit`
--

CREATE TABLE `tb_data_webpage_visit` (
  `id` int NOT NULL,
  `tracker_id` varchar(111) DEFAULT NULL,
  `rid` varchar(222) DEFAULT NULL,
  `session_id` varchar(222) DEFAULT NULL,
  `public_ip` varchar(222) DEFAULT NULL,
  `ip_info` varchar(2222) DEFAULT NULL,
  `user_agent` varchar(222) DEFAULT NULL,
  `screen_res` varchar(22) DEFAULT NULL,
  `time` varchar(222) DEFAULT NULL,
  `browser` varchar(222) DEFAULT NULL,
  `platform` varchar(222) DEFAULT NULL,
  `device_type` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_domains`
--

CREATE TABLE `tb_domains` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_domains`
--

INSERT INTO `tb_domains` (`id`, `name`, `path`) VALUES
(1, 'rbi-gov.org', '/home/techowlphish/rbi-gov.org/'),
(2, 'google-support.co.in', '/home/techowlphish/google-support.co.in/'),
(3, 'google-support.info', '/home/techowlphish/google-support.info/'),
(4, 'npcci.com', '/home/techowlphish/npcci.com/'),
(5, 'microsoft-support.co.in', '/home/techowlphish/microsoft-support.co.in/'),
(6, 'microsoftsupport.in', '/home/techowlphish/microsoftsupport.in/'),
(7, 'zoom-support.in', '/home/techowlphish/zoom-support.in/'),
(8, 'cisco-webex.co.in', '/home/techowlphish/cisco-webex.co.in/');

-- --------------------------------------------------------

--
-- Table structure for table `tb_hf_list`
--

CREATE TABLE `tb_hf_list` (
  `hf_id` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `hf_name` varchar(111) COLLATE utf8mb4_general_ci NOT NULL,
  `file_original_name` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_header` varchar(111) COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(111) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hland_page_list`
--

CREATE TABLE `tb_hland_page_list` (
  `hlp_id` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `page_name` mediumtext COLLATE utf8mb4_general_ci,
  `page_file_name` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `domain` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_hland_page_list`
--

INSERT INTO `tb_hland_page_list` (`hlp_id`, `page_name`, `page_file_name`, `date`, `domain`) VALUES
('efe1fk', 'Google Login', 'google_login.php', '15-06-2023 04:54 AM', 2),
('ttpeqg', 'Google Login', 'google_login.php', '15-06-2023 06:03 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ht_list`
--

CREATE TABLE `tb_ht_list` (
  `ht_id` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `ht_name` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alg` varchar(1111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_extension` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_header` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE `tb_log` (
  `id` int NOT NULL,
  `username` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log` text COLLATE utf8mb4_general_ci,
  `ip` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`id`, `username`, `log`, `ip`, `date`) VALUES
(1, 'admin', 'Account login', '::1', '17-02-2023 05:28 AM'),
(2, 'admin', 'Account login', '::1', '17-02-2023 05:43 AM'),
(3, 'admin', 'Account login', '::1', '17-02-2023 05:46 AM'),
(4, 'admin', 'Account login', '::1', '17-02-2023 05:49 AM'),
(5, 'admin', 'Account login', '::1', '17-02-2023 05:51 AM'),
(6, 'admin', 'Account login', '::1', '17-02-2023 05:59 AM'),
(7, 'admin', 'Account login', '::1', '17-02-2023 06:12 AM'),
(8, 'admin', 'Account login', '::1', '17-02-2023 06:29 AM'),
(9, 'admin', 'Account login', '::1', '17-02-2023 06:56 AM'),
(10, 'admin', 'Account login', '::1', '17-02-2023 07:07 AM'),
(11, 'admin', 'Account login', '::1', '17-02-2023 09:19 AM'),
(12, 'admin', 'Account login', '::1', '17-02-2023 10:00 AM'),
(13, 'admin', 'Account login', '::1', '17-02-2023 10:28 AM'),
(14, 'admin', 'Account login', '::1', '17-02-2023 10:30 AM'),
(15, 'admin', 'Account login', '::1', '17-02-2023 10:49 AM'),
(16, 'admin', 'Account login', '::1', '17-02-2023 11:19 AM'),
(17, 'abhishek@techowl.in', 'Account login', '::1', '20-02-2023 03:33 AM'),
(18, NULL, 'Account logout', '::1', '20-02-2023 10:21 AM'),
(19, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 10:22 AM'),
(20, NULL, 'Account logout', '::1', '20-02-2023 10:28 AM'),
(21, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 10:28 AM'),
(22, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 10:29 AM'),
(23, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 10:29 AM'),
(24, NULL, 'Account logout', '::1', '20-02-2023 11:34 AM'),
(25, 'abhishek@techowl.in', 'Account login', '::1', '20-02-2023 11:34 AM'),
(26, 'abhishek@techowl.in', 'Account login', '::1', '20-02-2023 12:19 PM'),
(27, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 12:27 PM'),
(28, NULL, 'Account logout', '::1', '20-02-2023 12:40 PM'),
(29, 'admin1@gmail.com', 'Account login', '::1', '20-02-2023 12:41 PM'),
(30, NULL, 'Account logout', '::1', '21-02-2023 09:53 AM'),
(31, 'abhishek@techowl.in', 'Account login', '::1', '21-02-2023 09:55 AM'),
(32, 'abhishek@techowl.in', 'Account login', '::1', '06-03-2023 03:41 AM'),
(33, NULL, 'Account logout', '::1', '06-03-2023 04:20 AM'),
(34, 'mamta01.img@gmail.com', 'Account login', '::1', '06-03-2023 04:20 AM'),
(35, NULL, 'Account logout', '::1', '06-03-2023 04:22 AM'),
(36, 'mamta01.img@gmail.com', 'Account login', '::1', '06-03-2023 04:22 AM'),
(37, NULL, 'Account logout', '::1', '06-03-2023 04:27 AM'),
(38, 'abhishek@techowl.in', 'Account login', '::1', '06-03-2023 04:27 AM'),
(39, NULL, 'Account logout', '::1', '06-03-2023 04:51 AM'),
(40, 'mamta01.img@gmail.com', 'Account login', '::1', '06-03-2023 04:51 AM'),
(41, NULL, 'Account logout', '::1', '06-03-2023 05:06 AM'),
(42, 'mamta01.img@gmail.com', 'Account login', '::1', '06-03-2023 05:06 AM'),
(43, 'mamta01.img@gmail.com', 'Account login', '::1', '06-03-2023 05:56 AM'),
(44, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 03:46 AM'),
(45, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 11:29 AM'),
(46, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 11:30 AM'),
(47, NULL, 'Account logout', '::1', '08-03-2023 11:31 AM'),
(48, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:31 AM'),
(49, NULL, 'Account logout', '::1', '08-03-2023 11:34 AM'),
(50, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:34 AM'),
(51, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:38 AM'),
(52, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:38 AM'),
(53, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:45 AM'),
(54, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:49 AM'),
(55, NULL, 'Account logout', '::1', '08-03-2023 11:50 AM'),
(56, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:50 AM'),
(57, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:52 AM'),
(58, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 11:54 AM'),
(59, NULL, 'Account logout', '::1', '08-03-2023 12:22 PM'),
(60, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 12:22 PM'),
(61, NULL, 'Account logout', '::1', '08-03-2023 12:23 PM'),
(62, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:23 PM'),
(63, NULL, 'Account logout', '::1', '08-03-2023 12:34 PM'),
(64, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:34 PM'),
(65, NULL, 'Account logout', '::1', '08-03-2023 12:34 PM'),
(66, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:35 PM'),
(67, NULL, 'Account logout', '::1', '08-03-2023 12:35 PM'),
(68, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:36 PM'),
(69, NULL, 'Account logout', '::1', '08-03-2023 12:40 PM'),
(70, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:40 PM'),
(71, NULL, 'Account logout', '::1', '08-03-2023 12:41 PM'),
(72, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 12:41 PM'),
(73, NULL, 'Account logout', '::1', '08-03-2023 12:42 PM'),
(74, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:42 PM'),
(75, NULL, 'Account logout', '::1', '08-03-2023 12:44 PM'),
(76, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 12:44 PM'),
(77, NULL, 'Account logout', '::1', '08-03-2023 12:45 PM'),
(78, 'abhishek@techowl.in', 'Account login', '::1', '08-03-2023 12:52 PM'),
(79, NULL, 'Account logout', '::1', '08-03-2023 12:52 PM'),
(80, 'mamta01.img@gmail.com', 'Account login', '::1', '08-03-2023 12:52 PM'),
(81, 'mamta01.img@gmail.com', 'Account login', '182.69.98.197', '30-05-2023 01:14 PM'),
(82, NULL, 'Account logout', '182.69.98.197', '30-05-2023 01:16 PM'),
(83, 'mamta01.img@gmail.com', 'Account login', '182.69.98.197', '30-05-2023 01:18 PM'),
(84, 'mamta01.img@gmail.com', 'Account login', '182.69.98.197', '30-05-2023 01:18 PM'),
(85, 'mamta01.img@gmail.com', 'Account login', '103.238.14.133', '30-05-2023 02:16 PM'),
(86, NULL, 'Account logout', '103.238.14.133', '30-05-2023 02:17 PM'),
(87, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 04:31 AM'),
(88, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 04:32 AM'),
(89, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:00 AM'),
(90, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:03 AM'),
(91, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:06 AM'),
(92, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:07 AM'),
(93, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:08 AM'),
(94, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:09 AM'),
(95, NULL, 'Account logout', '182.69.110.160', '31-05-2023 05:10 AM'),
(96, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:11 AM'),
(97, NULL, 'Account logout', '182.69.110.160', '31-05-2023 05:11 AM'),
(98, 'mamta01.img@gmail.com', 'Account login', '182.69.110.160', '31-05-2023 05:11 AM'),
(99, NULL, 'Account logout', '182.69.110.160', '31-05-2023 05:12 AM'),
(100, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 05:15 AM'),
(101, NULL, 'Account logout', '157.50.52.125', '31-05-2023 05:18 AM'),
(102, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 05:18 AM'),
(103, NULL, 'Account logout', '157.50.52.125', '31-05-2023 05:19 AM'),
(104, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 05:21 AM'),
(105, NULL, 'Account logout', '157.50.52.125', '31-05-2023 05:21 AM'),
(106, 'abhishek@techowl.in', 'Account login', '157.50.52.125', '31-05-2023 05:21 AM'),
(107, NULL, 'Account logout', '157.50.52.125', '31-05-2023 05:35 AM'),
(108, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 05:35 AM'),
(109, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 10:43 AM'),
(110, 'mamta01.img@gmail.com', 'Account login', '157.50.52.125', '31-05-2023 11:43 AM'),
(111, NULL, 'Account logout', '157.50.52.125', '31-05-2023 12:30 PM'),
(112, 'abhishek@techowl.in', 'Account login', '157.50.52.125', '31-05-2023 12:30 PM'),
(113, 'mamta01.img@gmail.com', 'Account login', '152.58.37.255', '31-05-2023 01:13 PM'),
(114, 'mamta01.img@gmail.com', 'Account login', '157.50.8.67', '01-06-2023 03:39 AM'),
(115, NULL, 'Account logout', '157.50.8.67', '01-06-2023 03:42 AM'),
(116, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 03:42 AM'),
(117, NULL, 'Account logout', '157.50.8.67', '01-06-2023 04:03 AM'),
(118, 'mamta01.img@gmail.com', 'Account login', '157.50.8.67', '01-06-2023 04:03 AM'),
(119, NULL, 'Account logout', '157.50.8.67', '01-06-2023 04:24 AM'),
(120, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 04:24 AM'),
(121, NULL, 'Account logout', '157.50.8.67', '01-06-2023 04:58 AM'),
(122, NULL, 'Account logout', '157.50.8.67', '01-06-2023 04:58 AM'),
(123, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 05:01 AM'),
(124, NULL, 'Account logout', '157.50.8.67', '01-06-2023 05:01 AM'),
(125, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 05:02 AM'),
(126, NULL, 'Account logout', '157.50.8.67', '01-06-2023 05:02 AM'),
(127, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 05:04 AM'),
(128, NULL, 'Account logout', '157.50.8.67', '01-06-2023 05:58 AM'),
(129, 'mamta01.img@gmail.com', 'Account login', '157.50.8.67', '01-06-2023 05:58 AM'),
(130, NULL, 'Account logout', '157.50.8.67', '01-06-2023 06:31 AM'),
(131, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 06:31 AM'),
(132, 'abhishek@techowl.in', 'Account login', '157.50.8.67', '01-06-2023 09:44 AM'),
(133, 'abhishek@techowl.in', 'Account login', '157.50.38.250', '02-06-2023 04:30 AM'),
(134, 'abhishek@techowl.in', 'Account login', '157.50.56.143', '02-06-2023 12:11 PM'),
(135, 'abhishek@techowl.in', 'Account login', '157.50.42.49', '05-06-2023 03:58 AM'),
(136, 'abhishek@techowl.in', 'Account login', '157.50.42.49', '05-06-2023 06:17 AM'),
(137, 'abhishek@techowl.in', 'Account login', '157.50.47.150', '05-06-2023 10:50 AM'),
(138, 'abhishek@techowl.in', 'Account login', '157.50.26.87', '06-06-2023 03:36 AM'),
(139, 'abhishek@techowl.in', 'Account login', '157.50.11.233', '06-06-2023 09:06 AM'),
(140, 'abhishek@techowl.in', 'Account login', '157.50.52.69', '07-06-2023 02:53 AM'),
(141, 'abhishek@techowl.in', 'Account login', '157.50.16.32', '07-06-2023 10:18 AM'),
(142, 'abhishek@techowl.in', 'Account login', '157.50.36.38', '08-06-2023 02:54 AM'),
(143, 'abhishek@techowl.in', 'Account login', '157.50.48.32', '08-06-2023 03:40 AM'),
(144, 'abhishek@techowl.in', 'Account login', '157.50.48.32', '08-06-2023 05:42 AM'),
(145, 'abhishek@techowl.in', 'Account login', '157.50.48.32', '08-06-2023 07:13 AM'),
(146, 'abhishek@techowl.in', 'Account login', '157.50.39.167', '09-06-2023 03:37 AM'),
(147, 'abhishek@techowl.in', 'Account login', '106.206.72.147', '12-06-2023 03:01 AM'),
(148, 'abhishek@techowl.in', 'Account login', '157.50.53.79', '12-06-2023 06:36 AM'),
(149, NULL, 'Account logout', '157.50.39.143', '12-06-2023 09:33 AM'),
(150, 'abhishek@techowl.in', 'Account login', '157.50.39.143', '12-06-2023 09:37 AM'),
(151, NULL, 'Account logout', '157.50.39.143', '12-06-2023 09:39 AM'),
(152, 'abhishek@techowl.in', 'Account login', '157.50.39.143', '12-06-2023 09:39 AM'),
(153, 'abhishek@techowl.in', 'Account login', '122.15.229.221', '12-06-2023 10:11 AM'),
(154, 'abhishek@techowl.in', 'Account login', '157.50.47.87', '12-06-2023 10:47 AM'),
(155, NULL, 'Account logout', '157.50.47.87', '12-06-2023 12:33 PM'),
(156, 'abhishek@techowl.in', 'Account login', '157.50.47.87', '12-06-2023 12:34 PM'),
(157, 'abhishek@techowl.in', 'Account login', '157.50.28.76', '13-06-2023 03:23 AM'),
(158, NULL, 'Account logout', '157.50.22.125', '13-06-2023 05:52 AM'),
(159, 'abhishek@techowl.in', 'Account login', '157.50.22.125', '13-06-2023 05:52 AM'),
(160, 'abhishek@techowl.in', 'Account login', '157.50.22.125', '13-06-2023 12:17 PM'),
(161, 'abhishek@techowl.in', 'Account login', '157.50.33.44', '14-06-2023 03:55 AM'),
(162, 'abhishek@techowl.in', 'Account login', '157.50.33.44', '14-06-2023 05:41 AM'),
(163, 'abhishek@techowl.in', 'Account login', '157.50.34.158', '14-06-2023 09:55 AM'),
(164, 'abhishek@techowl.in', 'Account login', '157.50.12.100', '14-06-2023 11:29 AM'),
(165, 'abhishek@techowl.in', 'Account login', '122.15.229.221', '14-06-2023 12:52 PM'),
(166, 'abhishek@techowl.in', 'Account login', '157.50.12.100', '14-06-2023 01:01 PM'),
(167, 'abhishek@techowl.in', 'Account login', '157.50.46.228', '15-06-2023 03:11 AM'),
(168, 'abhishek@techowl.in', 'Account login', '157.50.46.228', '15-06-2023 04:36 AM'),
(169, NULL, 'Account logout', '157.50.46.228', '15-06-2023 05:47 AM'),
(170, 'abhishek@techowl.in', 'Account login', '157.50.46.228', '15-06-2023 05:47 AM'),
(171, 'abhishek@techowl.in', 'Account login', '122.15.229.221', '15-06-2023 08:18 AM'),
(172, 'abhishek@techowl.in', 'Account login', '157.50.28.56', '15-06-2023 11:11 AM'),
(173, NULL, 'Account logout', '157.50.28.56', '15-06-2023 11:12 AM'),
(174, 'sutharmamta630@gmail.com', 'Account login', '157.50.28.56', '15-06-2023 11:13 AM'),
(175, 'abhishek@techowl.in', 'Account login', '157.50.48.62', '16-06-2023 04:04 AM'),
(176, NULL, 'Account logout', '157.50.48.62', '16-06-2023 06:01 AM'),
(177, 'abhishek@techowl.in', 'Account login', '157.50.48.62', '16-06-2023 06:01 AM'),
(178, 'abhishek@techowl.in', 'Account login', '157.50.62.18', '16-06-2023 08:54 AM'),
(179, 'abhishek@techowl.in', 'Account login', '157.50.14.198', '16-06-2023 12:16 PM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mail_verify`
--

CREATE TABLE `tb_mail_verify` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` bigint NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_mail_verify`
--

INSERT INTO `tb_mail_verify` (`id`, `userid`, `email`, `domain`, `code`, `status`, `created_at`, `updated_at`) VALUES
(23, 2, 'mamtatech@yopmail.com', 'yopmail.com', 634303, 1, '2023-06-01 06:14:41', '2023-06-01 06:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `tb_main`
--

CREATE TABLE `tb_main` (
  `id` int NOT NULL,
  `name` varchar(111) DEFAULT NULL,
  `username` varchar(111) DEFAULT NULL,
  `password` varchar(222) DEFAULT NULL,
  `contact_mail` varchar(111) DEFAULT NULL,
  `dp_name` varchar(111) DEFAULT NULL,
  `v_hash` varchar(111) DEFAULT NULL,
  `v_hash_time` varchar(111) DEFAULT NULL,
  `date` varchar(111) DEFAULT NULL,
  `last_login` varchar(111) DEFAULT NULL,
  `last_logout` varchar(111) DEFAULT NULL,
  `user_role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_main`
--

INSERT INTO `tb_main` (`id`, `name`, `username`, `password`, `contact_mail`, `dp_name`, `v_hash`, `v_hash_time`, `date`, `last_login`, `last_logout`, `user_role`) VALUES
(1, 'Admin1', 'admin', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'abhishek@techowl.in', '2', NULL, NULL, '17-02-2023 05:28 AM', '[\"16-06-2023 08:54 AM\",\"16-06-2023 12:16 PM\"]', NULL, 1),
(2, 'User', 'admin1', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'mamta01.img@gmail.com', '2', '40ec617617b8740a2cab54d2e0389ad9', '1676973235', '20-02-2023 10:21 AM', '[\"01-06-2023 04:03 AM\",\"01-06-2023 05:58 AM\"]', '', 0),
(3, 'User', 'mamta', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'sutharmamta630@gmail.com', '1', '', '', '$15-06-2023 11:13 AM', '[\"15-06-2023 11:13 AM\"]', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_main_cron`
--

CREATE TABLE `tb_main_cron` (
  `id` int NOT NULL,
  `pid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_main_cron`
--

INSERT INTO `tb_main_cron` (`id`, `pid`) VALUES
(1, 164229);

-- --------------------------------------------------------

--
-- Table structure for table `tb_main_variables`
--

CREATE TABLE `tb_main_variables` (
  `id` int NOT NULL,
  `server_protocol` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `domain` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `baseurl` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_zone` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_format` varchar(222) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_main_variables`
--

INSERT INTO `tb_main_variables` (`id`, `server_protocol`, `domain`, `baseurl`, `time_zone`, `time_format`) VALUES
(1, 'http', 'techowlphish.com', 'https://techowlphish.com', '{\"timezone\":\"Asia\\/Kolkata\",\"value\":19800}', '{\"date\":\"d-m-o\",\"space\":\"comaspace\",\"time\":\"h:i:s:v A\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pl_list`
--

CREATE TABLE `tb_pl_list` (
  `pl_id` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `pl_name` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_name` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pl_type` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pl_sub_type` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_store`
--

CREATE TABLE `tb_store` (
  `type` varchar(111) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(111) COLLATE utf8mb4_general_ci NOT NULL,
  `info` varchar(700) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_store`
--

INSERT INTO `tb_store` (`type`, `name`, `info`, `content`) VALUES
('mail_sender', 'Amazon SES', '{\"dsn_type\":\"amazon_ses\",\"disp_note\":\"\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'Custom', '{\"dsn_type\":\"custom\",\"disp_note\":\"Note: Custom mail sender template\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"\",\"disabled\":false}}'),
('mail_template', 'Give me your address', '{\"disp_note\":\"Desc: A simple mail to track mail open and capture data from the phishing site\"}', '{\"mail_template_subject\":\"Free COVID-19 Vaccine for {{FNAME}}\",\"mail_template_content\":\"Dear Sir\\/Madam<br><br>We are happy to inform you that you have been selected to receive the COVID-19 vaccine at your home for free. Please submit your address in the link given below, so that we can arrange our medical representative.<br><br>Submit address <a href=\\\"https:\\/\\/techowlphish.com \\/form.html?rid={{RID}}\\\">here<\\/a><br><br>Please let us know if you have any questions.<br><br>Regards,<br>Cage,<br>Chief Medical Officer<br><br>{{TRACKER}}\",\"timage_type\":1,\"mail_content_type\":\"text/html\",\"attachment\":[]}'),
('mail_sender', 'Gmail (gmail.com)', '{\"dsn_type\":\"gmail\",\"disp_note\":\"Note: You need to create app specifc password instead of your mail pasword. Refer <a href=\'https://support.google.com/accounts/answer/185833\' target=\'_blank\'>https://support.google.com/accounts/answer/185833</a>\"}', '{\"from\":\"Name<username@gmail.com>\",\"username\":\"username@gmail.com\",\"mailbox\":{\"value\":\"{imap.gmail.com:993/imap/ssl}INBOX\",\"disabled\":true,\"checked\":true},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_landing', 'Google Login', 'google_login.php', '{\r\n  \"mail_landing\": \"<body style=\\\"margin: 0; padding: 0; background-size: cover; font-family: sans-serif;\\\"><div class=\\\"box\\\" style=\\\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 25rem; padding: 2.5rem; box-sizing: border-box; border: 1px solid #dadce0; -webkit-border-radius: 8px; border-radius: 8px;\\\"><h2 style=\\\"margin: 0px 0 -0.125rem; padding: 0; color: #fff; text-align: center; color: #202124; font-family: \'Google Sans\',\'Noto Sans Myanmar UI\',arial,sans-serif; font-size: 24px; font-weight: 400;\\\">Sign in</h2><p style=\\\"font-size: 16px; font-weight: 400; letter-spacing: .1px; line-height: 1.5; margin-bottom: 25px; text-align: center;\\\">Use your Google Account</p><form class=\\\"form-horizontal m-t-20\\\" id=\\\"loginform\\\" method=\\\"post\\\" action=\\\"https://techowlphish.com/landingmail.php?landingrid=<?php echo $_GET[\'landingrid\'] ?>&#38;landingmid=<?php echo $_GET[\'landingmid\'] ?>\\\"><div class=\\\"inputBox\\\" style=\\\"position: relative;\\\"><input type=\\\"email\\\" name=\\\"email\\\" required><label>Username</label></div><div class=\\\"inputBox\\\" style=\\\"position: relative;\\\"><input type=\\\"text\\\" name=\\\"text\\\" required><label>Password</label></div><input type=\\\"submit\\\" name=\\\"sign-in\\\" value=\\\"Sign In\\\" style=\\\"border: none; outline: none; color: #fff; background-color: #1a73e8; padding: 0.625rem 1.25rem; cursor: pointer; border-radius: 0.312rem; font-size: 1rem; float: right;\\\"></form></div></body>\",\r\n  \"attachment\": []\r\n}'),
('mail_sender', 'Mailchimp Mandrill', '{\"dsn_type\":\"mailchimp_mandrill\",\"disp_note\":\"\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'Mailgun', '{\"dsn_type\":\"mailgun\",\"disp_note\":\"\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'Mailjet', '{\"dsn_type\":\"mailjet\",\"disp_note\":\"Note: Provide the value for ACCESS_KEY at \'SMTP Username\' field and SECRET_KEY at \'SMTP Password\' field.\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'MailPace', '{\"dsn_type\":\"mailpace\",\"disp_note\":\"Note: Provide the value of API_TOKEN at \'SMTP Password\' field.\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'Microsoft (outlook.com/live.com)', '{\"dsn_type\":\"microsoft\",\"disp_note\":\"Note: Refer <a href=\'https://support.microsoft.com/en-us/office/pop-imap-and-smtp-settings-for-outlook-com-d088b986-291d-42b8-9564-9c414e2aa040\' target=\'_blank\'>https://support.microsoft.com/en-us/office/pop-imap-and-smtp-settings-for-outlook-com-d088b986-291d-42b8-9564-9c414e2aa040</a>\"}', '{\"from\":\"Name<username@outlook.com>\",\"username\":\"username@outlook.com\",\"mailbox\":{\"value\":\"{outlook.office365.com:993/imap/ssl/novalidate-cert}INBOX\",\"disabled\":true,\"checked\":true},\"smtp\":{\"value\":\"smtp.office365.com:587\",\"disabled\":false}}'),
('mail_template', 'My Bank', '{\"disp_note\":\"Desc: A sample HTML rich phishing mail\"}', '{\"mail_template_subject\":\"Important! Your consent is required\",\"mail_template_content\":\"<br><div><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td><br><\\/td><\\/tr><\\/tbody><\\/table><\\/div><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"600\\\"><tbody><tr><td bgcolor=\\\"#dcddde\\\" style=\\\"line-height:0px;background-color:#dcddde; border-left:1px solid #dcddde;\\\" valign=\\\"top\\\"><div><a data-original-title=\\\"Mark as smart link\\\" href=\\\"https:\\/\\/myphishingsite.com\\/page?rid={{RID}}\\\" rel=\\\"tooltip\\\" target=\\\"_blank\\\"><img src=\\\"https:\\/\\/user-images.githubusercontent.com\\/15928266\\/105949193-4518f300-60a7-11eb-87a9-6bb241003d92.jpg\\\" alt=\\\"\\\" class=\\\"fr-fic fr-dii\\\" width=\\\"100%\\\" border=\\\"0\\\"><\\/a><\\/div><\\/td><\\/tr><tr><td style=\\\"border-bottom:1px solid #cccccc;border-left:1px solid #cccccc;border-right:1px solid #cccccc;\\\"><table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td align=\\\"center\\\" valign=\\\"top\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td width=\\\"4%\\\"><br><\\/td><td valign=\\\"top\\\" width=\\\"92%\\\"><table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"width:100%!important;\\\" width=\\\"100%\\\"><tbody><tr><td align=\\\"center\\\" valign=\\\"top\\\"><div><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"width:100% !important;\\\" width=\\\"100%\\\"><tbody><tr><td height=\\\"20\\\"><br><\\/td><\\/tr><tr><td style=\\\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\\\">Dear {{NAME}},<\\/td><\\/tr><tr><td height=\\\"10\\\"><br><\\/td><\\/tr><tr><td style=\\\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\\\">We value our association with you and look forward to enhancing this relationship at every step.<\\/td><\\/tr><tr><td height=\\\"10\\\"><br><\\/td><\\/tr><tr><td style=\\\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\\\">We are delighted to inform you that you are a part of Platinum Banking Programme and to continue enjoying programme benefits, kindly provide your consent.<\\/td><\\/tr><tr><td height=\\\"10\\\"><br><\\/td><\\/tr><tr><td style=\\\"font-family:Arial; font-size:1em; line-height:22px; color:#595959;\\\">Here are few privileges of the programme, exclusively for you.<\\/td><\\/tr><tr><td style=\\\"text-align:center;\\\" valign=\\\"top\\\"><div align=\\\"center\\\" style=\\\"width:180px; display:inline-block; vertical-align:top;\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse:collapse!important;width:100%!important;\\\" width=\\\"100%\\\"><tbody><tr><td align=\\\"center\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td height=\\\"5\\\"><br><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"87\\\" style=\\\"vertical-align:middle !important;\\\" valign=\\\"middle\\\"><img src=\\\"https:\\/\\/user-images.githubusercontent.com\\/15928266\\/105949203-46e2b680-60a7-11eb-9a7f-c7a078cc4ca6.jpg\\\" alt=\\\"\\\" class=\\\"fr-fic fr-dii\\\" width=\\\"48\\\" height=\\\"48\\\" border=\\\"0\\\"><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"75\\\" style=\\\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\\\" valign=\\\"top\\\">Personalized attention from a dedicated Platinum Relationship Manager<\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><\\/tbody><\\/table><\\/div><div align=\\\"center\\\" style=\\\"width:180px; display:inline-block; vertical-align:top;\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse:collapse!important;width:100%!important;\\\" width=\\\"100%\\\"><tbody><tr><td align=\\\"center\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td height=\\\"5\\\"><br><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"87\\\" style=\\\"vertical-align:middle !important;\\\" valign=\\\"middle\\\"><img src=\\\"https:\\/\\/user-images.githubusercontent.com\\/15928266\\/105949204-46e2b680-60a7-11eb-8b0a-b175a65b5018.jpg\\\" alt=\\\"\\\" class=\\\"fr-fic fr-dii\\\" width=\\\"56\\\" height=\\\"52\\\" border=\\\"0\\\"><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"110\\\" style=\\\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\\\" valign=\\\"top\\\">ZERO cost on locker<br>rental<\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><\\/tbody><\\/table><\\/div><div align=\\\"center\\\" style=\\\"width:180px; display:inline-block; vertical-align:top;\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse:collapse!important;width:100%!important;\\\" width=\\\"100%\\\"><tbody><tr><td align=\\\"center\\\"><table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" width=\\\"100%\\\"><tbody><tr><td height=\\\"5\\\"><br><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"87\\\" style=\\\"vertical-align:middle !important;\\\" valign=\\\"middle\\\"><img src=\\\"https:\\/\\/user-images.githubusercontent.com\\/15928266\\/105949205-477b4d00-60a7-11eb-9d32-41427f2c1601.jpg\\\" alt=\\\"\\\" class=\\\"fr-fic fr-dii\\\" width=\\\"53\\\" height=\\\"45\\\" border=\\\"0\\\"><\\/td><\\/tr><tr><td align=\\\"center\\\" height=\\\"110\\\" style=\\\"font-family:Arial, Helvetica, sans-serif; line-height:22px; font-size:0.938em; color:#595959; text-align:center;\\\" valign=\\\"top\\\">Special relationship rates for Loans and Forex transactions<\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><\\/tbody><\\/table><\\/div><\\/td><\\/tr><tr><td align=\\\"center\\\" valign=\\\"top\\\"><table align=\\\"center\\\" bgcolor=\\\"#0d4c8b\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"width:230px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\\\" width=\\\"230\\\"><tbody><tr><td align=\\\"center\\\" style=\\\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\\\" valign=\\\"middle\\\"><a data-original-title=\\\"Mark as smart link\\\" href=\\\"{{landing_page}}?landingmid={{MID}}&landingrid={{RID}}\\\" rel=\\\"tooltip\\\" style=\\\"text-decoration:none; color:#fff; font-weight:500;\\\" target=\\\"_blank\\\">Platinum Banking Benefits<\\/a><\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><tr><td height=\\\"20\\\"><br><\\/td><\\/tr><tr><td align=\\\"center\\\" valign=\\\"top\\\"><table align=\\\"center\\\" bgcolor=\\\"#0d4c8b\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"width:200px !important; border:1px solid #733943; border-radius:5px; background-color:#733943; font-size: 15px;\\\" width=\\\"200\\\"><tbody><tr><td align=\\\"center\\\" style=\\\"font-family:Arial, sans-serif; font-size:1.2em; color:#fff; text-align:center !important; border-radius:5px; background-color:#733943; padding:5px;\\\" valign=\\\"middle\\\"><a data-original-title=\\\"Mark as smart link\\\" href=\\\"{{landing_page}}?landingmid={{MID}}&landingrid={{RID}}\\\" rel=\\\"tooltip\\\" style=\\\"text-decoration:none; color:#fff; font-weight:500;\\\" target=\\\"_blank\\\">Yes, I want to Continue<\\/a><\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><tr><td height=\\\"15\\\"><br><\\/td><\\/tr><tr><td height=\\\"20\\\"><br><\\/td><\\/tr><\\/tbody><\\/table><\\/div><\\/td><\\/tr><tr><td height=\\\"30\\\"><br><\\/td><\\/tr><tr><td align=\\\"left\\\" style=\\\"font-family:Arial; font-size:16px; letter-spacing: 1px; line-height:28px; color:#000000;\\\" valign=\\\"top\\\">Warm regards,<br><br><div><span style=\\\"font-weight: bold !important;\\\">Aaron Murakami<\\/span><br>Programme Manager<br>Platinum Premium Banking<\\/div><\\/td><\\/tr><tr><td height=\\\"15\\\"><br><\\/td><\\/tr><\\/tbody><\\/table><\\/td><td width=\\\"4%\\\"><br><\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><\\/tbody><\\/table><\\/td><\\/tr><tr><td align=\\\"left\\\" style=\\\"font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:16px; padding:10px 5px 5px 18px; color:#201d1e; text-align:left;\\\" valign=\\\"top\\\">*Terms &amp; Conditions apply | <a data-original-title=\\\"Mark as smart link\\\" href=\\\"https:\\/\\/myphishingsite.com\\/unsubscribe\\\" rel=\\\"tooltip\\\" style=\\\"text-decoration:underline; color:#0000ff;\\\" target=\\\"_blank\\\">Unsubscribe<\\/a><\\/td><\\/tr><tr><td style=\\\"font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; padding:10px 0 5px 18px; color:#000000;\\\">*Based on Retail Loan book size (excluding mortgages). Source: Annual Reports as on 31<sup>st<\\/sup> March 2018 and No.1 on market capitalisation based on BSE data as on 22<sup>nd<\\/sup> May, 2018.<\\/td><\\/tr><\\/tbody><\\/table><div><br><\\/div><br>{{TRACKER}}\",\"timage_type\":1,\"mail_content_type\":\"text/html\",\"attachment\":[]}'),
('mail_sender', 'Postmark', '{\"dsn_type\":\"postmark\",\"disp_note\":\"Note: Provide the value of ID at \'SMTP Password\' field.\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_template', 'Scan me - QR', '{\"disp_note\":\"Desc: A QR based email. QR code is generated dynamicly\"}', '{\"mail_template_subject\":\"Lucky You\",\"mail_template_content\":\"Dear Customer,<br><br>Please scan the QR image shown below to confirm your prize!<br><br><img src=\\\"https:\\/\\/techowlphish.com\\/mod?type=qr_att&amp;content=<your text here>&amp;img_name=code.png\\\" class=\\\"fr-fic fr-dii\\\"><br><br>{{TRACKER}}\",\"timage_type\":1,\"mail_content_type\":\"text/html\",\"attachment\":[]}'),
('mail_sender', 'Sendgrid', '{\"dsn_type\":\"sendgrid\",\"disp_note\":\"Note: Provide value of KEY at \'SMTP Password\' field.\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_sender', 'Sendinblue', '{\"dsn_type\":\"sendinblue\",\"disp_note\":\"\"}', '{\"from\":\"\",\"username\":\"\",\"mailbox\":{\"value\":\"\",\"disabled\":false,\"checked\":false},\"smtp\":{\"value\":\"NA\",\"disabled\":true}}'),
('mail_template', 'Track me', '{\"disp_note\":\"Desc: A simple mail to track when the mail is opened\"}', '{\"mail_template_subject\":\"Thanks!\",\"mail_template_content\":\"Hi {{FNAME}},<br><br>Thank you for your email. We will meet soon.<br><br>Thanks &amp; Regards<br>Rose<br><br>{{TRACKER}}\",\"timage_type\":1,\"mail_content_type\":\"text/html\",\"attachment\":[]}'),
('mail_sender', 'Yahoo (yahoo.com/ymail.com) - SSL', '{\"dsn_type\":\"yahoo_ssl\",\"disp_note\":\"Note: You may need to turn on less secure apps. Refer <a href=\'https://help.yahoo.com/kb/access-yahoo-mail-third-party-apps-sln15241.html\' target=\'_blank\'>https://help.yahoo.com/kb/access-yahoo-mail-third-party-apps-sln15241.html</a>\"}', '{\"from\":\"Name<username@yahoo.com>\",\"username\":\"username@yahoo.com\",\"mailbox\":{\"value\":\"{imap.mail.yahoo.com:993/imap/ssl}INBOX\",\"disabled\":true,\"checked\":true},\"smtp\":{\"value\":\"smtp.mail.yahoo.com:465\",\"disabled\":false}}'),
('mail_sender', 'Yahoo (yahoo.com/ymail.com) - TLS', '{\"dsn_type\":\"yahoo_tls\",\"disp_note\":\"Note: You may need to turn on less secure apps. Refer <a href=\'https://help.yahoo.com/kb/access-yahoo-mail-third-party-apps-sln15241.html\' target=\'_blank\'>https://help.yahoo.com/kb/access-yahoo-mail-third-party-apps-sln15241.html</a>\"}', '{\"from\":\"Name<username@yahoo.com>\",\"username\":\"username@yahoo.com\",\"mailbox\":{\"value\":\"{imap.mail.yahoo.com:993/imap/ssl}INBOX\",\"disabled\":true,\"checked\":true},\"smtp\":{\"value\":\"smtp.mail.yahoo.com:587\",\"disabled\":false}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_access_ctrl`
--
ALTER TABLE `tb_access_ctrl`
  ADD PRIMARY KEY (`tk_id`);

--
-- Indexes for table `tb_core_mailcamp_config`
--
ALTER TABLE `tb_core_mailcamp_config`
  ADD PRIMARY KEY (`mconfig_id`);

--
-- Indexes for table `tb_core_mailcamp_list`
--
ALTER TABLE `tb_core_mailcamp_list`
  ADD PRIMARY KEY (`campaign_id`),
  ADD UNIQUE KEY `id` (`campaign_id`);

--
-- Indexes for table `tb_core_mailcamp_sender_list`
--
ALTER TABLE `tb_core_mailcamp_sender_list`
  ADD PRIMARY KEY (`sender_list_id`),
  ADD UNIQUE KEY `sender_list_id` (`sender_list_id`);

--
-- Indexes for table `tb_core_mailcamp_template_list`
--
ALTER TABLE `tb_core_mailcamp_template_list`
  ADD PRIMARY KEY (`mail_template_id`);

--
-- Indexes for table `tb_core_mailcamp_user_group`
--
ALTER TABLE `tb_core_mailcamp_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `tb_core_quick_tracker_list`
--
ALTER TABLE `tb_core_quick_tracker_list`
  ADD PRIMARY KEY (`tracker_id`);

--
-- Indexes for table `tb_core_web_tracker_list`
--
ALTER TABLE `tb_core_web_tracker_list`
  ADD PRIMARY KEY (`tracker_id`),
  ADD UNIQUE KEY `id_2` (`tracker_id`),
  ADD KEY `id` (`tracker_id`),
  ADD KEY `id_3` (`tracker_id`);

--
-- Indexes for table `tb_data_mailcamp_live`
--
ALTER TABLE `tb_data_mailcamp_live`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `tb_data_quick_tracker_live`
--
ALTER TABLE `tb_data_quick_tracker_live`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_data_webform_submit`
--
ALTER TABLE `tb_data_webform_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_data_webpage_visit`
--
ALTER TABLE `tb_data_webpage_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_domains`
--
ALTER TABLE `tb_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_hf_list`
--
ALTER TABLE `tb_hf_list`
  ADD PRIMARY KEY (`hf_id`);

--
-- Indexes for table `tb_hland_page_list`
--
ALTER TABLE `tb_hland_page_list`
  ADD PRIMARY KEY (`hlp_id`);

--
-- Indexes for table `tb_ht_list`
--
ALTER TABLE `tb_ht_list`
  ADD PRIMARY KEY (`ht_id`);

--
-- Indexes for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mail_verify`
--
ALTER TABLE `tb_mail_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_main`
--
ALTER TABLE `tb_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_main_cron`
--
ALTER TABLE `tb_main_cron`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_main_variables`
--
ALTER TABLE `tb_main_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pl_list`
--
ALTER TABLE `tb_pl_list`
  ADD PRIMARY KEY (`pl_id`);

--
-- Indexes for table `tb_store`
--
ALTER TABLE `tb_store`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_data_quick_tracker_live`
--
ALTER TABLE `tb_data_quick_tracker_live`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_data_webform_submit`
--
ALTER TABLE `tb_data_webform_submit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_data_webpage_visit`
--
ALTER TABLE `tb_data_webpage_visit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_domains`
--
ALTER TABLE `tb_domains`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `tb_mail_verify`
--
ALTER TABLE `tb_mail_verify`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_main`
--
ALTER TABLE `tb_main`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_main_cron`
--
ALTER TABLE `tb_main_cron`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
