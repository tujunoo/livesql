/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50169
Source Host           : 127.0.0.1:3306
Source Database       : live

Target Server Type    : MYSQL
Target Server Version : 50169
File Encoding         : 65001

Date: 2015-04-17 17:05:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_banner`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_banner`;
CREATE TABLE `tbl_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `group` varchar(100) NOT NULL,
  `html_text` text,
  `language` varchar(64) NOT NULL DEFAULT 'all',
  `category_id` varchar(200) DEFAULT NULL,
  `domestic_ip` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_change` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `show_in_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `bgcolor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `banner_sort_order_index` (`sort_order`),
  KEY `idx_group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=1128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_banner
-- ----------------------------
INSERT INTO `tbl_banner` VALUES ('1125', '21321312', '', '', 'test_aaa_1', '', 'all', null, '0', '2015-04-16 19:02:45', '2015-04-16 00:00:00', '2015-04-16 00:00:00', '0000-00-00 00:00:00', '1', '1', '0', '');
INSERT INTO `tbl_banner` VALUES ('1126', '21321312', '', '', '', '', 'all', null, '0', '2015-04-16 16:29:29', '2015-04-16 00:00:00', '2015-04-16 00:00:00', '0000-00-00 00:00:00', '1', '1', '0', '');

-- ----------------------------
-- Table structure for `tbl_banner_delete`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_banner_delete`;
CREATE TABLE `tbl_banner_delete` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `group` varchar(100) NOT NULL,
  `html_text` text,
  `language` varchar(64) NOT NULL DEFAULT 'all',
  `category_id` varchar(200) DEFAULT NULL,
  `domestic_ip` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_change` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `show_in_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `bgcolor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `banner_sort_order_index` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_banner_delete
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_banner_history`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_banner_history`;
CREATE TABLE `tbl_banner_history` (
  `banner_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shown` int(11) NOT NULL DEFAULT '0',
  `clicked` int(11) NOT NULL DEFAULT '0',
  `history_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banner_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`banner_history_id`),
  KEY `fk_banner_history_banner` (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12982 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_banner_history
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('1', 'This is a test comment.', '2', '1230952187', 'Tester', 'tester@example.com', null, '2');

-- ----------------------------
-- Table structure for `tbl_configuration`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configuration`;
CREATE TABLE `tbl_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `configuration_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `configuration_key_index` (`key`),
  KEY `configuration_sort_order_index` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_configuration
-- ----------------------------
INSERT INTO `tbl_configuration` VALUES ('1', '测试', 'PRIVATE_TOURS_CUSTOMER_SERVICE_CONTACT', '{\r\n\"13122\":\"123456\",\r\n\"16\":\"123456\",\r\n\"15\":\"123456\",\r\n\"5\":\"123456\",\r\n\"253\":\"111111\",\r\n\"13132\":\"13438281783\",\r\n\"42\":\"123456\"\r\n}', '描述', '1', '2015-04-16 10:46:51', '2015-04-16 10:46:51', '999');

-- ----------------------------
-- Table structure for `tbl_configuration_group`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configuration_group`;
CREATE TABLE `tbl_configuration_group` (
  `configuration_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`configuration_group_id`),
  KEY `configuration_group_sort_order_index` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_configuration_group
-- ----------------------------
INSERT INTO `tbl_configuration_group` VALUES ('1', 'My Store', 'General information about my store', '1', '1');
INSERT INTO `tbl_configuration_group` VALUES ('999', 'Homepage Config', 'Homepage Configurations', '1', '0');

-- ----------------------------
-- Table structure for `tbl_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `email_secret` tinyint(1) NOT NULL DEFAULT '0',
  `fmg_account_ask_flag` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `chinese_name` varchar(32) DEFAULT NULL,
  `gender` char(1) NOT NULL DEFAULT '',
  `dob` date NOT NULL COMMENT 'Date of Birth',
  `dob_secret` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(32) NOT NULL,
  `normalized_phone` varchar(32) DEFAULT NULL,
  `phone_secret` tinyint(1) NOT NULL DEFAULT '0',
  `fax` varchar(64) DEFAULT NULL,
  `cell` varchar(72) NOT NULL COMMENT 'Cellular phone',
  `normalized_cell` varchar(32) DEFAULT NULL,
  `cell_confirm` varchar(16) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `vip_code` varchar(10) DEFAULT NULL,
  `remark` tinytext,
  `face` varchar(128) DEFAULT NULL,
  `referer_url` varchar(255) DEFAULT NULL,
  `referer_type` tinyint(4) DEFAULT NULL,
  `charset` varchar(8) DEFAULT NULL,
  `shopping_points` decimal(10,2) NOT NULL,
  `credit_issued_amt` decimal(10,2) NOT NULL,
  `point_expire` date DEFAULT NULL,
  `experience_expire` date DEFAULT NULL,
  `experience` int(10) unsigned NOT NULL DEFAULT '0',
  `validation_code` varchar(8) DEFAULT NULL,
  `validation` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter` tinyint(4) DEFAULT NULL,
  `standalone` tinyint(4) NOT NULL DEFAULT '1',
  `dealalert` tinyint(4) NOT NULL DEFAULT '1',
  `is_newsletter_cruise` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cruises newsletter subscription',
  `is_travel_agent` tinyint(1) NOT NULL DEFAULT '0',
  `space_public` tinyint(1) NOT NULL DEFAULT '0',
  `email_validation_point` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `cim_profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'CIM Profile ID, not an FK',
  `purchased_without_account` tinyint(1) NOT NULL DEFAULT '0',
  `is_accept_sms_news` tinyint(1) NOT NULL DEFAULT '1',
  `fb_uid` bigint(20) unsigned DEFAULT NULL COMMENT 'Facebook User ID',
  `recommend_customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_address_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_store` (`store_id`),
  KEY `customer_fb_uid_index` (`fb_uid`),
  KEY `customer_email_index` (`email`),
  KEY `customer_normalized_phone_index` (`normalized_phone`),
  KEY `customer_normalized_cell_index` (`normalized_cell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_customer_shopping_point`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_shopping_point`;
CREATE TABLE `tbl_customer_shopping_point` (
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shopping_points` decimal(10,2) NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `point_expire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_customer_shopping_point
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_language`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_language`;
CREATE TABLE `tbl_language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `language_name_index` (`name`),
  KEY `language_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_language
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_lookup`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lookup`;
CREATE TABLE `tbl_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_lookup
-- ----------------------------
INSERT INTO `tbl_lookup` VALUES ('1', 'Draft', '1', 'PostStatus', '1');
INSERT INTO `tbl_lookup` VALUES ('2', 'Published', '2', 'PostStatus', '2');
INSERT INTO `tbl_lookup` VALUES ('3', 'Archived', '3', 'PostStatus', '3');
INSERT INTO `tbl_lookup` VALUES ('4', 'Pending Approval', '1', 'CommentStatus', '1');
INSERT INTO `tbl_lookup` VALUES ('5', 'Approved', '2', 'CommentStatus', '2');

-- ----------------------------
-- Table structure for `tbl_post`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES ('1', 'Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\r\n\r\nFeel free to try this system by writing new posts and posting comments.', 'yii, blog', '2', '1230952187', '1230952187', '1');
INSERT INTO `tbl_post` VALUES ('2', 'A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'test', '2', '1230952187', '1230952187', '1');

-- ----------------------------
-- Table structure for `tbl_tag`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tag`;
CREATE TABLE `tbl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_tag
-- ----------------------------
INSERT INTO `tbl_tag` VALUES ('1', 'yii', '1');
INSERT INTO `tbl_tag` VALUES ('2', 'blog', '1');
INSERT INTO `tbl_tag` VALUES ('3', 'test', '1');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'demo', '$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC', 'webmaster@example.com', null);
