/*
Navicat MySQL Data Transfer

Source Server         : local-MySQL5.7.0
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : imazon

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-14 20:33:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `category_id` bigint(10) NOT NULL,
  `url` varchar(500) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `pic2` varchar(500) DEFAULT NULL,
  `cid` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_content
-- ----------------------------

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category` (
  `id` bigint(10) NOT NULL,
  `parent_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `sort_order` int(10) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sell_point` varchar(500) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `num` int(10) NOT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `cid` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1', 'Motorola Nexus 6', '32/64 GB, 3 GB RAM', '69999', '11', '1234567', 'https://cdn2.gsmarena.com/vv/pics/motorola/motorola-nexus-6-1.jpg', '0', '1', '2018-04-05 21:51:32', '2018-04-13 21:51:37');

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` bigint(10) NOT NULL,
  `parent_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(10) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_desc`;
CREATE TABLE `tb_item_desc` (
  `item_id` bigint(10) NOT NULL,
  `item_desc` varchar(500) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_desc
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_param
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param`;
CREATE TABLE `tb_item_param` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sell_point` varchar(500) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `num` int(10) NOT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `cid` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_param
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_param_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param_item`;
CREATE TABLE `tb_item_param_item` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `param_data` varchar(500) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_param_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` bigint(20) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `post_fee` varchar(500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `consign_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `close_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `shipping_name` varchar(100) NOT NULL,
  `shipping_code` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `buyer_message` varchar(100) NOT NULL,
  `buyer_nick` varchar(100) NOT NULL,
  `buyer_rate` varchar(100) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `num` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `total_fee` bigint(20) NOT NULL,
  `pic_path` varchar(500) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_shipping`;
CREATE TABLE `tb_order_shipping` (
  `order_id` bigint(20) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_phone` varchar(50) DEFAULT NULL,
  `receiver_mobile` varchar(50) DEFAULT NULL,
  `receiver_state` varchar(50) DEFAULT NULL,
  `receiver_city` varchar(50) DEFAULT NULL,
  `receiver_district` varchar(50) DEFAULT NULL,
  `receiver_address` varchar(50) DEFAULT NULL,
  `receiver_zip` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
