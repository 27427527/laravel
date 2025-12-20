/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : lshop

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2025-11-28 20:08:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '张三', '15412341234', '云南', '保山市', '腾冲县', '路1000号汇亚大厦20楼');
INSERT INTO `address` VALUES ('7', '1', '李四', '13545645646', '四川', '德阳市', '广汉市', '汇亚大厦20楼');
INSERT INTO `address` VALUES ('8', '1', '王武', '18812341234', '贵州', '黔西南布依族苗族自治州', '贞丰县', '464');
INSERT INTO `address` VALUES ('10', '1', 'test', '123132', '重庆', '市辖区', '万州区', '5646546');
INSERT INTO `address` VALUES ('12', '4', 'test', '13588886666', '北京', '市辖区', '东城区', 'souhu');
INSERT INTO `address` VALUES ('13', '4', '123', '123586456', '北京', '市辖区', '崇文区', '1646');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `permissions` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'max', '$2y$10$jIm3giKcquPXdQqENUfB9Oai3d62vbnd7tEMfuboVgWjD76nI5kRu', '开发人员', '16612341111', null, '1', null, null, '2025-10-18 10:17:27',null);
INSERT INTO `admins` VALUES ('4', 'test', '$2y$10$BQFW6XrsNRg6nHeM0aFjou2mTB/t3c0ef1LfLdHM09OjwTyMtXepO', '测试123', '16685462546', null, '1', null, null, '2025-10-21 13:08:21',null);
INSERT INTO `admins` VALUES ('5', 'master', '$2y$10$nLHV7grMBfM9cDHFsLZSouG/E4di4nYaywX5XtRLv2RzC1B5xc/h6', '一般用户', '18812341234', null, '1', null, null, '2025-10-22 22:40:01',null);
INSERT INTO `admins` VALUES ('6', '468564', '$2y$10$/2Q1t2IEZcMZiL5OnxiBK.wEY9wu3RtQKwes2i9E0t2VfW39a/WdS', '46464', '18845615423', null, '1', null, null, '2025-10-22 22:49:04',null);
INSERT INTO `admins` VALUES ('7', '4654654', '$2y$10$4NxAMQkFGXZnXpcLahV.4.ltmZL5ym9/woaYGqfUffLRcfP4rSjCu', '465464', '13245785468', null, '1', null, null, '2025-10-22 22:53:39',null);
INSERT INTO `admins` VALUES ('8', '465465411', '$2y$10$iHKJuoTZZji7Xg3ZaMk.X.5Bun3fmm3xVkI006Nn7k7TwZGdBfgcW', '46546441', '13245785468', null, '1', null, null, '2025-10-22 22:54:25',null);

-- ----------------------------
-- Table structure for attr_name
-- ----------------------------
DROP TABLE IF EXISTS `attr_name`;
CREATE TABLE `attr_name` (
  `attr_name_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `good_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`attr_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attr_name
-- ----------------------------
INSERT INTO `attr_name` VALUES ('1', '颜色', '5');
INSERT INTO `attr_name` VALUES ('2', '存储大小', '5');
INSERT INTO `attr_name` VALUES ('8', '型号', '5');
INSERT INTO `attr_name` VALUES ('9', '颜色', '7');
INSERT INTO `attr_name` VALUES ('10', '存储大小', '7');

-- ----------------------------
-- Table structure for attr_price
-- ----------------------------
DROP TABLE IF EXISTS `attr_price`;
CREATE TABLE `attr_price` (
  `attr_price_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `org_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `good_id` bigint(20) unsigned NOT NULL,
  `attr` json DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attr_price
-- ----------------------------
INSERT INTO `attr_price` VALUES ('85', '1111.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"黑色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('86', '2245.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"黑色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('87', '3545.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"黑色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('88', '1112.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"黑色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('89', '2587.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"黑色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('90', '4584.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"黑色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('91', '1113.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"白色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('92', '2648.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"白色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('93', '6584.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"白色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('94', '1114.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"白色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('95', '2458.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"白色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('96', '6545.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"白色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('97', '1154.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"蓝色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('98', '4486.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"蓝色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('99', '3254.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"蓝色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('100', '1164.00', '9999.00', '5', '{\"型号\": \"Min\", \"颜色\": \"蓝色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('101', '2578.00', '9999.00', '5', '{\"型号\": \"Pro\", \"颜色\": \"蓝色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('102', '6484.00', '9999.00', '5', '{\"型号\": \"Max\", \"颜色\": \"蓝色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('103', '9999.00', '12888.00', '7', '{\"颜色\": \"白色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('104', '9999.00', '12888.00', '7', '{\"颜色\": \"白色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('105', '9999.00', '12888.00', '7', '{\"颜色\": \"黑色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('106', '9999.00', '12888.00', '7', '{\"颜色\": \"黑色\", \"存储大小\": \"512GB\"}',0);
INSERT INTO `attr_price` VALUES ('107', '10555.00', '12888.00', '7', '{\"颜色\": \"红色\", \"存储大小\": \"256GB\"}',0);
INSERT INTO `attr_price` VALUES ('108', '8888.00', '12888.00', '7', '{\"颜色\": \"红色\", \"存储大小\": \"512GB\"}',0);

-- ----------------------------
-- Table structure for attr_val
-- ----------------------------
DROP TABLE IF EXISTS `attr_val`;
CREATE TABLE `attr_val` (
  `attr_val_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_name_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`attr_val_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attr_val
-- ----------------------------
INSERT INTO `attr_val` VALUES ('114', '黑色', '1');
INSERT INTO `attr_val` VALUES ('115', '白色', '1');
INSERT INTO `attr_val` VALUES ('116', '蓝色', '1');
INSERT INTO `attr_val` VALUES ('117', '256GB', '2');
INSERT INTO `attr_val` VALUES ('118', '512GB', '2');
INSERT INTO `attr_val` VALUES ('119', 'Min', '8');
INSERT INTO `attr_val` VALUES ('120', 'Pro', '8');
INSERT INTO `attr_val` VALUES ('121', 'Max', '8');
INSERT INTO `attr_val` VALUES ('122', '白色', '9');
INSERT INTO `attr_val` VALUES ('123', '黑色', '9');
INSERT INTO `attr_val` VALUES ('124', '红色', '9');
INSERT INTO `attr_val` VALUES ('125', '256GB', '10');
INSERT INTO `attr_val` VALUES ('126', '512GB', '10');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `banner_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES ('1', '4', 'b1', '123', 'img/2025/11/08/xKHOWho3zsO6Queq9GnX.jpg', '456', '2025-11-02 19:28:13', '2025-11-08 16:09:23');
INSERT INTO `banners` VALUES ('2', '4', 'b2', '111', 'img/2025/11/08/JhppZ1IWKAuscn4i7Fdu.jpg', '456', '2025-11-02 19:43:27', '2025-11-08 16:09:32');
INSERT INTO `banners` VALUES ('4', '11', '546546', '6464', 'img/2025/11/02/1aj04C0apYOPvx1Sjdqv.png', '6464', '2025-11-02 19:58:37', '2025-11-02 19:58:37');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `brand_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', '13', '华为', null, '这是华为的', 'img/2025/11/03/9NeKhfY4hT8Z14c5iFvo.jpg', '2025-11-03 15:31:09', '2025-11-15 17:16:45');
INSERT INTO `brands` VALUES ('2', '13', '三星', null, '这是三星', 'img/2025/11/03/0wO2dKsXmx14RXGsmGvz.jpg', '2025-11-03 15:32:18', '2025-11-15 17:16:57');
INSERT INTO `brands` VALUES ('3', '13', '苹果', null, '这是苹果的', 'img/2025/11/03/XpGvsAGiJYgmgZm5Q5oF.jpg', '2025-11-03 15:32:30', '2025-11-15 17:17:05');

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates` (
  `cate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `relation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `cates_parent_id_index` (`parent_id`),
  KEY `cates_order_index` (`order`),
  KEY `cates_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES ('1', '商品列表', '/good', '1', 'good', '商品分类', '0', '1', '1', 'img/2025/10/24/8vBz3ZWgyPwOVN18dIhS.png', '13255554646', '4566564', '2025-10-24 15:19:25', '2025-11-07 20:48:05');
INSERT INTO `cates` VALUES ('3', '轮播图', null, '1', 'banner', null, '0', '2', '0', null, null, null, '2025-10-24 16:50:50', '2025-11-07 18:43:35');
INSERT INTO `cates` VALUES ('4', '首页轮播图', 'admin/banner', '2', null, null, '3', '1', '1', null, null, null, '2025-10-25 00:12:34', '2025-11-01 14:16:50');
INSERT INTO `cates` VALUES ('7', '手机', null, '2', null, null, '1', '1', '1', null, null, null, '2025-10-25 02:28:40', '2025-11-03 15:56:17');
INSERT INTO `cates` VALUES ('11', '测试3级', null, '3', null, null, '4', '1', '1', null, null, null, '2025-11-02 14:45:46', '2025-11-02 14:45:46');
INSERT INTO `cates` VALUES ('12', '品牌列表', '/brand', '1', 'brand', null, '0', '3', '1', null, null, null, '2025-11-03 15:08:58', '2025-11-07 20:48:18');
INSERT INTO `cates` VALUES ('13', '品牌', null, '2', null, null, '12', '1', '1', null, null, null, '2025-11-03 15:10:26', '2025-11-15 17:37:13');
INSERT INTO `cates` VALUES ('15', '电脑', null, '2', null, null, '1', '2', '1', null, null, null, '2025-11-03 15:56:35', '2025-11-07 18:42:21');
INSERT INTO `cates` VALUES ('18', '文章列表', '/post', '1', 'post', null, '0', '4', '1', null, null, null, '2025-11-06 12:07:34', '2025-11-07 20:48:25');
INSERT INTO `cates` VALUES ('19', '测试文章', null, '2', null, null, '18', '1', '1', null, null, null, '2025-11-06 12:11:36', '2025-11-27 17:59:51');
INSERT INTO `cates` VALUES ('20', '前端技术', null, '2', null, null, '18', '1', '1', null, null, null, '2025-11-06 12:11:50', '2025-11-27 17:37:03');
INSERT INTO `cates` VALUES ('21', '后端技术', null, '2', null, null, '18', '1', '1', null, null, null, '2025-11-27 17:37:23', '2025-11-27 17:37:23');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
INSERT INTO `failed_jobs` VALUES ('1', '2d7e2b65-fa50-444b-a6b1-33ad9fc623c4', 'redis', 'default', '{\"uuid\":\"2d7e2b65-fa50-444b-a6b1-33ad9fc623c4\",\"timeout\":60,\"id\":\"7EXMXoKPBdUImlKwqlGLEi9WhoTBWIvY\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:44\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(46): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#40 {main}', '2025-11-26 17:45:27');
INSERT INTO `failed_jobs` VALUES ('2', '60c076d4-f4c0-45c0-a9e2-4981b6d6231b', 'redis', 'default', '{\"uuid\":\"60c076d4-f4c0-45c0-a9e2-4981b6d6231b\",\"timeout\":60,\"id\":\"ceGdwDTQrO8gotLN9oE0GdiXBhF4S1CE\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:44\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(46): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#40 {main}', '2025-11-26 17:46:00');
INSERT INTO `failed_jobs` VALUES ('3', 'ddf5fef3-b1bb-457d-8c04-f210273046d0', 'redis', 'default', '{\"uuid\":\"ddf5fef3-b1bb-457d-8c04-f210273046d0\",\"timeout\":60,\"id\":\"CsmqLj4leEogAESelEPmJjgxD5tm4wVK\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:44\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(46): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#40 {main}', '2025-11-26 17:47:43');
INSERT INTO `failed_jobs` VALUES ('4', 'a3c808e8-1a28-4cbe-b94c-48982d94fa58', 'redis', 'default', '{\"uuid\":\"a3c808e8-1a28-4cbe-b94c-48982d94fa58\",\"timeout\":60,\"id\":\"zY0AWgVIDS6alnBgQUs50t4mZ6mkV77e\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:44\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(46): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#40 {main}', '2025-11-26 17:54:17');
INSERT INTO `failed_jobs` VALUES ('5', '5d51096f-aed8-4bbd-82ad-48ff70a73b96', 'redis', 'default', '{\"uuid\":\"5d51096f-aed8-4bbd-82ad-48ff70a73b96\",\"timeout\":60,\"id\":\"ouWylh2IJUur6EZYWweaPXhs1TDyWura\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:44\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(46): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#40 {main}', '2025-11-26 17:56:36');
INSERT INTO `failed_jobs` VALUES ('6', 'c0d3ccd6-4f43-4449-b252-c100d3185080', 'redis', 'default', '{\"uuid\":\"c0d3ccd6-4f43-4449-b252-c100d3185080\",\"timeout\":60,\"id\":\"JHbntd3AWo34BtAjCMJt7bMqNgjhhk9X\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:58\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(58): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(43): App\\Jobs\\ProcessUserVisit->updateStats()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#40 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#41 {main}', '2025-11-26 18:00:46');
INSERT INTO `failed_jobs` VALUES ('7', 'b84b67f3-6cb7-4daf-8d7f-cb5e15d0c7e2', 'redis', 'default', '{\"uuid\":\"b84b67f3-6cb7-4daf-8d7f-cb5e15d0c7e2\",\"timeout\":60,\"id\":\"Ebm2NPMQc2iQBW2TtLUffwoT8XDZrWHL\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:58\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(58): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(43): App\\Jobs\\ProcessUserVisit->updateStats()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#40 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#41 {main}', '2025-11-26 18:03:04');
INSERT INTO `failed_jobs` VALUES ('8', '99f56f48-2b28-46c5-8cbb-9df8337d4b2b', 'redis', 'default', '{\"uuid\":\"99f56f48-2b28-46c5-8cbb-9df8337d4b2b\",\"timeout\":60,\"id\":\"MF9CRHXv7uw6EeQUo5F2bXTqCVKIO4FX\",\"backoff\":null,\"displayName\":\"App\\\\Jobs\\\\ProcessUserVisit\",\"maxTries\":3,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:25:\\\"App\\\\Jobs\\\\ProcessUserVisit\\\":1:{s:7:\\\"post_id\\\";s:1:\\\"1\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessUserVisit\"},\"attempts\":2}', 'ErrorException: Undefined variable $post_id in D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php:58\nStack trace:\n#0 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(58): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(43): App\\Jobs\\ProcessUserVisit->updateStats()\n#3 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): App\\Jobs\\ProcessUserVisit->App\\Jobs\\{closure}()\n#4 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction()\n#5 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call()\n#6 D:\\phpstudy_pro\\WWW\\laravel\\app\\Jobs\\ProcessUserVisit.php(44): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#7 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessUserVisit->handle()\n#8 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#12 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#13 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#14 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#16 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#17 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#18 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then()\n#20 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#21 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#22 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(425): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process()\n#24 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob()\n#25 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#26 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#27 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#29 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#30 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#31 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(661): Illuminate\\Container\\BoundMethod::call()\n#32 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call()\n#33 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Command\\Command.php(291): Illuminate\\Console\\Command->execute()\n#34 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(153): Symfony\\Component\\Console\\Command\\Command->run()\n#35 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run()\n#36 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#37 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#38 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run()\n#39 D:\\phpstudy_pro\\WWW\\laravel\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run()\n#40 D:\\phpstudy_pro\\WWW\\laravel\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#41 {main}', '2025-11-26 18:05:17');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` json DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `specifications` json DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`good_id`),
  UNIQUE KEY `goods_sku_unique` (`sku`),
  KEY `goods_is_active_sort_order_index` (`is_active`,`sort_order`),
  KEY `goods_brand_id_index` (`brand_id`)INSERT INTO `goods` VALUES ('5', 'Iphone13', '活力版新品前后双5000万超清影像', '<p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01CL90Zv1VubcjSSSOu_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"\" data-spm-anchor-id=\"pc_detail.30350276.202205.i6.a54f7dd6NUSoky\"/></p><p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01oAet5U1VubcjOpHLz_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"\"/></p><p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01X43brI1VubciW246f_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"\"/></p><p><a href=\"https://pages.tmall.com/wow/a/act/tmall/dailyact/20212/20868/wupr?spm=pc_detail.30350276.202205.1.7aea7dd6keF1Ss&wh_pid=dailyAct-527288&disableNav=YES&status_bar_transparent=true&spm=a2141.7631564.1999060322.hot_area5\" class=\"descV8-hotArea\" style=\"width: 319.3548275157809px;\r\n                height: 143.95163496655803px;\r\n                top: 315.7257925358511px;\r\n                left: 43.548387475311756px;\"></a> &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"//img.alicdn.com/imgextra/i3/2838892713/O1CN011BcWdT1VubcjPMyw8_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"\"/></p>', '8888.00', '9999.00', '12344', '789789797946', 'img\\/2025\\/11\\/04\\/Px8gSeGtt8lPRpSQvdqy.jpg', '[\"img/2025/11/04/KPYt91V09DnmsdJbmagV.jpg\", \"img/2025/11/04/JTk1KZPo4geXheqz2QHB.jpg\", \"img/2025/11/04/somfRcehm3e7QXNrgDXA.jpg\"]', '1', '1', '13', '[{\"name\": \"长焦像素\", \"value\": \"1200万像素\"}, {\"name\": \"机身颜色\", \"value\": \"羽砂黑 冰晶蓝 凝霜白\"}, {\"name\": \"最大光圈\", \"value\": \"F1.9\"}]', '3', '2025-11-04 17:15:38',null,null);
INSERT INTO `goods` VALUES ('6', '三星', '人脸识别,鸿蒙安全纯净防诈', '<p>这是三星的手机</p>', '8888.00', '9999.00', '8888882', '4649468461646', 'img/2025/11/08/5dCUtLpKVDibkJOQwX5P.jpg', '[\"img/2025/11/08/Qwo5BEFPUKFyckTawejg.jpg\", \"img/2025/11/08/J1ek6YbpzSpRA1GYJxAV.jpg\", \"img/2025/11/08/R8tMvlJpedIJGjXeVWm8.jpg\"]', '1', '1', '0', '[{\"name\": \"解锁方式\", \"value\": \"侧边指纹 面部识别\"}, {\"name\": \"前置摄像头\", \"value\": \"5000万像素\"}]', '2', '2025-11-08 15:14:59',null,null);
INSERT INTO `goods` VALUES ('7', 'Mete 70', '高清摄像,人脸识别,卫星通话,', '<p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01CL90Zv1VubcjSSSOu_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"width: 750px;\" data-spm-anchor-id=\"pc_detail.30350276.202205.i6.a54f7dd6NUSoky\"/></p><p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01oAet5U1VubcjOpHLz_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"width: 750px;\"/></p><p><img src=\"//img.alicdn.com/imgextra/i1/2838892713/O1CN01X43brI1VubciW246f_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"width: 750px;\"/></p><p><a href=\"https://pages.tmall.com/wow/a/act/tmall/dailyact/20212/20868/wupr?spm=pc_detail.30350276.202205.1.7aea7dd6keF1Ss&wh_pid=dailyAct-527288&disableNav=YES&status_bar_transparent=true&spm=a2141.7631564.1999060322.hot_area5\" class=\"descV8-hotArea\" style=\"width: 319.3548275157809px;\r\n                height: 143.95163496655803px;\r\n                top: 315.7257925358511px;\r\n                left: 43.548387475311756px;\"></a> &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"//img.alicdn.com/imgextra/i3/2838892713/O1CN011BcWdT1VubcjPMyw8_!!2838892713.jpg\" data-name=\"singleImage\" class=\"descV8-singleImage-image lazyload\" style=\"width: 750px;height: 472.98387096774195px;\"/></p>', '9999.00', '12888.00', '888', '546416464344646', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '[\"img/2025/11/09/bAQP5L7s96QwHBMfKA2f.jpg\", \"img/2025/11/09/5fVwCVAgtWXccvffFKYH.jpg\", \"img/2025/11/09/gD0fy4JqP0sLi87H0Qfk.jpg\"]', '1', '1', '0', '[{\"name\": \"长焦像素\", \"value\": \"1200万像素\"}, {\"name\": \"蓝牙版本\", \"value\": \"5.2\"}, {\"name\": \"无线充电功率\", \"value\": \"20W\"}]', '1', '2025-11-09 16:22:57',null,null);
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------


-- ----------------------------
-- Table structure for good_cate
-- ----------------------------
DROP TABLE IF EXISTS `good_cate`;
CREATE TABLE `good_cate` (
  `good_cate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` bigint(20) unsigned NOT NULL,
  `cate_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`good_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of good_cate
-- ----------------------------
INSERT INTO `good_cate` VALUES ('11', '5', '15');
INSERT INTO `good_cate` VALUES ('13', '6', '7');
INSERT INTO `good_cate` VALUES ('14', '7', '7');
INSERT INTO `good_cate` VALUES ('15', '7', '15');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2014_10_12_200000_add_two_factor_columns_to_users_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('5', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('6', '2025_10_18_134844_create_sessions_table', '1');
INSERT INTO `migrations` VALUES ('7', '2025_10_19_195952_create_admins_table', '1');
INSERT INTO `migrations` VALUES ('8', '2025_10_21_144852_creat_permission_table', '2');
INSERT INTO `migrations` VALUES ('9', '2025_10_21_144941_creat_roles_table', '2');
INSERT INTO `migrations` VALUES ('10', '2025_10_21_150602_creat_role_admin_table', '2');
INSERT INTO `migrations` VALUES ('11', '2025_10_21_150623_creat_role_permission_table', '2');
INSERT INTO `migrations` VALUES ('12', '2025_10_22_124741_creat_permisson_cate_table', '3');
INSERT INTO `migrations` VALUES ('14', '2025_10_24_135947_creat_cates_table', '4');
INSERT INTO `migrations` VALUES ('16', '2025_11_01_131309_creat_banners_table', '5');
INSERT INTO `migrations` VALUES ('18', '2025_11_03_144020_create_brands_table', '6');
INSERT INTO `migrations` VALUES ('19', '2025_11_03_144107_create_good_cate_table', '6');
INSERT INTO `migrations` VALUES ('20', '2025_11_03_132548_create_goods_table', '7');
INSERT INTO `migrations` VALUES ('23', '2025_11_04_155221_creat_attr_name_table', '8');
INSERT INTO `migrations` VALUES ('26', '2025_11_04_155257_creat_attr_val_table', '9');
INSERT INTO `migrations` VALUES ('27', '2025_11_04_160025_creat_attr_price_table', '10');
INSERT INTO `migrations` VALUES ('30', '2025_11_06_121353_creat_post_table', '11');
INSERT INTO `migrations` VALUES ('31', '2025_11_11_142208_creat_order_table', '12');
INSERT INTO `migrations` VALUES ('32', '2025_11_11_143337_creat_order_item_table', '12');
INSERT INTO `migrations` VALUES ('33', '2025_11_12_131829_creat_address_table', '13');
INSERT INTO `migrations` VALUES ('34', '0000_00_00_000000_create_websockets_statistics_entries_table', '14');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) NOT NULL COMMENT '实际支付金额',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '订单状态',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `paid_at` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '订单备注',
  `address` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `express_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `express_info` text COLLATE utf8mb4_unicode_ci,
  `express_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_order_no_unique` (`order_no`),
  KEY `orders_order_no_index` (`order_no`),
  KEY `orders_id_index` (`id`),
  KEY `orders_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('26', '2025112718434569639', '1', '8888.00', '8888.00', 'shipped', '1', null, '张三', '15412341234', null, '\"\\u4e91\\u5357\\u4fdd\\u5c71\\u5e02\\u817e\\u51b2\\u53bf\\u8def1000\\u53f7\\u6c47\\u4e9a\\u5927\\u53a620\\u697c\"', '2025-11-27 18:43:45', '2025-11-27 21:23:45', '464564646465', '5463464', '顺丰', '1345646');
INSERT INTO `orders` VALUES ('27', '2025112718462893473', '1', '9999.00', '9999.00', 'pending', '1', null, '张三', '15412341234', null, '\"\\u4e91\\u5357\\u4fdd\\u5c71\\u5e02\\u817e\\u51b2\\u53bf\\u8def1000\\u53f7\\u6c47\\u4e9a\\u5927\\u53a620\\u697c\"', '2025-11-27 18:46:28', '2025-11-27 18:46:28', null, null, null, null);
INSERT INTO `orders` VALUES ('28', '2025112718505732566', '1', '1111.00', '1111.00', 'pending', '1', null, '编辑', '18812341234', null, '\"\\u8d35\\u5dde\\u9ed4\\u897f\\u5357\\u5e03\\u4f9d\\u65cf\\u82d7\\u65cf\\u81ea\\u6cbb\\u5dde\\u8d1e\\u4e30\\u53bf464\"', '2025-11-27 18:50:57', '2025-11-27 18:50:57', null, null, null, null);
INSERT INTO `orders` VALUES ('29', '2025112719430381516', '1', '28886.00', '28886.00', 'pending', '1', null, '编辑', '18812341234', null, '\"\\u8d35\\u5dde\\u9ed4\\u897f\\u5357\\u5e03\\u4f9d\\u65cf\\u82d7\\u65cf\\u81ea\\u6cbb\\u5dde\\u8d1e\\u4e30\\u53bf464\"', '2025-11-27 19:43:03', '2025-11-27 19:43:03', null, null, null, null);
INSERT INTO `orders` VALUES ('30', '2025112816050424785', '1', '9999.00', '9999.00', 'pending', '1', null, '编辑', '18812341234', null, '\"\\u8d35\\u5dde\\u9ed4\\u897f\\u5357\\u5e03\\u4f9d\\u65cf\\u82d7\\u65cf\\u81ea\\u6cbb\\u5dde\\u8d1e\\u4e30\\u53bf464\"', '2025-11-28 16:05:04', '2025-11-28 16:05:04', null, null, null, null);
INSERT INTO `orders` VALUES ('31', '2025112816241099855', '1', '9999.00', '9999.00', 'pending', '1', null, '编辑', '18812341234', null, '\"\\u8d35\\u5dde\\u9ed4\\u897f\\u5357\\u5e03\\u4f9d\\u65cf\\u82d7\\u65cf\\u81ea\\u6cbb\\u5dde\\u8d1e\\u4e30\\u53bf464\"', '2025-11-28 16:24:10', '2025-11-28 16:24:10', null, null, null, null);
INSERT INTO `orders` VALUES ('32', '2025112817163033147', '4', '19998.00', '19998.00', 'pending', '1', null, '123', '123586456', '1564646', '\"\\u5317\\u4eac\\u5e02\\u8f96\\u533a\\u5d07\\u6587\\u533a1646\"', '2025-11-28 17:16:30', '2025-11-28 17:16:30', null, null, null, null);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `good_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `good_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品属性',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图片',
  `good_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `total_price` decimal(10,2) NOT NULL COMMENT '商品总价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_item_order_id_index` (`order_id`),
  KEY `order_item_good_id_index` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('21', '26', '6', '三星', null, 'img/2025/11/08/5dCUtLpKVDibkJOQwX5P.jpg', '8888.00', '1', '8888.00', null, null);
INSERT INTO `order_item` VALUES ('22', '27', '7', 'Mete 70', '{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"256GB\"}', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '9999.00', '1', '9999.00', null, null);
INSERT INTO `order_item` VALUES ('23', '28', '5', 'Iphone13', '{\"\\u578b\\u53f7\":\"Min\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"256GB\"}', 'img\\/2025\\/11\\/04\\/Px8gSeGtt8lPRpSQvdqy.jpg', '1111.00', '1', '1111.00', null, null);
INSERT INTO `order_item` VALUES ('24', '29', '7', 'Mete 70', '{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"256GB\"}', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '9999.00', '2', '19998.00', null, null);
INSERT INTO `order_item` VALUES ('25', '29', '6', '三星', null, 'img/2025/11/08/5dCUtLpKVDibkJOQwX5P.jpg', '8888.00', '1', '8888.00', null, null);
INSERT INTO `order_item` VALUES ('26', '30', '7', 'Mete 70', '{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"256GB\"}', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '9999.00', '1', '9999.00', null, null);
INSERT INTO `order_item` VALUES ('27', '31', '7', 'Mete 70', '{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"512GB\"}', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '9999.00', '1', '9999.00', null, null);
INSERT INTO `order_item` VALUES ('28', '32', '7', 'Mete 70', '{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5b58\\u50a8\\u5927\\u5c0f\":\"512GB\"}', 'img/2025/11/09/0Iqm2GQFOTzgC8aPNM82.jpg', '9999.00', '2', '19998.00', null, null);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('8', '角色管理', 'role.index', '角色的设置', '角色管理', '2025-10-21 16:32:56', '2025-10-23 09:55:44');
INSERT INTO `permissions` VALUES ('9', '权限分类管理', 'permission.cate', '权限分类的管理', '权限分类', '2025-10-22 17:24:43', '2025-10-23 10:09:32');
INSERT INTO `permissions` VALUES ('12', '权限查看', 'permission.index', '查看所以的权限规则', '权限管理', '2025-10-22 19:09:53', '2025-10-22 19:09:53');
INSERT INTO `permissions` VALUES ('13', '用户管理', 'user.index', '用户的所有权限', '用户管理', '2025-10-23 10:08:17', '2025-10-23 10:08:17');
INSERT INTO `permissions` VALUES ('14', '轮播图', 'banner.index', '轮播图管理', '前端页面', '2025-11-01 14:31:02', '2025-11-01 14:31:33');
INSERT INTO `permissions` VALUES ('15', '品牌', 'brand.index', '品牌管理', '前端页面', '2025-11-03 15:18:03', '2025-11-03 15:18:03');
INSERT INTO `permissions` VALUES ('16', '商品', 'good.index', '商品管理', '前端页面', '2025-11-03 16:00:06', '2025-11-03 16:00:06');
INSERT INTO `permissions` VALUES ('17', '文章', 'post.index', '文章管理', '前端页面', '2025-11-06 13:22:46', '2025-11-06 13:22:46');

-- ----------------------------
-- Table structure for permission_cate
-- ----------------------------
DROP TABLE IF EXISTS `permission_cate`;
CREATE TABLE `permission_cate` (
  `permission_cate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_cate_id`),
  UNIQUE KEY `permission_cate_cate_name_unique` (`cate_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_cate
-- ----------------------------
INSERT INTO `permission_cate` VALUES ('1', '角色管理', '2025-10-22 14:03:32', '2025-10-22 14:03:32');
INSERT INTO `permission_cate` VALUES ('2', '权限分类', '2025-10-22 14:06:14', '2025-10-22 16:17:46');
INSERT INTO `permission_cate` VALUES ('3', '权限管理', '2025-10-22 14:37:04', '2025-10-22 16:17:58');
INSERT INTO `permission_cate` VALUES ('7', '用户管理', '2025-10-22 17:15:04', '2025-10-22 17:15:04');
INSERT INTO `permission_cate` VALUES ('8', '前端页面', '2025-11-01 14:31:20', '2025-11-01 14:31:20');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('17', '1', '12', null, null);
INSERT INTO `permission_role` VALUES ('20', '2', '12', null, null);
INSERT INTO `permission_role` VALUES ('26', '1', '9', null, null);
INSERT INTO `permission_role` VALUES ('27', '1', '8', null, null);
INSERT INTO `permission_role` VALUES ('28', '1', '13', null, null);
INSERT INTO `permission_role` VALUES ('29', '3', '8', null, null);
INSERT INTO `permission_role` VALUES ('30', '3', '9', null, null);
INSERT INTO `permission_role` VALUES ('31', '3', '12', null, null);
INSERT INTO `permission_role` VALUES ('32', '4', '9', null, null);
INSERT INTO `permission_role` VALUES ('33', '1', '14', null, null);
INSERT INTO `permission_role` VALUES ('34', '1', '15', null, null);
INSERT INTO `permission_role` VALUES ('35', '1', '16', null, null);
INSERT INTO `permission_role` VALUES ('36', '1', '17', null, null);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES ('14', 'App\\Models\\User', '2', 'auth_token', '5c244e78c29be1baf8482aa4351d0aa9f2d956f7b0e5002a5ecae68c7d516048', '[\"*\"]', null, null, '2025-11-02 22:15:43', '2025-11-02 22:15:43');
INSERT INTO `personal_access_tokens` VALUES ('48', 'App\\Models\\User', '4', 'auth_token', '6ea3e1ecb9ed8345afe4f16b49e770e57a4d8f43adca433c68f678fecae8de3b', '[\"*\"]', '2025-11-28 17:34:49', null, '2025-11-28 17:12:57', '2025-11-28 17:34:49');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view_count` int(10) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `posts_slug_unique` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '19', '智慧康养新探索 看机器人如何当银发族“贴心帮手”3', '', '<p data-spm-anchor-id=\"C44678610902.P0JAv8KVI6ez.0.i0\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">10月29日，中央广播电视总台“智享未来——保姆机器人大会”成都智慧康养机器人展演在成都启动，多款面向老年群体的智能机器人新品集中亮相。<br/></p><p data-spm-anchor-id=\"C44678610902.P0JAv8KVI6ez.0.i1\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">随着人口老龄化进程加快，如何借助科技力量提升养老服务质量成为社会关注的焦点。近日，总台记者走访成都多家养老机构，实地探访智慧康养机器人的应用成效，探究机器人如何成为银发族的“贴心帮手”。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>生活照料：日常起居更便利</strong></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">走进成都部分养老机构，我们能看到机器人在饮食、起居等日常场景中发挥着重要作用。厨房里，炒菜机器人能够精准控制火候与调味，制作出口感适宜的菜肴，并能根据老人的健康状况、饮食禁忌和口味偏好定制个性化菜单。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">对于行动不便或长期卧床的老人，洗浴是一大难题。目前，部分机构已引入便携式助浴机器人，采用“清水出、污水回”的闭环系统，实现无水化清洁，在保持老人身体干爽的同时，也能更好地维护个人尊严。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>健康护航：身心状态更向好</strong></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">在成都高新区某养老机构的康复区，多位老人正借助机器人进行系统化训练。下肢无力的老人在康复机器人支撑下完成蹬腿动作，手部灵活度下降的老人则通过手功能训练仪，跟随屏幕提示进行抓握与伸展练习。这些设备不仅能辅助老人完成标准化康复训练，还可根据实时身体反馈智能调整力度，有助于延缓身体机能退化。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">在健康监测与管理方面，智能设备同样表现突出。脑影像CT机器人可自主移动至老人床边，30秒内完成脑部检查；送药机器人通过建立电子健康档案与多重身份核验机制，确保老人用药安全、准确、及时。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>暖心服务：晚年生活更安心</strong></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">智慧康养机器人的服务不止于功能，更在于温度。如今它们不仅能日常聊天，还能成为老人的“兴趣知音”。比如，机器人能够以专业视角点评书法作品，并主动将作品分享给其他老人，帮助老年人在兴趣爱好中获得成就感与归属感。搭载红外跌倒检测传感器的机器人“洋洋”，能在感知到老人跌倒时立即停止移动并主动询问。若未得到回应，系统将自动联系护理站，同步发送老人位置信息，为紧急救援争取宝贵时间</p><p><br/></p>', '10月29日，中央广播电视总台“智享未来——保姆机器人大会”成都智慧康养机器人展演在成都...', 'img/2025/11/06/5lUc7eeCkiAnN2yGmMKM.png', '1', '2025-11-07 00:15:22', '1', null, null, '2025-11-06 23:04:21', '2025-11-26 18:51:19', '6');
INSERT INTO `posts` VALUES ('5', '19', '开放人文家园！2025“东盟伙伴”媒体合作周在广西开幕', '2025', '<p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">11月3日，由中央广播电视总台和广西壮族自治区人民政府共同主办的2025“东盟伙伴”媒体合作周在广西南宁开幕。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p2.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317053163612.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">老挝人民革命党中央书记处书记、中央宣传部部长坎潘·培亚冯作视频致辞。中央广播电视总台副总编辑、CGTN总编辑范昀，广西壮族自治区党委常委、宣传部部长陈奕君，柬埔寨新闻部国务秘书肯·顾纳瓦，缅甸宣传部副部长耶丁，泰国媒体发展基金会首席执行官塔纳功·习素塞出席开幕式并致辞。柬埔寨新闻部副国务秘书布拉·涛阿米达，柬埔寨仙女广播电视台台长科瓦·阿提亚出席活动。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p4.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317054913054.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">本届活动以“开放、人文、家园”为主题，来自中国和东盟国家的200余位政府官员、驻华使节、媒体人士、专家学者等齐聚一堂，开展深层次对话交流，探讨合作共赢之道，为构建更为紧密的中国—东盟命运共同体汇聚媒体力量。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p3.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317060628956.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>中央广播电视总台副总编辑、CGTN总编辑范昀</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">范昀在致辞中表示，中国共产党二十届四中全会审议通过了“十五五”规划建议，对扩大高水平对外开放、高质量共建“一带一路”等重大任务作出新部署。本届“东盟伙伴”媒体合作周，正是中央广播电视总台以媒体力量进一步加强中国—东盟全面战略伙伴关系的积极举措。总台将以“开放”为帆，与东盟伙伴进一步探索人工智能、大数据、云计算等创新技术在传媒领域的应用，让媒体合作成果更好惠及区域各国人民；以“人文”为脉，与东盟伙伴策划开展更多连民心、接地气、有温度的人文交流活动；以“家园”为锚，继续发挥总台85种语言、CGTN融媒体平台、192个海外站点等国际传播优势，讲好中国—东盟合作共赢的故事。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p4.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317062397468.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>广西壮族自治区党委常委、宣传部部长陈奕君</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">陈奕君在致辞中表示，广西着力构建“北上广研发+广西集成+东盟应用”的跨境产业生态，携手东盟伙伴深化智能传播、研发应用，让人工智能发展成果广泛惠及中国—东盟民众。中国共产党二十届四中全会提出全面实施“人工智能+”行动，释放出中国与世界各国共享机遇的强烈信号。广西愿携手东盟伙伴，打造“AI+媒体”创新发展新高地，聚焦智能内容生成、跨文化传播等领域深化合作；探索区域协同传播新范式，推动优质内容互译互播，扩大全球南方传播声量；以媒体为支点，撬动文旅、科教、农业等领域协同发展，推出更多融通中外、共情共鸣的人文交流产品，促进中国与东盟各国文化交流交融和价值共振，谱写文明互鉴新篇章。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p4.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317064834834.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>老挝人民革命党中央书记处书记、中央宣传部部长坎潘·培亚冯</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">坎潘·培亚冯在视频致辞中表示，本届活动不仅体现了合作精神，也再次印证了中国与东盟各国人民之间长期而深厚的友谊纽带。在这个瞬息万变的数字时代，媒体不再只是新闻报道者，更是连接文化、增进理解的重要“桥梁”。中国与东盟山水相连、地缘相近，媒体有责任架起友谊之桥，携手讲好合作与发展的建设性故事，共同打造一个稳定、强大、可持续的“命运共同家园”。老挝愿与中国和其他东盟成员国一道深化媒体合作，相信本次合作周将成为我们“启迪新思维、开辟新路径”的重要平台，把媒体合作提升到新的高度。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p2.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317070612208.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>柬埔寨新闻部国务秘书肯·顾纳瓦</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">肯·顾纳瓦在致辞中表示，柬中两国传统友谊源远流长，媒体间合作稳固而富有成效。越来越多的柬埔寨年轻一代，正在通过短视频与社交媒体，生动讲述柬中合作的日常故事，搭建起两国人民相互理解与文化共鸣的坚实桥梁。未来，东盟与中国可以深化媒体交流与合作，携手应对数字时代挑战，赋能新一代媒体人才，深化数字经济报道合作。柬埔寨愿继续与中国及所有东盟伙伴一道，携手构建一个开放、创新、共融的媒体格局，照亮我们共同的家园。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p5.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317072382978.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em data-spm-anchor-id=\"C12995884918.PEjam1q4opV5.0.i1\" style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>缅甸宣传部副部长耶丁</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">耶丁在致辞中表示，媒体不仅是新闻传播者，更是国家、人民与文化之间的桥梁。通过负责任的媒体合作，我们能够促进开放，尊重差异、增进理解、凝聚力量。面对当今数字化迅速发展的时代，我们亟需在媒体领域深化合作，共同传播真实信息，促进沟通交流，提升公众认知。相信通过团结协作、深化文化交流与加强媒体合作，能够进一步增强社会凝聚力，促进各国人民之间的交流，共同塑造一个以和平、创新与相互尊重为核心的区域媒体新格局。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p1.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317074397610.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p class=\"photo_alt_20190808\" style=\"text-size-adjust: none; padding: 0px; margin: 0px auto 30px; list-style: none; line-height: 23px; color: rgb(143, 143, 143); width: 1000px; text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><em style=\"display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1565315968922641/tujianjie_18897_1908011.png&quot;) 0px 0px no-repeat; width: 16px; height: 10px; margin-right: 10px;\"></em>泰国媒体发展基金会首席执行官塔纳功·习素塞</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">塔纳功·习素塞在致辞中表示，今年是中泰建交50周年，双方在各领域合作不断深化拓展，在文化领域尤为突出。媒体作为超越国界的世界语言，是增进相互理解、深化友谊的重要桥梁。近年来，中国的音乐、电视剧、电影及其他多种形式的文艺作品，特别是通过数字技术传播的作品，日益受到泰国民众喜爱。泰国愿意与中国加强沟通与协作，共同推动媒体与创意文化产业的能力建设。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p3.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317080490120.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">“‘东盟伙伴’一起看中国”中外记者联合采访活动在开幕式上启动。来自东盟国家的主流媒体记者，将与总台及广西媒体记者一起深入广西开展采访，多角度、立体化呈现中国高质量发展的强劲脉动和对外开放合作的丰硕成果。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">中央广播电视总台与广西壮族自治区相关单位、东盟相关媒体的一系列最新合作成果在活动现场发布。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p2.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317081217692.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">人工智能赋能南宁城市形象传播项目现场启动。项目将依托总台优质平台和“央视听大模型2.0”，充分展现南宁经济社会高质量发展成就和人工智能产业应用场景，推动南宁市与东盟媒体交往交流、携手合作，助力南宁市加快建设面向东盟开放合作的国际化大都市。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p5.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317082082046.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">中央广播电视总台与广西壮族自治区文旅部门、泰国媒体发展基金会合作推出“跟着微短剧游桂泰”文旅推荐活动。该活动将深度融合文化、旅游、科技等元素，推动文化交流、树立合作典范，展现广西与泰国的独特风情和文化魅力。</p><p class=\"photo_img_20190808\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 0px; color: rgb(51, 51, 51); text-align: center; font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);\"><img src=\"https://p2.img.cctvpic.com/photoworkspace/contentimg/2025/11/03/2025110317082789970.jpeg\" alt=\"\" style=\"border: 0px; display: block; max-width: 1000px; margin: 0px auto;\"/></p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">活动现场还举行了中央广播电视总台IP授权仪式。总台将与广西出版传媒集团合作，依托重点节目和品牌栏目，共同开发出版图书、漫画书等文化产品。</p><p style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">本次合作周还将举办中国—东盟青年媒体人对话会，双方青年媒体人将围绕“人工智能赋能文化传媒”等主题，探讨媒体创新发展与合作。</p><p data-spm-anchor-id=\"C12995884918.PEjam1q4opV5.0.i2\" style=\"text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 30px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; text-wrap-mode: wrap; background-color: rgb(255, 255, 255); text-indent: 2em;\">中央广播电视总台相关部门及广西总站负责同志，广西壮族自治区、南宁市、柳州市有关部门负责同志，东盟国家驻邕领事官员等参加活动。</p><p><br/></p>', '11月3日，由中央广播电视总台和广西壮族自治区人民政府共同主办的2025“东盟伙伴”媒体...', 'img/2025/11/06/ShXXG90uYZQesGo0AiMn.png', '1', '2025-11-16 14:38:02', '1', null, null, '2025-11-06 23:27:49', '2025-11-26 18:52:37', '2');
INSERT INTO `posts` VALUES ('17', '19', '丹青刻岁月 石窟映千年', null, '<p>散布在陇原大地上的一处处石窟\r\n是镌刻在崖壁上的文明瑰宝\r\n承载着悠久的文化记忆\r\n印证了中华文明多元一体\r\n\r\n2025年10月30日，在敦煌石窟文物保护研究陈列中心，游客使用AR设备在复制洞窟参观体验。\r\n\r\n这是敦煌莫高窟第323窟的张骞出使西域图（资料照片）。\r\n\r\n位于甘肃瓜州县的榆林窟（2025年10月31日摄，无人机照片）。\r\n\r\n2025年7月16日，游客在麦积山石窟参观。\r\n\r\n牢记嘱托\r\n甘肃在石窟艺术保护传承上\r\n持续发力\r\n不断壮大人才队伍\r\n广泛应用技术手段\r\n还原历史肌理\r\n传承千年文脉\r\n推动文保工作迈上新台阶\r\n\r\n2025年5月21日至23日，西北四省（区）文物保护工匠技能竞赛暨甘肃省第一届文物行业职业技能竞赛在兰州举行，这是来自敦煌研究院的选手杨韬在壁画文物修复比赛中（2025年5月22日摄）。本次竞赛以“守护丝路遗产·锻造大国工匠”为主题，共设木作、泥瓦作、金属、陶瓷、纸张书画、壁画文物修复和考古勘探等项目，吸引了来自青海、宁夏、甘肃、新疆四省区的100余名文物修复领域的能工巧匠参赛，旨在通过竞赛进一步发掘文物修复和考古技能人才，助力中华文化瑰宝永续传承。\r\n\r\n2024年11月2日，麦积山石窟艺术研究所保护研究室的高级文物修复师牟常有（右）和徒弟何举在麦积山石窟133窟内修复塑像。自1985年至今，牟常有在麦积山石窟艺术研究所工作已有四十年。经过多年磨砺，牟常有的文物修复技艺日臻成熟，面对年轻人的请教，他更是倾囊相授。“塑像壁画皆是凝固的历史，守护它们，需要耐心和毅力，相信年轻人能够接好接力棒，让这份珍贵的人类文化遗产永续。”牟常有说。\r\n\r\n2024年11月2日，麦积山石窟艺术研究所保护研究室的文物修复师何举在麦积山石窟133窟内修复塑像。近年来，麦积山石窟艺术研究所等文物保护部门持续加大对麦积山石窟的抢救性保护和预防性保护工作力度，积极探索现代科学技术手段与传统文物修复技艺相结合的保护修复新路径。截至目前，麦积山石窟已有80个洞窟完成整体保护修复工作。\r\n\r\n2023年8月3日，敦煌研究院文物数字化研究所的工作人员在展示莫高窟彩塑三维重建的成果。近年来，敦煌研究院持续加大文物保护基础研究和应用研究，不断加强文物科技保护力度，提升科研平台建设，为文物保护和文化遗产事业发展奠定良好基础。\r\n\r\n2023年8月3日，在敦煌研究院多场耦合实验室中，工作人员对庆阳北石窟寺砂岩样品进行三维扫描分析。2020年底，敦煌研究院建成我国文化遗产领域首个多场耦合实验室，实验室可模拟-30℃到60℃、10%至90%相对湿度以及风、雨、雪、太阳照射等各类气候条件，基础研究能力得到进一步提升。&nbsp; &nbsp; 2023年4月25日，敦煌研究院文物数字化保护团队图像采集人员熊业腾在洞窟内调试设备，准备采集壁画图像。30多年前，敦煌研究院便尝试以数字技术让古老石窟“芳华永驻”。2016年，“数字敦煌”资源库上线，首次向全球免费共享30个敦煌石窟的高清图像和全景漫游，用户足不出户就能欣赏到高清的敦煌文化数字资源，目前访问用户遍布全球78个国家，累计访问量超过2000万次。\r\n\r\n2022年4月19日，敦煌研究院文物保护技术服务中心的壁画修复师杨金礼在莫高窟第231窟内修复壁画。</p>', '散布在陇原大地上的一处处石窟\r\n是镌刻在崖壁上的文明瑰宝\r\n承载着悠久的文化记忆\r\n印...', 'img/2025/11/16/ubNSxFj29ia9yz2PMlmS.png', '1', '2025-11-16 17:20:40', '1', null, null, '2025-11-16 17:20:32', '2025-11-26 18:52:52', '2');
INSERT INTO `posts` VALUES ('18', '20', '关于本网站前端', null, '<p>前端采用VUE3框架</p>', '前端采用VUE3框架', 'img/2025/11/27/xS4Jimw5S5AbYsls34c7.png', '1', '2025-11-27 17:40:17', '1', null, null, '2025-11-27 17:40:13', '2025-11-27 17:40:17', '2');
INSERT INTO `posts` VALUES ('19', '21', '关于本网站后台', null, '<p>后端采用Laravel框架+Mysql+Redis</p>', '后端采用Laravel框架+Mysql+Redis', 'img/2025/11/27/G9TPz7tncPdhxMoZ2alC.png', '1', '2025-11-27 17:42:51', '1', null, null, '2025-11-27 17:42:19', '2025-11-27 18:04:28', '4');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', 'max', '拥有系统所有权限', '2025-10-21 16:32:56', '2025-10-22 22:03:42');
INSERT INTO `roles` VALUES ('2', '普通用户', 'user', '普通用户权限', '2025-10-21 16:32:56', '2025-10-21 16:32:56');
INSERT INTO `roles` VALUES ('3', '经理', 'master', '大部分', '2025-10-21 23:02:28', '2025-10-22 22:03:54');
INSERT INTO `roles` VALUES ('4', '测试', 'test', '测试用一下', '2025-10-22 22:04:24', '2025-10-22 22:04:24');

-- ----------------------------
-- Table structure for role_admin
-- ----------------------------
DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE `role_admin` (
  `role_admin_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_admin
-- ----------------------------
INSERT INTO `role_admin` VALUES ('5', '1', '1', null, null);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('ISm9SlwODjsLej1ueiV821AJy5KmjT3iA3KG4jN8', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVWpjMmdaMUZUSzZOdTM1aDFMV000d3hmcThraVFjSWlXWE9pa0RLbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9sc2hvcC9hZG1pbi93ZWxjb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', '1764133956');
INSERT INTO `sessions` VALUES ('JDahLUUadF87UXLnxsOHttRSrO9XuicrqxpTKU86', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ1ZoVkl2N1ZJWWtITmx4MDdRUEsyemthUXBvTkh1d0RZZW9ZOU5UTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9sc2hvcC9hZG1pbi93ZWxjb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', '1764060481');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_vip` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_address_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'test1', '18812341234', '1', '1234@qq.com', '1', null, '$2y$10$yGhPZD7ryFGURYVjMs86Ou/VyHiLmcv9ZVR34CSl6zkCTYq3mlbf2', null, null, null, null, '1', 'avatars/h6ChxU2DJStmmj2r1n3DziL1wh8WQkhDMly72wTT.jpg', '2025-10-28 13:06:20', '2025-11-28 17:12:26', '10');
INSERT INTO `users` VALUES ('3', '123456@qq.com', null, '1', '123457@qq.com', '0', null, '$2y$10$ZxzfotvPlq2ptXd.LhUryO.UderUgVxyUExcsjrt6ry4uQ4LZ7bTK', null, null, null, null, null, null, '2025-11-02 22:17:54', '2025-11-07 14:30:06', null);
INSERT INTO `users` VALUES ('4', 'test66', '13256484578', '1', '123456@qq.com', '0', null, '$2y$10$FmhJY9S2LKHHfd5/gKAjvuK.jiibyeVBUGLc5XHBDUNqthlzssDtO', null, null, null, null, null, 'avatars/VdK1H67ufRPUocXoqVDJBnejsL67ozvBeAEG7evW.jpg', '2025-11-28 16:28:39', '2025-11-28 17:16:21', '13');

-- ----------------------------
-- Table structure for websockets_statistics_entries
-- ----------------------------
DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connections_count` int(11) NOT NULL,
  `websocket_messages_count` int(11) NOT NULL,
  `api_messages_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2097 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of websockets_statistics_entries
-- ----------------------------
INSERT INTO `websockets_statistics_entries` VALUES ('1', 'local', '1', '2', '0', '2025-11-17 00:14:17', '2025-11-17 00:14:17');
INSERT INTO `websockets_statistics_entries` VALUES ('2', 'local', '1', '2', '0', '2025-11-17 00:15:17', '2025-11-17 00:15:17');
INSERT INTO `websockets_statistics_entries` VALUES ('3', 'local', '2', '4', '0', '2025-11-17 00:16:17', '2025-11-17 00:16:17');
INSERT INTO `websockets_statistics_entries` VALUES ('4', 'local', '2', '2', '0', '2025-11-17 00:17:17', '2025-11-17 00:17:17');
INSERT INTO `websockets_statistics_entries` VALUES ('5', 'local', '1', '2', '0', '2025-11-17 00:18:17', '2025-11-17 00:18:17');
INSERT INTO `websockets_statistics_entries` VALUES ('6', 'local', '1', '2', '0', '2025-11-17 00:19:17', '2025-11-17 00:19:17');
INSERT INTO `websockets_statistics_entries` VALUES ('7', 'local', '1', '2', '0', '2025-11-17 00:20:17', '2025-11-17 00:20:17');
INSERT INTO `websockets_statistics_entries` VALUES ('8', 'local', '1', '2', '0', '2025-11-17 00:21:17', '2025-11-17 00:21:17');
INSERT INTO `websockets_statistics_entries` VALUES ('9', 'local', '1', '2', '0', '2025-11-17 00:22:17', '2025-11-17 00:22:17');
INSERT INTO `websockets_statistics_entries` VALUES ('10', 'local', '1', '3', '0', '2025-11-17 00:23:17', '2025-11-17 00:23:17');
INSERT INTO `websockets_statistics_entries` VALUES ('11', 'local', '2', '3', '0', '2025-11-17 00:24:17', '2025-11-17 00:24:17');
INSERT INTO `websockets_statistics_entries` VALUES ('12', 'local', '2', '4', '0', '2025-11-17 00:25:17', '2025-11-17 00:25:17');
INSERT INTO `websockets_statistics_entries` VALUES ('13', 'local', '2', '3', '0', '2025-11-17 00:26:17', '2025-11-17 00:26:17');
INSERT INTO `websockets_statistics_entries` VALUES ('14', 'local', '1', '2', '0', '2025-11-17 00:27:17', '2025-11-17 00:27:17');
INSERT INTO `websockets_statistics_entries` VALUES ('15', 'local', '1', '2', '0', '2025-11-17 00:28:17', '2025-11-17 00:28:17');
INSERT INTO `websockets_statistics_entries` VALUES ('16', 'local', '1', '2', '0', '2025-11-17 00:29:17', '2025-11-17 00:29:17');
INSERT INTO `websockets_statistics_entries` VALUES ('17', 'local', '2', '4', '0', '2025-11-17 00:30:17', '2025-11-17 00:30:17');
INSERT INTO `websockets_statistics_entries` VALUES ('18', 'local', '1', '2', '0', '2025-11-17 00:31:17', '2025-11-17 00:31:17');
INSERT INTO `websockets_statistics_entries` VALUES ('19', 'local', '1', '1', '0', '2025-11-17 00:32:17', '2025-11-17 00:32:17');
INSERT INTO `websockets_statistics_entries` VALUES ('20', 'local', '1', '2', '0', '2025-11-17 00:33:17', '2025-11-17 00:33:17');
INSERT INTO `websockets_statistics_entries` VALUES ('21', 'local', '2', '6', '0', '2025-11-17 00:34:17', '2025-11-17 00:34:17');
INSERT INTO `websockets_statistics_entries` VALUES ('22', 'local', '1', '2', '0', '2025-11-17 00:35:17', '2025-11-17 00:35:17');
INSERT INTO `websockets_statistics_entries` VALUES ('23', 'local', '2', '4', '0', '2025-11-17 00:36:17', '2025-11-17 00:36:17');
INSERT INTO `websockets_statistics_entries` VALUES ('24', 'local', '2', '3', '0', '2025-11-17 00:37:17', '2025-11-17 00:37:17');
INSERT INTO `websockets_statistics_entries` VALUES ('25', 'local', '2', '4', '0', '2025-11-17 00:38:17', '2025-11-17 00:38:17');
INSERT INTO `websockets_statistics_entries` VALUES ('26', 'local', '2', '3', '0', '2025-11-17 00:39:17', '2025-11-17 00:39:17');
INSERT INTO `websockets_statistics_entries` VALUES ('27', 'local', '1', '2', '0', '2025-11-17 00:40:17', '2025-11-17 00:40:17');
INSERT INTO `websockets_statistics_entries` VALUES ('28', 'local', '1', '2', '0', '2025-11-17 00:41:17', '2025-11-17 00:41:17');
INSERT INTO `websockets_statistics_entries` VALUES ('29', 'local', '1', '2', '0', '2025-11-17 00:42:17', '2025-11-17 00:42:17');
INSERT INTO `websockets_statistics_entries` VALUES ('30', 'local', '1', '2', '0', '2025-11-17 00:43:17', '2025-11-17 00:43:17');
INSERT INTO `websockets_statistics_entries` VALUES ('31', 'local', '1', '2', '0', '2025-11-17 00:44:17', '2025-11-17 00:44:17');
INSERT INTO `websockets_statistics_entries` VALUES ('32', 'local', '1', '2', '0', '2025-11-17 00:45:17', '2025-11-17 00:45:17');
INSERT INTO `websockets_statistics_entries` VALUES ('33', 'local', '1', '2', '0', '2025-11-17 00:46:17', '2025-11-17 00:46:17');
INSERT INTO `websockets_statistics_entries` VALUES ('34', 'local', '1', '2', '0', '2025-11-17 00:47:17', '2025-11-17 00:47:17');
INSERT INTO `websockets_statistics_entries` VALUES ('35', 'local', '1', '2', '0', '2025-11-17 00:48:17', '2025-11-17 00:48:17');
INSERT INTO `websockets_statistics_entries` VALUES ('36', 'local', '1', '2', '0', '2025-11-17 00:49:17', '2025-11-17 00:49:17');
INSERT INTO `websockets_statistics_entries` VALUES ('37', 'local', '1', '2', '0', '2025-11-17 00:50:17', '2025-11-17 00:50:17');
INSERT INTO `websockets_statistics_entries` VALUES ('38', 'local', '1', '2', '0', '2025-11-17 00:51:17', '2025-11-17 00:51:17');
INSERT INTO `websockets_statistics_entries` VALUES ('39', 'local', '1', '2', '0', '2025-11-17 00:52:17', '2025-11-17 00:52:17');
INSERT INTO `websockets_statistics_entries` VALUES ('40', 'local', '1', '1', '0', '2025-11-17 00:53:17', '2025-11-17 00:53:17');
INSERT INTO `websockets_statistics_entries` VALUES ('41', 'local', '1', '2', '0', '2025-11-17 00:54:17', '2025-11-17 00:54:17');
INSERT INTO `websockets_statistics_entries` VALUES ('42', 'local', '1', '2', '0', '2025-11-17 00:55:17', '2025-11-17 00:55:17');
INSERT INTO `websockets_statistics_entries` VALUES ('43', 'local', '1', '2', '0', '2025-11-17 00:56:17', '2025-11-17 00:56:17');
INSERT INTO `websockets_statistics_entries` VALUES ('44', 'local', '1', '2', '0', '2025-11-17 00:57:17', '2025-11-17 00:57:17');
INSERT INTO `websockets_statistics_entries` VALUES ('45', 'local', '1', '2', '0', '2025-11-17 00:58:17', '2025-11-17 00:58:17');
INSERT INTO `websockets_statistics_entries` VALUES ('46', 'local', '1', '2', '0', '2025-11-17 00:59:17', '2025-11-17 00:59:17');
INSERT INTO `websockets_statistics_entries` VALUES ('47', 'local', '1', '2', '0', '2025-11-17 01:00:17', '2025-11-17 01:00:17');
INSERT INTO `websockets_statistics_entries` VALUES ('48', 'local', '1', '2', '0', '2025-11-17 01:01:17', '2025-11-17 01:01:17');
INSERT INTO `websockets_statistics_entries` VALUES ('49', 'local', '1', '2', '0', '2025-11-17 01:02:17', '2025-11-17 01:02:17');
INSERT INTO `websockets_statistics_entries` VALUES ('50', 'local', '1', '2', '0', '2025-11-17 01:03:17', '2025-11-17 01:03:17');
INSERT INTO `websockets_statistics_entries` VALUES ('51', 'local', '1', '2', '0', '2025-11-17 01:04:17', '2025-11-17 01:04:17');
INSERT INTO `websockets_statistics_entries` VALUES ('52', 'local', '1', '2', '0', '2025-11-17 01:05:17', '2025-11-17 01:05:17');
INSERT INTO `websockets_statistics_entries` VALUES ('53', 'local', '1', '2', '0', '2025-11-17 01:06:17', '2025-11-17 01:06:17');
INSERT INTO `websockets_statistics_entries` VALUES ('54', 'local', '1', '2', '0', '2025-11-17 01:07:17', '2025-11-17 01:07:17');
INSERT INTO `websockets_statistics_entries` VALUES ('55', 'local', '1', '2', '0', '2025-11-17 01:08:17', '2025-11-17 01:08:17');
INSERT INTO `websockets_statistics_entries` VALUES ('56', 'local', '1', '1', '0', '2025-11-17 01:09:17', '2025-11-17 01:09:17');
INSERT INTO `websockets_statistics_entries` VALUES ('57', 'local', '1', '2', '0', '2025-11-17 01:10:17', '2025-11-17 01:10:17');
INSERT INTO `websockets_statistics_entries` VALUES ('58', 'local', '1', '2', '0', '2025-11-17 01:11:17', '2025-11-17 01:11:17');
INSERT INTO `websockets_statistics_entries` VALUES ('59', 'local', '1', '2', '0', '2025-11-17 01:12:17', '2025-11-17 01:12:17');
INSERT INTO `websockets_statistics_entries` VALUES ('60', 'local', '1', '2', '0', '2025-11-17 01:13:18', '2025-11-17 01:13:18');
INSERT INTO `websockets_statistics_entries` VALUES ('61', 'local', '1', '2', '0', '2025-11-17 01:14:18', '2025-11-17 01:14:18');
INSERT INTO `websockets_statistics_entries` VALUES ('62', 'local', '1', '2', '0', '2025-11-17 01:15:18', '2025-11-17 01:15:18');
INSERT INTO `websockets_statistics_entries` VALUES ('63', 'local', '1', '2', '0', '2025-11-17 01:16:18', '2025-11-17 01:16:18');
INSERT INTO `websockets_statistics_entries` VALUES ('64', 'local', '1', '3', '0', '2025-11-17 01:17:18', '2025-11-17 01:17:18');
INSERT INTO `websockets_statistics_entries` VALUES ('65', 'local', '1', '2', '0', '2025-11-17 01:18:18', '2025-11-17 01:18:18');
INSERT INTO `websockets_statistics_entries` VALUES ('66', 'local', '1', '1', '0', '2025-11-17 01:19:18', '2025-11-17 01:19:18');
INSERT INTO `websockets_statistics_entries` VALUES ('67', 'local', '1', '2', '0', '2025-11-17 01:20:18', '2025-11-17 01:20:18');
INSERT INTO `websockets_statistics_entries` VALUES ('68', 'local', '1', '2', '0', '2025-11-17 01:21:18', '2025-11-17 01:21:18');
INSERT INTO `websockets_statistics_entries` VALUES ('69', 'local', '1', '3', '0', '2025-11-17 01:22:18', '2025-11-17 01:22:18');
INSERT INTO `websockets_statistics_entries` VALUES ('70', 'local', '1', '2', '0', '2025-11-17 01:23:18', '2025-11-17 01:23:18');
INSERT INTO `websockets_statistics_entries` VALUES ('71', 'local', '1', '2', '0', '2025-11-17 01:24:18', '2025-11-17 01:24:18');
INSERT INTO `websockets_statistics_entries` VALUES ('72', 'local', '1', '2', '0', '2025-11-17 01:25:18', '2025-11-17 01:25:18');
INSERT INTO `websockets_statistics_entries` VALUES ('73', 'local', '1', '2', '0', '2025-11-17 01:26:18', '2025-11-17 01:26:18');
INSERT INTO `websockets_statistics_entries` VALUES ('74', 'local', '1', '2', '0', '2025-11-17 01:27:18', '2025-11-17 01:27:18');
INSERT INTO `websockets_statistics_entries` VALUES ('75', 'local', '1', '2', '0', '2025-11-17 01:28:18', '2025-11-17 01:28:18');
INSERT INTO `websockets_statistics_entries` VALUES ('76', 'local', '1', '2', '0', '2025-11-17 01:29:18', '2025-11-17 01:29:18');
INSERT INTO `websockets_statistics_entries` VALUES ('77', 'local', '1', '2', '0', '2025-11-17 01:30:18', '2025-11-17 01:30:18');
INSERT INTO `websockets_statistics_entries` VALUES ('78', 'local', '1', '2', '0', '2025-11-17 01:31:18', '2025-11-17 01:31:18');
INSERT INTO `websockets_statistics_entries` VALUES ('79', 'local', '1', '2', '0', '2025-11-17 01:32:18', '2025-11-17 01:32:18');
INSERT INTO `websockets_statistics_entries` VALUES ('80', 'local', '1', '2', '0', '2025-11-17 01:33:18', '2025-11-17 01:33:18');
INSERT INTO `websockets_statistics_entries` VALUES ('81', 'local', '1', '3', '0', '2025-11-17 01:34:18', '2025-11-17 01:34:18');
INSERT INTO `websockets_statistics_entries` VALUES ('82', 'local', '1', '2', '0', '2025-11-17 01:35:18', '2025-11-17 01:35:18');
INSERT INTO `websockets_statistics_entries` VALUES ('83', 'local', '1', '2', '0', '2025-11-17 01:36:18', '2025-11-17 01:36:18');
INSERT INTO `websockets_statistics_entries` VALUES ('84', 'local', '1', '2', '0', '2025-11-17 01:37:18', '2025-11-17 01:37:18');
INSERT INTO `websockets_statistics_entries` VALUES ('85', 'local', '1', '2', '0', '2025-11-17 01:38:18', '2025-11-17 01:38:18');
INSERT INTO `websockets_statistics_entries` VALUES ('86', 'local', '1', '2', '0', '2025-11-17 01:39:18', '2025-11-17 01:39:18');
INSERT INTO `websockets_statistics_entries` VALUES ('87', 'local', '1', '1', '0', '2025-11-17 01:40:18', '2025-11-17 01:40:18');
INSERT INTO `websockets_statistics_entries` VALUES ('88', 'local', '1', '2', '0', '2025-11-17 01:41:18', '2025-11-17 01:41:18');
INSERT INTO `websockets_statistics_entries` VALUES ('89', 'local', '1', '2', '0', '2025-11-17 01:42:18', '2025-11-17 01:42:18');
INSERT INTO `websockets_statistics_entries` VALUES ('90', 'local', '1', '2', '0', '2025-11-17 01:43:18', '2025-11-17 01:43:18');
INSERT INTO `websockets_statistics_entries` VALUES ('91', 'local', '1', '2', '0', '2025-11-17 01:44:18', '2025-11-17 01:44:18');
INSERT INTO `websockets_statistics_entries` VALUES ('92', 'local', '1', '2', '0', '2025-11-17 01:45:18', '2025-11-17 01:45:18');
INSERT INTO `websockets_statistics_entries` VALUES ('93', 'local', '1', '2', '0', '2025-11-17 01:46:18', '2025-11-17 01:46:18');
INSERT INTO `websockets_statistics_entries` VALUES ('94', 'local', '1', '2', '0', '2025-11-17 01:47:18', '2025-11-17 01:47:18');
INSERT INTO `websockets_statistics_entries` VALUES ('95', 'local', '1', '2', '0', '2025-11-17 01:48:18', '2025-11-17 01:48:18');
INSERT INTO `websockets_statistics_entries` VALUES ('96', 'local', '1', '2', '0', '2025-11-17 01:49:18', '2025-11-17 01:49:18');
INSERT INTO `websockets_statistics_entries` VALUES ('97', 'local', '1', '2', '0', '2025-11-17 01:50:18', '2025-11-17 01:50:18');
INSERT INTO `websockets_statistics_entries` VALUES ('98', 'local', '1', '2', '0', '2025-11-17 01:51:18', '2025-11-17 01:51:18');
INSERT INTO `websockets_statistics_entries` VALUES ('99', 'local', '1', '2', '0', '2025-11-17 01:52:18', '2025-11-17 01:52:18');
INSERT INTO `websockets_statistics_entries` VALUES ('100', 'local', '1', '2', '0', '2025-11-17 01:53:18', '2025-11-17 01:53:18');
INSERT INTO `websockets_statistics_entries` VALUES ('101', 'local', '1', '2', '0', '2025-11-17 01:54:18', '2025-11-17 01:54:18');
INSERT INTO `websockets_statistics_entries` VALUES ('102', 'local', '1', '2', '0', '2025-11-17 01:55:18', '2025-11-17 01:55:18');
INSERT INTO `websockets_statistics_entries` VALUES ('103', 'local', '1', '1', '0', '2025-11-17 01:56:18', '2025-11-17 01:56:18');
INSERT INTO `websockets_statistics_entries` VALUES ('104', 'local', '1', '2', '0', '2025-11-17 01:57:18', '2025-11-17 01:57:18');
INSERT INTO `websockets_statistics_entries` VALUES ('105', 'local', '1', '2', '0', '2025-11-17 01:58:18', '2025-11-17 01:58:18');
INSERT INTO `websockets_statistics_entries` VALUES ('106', 'local', '1', '2', '0', '2025-11-17 01:59:18', '2025-11-17 01:59:18');
INSERT INTO `websockets_statistics_entries` VALUES ('107', 'local', '1', '2', '0', '2025-11-17 02:00:18', '2025-11-17 02:00:18');
INSERT INTO `websockets_statistics_entries` VALUES ('108', 'local', '1', '2', '0', '2025-11-17 02:01:18', '2025-11-17 02:01:18');
INSERT INTO `websockets_statistics_entries` VALUES ('109', 'local', '1', '2', '0', '2025-11-17 02:02:18', '2025-11-17 02:02:18');
INSERT INTO `websockets_statistics_entries` VALUES ('110', 'local', '1', '2', '0', '2025-11-17 02:03:18', '2025-11-17 02:03:18');
INSERT INTO `websockets_statistics_entries` VALUES ('111', 'local', '1', '2', '0', '2025-11-17 02:04:18', '2025-11-17 02:04:18');
INSERT INTO `websockets_statistics_entries` VALUES ('112', 'local', '1', '2', '0', '2025-11-17 02:05:18', '2025-11-17 02:05:18');
INSERT INTO `websockets_statistics_entries` VALUES ('113', 'local', '1', '2', '0', '2025-11-17 02:06:18', '2025-11-17 02:06:18');
INSERT INTO `websockets_statistics_entries` VALUES ('114', 'local', '1', '2', '0', '2025-11-17 02:07:18', '2025-11-17 02:07:18');
INSERT INTO `websockets_statistics_entries` VALUES ('115', 'local', '1', '2', '0', '2025-11-17 02:08:18', '2025-11-17 02:08:18');
INSERT INTO `websockets_statistics_entries` VALUES ('116', 'local', '1', '2', '0', '2025-11-17 02:09:18', '2025-11-17 02:09:18');
INSERT INTO `websockets_statistics_entries` VALUES ('117', 'local', '1', '2', '0', '2025-11-17 02:10:18', '2025-11-17 02:10:18');
INSERT INTO `websockets_statistics_entries` VALUES ('118', 'local', '1', '2', '0', '2025-11-17 02:11:18', '2025-11-17 02:11:18');
INSERT INTO `websockets_statistics_entries` VALUES ('119', 'local', '1', '2', '0', '2025-11-17 02:12:18', '2025-11-17 02:12:18');
INSERT INTO `websockets_statistics_entries` VALUES ('120', 'local', '1', '2', '0', '2025-11-17 02:13:18', '2025-11-17 02:13:18');
INSERT INTO `websockets_statistics_entries` VALUES ('121', 'local', '1', '2', '0', '2025-11-17 02:14:18', '2025-11-17 02:14:18');
INSERT INTO `websockets_statistics_entries` VALUES ('122', 'local', '1', '2', '0', '2025-11-17 02:15:18', '2025-11-17 02:15:18');
INSERT INTO `websockets_statistics_entries` VALUES ('123', 'local', '1', '2', '0', '2025-11-17 02:16:18', '2025-11-17 02:16:18');
INSERT INTO `websockets_statistics_entries` VALUES ('124', 'local', '1', '2', '0', '2025-11-17 02:17:18', '2025-11-17 02:17:18');
INSERT INTO `websockets_statistics_entries` VALUES ('125', 'local', '1', '2', '0', '2025-11-17 02:18:18', '2025-11-17 02:18:18');
INSERT INTO `websockets_statistics_entries` VALUES ('126', 'local', '1', '2', '0', '2025-11-17 02:19:18', '2025-11-17 02:19:18');
INSERT INTO `websockets_statistics_entries` VALUES ('127', 'local', '1', '1', '0', '2025-11-17 02:20:18', '2025-11-17 02:20:18');
INSERT INTO `websockets_statistics_entries` VALUES ('128', 'local', '1', '2', '0', '2025-11-17 02:21:18', '2025-11-17 02:21:18');
INSERT INTO `websockets_statistics_entries` VALUES ('129', 'local', '1', '0', '0', '2025-11-17 03:45:19', '2025-11-17 03:45:19');
INSERT INTO `websockets_statistics_entries` VALUES ('130', 'local', '2', '3', '0', '2025-11-17 03:54:19', '2025-11-17 03:54:19');
INSERT INTO `websockets_statistics_entries` VALUES ('131', 'local', '1', '2', '0', '2025-11-17 13:59:10', '2025-11-17 13:59:10');
INSERT INTO `websockets_statistics_entries` VALUES ('132', 'local', '1', '2', '0', '2025-11-17 14:00:10', '2025-11-17 14:00:10');
INSERT INTO `websockets_statistics_entries` VALUES ('133', 'local', '1', '1', '0', '2025-11-17 14:01:10', '2025-11-17 14:01:10');
INSERT INTO `websockets_statistics_entries` VALUES ('134', 'local', '1', '2', '0', '2025-11-17 14:02:10', '2025-11-17 14:02:10');
INSERT INTO `websockets_statistics_entries` VALUES ('135', 'local', '1', '2', '0', '2025-11-17 14:03:10', '2025-11-17 14:03:10');
INSERT INTO `websockets_statistics_entries` VALUES ('136', 'local', '1', '3', '0', '2025-11-17 14:04:10', '2025-11-17 14:04:10');
INSERT INTO `websockets_statistics_entries` VALUES ('137', 'local', '1', '2', '0', '2025-11-17 14:05:10', '2025-11-17 14:05:10');
INSERT INTO `websockets_statistics_entries` VALUES ('138', 'local', '1', '3', '0', '2025-11-17 14:06:10', '2025-11-17 14:06:10');
INSERT INTO `websockets_statistics_entries` VALUES ('139', 'local', '1', '2', '0', '2025-11-17 14:07:10', '2025-11-17 14:07:10');
INSERT INTO `websockets_statistics_entries` VALUES ('140', 'local', '1', '1', '0', '2025-11-17 14:08:10', '2025-11-17 14:08:10');
INSERT INTO `websockets_statistics_entries` VALUES ('141', 'local', '1', '2', '0', '2025-11-17 14:09:10', '2025-11-17 14:09:10');
INSERT INTO `websockets_statistics_entries` VALUES ('142', 'local', '1', '2', '0', '2025-11-17 14:10:10', '2025-11-17 14:10:10');
INSERT INTO `websockets_statistics_entries` VALUES ('143', 'local', '1', '2', '0', '2025-11-17 14:11:10', '2025-11-17 14:11:10');
INSERT INTO `websockets_statistics_entries` VALUES ('144', 'local', '1', '2', '0', '2025-11-17 14:12:10', '2025-11-17 14:12:10');
INSERT INTO `websockets_statistics_entries` VALUES ('145', 'local', '1', '2', '0', '2025-11-17 14:13:10', '2025-11-17 14:13:10');
INSERT INTO `websockets_statistics_entries` VALUES ('146', 'local', '1', '2', '0', '2025-11-17 14:14:10', '2025-11-17 14:14:10');
INSERT INTO `websockets_statistics_entries` VALUES ('147', 'local', '1', '2', '0', '2025-11-17 14:15:10', '2025-11-17 14:15:10');
INSERT INTO `websockets_statistics_entries` VALUES ('148', 'local', '1', '2', '0', '2025-11-17 14:16:10', '2025-11-17 14:16:10');
INSERT INTO `websockets_statistics_entries` VALUES ('149', 'local', '1', '2', '0', '2025-11-17 14:17:10', '2025-11-17 14:17:10');
INSERT INTO `websockets_statistics_entries` VALUES ('150', 'local', '1', '2', '0', '2025-11-17 14:18:10', '2025-11-17 14:18:10');
INSERT INTO `websockets_statistics_entries` VALUES ('151', 'local', '1', '2', '0', '2025-11-17 14:19:10', '2025-11-17 14:19:10');
INSERT INTO `websockets_statistics_entries` VALUES ('152', 'local', '1', '2', '0', '2025-11-17 14:20:10', '2025-11-17 14:20:10');
INSERT INTO `websockets_statistics_entries` VALUES ('153', 'local', '1', '1', '1', '2025-11-17 14:21:10', '2025-11-17 14:21:10');
INSERT INTO `websockets_statistics_entries` VALUES ('154', 'local', '1', '2', '0', '2025-11-17 14:22:10', '2025-11-17 14:22:10');
INSERT INTO `websockets_statistics_entries` VALUES ('155', 'local', '1', '2', '0', '2025-11-17 14:23:10', '2025-11-17 14:23:10');
INSERT INTO `websockets_statistics_entries` VALUES ('156', 'local', '1', '2', '0', '2025-11-17 14:24:10', '2025-11-17 14:24:10');
INSERT INTO `websockets_statistics_entries` VALUES ('157', 'local', '1', '2', '0', '2025-11-17 14:25:10', '2025-11-17 14:25:10');
INSERT INTO `websockets_statistics_entries` VALUES ('158', 'local', '1', '2', '0', '2025-11-17 14:26:10', '2025-11-17 14:26:10');
INSERT INTO `websockets_statistics_entries` VALUES ('159', 'local', '1', '2', '0', '2025-11-17 14:27:10', '2025-11-17 14:27:10');
INSERT INTO `websockets_statistics_entries` VALUES ('160', 'local', '1', '2', '0', '2025-11-17 14:28:10', '2025-11-17 14:28:10');
INSERT INTO `websockets_statistics_entries` VALUES ('161', 'local', '1', '2', '0', '2025-11-17 14:29:10', '2025-11-17 14:29:10');
INSERT INTO `websockets_statistics_entries` VALUES ('162', 'local', '1', '2', '0', '2025-11-17 14:30:10', '2025-11-17 14:30:10');
INSERT INTO `websockets_statistics_entries` VALUES ('163', 'local', '1', '2', '1', '2025-11-17 14:31:10', '2025-11-17 14:31:10');
INSERT INTO `websockets_statistics_entries` VALUES ('164', 'local', '1', '2', '0', '2025-11-17 14:32:10', '2025-11-17 14:32:10');
INSERT INTO `websockets_statistics_entries` VALUES ('165', 'local', '1', '2', '0', '2025-11-17 14:33:10', '2025-11-17 14:33:10');
INSERT INTO `websockets_statistics_entries` VALUES ('166', 'local', '1', '2', '0', '2025-11-17 14:34:10', '2025-11-17 14:34:10');
INSERT INTO `websockets_statistics_entries` VALUES ('167', 'local', '1', '2', '0', '2025-11-17 14:35:10', '2025-11-17 14:35:10');
INSERT INTO `websockets_statistics_entries` VALUES ('168', 'local', '1', '2', '0', '2025-11-17 14:36:10', '2025-11-17 14:36:10');
INSERT INTO `websockets_statistics_entries` VALUES ('169', 'local', '1', '2', '0', '2025-11-17 14:37:10', '2025-11-17 14:37:10');
INSERT INTO `websockets_statistics_entries` VALUES ('170', 'local', '1', '2', '0', '2025-11-17 14:38:10', '2025-11-17 14:38:10');
INSERT INTO `websockets_statistics_entries` VALUES ('171', 'local', '1', '2', '0', '2025-11-17 14:39:10', '2025-11-17 14:39:10');
INSERT INTO `websockets_statistics_entries` VALUES ('172', 'local', '1', '2', '0', '2025-11-17 14:40:10', '2025-11-17 14:40:10');
INSERT INTO `websockets_statistics_entries` VALUES ('173', 'local', '1', '2', '0', '2025-11-17 14:41:10', '2025-11-17 14:41:10');
INSERT INTO `websockets_statistics_entries` VALUES ('174', 'local', '1', '2', '0', '2025-11-17 14:42:10', '2025-11-17 14:42:10');
INSERT INTO `websockets_statistics_entries` VALUES ('175', 'local', '1', '1', '0', '2025-11-17 14:43:10', '2025-11-17 14:43:10');
INSERT INTO `websockets_statistics_entries` VALUES ('176', 'local', '1', '2', '0', '2025-11-17 14:44:10', '2025-11-17 14:44:10');
INSERT INTO `websockets_statistics_entries` VALUES ('177', 'local', '1', '2', '0', '2025-11-17 14:45:11', '2025-11-17 14:45:11');
INSERT INTO `websockets_statistics_entries` VALUES ('178', 'local', '1', '2', '0', '2025-11-17 14:46:11', '2025-11-17 14:46:11');
INSERT INTO `websockets_statistics_entries` VALUES ('179', 'local', '1', '2', '0', '2025-11-17 14:47:11', '2025-11-17 14:47:11');
INSERT INTO `websockets_statistics_entries` VALUES ('180', 'local', '1', '2', '0', '2025-11-17 14:48:11', '2025-11-17 14:48:11');
INSERT INTO `websockets_statistics_entries` VALUES ('181', 'local', '1', '2', '0', '2025-11-17 14:49:11', '2025-11-17 14:49:11');
INSERT INTO `websockets_statistics_entries` VALUES ('182', 'local', '1', '2', '0', '2025-11-17 14:50:13', '2025-11-17 14:50:13');
INSERT INTO `websockets_statistics_entries` VALUES ('183', 'local', '1', '2', '0', '2025-11-17 14:51:13', '2025-11-17 14:51:13');
INSERT INTO `websockets_statistics_entries` VALUES ('184', 'local', '1', '2', '0', '2025-11-17 14:52:13', '2025-11-17 14:52:13');
INSERT INTO `websockets_statistics_entries` VALUES ('185', 'local', '1', '2', '0', '2025-11-17 14:53:13', '2025-11-17 14:53:13');
INSERT INTO `websockets_statistics_entries` VALUES ('186', 'local', '1', '2', '0', '2025-11-17 14:54:13', '2025-11-17 14:54:13');
INSERT INTO `websockets_statistics_entries` VALUES ('187', 'local', '1', '2', '0', '2025-11-17 14:55:13', '2025-11-17 14:55:13');
INSERT INTO `websockets_statistics_entries` VALUES ('188', 'local', '1', '2', '0', '2025-11-17 14:56:13', '2025-11-17 14:56:13');
INSERT INTO `websockets_statistics_entries` VALUES ('189', 'local', '1', '2', '0', '2025-11-17 14:57:13', '2025-11-17 14:57:13');
INSERT INTO `websockets_statistics_entries` VALUES ('190', 'local', '1', '2', '0', '2025-11-17 14:58:13', '2025-11-17 14:58:13');
INSERT INTO `websockets_statistics_entries` VALUES ('191', 'local', '1', '2', '0', '2025-11-17 14:59:13', '2025-11-17 14:59:13');
INSERT INTO `websockets_statistics_entries` VALUES ('192', 'local', '1', '2', '0', '2025-11-17 15:00:13', '2025-11-17 15:00:13');
INSERT INTO `websockets_statistics_entries` VALUES ('193', 'local', '1', '2', '0', '2025-11-17 15:01:13', '2025-11-17 15:01:13');
INSERT INTO `websockets_statistics_entries` VALUES ('194', 'local', '1', '2', '0', '2025-11-17 15:02:13', '2025-11-17 15:02:13');
INSERT INTO `websockets_statistics_entries` VALUES ('195', 'local', '1', '2', '0', '2025-11-17 15:03:13', '2025-11-17 15:03:13');
INSERT INTO `websockets_statistics_entries` VALUES ('196', 'local', '1', '2', '0', '2025-11-17 15:04:13', '2025-11-17 15:04:13');
INSERT INTO `websockets_statistics_entries` VALUES ('197', 'local', '1', '2', '0', '2025-11-17 15:05:13', '2025-11-17 15:05:13');
INSERT INTO `websockets_statistics_entries` VALUES ('198', 'local', '1', '1', '0', '2025-11-17 15:06:13', '2025-11-17 15:06:13');
INSERT INTO `websockets_statistics_entries` VALUES ('199', 'local', '1', '2', '0', '2025-11-17 15:07:13', '2025-11-17 15:07:13');
INSERT INTO `websockets_statistics_entries` VALUES ('200', 'local', '1', '2', '0', '2025-11-17 15:08:13', '2025-11-17 15:08:13');
INSERT INTO `websockets_statistics_entries` VALUES ('201', 'local', '1', '2', '0', '2025-11-17 15:09:13', '2025-11-17 15:09:13');
INSERT INTO `websockets_statistics_entries` VALUES ('202', 'local', '1', '2', '0', '2025-11-17 15:10:13', '2025-11-17 15:10:13');
INSERT INTO `websockets_statistics_entries` VALUES ('203', 'local', '1', '2', '0', '2025-11-17 15:11:13', '2025-11-17 15:11:13');
INSERT INTO `websockets_statistics_entries` VALUES ('204', 'local', '1', '2', '0', '2025-11-17 15:12:13', '2025-11-17 15:12:13');
INSERT INTO `websockets_statistics_entries` VALUES ('205', 'local', '1', '2', '0', '2025-11-17 15:13:13', '2025-11-17 15:13:13');
INSERT INTO `websockets_statistics_entries` VALUES ('206', 'local', '1', '2', '0', '2025-11-17 15:14:13', '2025-11-17 15:14:13');
INSERT INTO `websockets_statistics_entries` VALUES ('207', 'local', '1', '2', '0', '2025-11-17 15:15:13', '2025-11-17 15:15:13');
INSERT INTO `websockets_statistics_entries` VALUES ('208', 'local', '1', '2', '0', '2025-11-17 15:16:13', '2025-11-17 15:16:13');
INSERT INTO `websockets_statistics_entries` VALUES ('209', 'local', '1', '2', '0', '2025-11-17 15:17:13', '2025-11-17 15:17:13');
INSERT INTO `websockets_statistics_entries` VALUES ('210', 'local', '1', '2', '0', '2025-11-17 15:18:13', '2025-11-17 15:18:13');
INSERT INTO `websockets_statistics_entries` VALUES ('211', 'local', '1', '2', '0', '2025-11-17 15:19:13', '2025-11-17 15:19:13');
INSERT INTO `websockets_statistics_entries` VALUES ('212', 'local', '1', '2', '0', '2025-11-17 15:20:13', '2025-11-17 15:20:13');
INSERT INTO `websockets_statistics_entries` VALUES ('213', 'local', '1', '1', '0', '2025-11-17 15:21:13', '2025-11-17 15:21:13');
INSERT INTO `websockets_statistics_entries` VALUES ('214', 'local', '1', '2', '0', '2025-11-17 15:22:13', '2025-11-17 15:22:13');
INSERT INTO `websockets_statistics_entries` VALUES ('215', 'local', '1', '2', '0', '2025-11-17 15:23:13', '2025-11-17 15:23:13');
INSERT INTO `websockets_statistics_entries` VALUES ('216', 'local', '1', '2', '0', '2025-11-17 15:24:13', '2025-11-17 15:24:13');
INSERT INTO `websockets_statistics_entries` VALUES ('217', 'local', '1', '2', '0', '2025-11-17 15:25:13', '2025-11-17 15:25:13');
INSERT INTO `websockets_statistics_entries` VALUES ('218', 'local', '1', '2', '0', '2025-11-17 15:26:13', '2025-11-17 15:26:13');
INSERT INTO `websockets_statistics_entries` VALUES ('219', 'local', '1', '2', '0', '2025-11-17 15:27:13', '2025-11-17 15:27:13');
INSERT INTO `websockets_statistics_entries` VALUES ('220', 'local', '1', '2', '0', '2025-11-17 15:28:13', '2025-11-17 15:28:13');
INSERT INTO `websockets_statistics_entries` VALUES ('221', 'local', '1', '2', '0', '2025-11-17 15:29:13', '2025-11-17 15:29:13');
INSERT INTO `websockets_statistics_entries` VALUES ('222', 'local', '1', '2', '0', '2025-11-17 15:30:13', '2025-11-17 15:30:13');
INSERT INTO `websockets_statistics_entries` VALUES ('223', 'local', '1', '2', '0', '2025-11-17 15:31:13', '2025-11-17 15:31:13');
INSERT INTO `websockets_statistics_entries` VALUES ('224', 'local', '1', '2', '0', '2025-11-17 15:32:13', '2025-11-17 15:32:13');
INSERT INTO `websockets_statistics_entries` VALUES ('225', 'local', '1', '2', '0', '2025-11-17 15:33:13', '2025-11-17 15:33:13');
INSERT INTO `websockets_statistics_entries` VALUES ('226', 'local', '1', '2', '0', '2025-11-17 15:34:13', '2025-11-17 15:34:13');
INSERT INTO `websockets_statistics_entries` VALUES ('227', 'local', '1', '2', '0', '2025-11-17 15:35:13', '2025-11-17 15:35:13');
INSERT INTO `websockets_statistics_entries` VALUES ('228', 'local', '1', '2', '0', '2025-11-17 15:36:13', '2025-11-17 15:36:13');
INSERT INTO `websockets_statistics_entries` VALUES ('229', 'local', '1', '1', '0', '2025-11-17 15:37:13', '2025-11-17 15:37:13');
INSERT INTO `websockets_statistics_entries` VALUES ('230', 'local', '1', '2', '0', '2025-11-17 15:38:13', '2025-11-17 15:38:13');
INSERT INTO `websockets_statistics_entries` VALUES ('231', 'local', '1', '2', '0', '2025-11-17 15:39:13', '2025-11-17 15:39:13');
INSERT INTO `websockets_statistics_entries` VALUES ('232', 'local', '1', '2', '0', '2025-11-17 15:40:13', '2025-11-17 15:40:13');
INSERT INTO `websockets_statistics_entries` VALUES ('233', 'local', '1', '2', '0', '2025-11-17 15:41:13', '2025-11-17 15:41:13');
INSERT INTO `websockets_statistics_entries` VALUES ('234', 'local', '1', '2', '0', '2025-11-17 15:42:13', '2025-11-17 15:42:13');
INSERT INTO `websockets_statistics_entries` VALUES ('235', 'local', '1', '3', '0', '2025-11-17 15:43:13', '2025-11-17 15:43:13');
INSERT INTO `websockets_statistics_entries` VALUES ('236', 'local', '1', '2', '0', '2025-11-17 15:44:13', '2025-11-17 15:44:13');
INSERT INTO `websockets_statistics_entries` VALUES ('237', 'local', '1', '2', '0', '2025-11-17 15:45:13', '2025-11-17 15:45:13');
INSERT INTO `websockets_statistics_entries` VALUES ('238', 'local', '1', '2', '0', '2025-11-17 15:46:13', '2025-11-17 15:46:13');
INSERT INTO `websockets_statistics_entries` VALUES ('239', 'local', '1', '1', '1', '2025-11-17 15:47:13', '2025-11-17 15:47:13');
INSERT INTO `websockets_statistics_entries` VALUES ('240', 'local', '1', '5', '0', '2025-11-17 16:03:13', '2025-11-17 16:03:13');
INSERT INTO `websockets_statistics_entries` VALUES ('241', 'local', '1', '2', '1', '2025-11-17 16:04:13', '2025-11-17 16:04:13');
INSERT INTO `websockets_statistics_entries` VALUES ('242', 'local', '2', '4', '0', '2025-11-17 16:05:13', '2025-11-17 16:05:13');
INSERT INTO `websockets_statistics_entries` VALUES ('243', 'local', '2', '4', '0', '2025-11-17 16:06:13', '2025-11-17 16:06:13');
INSERT INTO `websockets_statistics_entries` VALUES ('244', 'local', '2', '4', '0', '2025-11-17 16:07:13', '2025-11-17 16:07:13');
INSERT INTO `websockets_statistics_entries` VALUES ('245', 'local', '1', '5', '1', '2025-11-17 16:08:13', '2025-11-17 16:08:13');
INSERT INTO `websockets_statistics_entries` VALUES ('246', 'local', '1', '2', '0', '2025-11-17 16:09:13', '2025-11-17 16:09:13');
INSERT INTO `websockets_statistics_entries` VALUES ('247', 'local', '1', '2', '0', '2025-11-17 16:10:13', '2025-11-17 16:10:13');
INSERT INTO `websockets_statistics_entries` VALUES ('248', 'local', '1', '2', '0', '2025-11-17 16:11:13', '2025-11-17 16:11:13');
INSERT INTO `websockets_statistics_entries` VALUES ('249', 'local', '1', '2', '0', '2025-11-17 16:12:13', '2025-11-17 16:12:13');
INSERT INTO `websockets_statistics_entries` VALUES ('250', 'local', '1', '2', '0', '2025-11-17 16:13:13', '2025-11-17 16:13:13');
INSERT INTO `websockets_statistics_entries` VALUES ('251', 'local', '1', '2', '0', '2025-11-17 16:14:13', '2025-11-17 16:14:13');
INSERT INTO `websockets_statistics_entries` VALUES ('252', 'local', '1', '2', '0', '2025-11-17 16:15:13', '2025-11-17 16:15:13');
INSERT INTO `websockets_statistics_entries` VALUES ('253', 'local', '1', '3', '1', '2025-11-17 16:16:13', '2025-11-17 16:16:13');
INSERT INTO `websockets_statistics_entries` VALUES ('254', 'local', '1', '2', '0', '2025-11-17 16:17:13', '2025-11-17 16:17:13');
INSERT INTO `websockets_statistics_entries` VALUES ('255', 'local', '1', '2', '0', '2025-11-17 16:18:13', '2025-11-17 16:18:13');
INSERT INTO `websockets_statistics_entries` VALUES ('256', 'local', '1', '2', '2', '2025-11-17 16:19:13', '2025-11-17 16:19:13');
INSERT INTO `websockets_statistics_entries` VALUES ('257', 'local', '1', '2', '2', '2025-11-17 16:20:13', '2025-11-17 16:20:13');
INSERT INTO `websockets_statistics_entries` VALUES ('258', 'local', '1', '2', '0', '2025-11-17 16:21:13', '2025-11-17 16:21:13');
INSERT INTO `websockets_statistics_entries` VALUES ('259', 'local', '1', '2', '0', '2025-11-17 16:22:13', '2025-11-17 16:22:13');
INSERT INTO `websockets_statistics_entries` VALUES ('260', 'local', '1', '1', '0', '2025-11-17 16:23:13', '2025-11-17 16:23:13');
INSERT INTO `websockets_statistics_entries` VALUES ('261', 'local', '1', '2', '0', '2025-11-17 16:24:13', '2025-11-17 16:24:13');
INSERT INTO `websockets_statistics_entries` VALUES ('262', 'local', '1', '4', '0', '2025-11-17 16:25:13', '2025-11-17 16:25:13');
INSERT INTO `websockets_statistics_entries` VALUES ('263', 'local', '1', '1', '2', '2025-11-17 16:26:13', '2025-11-17 16:26:13');
INSERT INTO `websockets_statistics_entries` VALUES ('264', 'local', '1', '2', '0', '2025-11-17 16:27:13', '2025-11-17 16:27:13');
INSERT INTO `websockets_statistics_entries` VALUES ('265', 'local', '1', '2', '0', '2025-11-17 16:28:13', '2025-11-17 16:28:13');
INSERT INTO `websockets_statistics_entries` VALUES ('266', 'local', '1', '2', '1', '2025-11-17 16:29:13', '2025-11-17 16:29:13');
INSERT INTO `websockets_statistics_entries` VALUES ('267', 'local', '1', '3', '1', '2025-11-17 16:30:13', '2025-11-17 16:30:13');
INSERT INTO `websockets_statistics_entries` VALUES ('268', 'local', '1', '2', '1', '2025-11-17 16:31:13', '2025-11-17 16:31:13');
INSERT INTO `websockets_statistics_entries` VALUES ('269', 'local', '1', '4', '0', '2025-11-17 16:32:13', '2025-11-17 16:32:13');
INSERT INTO `websockets_statistics_entries` VALUES ('270', 'local', '1', '2', '0', '2025-11-17 16:33:13', '2025-11-17 16:33:13');
INSERT INTO `websockets_statistics_entries` VALUES ('271', 'local', '1', '2', '1', '2025-11-17 16:34:13', '2025-11-17 16:34:13');
INSERT INTO `websockets_statistics_entries` VALUES ('272', 'local', '1', '2', '0', '2025-11-17 16:35:13', '2025-11-17 16:35:13');
INSERT INTO `websockets_statistics_entries` VALUES ('273', 'local', '1', '1', '0', '2025-11-17 16:36:13', '2025-11-17 16:36:13');
INSERT INTO `websockets_statistics_entries` VALUES ('274', 'local', '1', '2', '1', '2025-11-17 16:37:13', '2025-11-17 16:37:13');
INSERT INTO `websockets_statistics_entries` VALUES ('275', 'local', '1', '2', '1', '2025-11-17 16:38:14', '2025-11-17 16:38:14');
INSERT INTO `websockets_statistics_entries` VALUES ('276', 'local', '1', '2', '0', '2025-11-17 16:39:14', '2025-11-17 16:39:14');
INSERT INTO `websockets_statistics_entries` VALUES ('277', 'local', '1', '2', '0', '2025-11-17 16:40:14', '2025-11-17 16:40:14');
INSERT INTO `websockets_statistics_entries` VALUES ('278', 'local', '1', '2', '0', '2025-11-17 16:41:14', '2025-11-17 16:41:14');
INSERT INTO `websockets_statistics_entries` VALUES ('279', 'local', '1', '2', '0', '2025-11-17 16:42:14', '2025-11-17 16:42:14');
INSERT INTO `websockets_statistics_entries` VALUES ('280', 'local', '1', '2', '0', '2025-11-17 16:43:14', '2025-11-17 16:43:14');
INSERT INTO `websockets_statistics_entries` VALUES ('281', 'local', '1', '2', '0', '2025-11-17 16:44:14', '2025-11-17 16:44:14');
INSERT INTO `websockets_statistics_entries` VALUES ('282', 'local', '1', '2', '0', '2025-11-17 16:45:14', '2025-11-17 16:45:14');
INSERT INTO `websockets_statistics_entries` VALUES ('283', 'local', '1', '2', '0', '2025-11-17 16:46:14', '2025-11-17 16:46:14');
INSERT INTO `websockets_statistics_entries` VALUES ('284', 'local', '1', '2', '0', '2025-11-17 16:47:14', '2025-11-17 16:47:14');
INSERT INTO `websockets_statistics_entries` VALUES ('285', 'local', '2', '6', '0', '2025-11-17 16:48:14', '2025-11-17 16:48:14');
INSERT INTO `websockets_statistics_entries` VALUES ('286', 'local', '1', '4', '1', '2025-11-17 16:49:14', '2025-11-17 16:49:14');
INSERT INTO `websockets_statistics_entries` VALUES ('287', 'local', '1', '2', '0', '2025-11-17 16:50:14', '2025-11-17 16:50:14');
INSERT INTO `websockets_statistics_entries` VALUES ('288', 'local', '1', '2', '0', '2025-11-17 16:51:14', '2025-11-17 16:51:14');
INSERT INTO `websockets_statistics_entries` VALUES ('289', 'local', '1', '2', '0', '2025-11-17 16:52:14', '2025-11-17 16:52:14');
INSERT INTO `websockets_statistics_entries` VALUES ('290', 'local', '1', '1', '0', '2025-11-17 16:53:14', '2025-11-17 16:53:14');
INSERT INTO `websockets_statistics_entries` VALUES ('291', 'local', '1', '2', '0', '2025-11-17 16:54:14', '2025-11-17 16:54:14');
INSERT INTO `websockets_statistics_entries` VALUES ('292', 'local', '1', '2', '0', '2025-11-17 16:55:14', '2025-11-17 16:55:14');
INSERT INTO `websockets_statistics_entries` VALUES ('293', 'local', '1', '2', '0', '2025-11-17 16:56:14', '2025-11-17 16:56:14');
INSERT INTO `websockets_statistics_entries` VALUES ('294', 'local', '1', '5', '0', '2025-11-17 16:57:14', '2025-11-17 16:57:14');
INSERT INTO `websockets_statistics_entries` VALUES ('295', 'local', '1', '1', '1', '2025-11-17 16:58:14', '2025-11-17 16:58:14');
INSERT INTO `websockets_statistics_entries` VALUES ('296', 'local', '1', '2', '0', '2025-11-17 16:59:14', '2025-11-17 16:59:14');
INSERT INTO `websockets_statistics_entries` VALUES ('297', 'local', '1', '3', '0', '2025-11-17 17:00:14', '2025-11-17 17:00:14');
INSERT INTO `websockets_statistics_entries` VALUES ('298', 'local', '1', '2', '0', '2025-11-17 17:01:14', '2025-11-17 17:01:14');
INSERT INTO `websockets_statistics_entries` VALUES ('299', 'local', '1', '1', '1', '2025-11-17 17:02:14', '2025-11-17 17:02:14');
INSERT INTO `websockets_statistics_entries` VALUES ('300', 'local', '1', '2', '0', '2025-11-17 17:03:14', '2025-11-17 17:03:14');
INSERT INTO `websockets_statistics_entries` VALUES ('301', 'local', '1', '2', '0', '2025-11-17 17:04:14', '2025-11-17 17:04:14');
INSERT INTO `websockets_statistics_entries` VALUES ('302', 'local', '1', '2', '0', '2025-11-17 17:05:14', '2025-11-17 17:05:14');
INSERT INTO `websockets_statistics_entries` VALUES ('303', 'local', '1', '2', '0', '2025-11-17 17:06:14', '2025-11-17 17:06:14');
INSERT INTO `websockets_statistics_entries` VALUES ('304', 'local', '1', '2', '0', '2025-11-17 17:07:14', '2025-11-17 17:07:14');
INSERT INTO `websockets_statistics_entries` VALUES ('305', 'local', '1', '2', '0', '2025-11-17 17:08:14', '2025-11-17 17:08:14');
INSERT INTO `websockets_statistics_entries` VALUES ('306', 'local', '1', '2', '0', '2025-11-17 17:09:14', '2025-11-17 17:09:14');
INSERT INTO `websockets_statistics_entries` VALUES ('307', 'local', '1', '2', '0', '2025-11-17 17:10:14', '2025-11-17 17:10:14');
INSERT INTO `websockets_statistics_entries` VALUES ('308', 'local', '1', '1', '0', '2025-11-17 17:11:14', '2025-11-17 17:11:14');
INSERT INTO `websockets_statistics_entries` VALUES ('309', 'local', '1', '2', '0', '2025-11-17 17:12:14', '2025-11-17 17:12:14');
INSERT INTO `websockets_statistics_entries` VALUES ('310', 'local', '1', '2', '0', '2025-11-17 17:13:14', '2025-11-17 17:13:14');
INSERT INTO `websockets_statistics_entries` VALUES ('311', 'local', '1', '2', '0', '2025-11-17 17:14:14', '2025-11-17 17:14:14');
INSERT INTO `websockets_statistics_entries` VALUES ('312', 'local', '1', '2', '0', '2025-11-17 17:15:14', '2025-11-17 17:15:14');
INSERT INTO `websockets_statistics_entries` VALUES ('313', 'local', '1', '2', '0', '2025-11-17 17:16:14', '2025-11-17 17:16:14');
INSERT INTO `websockets_statistics_entries` VALUES ('314', 'local', '1', '2', '0', '2025-11-17 17:17:14', '2025-11-17 17:17:14');
INSERT INTO `websockets_statistics_entries` VALUES ('315', 'local', '1', '2', '0', '2025-11-17 17:18:14', '2025-11-17 17:18:14');
INSERT INTO `websockets_statistics_entries` VALUES ('316', 'local', '1', '2', '0', '2025-11-17 17:19:14', '2025-11-17 17:19:14');
INSERT INTO `websockets_statistics_entries` VALUES ('317', 'local', '1', '2', '0', '2025-11-17 17:20:14', '2025-11-17 17:20:14');
INSERT INTO `websockets_statistics_entries` VALUES ('318', 'local', '1', '2', '0', '2025-11-17 17:21:14', '2025-11-17 17:21:14');
INSERT INTO `websockets_statistics_entries` VALUES ('319', 'local', '1', '4', '0', '2025-11-17 17:22:14', '2025-11-17 17:22:14');
INSERT INTO `websockets_statistics_entries` VALUES ('320', 'local', '1', '2', '0', '2025-11-17 17:23:14', '2025-11-17 17:23:14');
INSERT INTO `websockets_statistics_entries` VALUES ('321', 'local', '1', '3', '0', '2025-11-17 17:24:14', '2025-11-17 17:24:14');
INSERT INTO `websockets_statistics_entries` VALUES ('322', 'local', '1', '3', '0', '2025-11-17 17:25:14', '2025-11-17 17:25:14');
INSERT INTO `websockets_statistics_entries` VALUES ('323', 'local', '1', '3', '0', '2025-11-17 17:26:14', '2025-11-17 17:26:14');
INSERT INTO `websockets_statistics_entries` VALUES ('324', 'local', '1', '2', '0', '2025-11-17 17:27:14', '2025-11-17 17:27:14');
INSERT INTO `websockets_statistics_entries` VALUES ('325', 'local', '1', '4', '0', '2025-11-17 17:28:14', '2025-11-17 17:28:14');
INSERT INTO `websockets_statistics_entries` VALUES ('326', 'local', '1', '2', '0', '2025-11-17 17:29:14', '2025-11-17 17:29:14');
INSERT INTO `websockets_statistics_entries` VALUES ('327', 'local', '1', '2', '0', '2025-11-17 17:30:14', '2025-11-17 17:30:14');
INSERT INTO `websockets_statistics_entries` VALUES ('328', 'local', '1', '5', '0', '2025-11-17 17:31:14', '2025-11-17 17:31:14');
INSERT INTO `websockets_statistics_entries` VALUES ('329', 'local', '2', '3', '0', '2025-11-17 17:32:14', '2025-11-17 17:32:14');
INSERT INTO `websockets_statistics_entries` VALUES ('330', 'local', '1', '4', '0', '2025-11-17 17:33:14', '2025-11-17 17:33:14');
INSERT INTO `websockets_statistics_entries` VALUES ('331', 'local', '1', '4', '0', '2025-11-17 17:34:14', '2025-11-17 17:34:14');
INSERT INTO `websockets_statistics_entries` VALUES ('332', 'local', '1', '3', '0', '2025-11-17 17:35:14', '2025-11-17 17:35:14');
INSERT INTO `websockets_statistics_entries` VALUES ('333', 'local', '1', '3', '0', '2025-11-17 17:36:14', '2025-11-17 17:36:14');
INSERT INTO `websockets_statistics_entries` VALUES ('334', 'local', '2', '4', '1', '2025-11-17 17:37:14', '2025-11-17 17:37:14');
INSERT INTO `websockets_statistics_entries` VALUES ('335', 'local', '2', '0', '0', '2025-11-17 17:38:14', '2025-11-17 17:38:14');
INSERT INTO `websockets_statistics_entries` VALUES ('336', 'local', '2', '2', '0', '2025-11-20 12:46:04', '2025-11-20 12:46:04');
INSERT INTO `websockets_statistics_entries` VALUES ('337', 'local', '1', '4', '0', '2025-11-20 12:47:04', '2025-11-20 12:47:04');
INSERT INTO `websockets_statistics_entries` VALUES ('338', 'local', '1', '4', '0', '2025-11-20 12:48:04', '2025-11-20 12:48:04');
INSERT INTO `websockets_statistics_entries` VALUES ('339', 'local', '1', '4', '0', '2025-11-20 12:49:04', '2025-11-20 12:49:04');
INSERT INTO `websockets_statistics_entries` VALUES ('340', 'local', '1', '4', '0', '2025-11-20 12:50:04', '2025-11-20 12:50:04');
INSERT INTO `websockets_statistics_entries` VALUES ('341', 'local', '1', '4', '0', '2025-11-20 12:51:04', '2025-11-20 12:51:04');
INSERT INTO `websockets_statistics_entries` VALUES ('342', 'local', '1', '4', '0', '2025-11-20 12:52:04', '2025-11-20 12:52:04');
INSERT INTO `websockets_statistics_entries` VALUES ('343', 'local', '1', '4', '0', '2025-11-20 12:53:04', '2025-11-20 12:53:04');
INSERT INTO `websockets_statistics_entries` VALUES ('344', 'local', '1', '4', '0', '2025-11-20 12:54:04', '2025-11-20 12:54:04');
INSERT INTO `websockets_statistics_entries` VALUES ('345', 'local', '1', '3', '0', '2025-11-20 12:55:04', '2025-11-20 12:55:04');
INSERT INTO `websockets_statistics_entries` VALUES ('346', 'local', '1', '4', '0', '2025-11-20 12:56:04', '2025-11-20 12:56:04');
INSERT INTO `websockets_statistics_entries` VALUES ('347', 'local', '1', '3', '0', '2025-11-20 12:57:04', '2025-11-20 12:57:04');
INSERT INTO `websockets_statistics_entries` VALUES ('348', 'local', '1', '4', '0', '2025-11-20 12:58:04', '2025-11-20 12:58:04');
INSERT INTO `websockets_statistics_entries` VALUES ('349', 'local', '1', '4', '0', '2025-11-20 12:59:04', '2025-11-20 12:59:04');
INSERT INTO `websockets_statistics_entries` VALUES ('350', 'local', '1', '4', '0', '2025-11-20 13:00:04', '2025-11-20 13:00:04');
INSERT INTO `websockets_statistics_entries` VALUES ('351', 'local', '1', '4', '0', '2025-11-20 13:01:04', '2025-11-20 13:01:04');
INSERT INTO `websockets_statistics_entries` VALUES ('352', 'local', '1', '4', '0', '2025-11-20 13:02:04', '2025-11-20 13:02:04');
INSERT INTO `websockets_statistics_entries` VALUES ('353', 'local', '1', '4', '0', '2025-11-20 13:03:04', '2025-11-20 13:03:04');
INSERT INTO `websockets_statistics_entries` VALUES ('354', 'local', '1', '4', '0', '2025-11-20 13:04:04', '2025-11-20 13:04:04');
INSERT INTO `websockets_statistics_entries` VALUES ('355', 'local', '1', '4', '0', '2025-11-20 13:05:04', '2025-11-20 13:05:04');
INSERT INTO `websockets_statistics_entries` VALUES ('356', 'local', '1', '4', '0', '2025-11-20 13:06:04', '2025-11-20 13:06:04');
INSERT INTO `websockets_statistics_entries` VALUES ('357', 'local', '1', '4', '0', '2025-11-20 13:07:04', '2025-11-20 13:07:04');
INSERT INTO `websockets_statistics_entries` VALUES ('358', 'local', '1', '4', '0', '2025-11-20 13:08:04', '2025-11-20 13:08:04');
INSERT INTO `websockets_statistics_entries` VALUES ('359', 'local', '1', '4', '0', '2025-11-20 13:09:04', '2025-11-20 13:09:04');
INSERT INTO `websockets_statistics_entries` VALUES ('360', 'local', '1', '3', '0', '2025-11-20 13:10:04', '2025-11-20 13:10:04');
INSERT INTO `websockets_statistics_entries` VALUES ('361', 'local', '1', '4', '0', '2025-11-20 13:11:04', '2025-11-20 13:11:04');
INSERT INTO `websockets_statistics_entries` VALUES ('362', 'local', '1', '3', '0', '2025-11-20 13:12:04', '2025-11-20 13:12:04');
INSERT INTO `websockets_statistics_entries` VALUES ('363', 'local', '1', '4', '0', '2025-11-20 13:13:04', '2025-11-20 13:13:04');
INSERT INTO `websockets_statistics_entries` VALUES ('364', 'local', '1', '4', '0', '2025-11-20 13:14:04', '2025-11-20 13:14:04');
INSERT INTO `websockets_statistics_entries` VALUES ('365', 'local', '1', '4', '0', '2025-11-20 13:15:04', '2025-11-20 13:15:04');
INSERT INTO `websockets_statistics_entries` VALUES ('366', 'local', '1', '4', '0', '2025-11-20 13:16:04', '2025-11-20 13:16:04');
INSERT INTO `websockets_statistics_entries` VALUES ('367', 'local', '1', '4', '0', '2025-11-20 13:17:04', '2025-11-20 13:17:04');
INSERT INTO `websockets_statistics_entries` VALUES ('368', 'local', '1', '4', '0', '2025-11-20 13:18:04', '2025-11-20 13:18:04');
INSERT INTO `websockets_statistics_entries` VALUES ('369', 'local', '1', '4', '0', '2025-11-20 13:19:04', '2025-11-20 13:19:04');
INSERT INTO `websockets_statistics_entries` VALUES ('370', 'local', '1', '4', '0', '2025-11-20 13:20:04', '2025-11-20 13:20:04');
INSERT INTO `websockets_statistics_entries` VALUES ('371', 'local', '1', '4', '0', '2025-11-20 13:21:04', '2025-11-20 13:21:04');
INSERT INTO `websockets_statistics_entries` VALUES ('372', 'local', '1', '4', '0', '2025-11-20 13:22:04', '2025-11-20 13:22:04');
INSERT INTO `websockets_statistics_entries` VALUES ('373', 'local', '1', '4', '0', '2025-11-20 13:23:04', '2025-11-20 13:23:04');
INSERT INTO `websockets_statistics_entries` VALUES ('374', 'local', '1', '4', '0', '2025-11-20 13:24:04', '2025-11-20 13:24:04');
INSERT INTO `websockets_statistics_entries` VALUES ('375', 'local', '1', '4', '0', '2025-11-20 13:25:04', '2025-11-20 13:25:04');
INSERT INTO `websockets_statistics_entries` VALUES ('376', 'local', '1', '4', '0', '2025-11-20 13:26:04', '2025-11-20 13:26:04');
INSERT INTO `websockets_statistics_entries` VALUES ('377', 'local', '1', '3', '0', '2025-11-20 13:27:04', '2025-11-20 13:27:04');
INSERT INTO `websockets_statistics_entries` VALUES ('378', 'local', '1', '4', '0', '2025-11-20 13:28:04', '2025-11-20 13:28:04');
INSERT INTO `websockets_statistics_entries` VALUES ('379', 'local', '1', '3', '0', '2025-11-20 13:29:04', '2025-11-20 13:29:04');
INSERT INTO `websockets_statistics_entries` VALUES ('380', 'local', '1', '4', '0', '2025-11-20 13:30:04', '2025-11-20 13:30:04');
INSERT INTO `websockets_statistics_entries` VALUES ('381', 'local', '1', '4', '0', '2025-11-20 13:31:04', '2025-11-20 13:31:04');
INSERT INTO `websockets_statistics_entries` VALUES ('382', 'local', '1', '3', '0', '2025-11-20 13:32:04', '2025-11-20 13:32:04');
INSERT INTO `websockets_statistics_entries` VALUES ('383', 'local', '1', '2', '0', '2025-11-20 13:33:04', '2025-11-20 13:33:04');
INSERT INTO `websockets_statistics_entries` VALUES ('384', 'local', '1', '2', '0', '2025-11-20 13:34:04', '2025-11-20 13:34:04');
INSERT INTO `websockets_statistics_entries` VALUES ('385', 'local', '1', '2', '0', '2025-11-20 13:35:04', '2025-11-20 13:35:04');
INSERT INTO `websockets_statistics_entries` VALUES ('386', 'local', '1', '2', '0', '2025-11-20 13:36:04', '2025-11-20 13:36:04');
INSERT INTO `websockets_statistics_entries` VALUES ('387', 'local', '1', '2', '0', '2025-11-20 13:37:04', '2025-11-20 13:37:04');
INSERT INTO `websockets_statistics_entries` VALUES ('388', 'local', '1', '2', '0', '2025-11-20 13:38:04', '2025-11-20 13:38:04');
INSERT INTO `websockets_statistics_entries` VALUES ('389', 'local', '1', '2', '0', '2025-11-20 13:39:04', '2025-11-20 13:39:04');
INSERT INTO `websockets_statistics_entries` VALUES ('390', 'local', '1', '2', '0', '2025-11-20 13:40:04', '2025-11-20 13:40:04');
INSERT INTO `websockets_statistics_entries` VALUES ('391', 'local', '1', '2', '0', '2025-11-20 13:41:04', '2025-11-20 13:41:04');
INSERT INTO `websockets_statistics_entries` VALUES ('392', 'local', '1', '2', '0', '2025-11-20 13:42:04', '2025-11-20 13:42:04');
INSERT INTO `websockets_statistics_entries` VALUES ('393', 'local', '1', '2', '0', '2025-11-20 13:43:04', '2025-11-20 13:43:04');
INSERT INTO `websockets_statistics_entries` VALUES ('394', 'local', '1', '2', '0', '2025-11-20 13:44:04', '2025-11-20 13:44:04');
INSERT INTO `websockets_statistics_entries` VALUES ('395', 'local', '1', '2', '0', '2025-11-20 13:45:04', '2025-11-20 13:45:04');
INSERT INTO `websockets_statistics_entries` VALUES ('396', 'local', '1', '2', '0', '2025-11-20 13:46:04', '2025-11-20 13:46:04');
INSERT INTO `websockets_statistics_entries` VALUES ('397', 'local', '1', '2', '0', '2025-11-20 13:47:04', '2025-11-20 13:47:04');
INSERT INTO `websockets_statistics_entries` VALUES ('398', 'local', '1', '1', '0', '2025-11-20 13:48:04', '2025-11-20 13:48:04');
INSERT INTO `websockets_statistics_entries` VALUES ('399', 'local', '1', '2', '0', '2025-11-20 13:49:04', '2025-11-20 13:49:04');
INSERT INTO `websockets_statistics_entries` VALUES ('400', 'local', '1', '2', '1', '2025-11-20 13:50:04', '2025-11-20 13:50:04');
INSERT INTO `websockets_statistics_entries` VALUES ('401', 'local', '1', '2', '0', '2025-11-20 13:51:04', '2025-11-20 13:51:04');
INSERT INTO `websockets_statistics_entries` VALUES ('402', 'local', '1', '2', '0', '2025-11-20 13:52:04', '2025-11-20 13:52:04');
INSERT INTO `websockets_statistics_entries` VALUES ('403', 'local', '1', '2', '0', '2025-11-20 13:53:04', '2025-11-20 13:53:04');
INSERT INTO `websockets_statistics_entries` VALUES ('404', 'local', '1', '2', '0', '2025-11-20 13:54:04', '2025-11-20 13:54:04');
INSERT INTO `websockets_statistics_entries` VALUES ('405', 'local', '1', '2', '0', '2025-11-20 13:55:04', '2025-11-20 13:55:04');
INSERT INTO `websockets_statistics_entries` VALUES ('406', 'local', '1', '1', '1', '2025-11-20 13:56:04', '2025-11-20 13:56:04');
INSERT INTO `websockets_statistics_entries` VALUES ('407', 'local', '1', '2', '0', '2025-11-20 13:57:04', '2025-11-20 13:57:04');
INSERT INTO `websockets_statistics_entries` VALUES ('408', 'local', '1', '1', '1', '2025-11-20 13:58:04', '2025-11-20 13:58:04');
INSERT INTO `websockets_statistics_entries` VALUES ('409', 'local', '1', '2', '0', '2025-11-20 13:59:04', '2025-11-20 13:59:04');
INSERT INTO `websockets_statistics_entries` VALUES ('410', 'local', '1', '2', '0', '2025-11-20 14:00:04', '2025-11-20 14:00:04');
INSERT INTO `websockets_statistics_entries` VALUES ('411', 'local', '1', '2', '0', '2025-11-20 14:01:04', '2025-11-20 14:01:04');
INSERT INTO `websockets_statistics_entries` VALUES ('412', 'local', '1', '2', '0', '2025-11-20 14:02:04', '2025-11-20 14:02:04');
INSERT INTO `websockets_statistics_entries` VALUES ('413', 'local', '1', '2', '0', '2025-11-20 14:03:04', '2025-11-20 14:03:04');
INSERT INTO `websockets_statistics_entries` VALUES ('414', 'local', '1', '2', '0', '2025-11-20 14:04:04', '2025-11-20 14:04:04');
INSERT INTO `websockets_statistics_entries` VALUES ('415', 'local', '1', '2', '0', '2025-11-20 14:05:04', '2025-11-20 14:05:04');
INSERT INTO `websockets_statistics_entries` VALUES ('416', 'local', '1', '2', '0', '2025-11-20 14:06:04', '2025-11-20 14:06:04');
INSERT INTO `websockets_statistics_entries` VALUES ('417', 'local', '1', '2', '0', '2025-11-20 14:07:04', '2025-11-20 14:07:04');
INSERT INTO `websockets_statistics_entries` VALUES ('418', 'local', '1', '2', '0', '2025-11-20 14:08:04', '2025-11-20 14:08:04');
INSERT INTO `websockets_statistics_entries` VALUES ('419', 'local', '1', '2', '0', '2025-11-20 14:09:04', '2025-11-20 14:09:04');
INSERT INTO `websockets_statistics_entries` VALUES ('420', 'local', '1', '2', '0', '2025-11-20 14:10:05', '2025-11-20 14:10:05');
INSERT INTO `websockets_statistics_entries` VALUES ('421', 'local', '1', '2', '0', '2025-11-20 14:11:05', '2025-11-20 14:11:05');
INSERT INTO `websockets_statistics_entries` VALUES ('422', 'local', '1', '2', '0', '2025-11-20 14:12:05', '2025-11-20 14:12:05');
INSERT INTO `websockets_statistics_entries` VALUES ('423', 'local', '1', '1', '0', '2025-11-20 14:13:05', '2025-11-20 14:13:05');
INSERT INTO `websockets_statistics_entries` VALUES ('424', 'local', '1', '2', '0', '2025-11-20 14:14:05', '2025-11-20 14:14:05');
INSERT INTO `websockets_statistics_entries` VALUES ('425', 'local', '1', '2', '0', '2025-11-20 14:15:05', '2025-11-20 14:15:05');
INSERT INTO `websockets_statistics_entries` VALUES ('426', 'local', '2', '1', '0', '2025-11-20 14:16:05', '2025-11-20 14:16:05');
INSERT INTO `websockets_statistics_entries` VALUES ('427', 'local', '0', '0', '0', '2025-11-20 14:30:05', '2025-11-20 14:30:05');
INSERT INTO `websockets_statistics_entries` VALUES ('428', 'local', '1', '1', '0', '2025-11-20 15:01:05', '2025-11-20 15:01:05');
INSERT INTO `websockets_statistics_entries` VALUES ('429', 'local', '0', '2', '0', '2025-11-20 15:10:05', '2025-11-20 15:10:05');
INSERT INTO `websockets_statistics_entries` VALUES ('430', 'local', '1', '1', '0', '2025-11-20 15:11:05', '2025-11-20 15:11:05');
INSERT INTO `websockets_statistics_entries` VALUES ('431', 'local', '0', '1', '1', '2025-11-20 15:27:05', '2025-11-20 15:27:05');
INSERT INTO `websockets_statistics_entries` VALUES ('432', 'local', '1', '0', '0', '2025-11-20 15:28:05', '2025-11-20 15:28:05');
INSERT INTO `websockets_statistics_entries` VALUES ('433', 'local', '1', '2', '0', '2025-11-20 16:18:00', '2025-11-20 16:18:00');
INSERT INTO `websockets_statistics_entries` VALUES ('434', 'local', '1', '1', '1', '2025-11-20 16:19:00', '2025-11-20 16:19:00');
INSERT INTO `websockets_statistics_entries` VALUES ('435', 'local', '1', '2', '0', '2025-11-20 16:20:00', '2025-11-20 16:20:00');
INSERT INTO `websockets_statistics_entries` VALUES ('436', 'local', '1', '4', '0', '2025-11-20 16:21:00', '2025-11-20 16:21:00');
INSERT INTO `websockets_statistics_entries` VALUES ('437', 'local', '2', '6', '0', '2025-11-20 16:22:00', '2025-11-20 16:22:00');
INSERT INTO `websockets_statistics_entries` VALUES ('438', 'local', '2', '2', '3', '2025-11-20 16:23:00', '2025-11-20 16:23:00');
INSERT INTO `websockets_statistics_entries` VALUES ('439', 'local', '2', '4', '0', '2025-11-20 16:24:00', '2025-11-20 16:24:00');
INSERT INTO `websockets_statistics_entries` VALUES ('440', 'local', '2', '5', '1', '2025-11-20 16:25:00', '2025-11-20 16:25:00');
INSERT INTO `websockets_statistics_entries` VALUES ('441', 'local', '2', '2', '1', '2025-11-20 16:26:00', '2025-11-20 16:26:00');
INSERT INTO `websockets_statistics_entries` VALUES ('442', 'local', '2', '2', '1', '2025-11-20 16:27:00', '2025-11-20 16:27:00');
INSERT INTO `websockets_statistics_entries` VALUES ('443', 'local', '2', '2', '1', '2025-11-20 16:28:00', '2025-11-20 16:28:00');
INSERT INTO `websockets_statistics_entries` VALUES ('444', 'local', '2', '4', '0', '2025-11-20 16:29:00', '2025-11-20 16:29:00');
INSERT INTO `websockets_statistics_entries` VALUES ('445', 'local', '2', '4', '0', '2025-11-20 16:30:00', '2025-11-20 16:30:00');
INSERT INTO `websockets_statistics_entries` VALUES ('446', 'local', '2', '4', '0', '2025-11-20 16:31:00', '2025-11-20 16:31:00');
INSERT INTO `websockets_statistics_entries` VALUES ('447', 'local', '2', '4', '0', '2025-11-20 16:32:00', '2025-11-20 16:32:00');
INSERT INTO `websockets_statistics_entries` VALUES ('448', 'local', '2', '4', '0', '2025-11-20 16:33:00', '2025-11-20 16:33:00');
INSERT INTO `websockets_statistics_entries` VALUES ('449', 'local', '2', '4', '0', '2025-11-20 16:34:00', '2025-11-20 16:34:00');
INSERT INTO `websockets_statistics_entries` VALUES ('450', 'local', '2', '4', '0', '2025-11-20 16:35:00', '2025-11-20 16:35:00');
INSERT INTO `websockets_statistics_entries` VALUES ('451', 'local', '2', '4', '0', '2025-11-20 16:36:00', '2025-11-20 16:36:00');
INSERT INTO `websockets_statistics_entries` VALUES ('452', 'local', '2', '4', '0', '2025-11-20 16:37:00', '2025-11-20 16:37:00');
INSERT INTO `websockets_statistics_entries` VALUES ('453', 'local', '2', '4', '0', '2025-11-20 16:38:00', '2025-11-20 16:38:00');
INSERT INTO `websockets_statistics_entries` VALUES ('454', 'local', '2', '4', '0', '2025-11-20 16:39:00', '2025-11-20 16:39:00');
INSERT INTO `websockets_statistics_entries` VALUES ('455', 'local', '2', '4', '0', '2025-11-20 16:40:00', '2025-11-20 16:40:00');
INSERT INTO `websockets_statistics_entries` VALUES ('456', 'local', '2', '4', '0', '2025-11-20 16:41:00', '2025-11-20 16:41:00');
INSERT INTO `websockets_statistics_entries` VALUES ('457', 'local', '2', '4', '0', '2025-11-20 16:42:00', '2025-11-20 16:42:00');
INSERT INTO `websockets_statistics_entries` VALUES ('458', 'local', '2', '3', '0', '2025-11-20 16:43:00', '2025-11-20 16:43:00');
INSERT INTO `websockets_statistics_entries` VALUES ('459', 'local', '2', '3', '0', '2025-11-20 16:44:00', '2025-11-20 16:44:00');
INSERT INTO `websockets_statistics_entries` VALUES ('460', 'local', '2', '4', '0', '2025-11-20 16:45:00', '2025-11-20 16:45:00');
INSERT INTO `websockets_statistics_entries` VALUES ('461', 'local', '2', '4', '0', '2025-11-20 16:46:00', '2025-11-20 16:46:00');
INSERT INTO `websockets_statistics_entries` VALUES ('462', 'local', '2', '4', '0', '2025-11-20 16:47:00', '2025-11-20 16:47:00');
INSERT INTO `websockets_statistics_entries` VALUES ('463', 'local', '2', '4', '0', '2025-11-20 16:48:00', '2025-11-20 16:48:00');
INSERT INTO `websockets_statistics_entries` VALUES ('464', 'local', '2', '4', '0', '2025-11-20 16:49:00', '2025-11-20 16:49:00');
INSERT INTO `websockets_statistics_entries` VALUES ('465', 'local', '2', '4', '0', '2025-11-20 16:50:00', '2025-11-20 16:50:00');
INSERT INTO `websockets_statistics_entries` VALUES ('466', 'local', '2', '4', '0', '2025-11-20 16:51:00', '2025-11-20 16:51:00');
INSERT INTO `websockets_statistics_entries` VALUES ('467', 'local', '2', '4', '0', '2025-11-20 16:52:00', '2025-11-20 16:52:00');
INSERT INTO `websockets_statistics_entries` VALUES ('468', 'local', '2', '4', '0', '2025-11-20 16:53:00', '2025-11-20 16:53:00');
INSERT INTO `websockets_statistics_entries` VALUES ('469', 'local', '2', '4', '0', '2025-11-20 16:54:00', '2025-11-20 16:54:00');
INSERT INTO `websockets_statistics_entries` VALUES ('470', 'local', '2', '4', '0', '2025-11-20 16:55:00', '2025-11-20 16:55:00');
INSERT INTO `websockets_statistics_entries` VALUES ('471', 'local', '2', '4', '0', '2025-11-20 16:56:00', '2025-11-20 16:56:00');
INSERT INTO `websockets_statistics_entries` VALUES ('472', 'local', '2', '4', '0', '2025-11-20 16:57:00', '2025-11-20 16:57:00');
INSERT INTO `websockets_statistics_entries` VALUES ('473', 'local', '2', '4', '0', '2025-11-20 16:58:00', '2025-11-20 16:58:00');
INSERT INTO `websockets_statistics_entries` VALUES ('474', 'local', '2', '3', '0', '2025-11-20 16:59:00', '2025-11-20 16:59:00');
INSERT INTO `websockets_statistics_entries` VALUES ('475', 'local', '2', '4', '0', '2025-11-20 17:00:00', '2025-11-20 17:00:00');
INSERT INTO `websockets_statistics_entries` VALUES ('476', 'local', '2', '3', '0', '2025-11-20 17:01:00', '2025-11-20 17:01:00');
INSERT INTO `websockets_statistics_entries` VALUES ('477', 'local', '2', '4', '0', '2025-11-20 17:02:00', '2025-11-20 17:02:00');
INSERT INTO `websockets_statistics_entries` VALUES ('478', 'local', '2', '4', '1', '2025-11-20 17:03:00', '2025-11-20 17:03:00');
INSERT INTO `websockets_statistics_entries` VALUES ('479', 'local', '2', '6', '0', '2025-11-20 17:04:00', '2025-11-20 17:04:00');
INSERT INTO `websockets_statistics_entries` VALUES ('480', 'local', '2', '10', '0', '2025-11-20 17:05:00', '2025-11-20 17:05:00');
INSERT INTO `websockets_statistics_entries` VALUES ('481', 'local', '2', '3', '3', '2025-11-20 17:06:00', '2025-11-20 17:06:00');
INSERT INTO `websockets_statistics_entries` VALUES ('482', 'local', '2', '4', '1', '2025-11-20 17:07:00', '2025-11-20 17:07:00');
INSERT INTO `websockets_statistics_entries` VALUES ('483', 'local', '2', '4', '0', '2025-11-20 17:08:00', '2025-11-20 17:08:00');
INSERT INTO `websockets_statistics_entries` VALUES ('484', 'local', '2', '5', '0', '2025-11-20 17:09:00', '2025-11-20 17:09:00');
INSERT INTO `websockets_statistics_entries` VALUES ('485', 'local', '2', '4', '0', '2025-11-20 17:10:00', '2025-11-20 17:10:00');
INSERT INTO `websockets_statistics_entries` VALUES ('486', 'local', '2', '4', '0', '2025-11-20 17:11:00', '2025-11-20 17:11:00');
INSERT INTO `websockets_statistics_entries` VALUES ('487', 'local', '2', '4', '0', '2025-11-20 17:12:00', '2025-11-20 17:12:00');
INSERT INTO `websockets_statistics_entries` VALUES ('488', 'local', '2', '5', '0', '2025-11-20 17:13:00', '2025-11-20 17:13:00');
INSERT INTO `websockets_statistics_entries` VALUES ('489', 'local', '2', '5', '1', '2025-11-20 17:14:00', '2025-11-20 17:14:00');
INSERT INTO `websockets_statistics_entries` VALUES ('490', 'local', '2', '2', '0', '2025-11-20 17:15:00', '2025-11-20 17:15:00');
INSERT INTO `websockets_statistics_entries` VALUES ('491', 'local', '1', '2', '0', '2025-11-20 17:16:00', '2025-11-20 17:16:00');
INSERT INTO `websockets_statistics_entries` VALUES ('492', 'local', '1', '2', '0', '2025-11-20 17:17:00', '2025-11-20 17:17:00');
INSERT INTO `websockets_statistics_entries` VALUES ('493', 'local', '2', '3', '0', '2025-11-20 17:18:00', '2025-11-20 17:18:00');
INSERT INTO `websockets_statistics_entries` VALUES ('494', 'local', '2', '3', '2', '2025-11-20 17:19:00', '2025-11-20 17:19:00');
INSERT INTO `websockets_statistics_entries` VALUES ('495', 'local', '2', '4', '0', '2025-11-20 17:20:00', '2025-11-20 17:20:00');
INSERT INTO `websockets_statistics_entries` VALUES ('496', 'local', '2', '4', '0', '2025-11-20 17:21:00', '2025-11-20 17:21:00');
INSERT INTO `websockets_statistics_entries` VALUES ('497', 'local', '2', '4', '1', '2025-11-20 17:22:00', '2025-11-20 17:22:00');
INSERT INTO `websockets_statistics_entries` VALUES ('498', 'local', '2', '11', '0', '2025-11-20 17:23:00', '2025-11-20 17:23:00');
INSERT INTO `websockets_statistics_entries` VALUES ('499', 'local', '2', '3', '0', '2025-11-20 17:24:00', '2025-11-20 17:24:00');
INSERT INTO `websockets_statistics_entries` VALUES ('500', 'local', '2', '4', '0', '2025-11-20 17:25:00', '2025-11-20 17:25:00');
INSERT INTO `websockets_statistics_entries` VALUES ('501', 'local', '2', '4', '0', '2025-11-20 17:26:00', '2025-11-20 17:26:00');
INSERT INTO `websockets_statistics_entries` VALUES ('502', 'local', '2', '4', '0', '2025-11-20 17:27:00', '2025-11-20 17:27:00');
INSERT INTO `websockets_statistics_entries` VALUES ('503', 'local', '2', '4', '2', '2025-11-20 17:28:00', '2025-11-20 17:28:00');
INSERT INTO `websockets_statistics_entries` VALUES ('504', 'local', '2', '4', '0', '2025-11-20 17:29:00', '2025-11-20 17:29:00');
INSERT INTO `websockets_statistics_entries` VALUES ('505', 'local', '2', '4', '1', '2025-11-20 17:30:00', '2025-11-20 17:30:00');
INSERT INTO `websockets_statistics_entries` VALUES ('506', 'local', '2', '7', '1', '2025-11-20 17:31:00', '2025-11-20 17:31:00');
INSERT INTO `websockets_statistics_entries` VALUES ('507', 'local', '2', '4', '0', '2025-11-20 17:32:00', '2025-11-20 17:32:00');
INSERT INTO `websockets_statistics_entries` VALUES ('508', 'local', '2', '5', '0', '2025-11-20 17:33:00', '2025-11-20 17:33:00');
INSERT INTO `websockets_statistics_entries` VALUES ('509', 'local', '2', '5', '0', '2025-11-20 17:34:00', '2025-11-20 17:34:00');
INSERT INTO `websockets_statistics_entries` VALUES ('510', 'local', '2', '4', '0', '2025-11-20 17:35:00', '2025-11-20 17:35:00');
INSERT INTO `websockets_statistics_entries` VALUES ('511', 'local', '2', '6', '1', '2025-11-20 17:36:01', '2025-11-20 17:36:01');
INSERT INTO `websockets_statistics_entries` VALUES ('512', 'local', '2', '5', '0', '2025-11-20 17:37:01', '2025-11-20 17:37:01');
INSERT INTO `websockets_statistics_entries` VALUES ('513', 'local', '2', '5', '1', '2025-11-20 17:38:01', '2025-11-20 17:38:01');
INSERT INTO `websockets_statistics_entries` VALUES ('514', 'local', '2', '3', '1', '2025-11-20 17:39:01', '2025-11-20 17:39:01');
INSERT INTO `websockets_statistics_entries` VALUES ('515', 'local', '2', '4', '0', '2025-11-20 17:40:01', '2025-11-20 17:40:01');
INSERT INTO `websockets_statistics_entries` VALUES ('516', 'local', '2', '4', '0', '2025-11-20 17:41:01', '2025-11-20 17:41:01');
INSERT INTO `websockets_statistics_entries` VALUES ('517', 'local', '2', '4', '0', '2025-11-20 17:42:01', '2025-11-20 17:42:01');
INSERT INTO `websockets_statistics_entries` VALUES ('518', 'local', '2', '4', '0', '2025-11-20 17:43:01', '2025-11-20 17:43:01');
INSERT INTO `websockets_statistics_entries` VALUES ('519', 'local', '2', '5', '0', '2025-11-20 17:44:01', '2025-11-20 17:44:01');
INSERT INTO `websockets_statistics_entries` VALUES ('520', 'local', '2', '3', '1', '2025-11-20 17:45:01', '2025-11-20 17:45:01');
INSERT INTO `websockets_statistics_entries` VALUES ('521', 'local', '2', '4', '0', '2025-11-20 17:46:01', '2025-11-20 17:46:01');
INSERT INTO `websockets_statistics_entries` VALUES ('522', 'local', '2', '4', '2', '2025-11-20 17:47:01', '2025-11-20 17:47:01');
INSERT INTO `websockets_statistics_entries` VALUES ('523', 'local', '2', '4', '2', '2025-11-20 17:48:01', '2025-11-20 17:48:01');
INSERT INTO `websockets_statistics_entries` VALUES ('524', 'local', '1', '4', '0', '2025-11-20 17:49:01', '2025-11-20 17:49:01');
INSERT INTO `websockets_statistics_entries` VALUES ('525', 'local', '1', '2', '0', '2025-11-20 17:50:01', '2025-11-20 17:50:01');
INSERT INTO `websockets_statistics_entries` VALUES ('526', 'local', '1', '2', '0', '2025-11-20 17:51:01', '2025-11-20 17:51:01');
INSERT INTO `websockets_statistics_entries` VALUES ('527', 'local', '1', '1', '2', '2025-11-20 17:52:01', '2025-11-20 17:52:01');
INSERT INTO `websockets_statistics_entries` VALUES ('528', 'local', '1', '2', '0', '2025-11-20 17:53:01', '2025-11-20 17:53:01');
INSERT INTO `websockets_statistics_entries` VALUES ('529', 'local', '1', '2', '0', '2025-11-20 17:54:01', '2025-11-20 17:54:01');
INSERT INTO `websockets_statistics_entries` VALUES ('530', 'local', '1', '2', '0', '2025-11-20 17:55:01', '2025-11-20 17:55:01');
INSERT INTO `websockets_statistics_entries` VALUES ('531', 'local', '1', '2', '1', '2025-11-20 17:56:01', '2025-11-20 17:56:01');
INSERT INTO `websockets_statistics_entries` VALUES ('532', 'local', '1', '2', '0', '2025-11-20 17:57:01', '2025-11-20 17:57:01');
INSERT INTO `websockets_statistics_entries` VALUES ('533', 'local', '1', '2', '0', '2025-11-20 17:58:01', '2025-11-20 17:58:01');
INSERT INTO `websockets_statistics_entries` VALUES ('534', 'local', '1', '2', '0', '2025-11-20 17:59:01', '2025-11-20 17:59:01');
INSERT INTO `websockets_statistics_entries` VALUES ('535', 'local', '1', '2', '0', '2025-11-20 18:00:01', '2025-11-20 18:00:01');
INSERT INTO `websockets_statistics_entries` VALUES ('536', 'local', '1', '1', '0', '2025-11-20 18:01:01', '2025-11-20 18:01:01');
INSERT INTO `websockets_statistics_entries` VALUES ('537', 'local', '1', '2', '0', '2025-11-20 18:02:01', '2025-11-20 18:02:01');
INSERT INTO `websockets_statistics_entries` VALUES ('538', 'local', '1', '2', '0', '2025-11-20 18:03:01', '2025-11-20 18:03:01');
INSERT INTO `websockets_statistics_entries` VALUES ('539', 'local', '1', '2', '0', '2025-11-20 18:04:01', '2025-11-20 18:04:01');
INSERT INTO `websockets_statistics_entries` VALUES ('540', 'local', '1', '2', '0', '2025-11-20 18:05:01', '2025-11-20 18:05:01');
INSERT INTO `websockets_statistics_entries` VALUES ('541', 'local', '1', '2', '0', '2025-11-20 18:06:01', '2025-11-20 18:06:01');
INSERT INTO `websockets_statistics_entries` VALUES ('542', 'local', '1', '2', '0', '2025-11-20 18:07:01', '2025-11-20 18:07:01');
INSERT INTO `websockets_statistics_entries` VALUES ('543', 'local', '1', '2', '0', '2025-11-20 18:08:01', '2025-11-20 18:08:01');
INSERT INTO `websockets_statistics_entries` VALUES ('544', 'local', '1', '2', '0', '2025-11-20 18:09:01', '2025-11-20 18:09:01');
INSERT INTO `websockets_statistics_entries` VALUES ('545', 'local', '1', '2', '0', '2025-11-20 18:10:01', '2025-11-20 18:10:01');
INSERT INTO `websockets_statistics_entries` VALUES ('546', 'local', '1', '2', '0', '2025-11-20 18:11:01', '2025-11-20 18:11:01');
INSERT INTO `websockets_statistics_entries` VALUES ('547', 'local', '1', '4', '0', '2025-11-20 18:12:01', '2025-11-20 18:12:01');
INSERT INTO `websockets_statistics_entries` VALUES ('548', 'local', '1', '3', '0', '2025-11-20 18:13:01', '2025-11-20 18:13:01');
INSERT INTO `websockets_statistics_entries` VALUES ('549', 'local', '2', '4', '0', '2025-11-20 18:14:01', '2025-11-20 18:14:01');
INSERT INTO `websockets_statistics_entries` VALUES ('550', 'local', '2', '4', '0', '2025-11-20 18:15:01', '2025-11-20 18:15:01');
INSERT INTO `websockets_statistics_entries` VALUES ('551', 'local', '2', '5', '0', '2025-11-20 18:16:01', '2025-11-20 18:16:01');
INSERT INTO `websockets_statistics_entries` VALUES ('552', 'local', '1', '2', '0', '2025-11-20 18:17:01', '2025-11-20 18:17:01');
INSERT INTO `websockets_statistics_entries` VALUES ('553', 'local', '1', '2', '0', '2025-11-20 18:18:01', '2025-11-20 18:18:01');
INSERT INTO `websockets_statistics_entries` VALUES ('554', 'local', '1', '2', '0', '2025-11-20 18:19:01', '2025-11-20 18:19:01');
INSERT INTO `websockets_statistics_entries` VALUES ('555', 'local', '1', '2', '0', '2025-11-20 18:20:01', '2025-11-20 18:20:01');
INSERT INTO `websockets_statistics_entries` VALUES ('556', 'local', '1', '2', '0', '2025-11-20 18:21:01', '2025-11-20 18:21:01');
INSERT INTO `websockets_statistics_entries` VALUES ('557', 'local', '1', '2', '0', '2025-11-20 18:22:01', '2025-11-20 18:22:01');
INSERT INTO `websockets_statistics_entries` VALUES ('558', 'local', '1', '2', '0', '2025-11-20 18:23:01', '2025-11-20 18:23:01');
INSERT INTO `websockets_statistics_entries` VALUES ('559', 'local', '1', '2', '0', '2025-11-20 18:24:01', '2025-11-20 18:24:01');
INSERT INTO `websockets_statistics_entries` VALUES ('560', 'local', '1', '2', '0', '2025-11-20 18:25:01', '2025-11-20 18:25:01');
INSERT INTO `websockets_statistics_entries` VALUES ('561', 'local', '1', '2', '0', '2025-11-20 18:26:01', '2025-11-20 18:26:01');
INSERT INTO `websockets_statistics_entries` VALUES ('562', 'local', '1', '5', '0', '2025-11-20 18:27:01', '2025-11-20 18:27:01');
INSERT INTO `websockets_statistics_entries` VALUES ('563', 'local', '2', '7', '0', '2025-11-20 18:28:01', '2025-11-20 18:28:01');
INSERT INTO `websockets_statistics_entries` VALUES ('564', 'local', '2', '2', '0', '2025-11-20 18:29:01', '2025-11-20 18:29:01');
INSERT INTO `websockets_statistics_entries` VALUES ('565', 'local', '1', '2', '2', '2025-11-20 18:31:01', '2025-11-20 18:31:01');
INSERT INTO `websockets_statistics_entries` VALUES ('566', 'local', '1', '3', '2', '2025-11-20 18:33:01', '2025-11-20 18:33:01');
INSERT INTO `websockets_statistics_entries` VALUES ('567', 'local', '2', '3', '2', '2025-11-20 18:34:01', '2025-11-20 18:34:01');
INSERT INTO `websockets_statistics_entries` VALUES ('568', 'local', '2', '2', '1', '2025-11-20 18:35:01', '2025-11-20 18:35:01');
INSERT INTO `websockets_statistics_entries` VALUES ('569', 'local', '2', '7', '1', '2025-11-20 18:36:01', '2025-11-20 18:36:01');
INSERT INTO `websockets_statistics_entries` VALUES ('570', 'local', '2', '3', '1', '2025-11-20 18:37:01', '2025-11-20 18:37:01');
INSERT INTO `websockets_statistics_entries` VALUES ('571', 'local', '2', '6', '0', '2025-11-20 18:38:01', '2025-11-20 18:38:01');
INSERT INTO `websockets_statistics_entries` VALUES ('572', 'local', '2', '2', '2', '2025-11-20 18:39:01', '2025-11-20 18:39:01');
INSERT INTO `websockets_statistics_entries` VALUES ('573', 'local', '1', '1', '1', '2025-11-20 18:40:01', '2025-11-20 18:40:01');
INSERT INTO `websockets_statistics_entries` VALUES ('574', 'local', '1', '3', '1', '2025-11-20 18:44:01', '2025-11-20 18:44:01');
INSERT INTO `websockets_statistics_entries` VALUES ('575', 'local', '1', '2', '3', '2025-11-20 18:45:01', '2025-11-20 18:45:01');
INSERT INTO `websockets_statistics_entries` VALUES ('576', 'local', '1', '3', '1', '2025-11-20 18:46:01', '2025-11-20 18:46:01');
INSERT INTO `websockets_statistics_entries` VALUES ('577', 'local', '1', '2', '0', '2025-11-20 18:47:01', '2025-11-20 18:47:01');
INSERT INTO `websockets_statistics_entries` VALUES ('578', 'local', '1', '2', '0', '2025-11-20 18:48:01', '2025-11-20 18:48:01');
INSERT INTO `websockets_statistics_entries` VALUES ('579', 'local', '1', '2', '0', '2025-11-20 18:49:01', '2025-11-20 18:49:01');
INSERT INTO `websockets_statistics_entries` VALUES ('580', 'local', '1', '1', '0', '2025-11-20 18:50:01', '2025-11-20 18:50:01');
INSERT INTO `websockets_statistics_entries` VALUES ('581', 'local', '1', '2', '0', '2025-11-20 18:51:04', '2025-11-20 18:51:04');
INSERT INTO `websockets_statistics_entries` VALUES ('582', 'local', '1', '2', '0', '2025-11-20 18:52:04', '2025-11-20 18:52:04');
INSERT INTO `websockets_statistics_entries` VALUES ('583', 'local', '1', '2', '0', '2025-11-20 18:53:04', '2025-11-20 18:53:04');
INSERT INTO `websockets_statistics_entries` VALUES ('584', 'local', '1', '2', '0', '2025-11-20 18:54:04', '2025-11-20 18:54:04');
INSERT INTO `websockets_statistics_entries` VALUES ('585', 'local', '1', '4', '0', '2025-11-26 13:12:57', '2025-11-26 13:12:57');
INSERT INTO `websockets_statistics_entries` VALUES ('586', 'local', '1', '2', '0', '2025-11-26 13:13:57', '2025-11-26 13:13:57');
INSERT INTO `websockets_statistics_entries` VALUES ('587', 'local', '1', '2', '0', '2025-11-26 13:14:57', '2025-11-26 13:14:57');
INSERT INTO `websockets_statistics_entries` VALUES ('588', 'local', '1', '2', '0', '2025-11-26 13:15:57', '2025-11-26 13:15:57');
INSERT INTO `websockets_statistics_entries` VALUES ('589', 'local', '1', '2', '0', '2025-11-26 13:16:57', '2025-11-26 13:16:57');
INSERT INTO `websockets_statistics_entries` VALUES ('590', 'local', '1', '2', '0', '2025-11-26 13:17:57', '2025-11-26 13:17:57');
INSERT INTO `websockets_statistics_entries` VALUES ('591', 'local', '1', '2', '0', '2025-11-26 13:18:57', '2025-11-26 13:18:57');
INSERT INTO `websockets_statistics_entries` VALUES ('592', 'local', '2', '3', '0', '2025-11-26 13:19:57', '2025-11-26 13:19:57');
INSERT INTO `websockets_statistics_entries` VALUES ('593', 'local', '1', '2', '0', '2025-11-26 13:20:57', '2025-11-26 13:20:57');
INSERT INTO `websockets_statistics_entries` VALUES ('594', 'local', '1', '2', '0', '2025-11-26 13:21:57', '2025-11-26 13:21:57');
INSERT INTO `websockets_statistics_entries` VALUES ('595', 'local', '1', '2', '0', '2025-11-26 13:22:57', '2025-11-26 13:22:57');
INSERT INTO `websockets_statistics_entries` VALUES ('596', 'local', '1', '1', '0', '2025-11-26 13:23:57', '2025-11-26 13:23:57');
INSERT INTO `websockets_statistics_entries` VALUES ('597', 'local', '1', '2', '0', '2025-11-26 13:24:57', '2025-11-26 13:24:57');
INSERT INTO `websockets_statistics_entries` VALUES ('598', 'local', '1', '2', '0', '2025-11-26 13:25:57', '2025-11-26 13:25:57');
INSERT INTO `websockets_statistics_entries` VALUES ('599', 'local', '1', '2', '0', '2025-11-26 13:26:57', '2025-11-26 13:26:57');
INSERT INTO `websockets_statistics_entries` VALUES ('600', 'local', '1', '2', '0', '2025-11-26 13:27:57', '2025-11-26 13:27:57');
INSERT INTO `websockets_statistics_entries` VALUES ('601', 'local', '1', '2', '0', '2025-11-26 13:28:57', '2025-11-26 13:28:57');
INSERT INTO `websockets_statistics_entries` VALUES ('602', 'local', '1', '2', '0', '2025-11-26 13:29:57', '2025-11-26 13:29:57');
INSERT INTO `websockets_statistics_entries` VALUES ('603', 'local', '1', '2', '0', '2025-11-26 13:30:57', '2025-11-26 13:30:57');
INSERT INTO `websockets_statistics_entries` VALUES ('604', 'local', '1', '2', '0', '2025-11-26 13:31:57', '2025-11-26 13:31:57');
INSERT INTO `websockets_statistics_entries` VALUES ('605', 'local', '1', '2', '0', '2025-11-26 13:32:57', '2025-11-26 13:32:57');
INSERT INTO `websockets_statistics_entries` VALUES ('606', 'local', '1', '2', '0', '2025-11-26 13:33:57', '2025-11-26 13:33:57');
INSERT INTO `websockets_statistics_entries` VALUES ('607', 'local', '1', '2', '0', '2025-11-26 13:34:57', '2025-11-26 13:34:57');
INSERT INTO `websockets_statistics_entries` VALUES ('608', 'local', '1', '2', '0', '2025-11-26 13:35:57', '2025-11-26 13:35:57');
INSERT INTO `websockets_statistics_entries` VALUES ('609', 'local', '1', '2', '0', '2025-11-26 13:36:57', '2025-11-26 13:36:57');
INSERT INTO `websockets_statistics_entries` VALUES ('610', 'local', '1', '2', '0', '2025-11-26 13:37:57', '2025-11-26 13:37:57');
INSERT INTO `websockets_statistics_entries` VALUES ('611', 'local', '1', '1', '0', '2025-11-26 13:38:57', '2025-11-26 13:38:57');
INSERT INTO `websockets_statistics_entries` VALUES ('612', 'local', '1', '2', '0', '2025-11-26 13:39:57', '2025-11-26 13:39:57');
INSERT INTO `websockets_statistics_entries` VALUES ('613', 'local', '1', '2', '0', '2025-11-26 13:40:57', '2025-11-26 13:40:57');
INSERT INTO `websockets_statistics_entries` VALUES ('614', 'local', '1', '2', '0', '2025-11-26 13:41:57', '2025-11-26 13:41:57');
INSERT INTO `websockets_statistics_entries` VALUES ('615', 'local', '1', '2', '0', '2025-11-26 13:42:57', '2025-11-26 13:42:57');
INSERT INTO `websockets_statistics_entries` VALUES ('616', 'local', '1', '2', '0', '2025-11-26 13:43:57', '2025-11-26 13:43:57');
INSERT INTO `websockets_statistics_entries` VALUES ('617', 'local', '1', '2', '0', '2025-11-26 13:44:57', '2025-11-26 13:44:57');
INSERT INTO `websockets_statistics_entries` VALUES ('618', 'local', '1', '2', '0', '2025-11-26 13:45:57', '2025-11-26 13:45:57');
INSERT INTO `websockets_statistics_entries` VALUES ('619', 'local', '1', '2', '0', '2025-11-26 13:46:57', '2025-11-26 13:46:57');
INSERT INTO `websockets_statistics_entries` VALUES ('620', 'local', '1', '2', '0', '2025-11-26 13:47:57', '2025-11-26 13:47:57');
INSERT INTO `websockets_statistics_entries` VALUES ('621', 'local', '1', '2', '0', '2025-11-26 13:48:57', '2025-11-26 13:48:57');
INSERT INTO `websockets_statistics_entries` VALUES ('622', 'local', '1', '2', '0', '2025-11-26 13:49:57', '2025-11-26 13:49:57');
INSERT INTO `websockets_statistics_entries` VALUES ('623', 'local', '1', '2', '0', '2025-11-26 13:50:57', '2025-11-26 13:50:57');
INSERT INTO `websockets_statistics_entries` VALUES ('624', 'local', '1', '2', '0', '2025-11-26 13:51:57', '2025-11-26 13:51:57');
INSERT INTO `websockets_statistics_entries` VALUES ('625', 'local', '1', '2', '0', '2025-11-26 13:52:57', '2025-11-26 13:52:57');
INSERT INTO `websockets_statistics_entries` VALUES ('626', 'local', '1', '2', '0', '2025-11-26 13:53:57', '2025-11-26 13:53:57');
INSERT INTO `websockets_statistics_entries` VALUES ('627', 'local', '1', '1', '0', '2025-11-26 13:54:57', '2025-11-26 13:54:57');
INSERT INTO `websockets_statistics_entries` VALUES ('628', 'local', '1', '2', '0', '2025-11-26 13:55:57', '2025-11-26 13:55:57');
INSERT INTO `websockets_statistics_entries` VALUES ('629', 'local', '1', '2', '0', '2025-11-26 13:56:57', '2025-11-26 13:56:57');
INSERT INTO `websockets_statistics_entries` VALUES ('630', 'local', '1', '2', '0', '2025-11-26 13:57:57', '2025-11-26 13:57:57');
INSERT INTO `websockets_statistics_entries` VALUES ('631', 'local', '1', '2', '0', '2025-11-26 13:58:57', '2025-11-26 13:58:57');
INSERT INTO `websockets_statistics_entries` VALUES ('632', 'local', '1', '2', '0', '2025-11-26 13:59:57', '2025-11-26 13:59:57');
INSERT INTO `websockets_statistics_entries` VALUES ('633', 'local', '1', '2', '0', '2025-11-26 14:00:57', '2025-11-26 14:00:57');
INSERT INTO `websockets_statistics_entries` VALUES ('634', 'local', '1', '2', '0', '2025-11-26 14:01:57', '2025-11-26 14:01:57');
INSERT INTO `websockets_statistics_entries` VALUES ('635', 'local', '1', '2', '0', '2025-11-26 14:02:57', '2025-11-26 14:02:57');
INSERT INTO `websockets_statistics_entries` VALUES ('636', 'local', '1', '2', '0', '2025-11-26 14:03:57', '2025-11-26 14:03:57');
INSERT INTO `websockets_statistics_entries` VALUES ('637', 'local', '1', '2', '0', '2025-11-26 14:04:57', '2025-11-26 14:04:57');
INSERT INTO `websockets_statistics_entries` VALUES ('638', 'local', '1', '2', '0', '2025-11-26 14:05:57', '2025-11-26 14:05:57');
INSERT INTO `websockets_statistics_entries` VALUES ('639', 'local', '1', '2', '0', '2025-11-26 14:06:57', '2025-11-26 14:06:57');
INSERT INTO `websockets_statistics_entries` VALUES ('640', 'local', '1', '2', '0', '2025-11-26 14:07:57', '2025-11-26 14:07:57');
INSERT INTO `websockets_statistics_entries` VALUES ('641', 'local', '1', '2', '0', '2025-11-26 14:08:57', '2025-11-26 14:08:57');
INSERT INTO `websockets_statistics_entries` VALUES ('642', 'local', '1', '2', '0', '2025-11-26 14:09:57', '2025-11-26 14:09:57');
INSERT INTO `websockets_statistics_entries` VALUES ('643', 'local', '1', '4', '0', '2025-11-26 14:10:57', '2025-11-26 14:10:57');
INSERT INTO `websockets_statistics_entries` VALUES ('644', 'local', '1', '2', '0', '2025-11-26 14:11:57', '2025-11-26 14:11:57');
INSERT INTO `websockets_statistics_entries` VALUES ('645', 'local', '1', '2', '0', '2025-11-26 14:12:57', '2025-11-26 14:12:57');
INSERT INTO `websockets_statistics_entries` VALUES ('646', 'local', '1', '2', '0', '2025-11-26 14:13:57', '2025-11-26 14:13:57');
INSERT INTO `websockets_statistics_entries` VALUES ('647', 'local', '1', '1', '0', '2025-11-26 14:14:57', '2025-11-26 14:14:57');
INSERT INTO `websockets_statistics_entries` VALUES ('648', 'local', '1', '2', '0', '2025-11-26 14:15:57', '2025-11-26 14:15:57');
INSERT INTO `websockets_statistics_entries` VALUES ('649', 'local', '1', '2', '0', '2025-11-26 14:16:57', '2025-11-26 14:16:57');
INSERT INTO `websockets_statistics_entries` VALUES ('650', 'local', '1', '2', '0', '2025-11-26 14:17:57', '2025-11-26 14:17:57');
INSERT INTO `websockets_statistics_entries` VALUES ('651', 'local', '1', '2', '0', '2025-11-26 14:18:57', '2025-11-26 14:18:57');
INSERT INTO `websockets_statistics_entries` VALUES ('652', 'local', '1', '2', '0', '2025-11-26 14:19:57', '2025-11-26 14:19:57');
INSERT INTO `websockets_statistics_entries` VALUES ('653', 'local', '1', '2', '0', '2025-11-26 14:20:57', '2025-11-26 14:20:57');
INSERT INTO `websockets_statistics_entries` VALUES ('654', 'local', '1', '2', '0', '2025-11-26 14:21:57', '2025-11-26 14:21:57');
INSERT INTO `websockets_statistics_entries` VALUES ('655', 'local', '1', '4', '0', '2025-11-26 14:22:57', '2025-11-26 14:22:57');
INSERT INTO `websockets_statistics_entries` VALUES ('656', 'local', '1', '2', '0', '2025-11-26 14:23:57', '2025-11-26 14:23:57');
INSERT INTO `websockets_statistics_entries` VALUES ('657', 'local', '1', '2', '0', '2025-11-26 14:24:57', '2025-11-26 14:24:57');
INSERT INTO `websockets_statistics_entries` VALUES ('658', 'local', '1', '5', '0', '2025-11-26 14:25:57', '2025-11-26 14:25:57');
INSERT INTO `websockets_statistics_entries` VALUES ('659', 'local', '1', '2', '0', '2025-11-26 14:26:57', '2025-11-26 14:26:57');
INSERT INTO `websockets_statistics_entries` VALUES ('660', 'local', '1', '7', '0', '2025-11-26 14:27:57', '2025-11-26 14:27:57');
INSERT INTO `websockets_statistics_entries` VALUES ('661', 'local', '1', '9', '0', '2025-11-26 14:28:57', '2025-11-26 14:28:57');
INSERT INTO `websockets_statistics_entries` VALUES ('662', 'local', '1', '2', '0', '2025-11-26 14:29:57', '2025-11-26 14:29:57');
INSERT INTO `websockets_statistics_entries` VALUES ('663', 'local', '1', '4', '0', '2025-11-26 14:30:57', '2025-11-26 14:30:57');
INSERT INTO `websockets_statistics_entries` VALUES ('664', 'local', '1', '4', '0', '2025-11-26 14:31:57', '2025-11-26 14:31:57');
INSERT INTO `websockets_statistics_entries` VALUES ('665', 'local', '1', '2', '0', '2025-11-26 14:32:58', '2025-11-26 14:32:58');
INSERT INTO `websockets_statistics_entries` VALUES ('666', 'local', '1', '2', '0', '2025-11-26 14:33:58', '2025-11-26 14:33:58');
INSERT INTO `websockets_statistics_entries` VALUES ('667', 'local', '1', '2', '0', '2025-11-26 14:34:58', '2025-11-26 14:34:58');
INSERT INTO `websockets_statistics_entries` VALUES ('668', 'local', '1', '2', '0', '2025-11-26 14:35:58', '2025-11-26 14:35:58');
INSERT INTO `websockets_statistics_entries` VALUES ('669', 'local', '1', '2', '0', '2025-11-26 14:36:58', '2025-11-26 14:36:58');
INSERT INTO `websockets_statistics_entries` VALUES ('670', 'local', '1', '2', '0', '2025-11-26 14:37:58', '2025-11-26 14:37:58');
INSERT INTO `websockets_statistics_entries` VALUES ('671', 'local', '1', '5', '0', '2025-11-26 14:38:58', '2025-11-26 14:38:58');
INSERT INTO `websockets_statistics_entries` VALUES ('672', 'local', '1', '2', '0', '2025-11-26 14:39:58', '2025-11-26 14:39:58');
INSERT INTO `websockets_statistics_entries` VALUES ('673', 'local', '1', '4', '0', '2025-11-26 14:40:58', '2025-11-26 14:40:58');
INSERT INTO `websockets_statistics_entries` VALUES ('674', 'local', '1', '2', '0', '2025-11-26 14:41:58', '2025-11-26 14:41:58');
INSERT INTO `websockets_statistics_entries` VALUES ('675', 'local', '1', '2', '0', '2025-11-26 14:42:58', '2025-11-26 14:42:58');
INSERT INTO `websockets_statistics_entries` VALUES ('676', 'local', '1', '2', '0', '2025-11-26 14:43:58', '2025-11-26 14:43:58');
INSERT INTO `websockets_statistics_entries` VALUES ('677', 'local', '1', '2', '0', '2025-11-26 14:44:58', '2025-11-26 14:44:58');
INSERT INTO `websockets_statistics_entries` VALUES ('678', 'local', '1', '4', '0', '2025-11-26 14:45:58', '2025-11-26 14:45:58');
INSERT INTO `websockets_statistics_entries` VALUES ('679', 'local', '1', '3', '0', '2025-11-26 14:46:58', '2025-11-26 14:46:58');
INSERT INTO `websockets_statistics_entries` VALUES ('680', 'local', '1', '5', '0', '2025-11-26 14:47:58', '2025-11-26 14:47:58');
INSERT INTO `websockets_statistics_entries` VALUES ('681', 'local', '1', '7', '0', '2025-11-26 14:48:58', '2025-11-26 14:48:58');
INSERT INTO `websockets_statistics_entries` VALUES ('682', 'local', '1', '16', '0', '2025-11-26 14:49:58', '2025-11-26 14:49:58');
INSERT INTO `websockets_statistics_entries` VALUES ('683', 'local', '1', '2', '0', '2025-11-26 14:50:58', '2025-11-26 14:50:58');
INSERT INTO `websockets_statistics_entries` VALUES ('684', 'local', '1', '4', '0', '2025-11-26 14:51:58', '2025-11-26 14:51:58');
INSERT INTO `websockets_statistics_entries` VALUES ('685', 'local', '1', '2', '0', '2025-11-26 14:52:58', '2025-11-26 14:52:58');
INSERT INTO `websockets_statistics_entries` VALUES ('686', 'local', '1', '2', '0', '2025-11-26 14:53:58', '2025-11-26 14:53:58');
INSERT INTO `websockets_statistics_entries` VALUES ('687', 'local', '1', '2', '0', '2025-11-26 14:54:58', '2025-11-26 14:54:58');
INSERT INTO `websockets_statistics_entries` VALUES ('688', 'local', '1', '2', '0', '2025-11-26 14:55:58', '2025-11-26 14:55:58');
INSERT INTO `websockets_statistics_entries` VALUES ('689', 'local', '1', '5', '0', '2025-11-26 14:56:58', '2025-11-26 14:56:58');
INSERT INTO `websockets_statistics_entries` VALUES ('690', 'local', '1', '10', '0', '2025-11-26 14:57:58', '2025-11-26 14:57:58');
INSERT INTO `websockets_statistics_entries` VALUES ('691', 'local', '1', '2', '0', '2025-11-26 14:58:58', '2025-11-26 14:58:58');
INSERT INTO `websockets_statistics_entries` VALUES ('692', 'local', '1', '1', '0', '2025-11-26 14:59:58', '2025-11-26 14:59:58');
INSERT INTO `websockets_statistics_entries` VALUES ('693', 'local', '1', '2', '0', '2025-11-26 15:00:58', '2025-11-26 15:00:58');
INSERT INTO `websockets_statistics_entries` VALUES ('694', 'local', '1', '2', '0', '2025-11-26 15:01:58', '2025-11-26 15:01:58');
INSERT INTO `websockets_statistics_entries` VALUES ('695', 'local', '1', '2', '0', '2025-11-26 15:02:58', '2025-11-26 15:02:58');
INSERT INTO `websockets_statistics_entries` VALUES ('696', 'local', '1', '2', '0', '2025-11-26 15:03:58', '2025-11-26 15:03:58');
INSERT INTO `websockets_statistics_entries` VALUES ('697', 'local', '1', '2', '0', '2025-11-26 15:04:58', '2025-11-26 15:04:58');
INSERT INTO `websockets_statistics_entries` VALUES ('698', 'local', '1', '2', '0', '2025-11-26 15:05:58', '2025-11-26 15:05:58');
INSERT INTO `websockets_statistics_entries` VALUES ('699', 'local', '1', '2', '0', '2025-11-26 15:06:58', '2025-11-26 15:06:58');
INSERT INTO `websockets_statistics_entries` VALUES ('700', 'local', '1', '2', '0', '2025-11-26 15:07:58', '2025-11-26 15:07:58');
INSERT INTO `websockets_statistics_entries` VALUES ('701', 'local', '1', '2', '0', '2025-11-26 15:08:58', '2025-11-26 15:08:58');
INSERT INTO `websockets_statistics_entries` VALUES ('702', 'local', '1', '2', '0', '2025-11-26 15:09:58', '2025-11-26 15:09:58');
INSERT INTO `websockets_statistics_entries` VALUES ('703', 'local', '1', '2', '0', '2025-11-26 15:10:58', '2025-11-26 15:10:58');
INSERT INTO `websockets_statistics_entries` VALUES ('704', 'local', '1', '2', '0', '2025-11-26 15:11:58', '2025-11-26 15:11:58');
INSERT INTO `websockets_statistics_entries` VALUES ('705', 'local', '1', '2', '0', '2025-11-26 15:12:58', '2025-11-26 15:12:58');
INSERT INTO `websockets_statistics_entries` VALUES ('706', 'local', '1', '2', '0', '2025-11-26 15:13:58', '2025-11-26 15:13:58');
INSERT INTO `websockets_statistics_entries` VALUES ('707', 'local', '1', '1', '0', '2025-11-26 15:14:58', '2025-11-26 15:14:58');
INSERT INTO `websockets_statistics_entries` VALUES ('708', 'local', '1', '2', '0', '2025-11-26 15:15:58', '2025-11-26 15:15:58');
INSERT INTO `websockets_statistics_entries` VALUES ('709', 'local', '1', '2', '0', '2025-11-26 15:16:58', '2025-11-26 15:16:58');
INSERT INTO `websockets_statistics_entries` VALUES ('710', 'local', '1', '2', '0', '2025-11-26 15:17:58', '2025-11-26 15:17:58');
INSERT INTO `websockets_statistics_entries` VALUES ('711', 'local', '1', '2', '0', '2025-11-26 15:18:58', '2025-11-26 15:18:58');
INSERT INTO `websockets_statistics_entries` VALUES ('712', 'local', '1', '2', '0', '2025-11-26 15:19:58', '2025-11-26 15:19:58');
INSERT INTO `websockets_statistics_entries` VALUES ('713', 'local', '1', '2', '0', '2025-11-26 15:20:58', '2025-11-26 15:20:58');
INSERT INTO `websockets_statistics_entries` VALUES ('714', 'local', '1', '2', '0', '2025-11-26 15:21:58', '2025-11-26 15:21:58');
INSERT INTO `websockets_statistics_entries` VALUES ('715', 'local', '1', '2', '0', '2025-11-26 15:22:58', '2025-11-26 15:22:58');
INSERT INTO `websockets_statistics_entries` VALUES ('716', 'local', '1', '2', '0', '2025-11-26 15:23:58', '2025-11-26 15:23:58');
INSERT INTO `websockets_statistics_entries` VALUES ('717', 'local', '1', '2', '0', '2025-11-26 15:24:58', '2025-11-26 15:24:58');
INSERT INTO `websockets_statistics_entries` VALUES ('718', 'local', '1', '2', '0', '2025-11-26 15:25:58', '2025-11-26 15:25:58');
INSERT INTO `websockets_statistics_entries` VALUES ('719', 'local', '1', '2', '0', '2025-11-26 15:26:58', '2025-11-26 15:26:58');
INSERT INTO `websockets_statistics_entries` VALUES ('720', 'local', '1', '2', '0', '2025-11-26 15:27:58', '2025-11-26 15:27:58');
INSERT INTO `websockets_statistics_entries` VALUES ('721', 'local', '1', '2', '0', '2025-11-26 15:28:58', '2025-11-26 15:28:58');
INSERT INTO `websockets_statistics_entries` VALUES ('722', 'local', '1', '2', '0', '2025-11-26 15:29:58', '2025-11-26 15:29:58');
INSERT INTO `websockets_statistics_entries` VALUES ('723', 'local', '1', '1', '0', '2025-11-26 15:30:58', '2025-11-26 15:30:58');
INSERT INTO `websockets_statistics_entries` VALUES ('724', 'local', '1', '2', '0', '2025-11-26 15:31:58', '2025-11-26 15:31:58');
INSERT INTO `websockets_statistics_entries` VALUES ('725', 'local', '1', '2', '0', '2025-11-26 15:32:58', '2025-11-26 15:32:58');
INSERT INTO `websockets_statistics_entries` VALUES ('726', 'local', '1', '2', '0', '2025-11-26 15:33:58', '2025-11-26 15:33:58');
INSERT INTO `websockets_statistics_entries` VALUES ('727', 'local', '1', '2', '0', '2025-11-26 15:34:58', '2025-11-26 15:34:58');
INSERT INTO `websockets_statistics_entries` VALUES ('728', 'local', '1', '2', '0', '2025-11-26 15:35:58', '2025-11-26 15:35:58');
INSERT INTO `websockets_statistics_entries` VALUES ('729', 'local', '1', '2', '0', '2025-11-26 15:36:58', '2025-11-26 15:36:58');
INSERT INTO `websockets_statistics_entries` VALUES ('730', 'local', '1', '2', '0', '2025-11-26 15:37:58', '2025-11-26 15:37:58');
INSERT INTO `websockets_statistics_entries` VALUES ('731', 'local', '1', '2', '0', '2025-11-26 15:38:58', '2025-11-26 15:38:58');
INSERT INTO `websockets_statistics_entries` VALUES ('732', 'local', '1', '2', '0', '2025-11-26 15:39:58', '2025-11-26 15:39:58');
INSERT INTO `websockets_statistics_entries` VALUES ('733', 'local', '1', '2', '0', '2025-11-26 15:40:58', '2025-11-26 15:40:58');
INSERT INTO `websockets_statistics_entries` VALUES ('734', 'local', '1', '2', '0', '2025-11-26 15:41:58', '2025-11-26 15:41:58');
INSERT INTO `websockets_statistics_entries` VALUES ('735', 'local', '1', '2', '0', '2025-11-26 15:42:58', '2025-11-26 15:42:58');
INSERT INTO `websockets_statistics_entries` VALUES ('736', 'local', '1', '2', '0', '2025-11-26 15:43:58', '2025-11-26 15:43:58');
INSERT INTO `websockets_statistics_entries` VALUES ('737', 'local', '1', '2', '0', '2025-11-26 15:44:58', '2025-11-26 15:44:58');
INSERT INTO `websockets_statistics_entries` VALUES ('738', 'local', '1', '2', '0', '2025-11-26 15:45:58', '2025-11-26 15:45:58');
INSERT INTO `websockets_statistics_entries` VALUES ('739', 'local', '1', '1', '0', '2025-11-26 15:46:58', '2025-11-26 15:46:58');
INSERT INTO `websockets_statistics_entries` VALUES ('740', 'local', '1', '2', '0', '2025-11-26 15:47:58', '2025-11-26 15:47:58');
INSERT INTO `websockets_statistics_entries` VALUES ('741', 'local', '1', '2', '0', '2025-11-26 15:48:58', '2025-11-26 15:48:58');
INSERT INTO `websockets_statistics_entries` VALUES ('742', 'local', '1', '2', '0', '2025-11-26 15:49:58', '2025-11-26 15:49:58');
INSERT INTO `websockets_statistics_entries` VALUES ('743', 'local', '1', '2', '0', '2025-11-26 15:50:58', '2025-11-26 15:50:58');
INSERT INTO `websockets_statistics_entries` VALUES ('744', 'local', '1', '2', '0', '2025-11-26 15:51:58', '2025-11-26 15:51:58');
INSERT INTO `websockets_statistics_entries` VALUES ('745', 'local', '1', '2', '0', '2025-11-26 15:52:58', '2025-11-26 15:52:58');
INSERT INTO `websockets_statistics_entries` VALUES ('746', 'local', '1', '2', '0', '2025-11-26 15:53:58', '2025-11-26 15:53:58');
INSERT INTO `websockets_statistics_entries` VALUES ('747', 'local', '1', '2', '0', '2025-11-26 15:54:58', '2025-11-26 15:54:58');
INSERT INTO `websockets_statistics_entries` VALUES ('748', 'local', '1', '2', '0', '2025-11-26 15:55:58', '2025-11-26 15:55:58');
INSERT INTO `websockets_statistics_entries` VALUES ('749', 'local', '1', '2', '0', '2025-11-26 15:56:58', '2025-11-26 15:56:58');
INSERT INTO `websockets_statistics_entries` VALUES ('750', 'local', '1', '2', '0', '2025-11-26 15:57:58', '2025-11-26 15:57:58');
INSERT INTO `websockets_statistics_entries` VALUES ('751', 'local', '1', '2', '0', '2025-11-26 15:58:58', '2025-11-26 15:58:58');
INSERT INTO `websockets_statistics_entries` VALUES ('752', 'local', '1', '2', '0', '2025-11-26 15:59:58', '2025-11-26 15:59:58');
INSERT INTO `websockets_statistics_entries` VALUES ('753', 'local', '1', '2', '0', '2025-11-26 16:00:58', '2025-11-26 16:00:58');
INSERT INTO `websockets_statistics_entries` VALUES ('754', 'local', '1', '1', '0', '2025-11-26 16:01:58', '2025-11-26 16:01:58');
INSERT INTO `websockets_statistics_entries` VALUES ('755', 'local', '1', '2', '0', '2025-11-26 16:02:58', '2025-11-26 16:02:58');
INSERT INTO `websockets_statistics_entries` VALUES ('756', 'local', '1', '2', '0', '2025-11-26 16:03:58', '2025-11-26 16:03:58');
INSERT INTO `websockets_statistics_entries` VALUES ('757', 'local', '1', '2', '0', '2025-11-26 16:04:58', '2025-11-26 16:04:58');
INSERT INTO `websockets_statistics_entries` VALUES ('758', 'local', '1', '2', '0', '2025-11-26 16:05:58', '2025-11-26 16:05:58');
INSERT INTO `websockets_statistics_entries` VALUES ('759', 'local', '1', '2', '0', '2025-11-26 16:06:58', '2025-11-26 16:06:58');
INSERT INTO `websockets_statistics_entries` VALUES ('760', 'local', '1', '2', '0', '2025-11-26 16:07:58', '2025-11-26 16:07:58');
INSERT INTO `websockets_statistics_entries` VALUES ('761', 'local', '1', '2', '0', '2025-11-26 16:08:58', '2025-11-26 16:08:58');
INSERT INTO `websockets_statistics_entries` VALUES ('762', 'local', '1', '2', '0', '2025-11-26 16:09:58', '2025-11-26 16:09:58');
INSERT INTO `websockets_statistics_entries` VALUES ('763', 'local', '1', '2', '0', '2025-11-26 16:10:58', '2025-11-26 16:10:58');
INSERT INTO `websockets_statistics_entries` VALUES ('764', 'local', '1', '2', '0', '2025-11-26 16:11:58', '2025-11-26 16:11:58');
INSERT INTO `websockets_statistics_entries` VALUES ('765', 'local', '1', '2', '0', '2025-11-26 16:12:58', '2025-11-26 16:12:58');
INSERT INTO `websockets_statistics_entries` VALUES ('766', 'local', '1', '2', '0', '2025-11-26 16:13:58', '2025-11-26 16:13:58');
INSERT INTO `websockets_statistics_entries` VALUES ('767', 'local', '1', '2', '0', '2025-11-26 16:14:58', '2025-11-26 16:14:58');
INSERT INTO `websockets_statistics_entries` VALUES ('768', 'local', '1', '2', '0', '2025-11-26 16:15:58', '2025-11-26 16:15:58');
INSERT INTO `websockets_statistics_entries` VALUES ('769', 'local', '1', '2', '0', '2025-11-26 16:16:58', '2025-11-26 16:16:58');
INSERT INTO `websockets_statistics_entries` VALUES ('770', 'local', '1', '1', '0', '2025-11-26 16:17:58', '2025-11-26 16:17:58');
INSERT INTO `websockets_statistics_entries` VALUES ('771', 'local', '1', '2', '0', '2025-11-26 16:18:58', '2025-11-26 16:18:58');
INSERT INTO `websockets_statistics_entries` VALUES ('772', 'local', '1', '2', '0', '2025-11-26 16:19:58', '2025-11-26 16:19:58');
INSERT INTO `websockets_statistics_entries` VALUES ('773', 'local', '1', '2', '0', '2025-11-26 16:20:58', '2025-11-26 16:20:58');
INSERT INTO `websockets_statistics_entries` VALUES ('774', 'local', '1', '2', '0', '2025-11-26 16:21:58', '2025-11-26 16:21:58');
INSERT INTO `websockets_statistics_entries` VALUES ('775', 'local', '1', '2', '0', '2025-11-26 16:22:58', '2025-11-26 16:22:58');
INSERT INTO `websockets_statistics_entries` VALUES ('776', 'local', '1', '2', '0', '2025-11-26 16:23:58', '2025-11-26 16:23:58');
INSERT INTO `websockets_statistics_entries` VALUES ('777', 'local', '1', '2', '0', '2025-11-26 16:24:59', '2025-11-26 16:24:59');
INSERT INTO `websockets_statistics_entries` VALUES ('778', 'local', '1', '2', '0', '2025-11-26 16:25:59', '2025-11-26 16:25:59');
INSERT INTO `websockets_statistics_entries` VALUES ('779', 'local', '1', '2', '0', '2025-11-26 16:26:59', '2025-11-26 16:26:59');
INSERT INTO `websockets_statistics_entries` VALUES ('780', 'local', '1', '2', '0', '2025-11-26 16:27:59', '2025-11-26 16:27:59');
INSERT INTO `websockets_statistics_entries` VALUES ('781', 'local', '1', '2', '0', '2025-11-26 16:28:59', '2025-11-26 16:28:59');
INSERT INTO `websockets_statistics_entries` VALUES ('782', 'local', '1', '2', '0', '2025-11-26 16:29:59', '2025-11-26 16:29:59');
INSERT INTO `websockets_statistics_entries` VALUES ('783', 'local', '1', '2', '0', '2025-11-26 16:30:59', '2025-11-26 16:30:59');
INSERT INTO `websockets_statistics_entries` VALUES ('784', 'local', '1', '2', '0', '2025-11-26 16:31:59', '2025-11-26 16:31:59');
INSERT INTO `websockets_statistics_entries` VALUES ('785', 'local', '1', '1', '0', '2025-11-26 16:32:59', '2025-11-26 16:32:59');
INSERT INTO `websockets_statistics_entries` VALUES ('786', 'local', '1', '2', '0', '2025-11-26 16:33:59', '2025-11-26 16:33:59');
INSERT INTO `websockets_statistics_entries` VALUES ('787', 'local', '1', '2', '0', '2025-11-26 16:34:59', '2025-11-26 16:34:59');
INSERT INTO `websockets_statistics_entries` VALUES ('788', 'local', '1', '2', '0', '2025-11-26 16:35:59', '2025-11-26 16:35:59');
INSERT INTO `websockets_statistics_entries` VALUES ('789', 'local', '1', '5', '0', '2025-11-26 16:36:59', '2025-11-26 16:36:59');
INSERT INTO `websockets_statistics_entries` VALUES ('790', 'local', '1', '2', '0', '2025-11-26 16:37:59', '2025-11-26 16:37:59');
INSERT INTO `websockets_statistics_entries` VALUES ('791', 'local', '1', '1', '0', '2025-11-26 16:38:59', '2025-11-26 16:38:59');
INSERT INTO `websockets_statistics_entries` VALUES ('792', 'local', '1', '5', '0', '2025-11-26 16:39:59', '2025-11-26 16:39:59');
INSERT INTO `websockets_statistics_entries` VALUES ('793', 'local', '1', '2', '0', '2025-11-26 16:40:59', '2025-11-26 16:40:59');
INSERT INTO `websockets_statistics_entries` VALUES ('794', 'local', '1', '4', '0', '2025-11-26 16:41:59', '2025-11-26 16:41:59');
INSERT INTO `websockets_statistics_entries` VALUES ('795', 'local', '1', '2', '0', '2025-11-26 16:42:59', '2025-11-26 16:42:59');
INSERT INTO `websockets_statistics_entries` VALUES ('796', 'local', '1', '2', '0', '2025-11-26 16:43:59', '2025-11-26 16:43:59');
INSERT INTO `websockets_statistics_entries` VALUES ('797', 'local', '1', '2', '0', '2025-11-26 16:44:59', '2025-11-26 16:44:59');
INSERT INTO `websockets_statistics_entries` VALUES ('798', 'local', '1', '2', '0', '2025-11-26 16:45:59', '2025-11-26 16:45:59');
INSERT INTO `websockets_statistics_entries` VALUES ('799', 'local', '1', '2', '0', '2025-11-26 16:46:59', '2025-11-26 16:46:59');
INSERT INTO `websockets_statistics_entries` VALUES ('800', 'local', '1', '2', '0', '2025-11-26 16:47:59', '2025-11-26 16:47:59');
INSERT INTO `websockets_statistics_entries` VALUES ('801', 'local', '1', '2', '0', '2025-11-26 16:48:59', '2025-11-26 16:48:59');
INSERT INTO `websockets_statistics_entries` VALUES ('802', 'local', '1', '2', '0', '2025-11-26 16:49:59', '2025-11-26 16:49:59');
INSERT INTO `websockets_statistics_entries` VALUES ('803', 'local', '1', '2', '0', '2025-11-26 16:50:59', '2025-11-26 16:50:59');
INSERT INTO `websockets_statistics_entries` VALUES ('804', 'local', '1', '2', '0', '2025-11-26 16:51:59', '2025-11-26 16:51:59');
INSERT INTO `websockets_statistics_entries` VALUES ('805', 'local', '1', '2', '0', '2025-11-26 16:52:59', '2025-11-26 16:52:59');
INSERT INTO `websockets_statistics_entries` VALUES ('806', 'local', '1', '2', '0', '2025-11-26 16:53:59', '2025-11-26 16:53:59');
INSERT INTO `websockets_statistics_entries` VALUES ('807', 'local', '1', '2', '0', '2025-11-26 16:54:59', '2025-11-26 16:54:59');
INSERT INTO `websockets_statistics_entries` VALUES ('808', 'local', '1', '1', '0', '2025-11-26 16:55:59', '2025-11-26 16:55:59');
INSERT INTO `websockets_statistics_entries` VALUES ('809', 'local', '1', '2', '0', '2025-11-26 16:56:59', '2025-11-26 16:56:59');
INSERT INTO `websockets_statistics_entries` VALUES ('810', 'local', '1', '2', '0', '2025-11-26 16:57:59', '2025-11-26 16:57:59');
INSERT INTO `websockets_statistics_entries` VALUES ('811', 'local', '1', '2', '0', '2025-11-26 16:58:59', '2025-11-26 16:58:59');
INSERT INTO `websockets_statistics_entries` VALUES ('812', 'local', '1', '2', '0', '2025-11-26 16:59:59', '2025-11-26 16:59:59');
INSERT INTO `websockets_statistics_entries` VALUES ('813', 'local', '1', '2', '0', '2025-11-26 17:00:59', '2025-11-26 17:00:59');
INSERT INTO `websockets_statistics_entries` VALUES ('814', 'local', '1', '2', '0', '2025-11-26 17:01:59', '2025-11-26 17:01:59');
INSERT INTO `websockets_statistics_entries` VALUES ('815', 'local', '1', '2', '0', '2025-11-26 17:02:59', '2025-11-26 17:02:59');
INSERT INTO `websockets_statistics_entries` VALUES ('816', 'local', '1', '4', '0', '2025-11-26 17:03:59', '2025-11-26 17:03:59');
INSERT INTO `websockets_statistics_entries` VALUES ('817', 'local', '1', '2', '0', '2025-11-26 17:04:59', '2025-11-26 17:04:59');
INSERT INTO `websockets_statistics_entries` VALUES ('818', 'local', '1', '2', '0', '2025-11-26 17:05:59', '2025-11-26 17:05:59');
INSERT INTO `websockets_statistics_entries` VALUES ('819', 'local', '1', '2', '0', '2025-11-26 17:06:59', '2025-11-26 17:06:59');
INSERT INTO `websockets_statistics_entries` VALUES ('820', 'local', '1', '2', '0', '2025-11-26 17:07:59', '2025-11-26 17:07:59');
INSERT INTO `websockets_statistics_entries` VALUES ('821', 'local', '1', '2', '0', '2025-11-26 17:08:59', '2025-11-26 17:08:59');
INSERT INTO `websockets_statistics_entries` VALUES ('822', 'local', '1', '2', '0', '2025-11-26 17:09:59', '2025-11-26 17:09:59');
INSERT INTO `websockets_statistics_entries` VALUES ('823', 'local', '1', '2', '0', '2025-11-26 17:10:59', '2025-11-26 17:10:59');
INSERT INTO `websockets_statistics_entries` VALUES ('824', 'local', '1', '2', '0', '2025-11-26 17:11:59', '2025-11-26 17:11:59');
INSERT INTO `websockets_statistics_entries` VALUES ('825', 'local', '1', '2', '0', '2025-11-26 17:12:59', '2025-11-26 17:12:59');
INSERT INTO `websockets_statistics_entries` VALUES ('826', 'local', '1', '2', '0', '2025-11-26 17:13:59', '2025-11-26 17:13:59');
INSERT INTO `websockets_statistics_entries` VALUES ('827', 'local', '1', '2', '0', '2025-11-26 17:14:59', '2025-11-26 17:14:59');
INSERT INTO `websockets_statistics_entries` VALUES ('828', 'local', '1', '1', '0', '2025-11-26 17:15:59', '2025-11-26 17:15:59');
INSERT INTO `websockets_statistics_entries` VALUES ('829', 'local', '1', '2', '0', '2025-11-26 17:16:59', '2025-11-26 17:16:59');
INSERT INTO `websockets_statistics_entries` VALUES ('830', 'local', '1', '2', '0', '2025-11-26 17:17:59', '2025-11-26 17:17:59');
INSERT INTO `websockets_statistics_entries` VALUES ('831', 'local', '1', '2', '0', '2025-11-26 17:18:59', '2025-11-26 17:18:59');
INSERT INTO `websockets_statistics_entries` VALUES ('832', 'local', '1', '2', '0', '2025-11-26 17:19:59', '2025-11-26 17:19:59');
INSERT INTO `websockets_statistics_entries` VALUES ('833', 'local', '1', '2', '0', '2025-11-26 17:20:59', '2025-11-26 17:20:59');
INSERT INTO `websockets_statistics_entries` VALUES ('834', 'local', '1', '2', '0', '2025-11-26 17:21:59', '2025-11-26 17:21:59');
INSERT INTO `websockets_statistics_entries` VALUES ('835', 'local', '1', '2', '0', '2025-11-26 17:22:59', '2025-11-26 17:22:59');
INSERT INTO `websockets_statistics_entries` VALUES ('836', 'local', '1', '2', '0', '2025-11-26 17:23:59', '2025-11-26 17:23:59');
INSERT INTO `websockets_statistics_entries` VALUES ('837', 'local', '1', '2', '0', '2025-11-26 17:24:59', '2025-11-26 17:24:59');
INSERT INTO `websockets_statistics_entries` VALUES ('838', 'local', '1', '2', '0', '2025-11-26 17:25:59', '2025-11-26 17:25:59');
INSERT INTO `websockets_statistics_entries` VALUES ('839', 'local', '1', '2', '0', '2025-11-26 17:26:59', '2025-11-26 17:26:59');
INSERT INTO `websockets_statistics_entries` VALUES ('840', 'local', '1', '2', '0', '2025-11-26 17:27:59', '2025-11-26 17:27:59');
INSERT INTO `websockets_statistics_entries` VALUES ('841', 'local', '1', '2', '0', '2025-11-26 17:28:59', '2025-11-26 17:28:59');
INSERT INTO `websockets_statistics_entries` VALUES ('842', 'local', '1', '2', '0', '2025-11-26 17:29:59', '2025-11-26 17:29:59');
INSERT INTO `websockets_statistics_entries` VALUES ('843', 'local', '1', '1', '0', '2025-11-26 17:30:59', '2025-11-26 17:30:59');
INSERT INTO `websockets_statistics_entries` VALUES ('844', 'local', '1', '2', '0', '2025-11-26 17:31:59', '2025-11-26 17:31:59');
INSERT INTO `websockets_statistics_entries` VALUES ('845', 'local', '1', '2', '0', '2025-11-26 17:32:59', '2025-11-26 17:32:59');
INSERT INTO `websockets_statistics_entries` VALUES ('846', 'local', '1', '2', '0', '2025-11-26 17:33:59', '2025-11-26 17:33:59');
INSERT INTO `websockets_statistics_entries` VALUES ('847', 'local', '1', '2', '0', '2025-11-26 17:34:59', '2025-11-26 17:34:59');
INSERT INTO `websockets_statistics_entries` VALUES ('848', 'local', '1', '2', '0', '2025-11-26 17:35:59', '2025-11-26 17:35:59');
INSERT INTO `websockets_statistics_entries` VALUES ('849', 'local', '1', '2', '0', '2025-11-26 17:36:59', '2025-11-26 17:36:59');
INSERT INTO `websockets_statistics_entries` VALUES ('850', 'local', '1', '2', '0', '2025-11-26 17:37:59', '2025-11-26 17:37:59');
INSERT INTO `websockets_statistics_entries` VALUES ('851', 'local', '1', '2', '0', '2025-11-26 17:38:59', '2025-11-26 17:38:59');
INSERT INTO `websockets_statistics_entries` VALUES ('852', 'local', '1', '2', '0', '2025-11-26 17:39:59', '2025-11-26 17:39:59');
INSERT INTO `websockets_statistics_entries` VALUES ('853', 'local', '1', '2', '0', '2025-11-26 17:40:59', '2025-11-26 17:40:59');
INSERT INTO `websockets_statistics_entries` VALUES ('854', 'local', '1', '2', '0', '2025-11-26 17:41:59', '2025-11-26 17:41:59');
INSERT INTO `websockets_statistics_entries` VALUES ('855', 'local', '1', '2', '0', '2025-11-26 17:42:59', '2025-11-26 17:42:59');
INSERT INTO `websockets_statistics_entries` VALUES ('856', 'local', '1', '5', '0', '2025-11-26 17:43:59', '2025-11-26 17:43:59');
INSERT INTO `websockets_statistics_entries` VALUES ('857', 'local', '1', '2', '0', '2025-11-26 17:44:59', '2025-11-26 17:44:59');
INSERT INTO `websockets_statistics_entries` VALUES ('858', 'local', '1', '9', '0', '2025-11-26 17:45:59', '2025-11-26 17:45:59');
INSERT INTO `websockets_statistics_entries` VALUES ('859', 'local', '1', '2', '0', '2025-11-26 17:46:59', '2025-11-26 17:46:59');
INSERT INTO `websockets_statistics_entries` VALUES ('860', 'local', '1', '5', '0', '2025-11-26 17:47:59', '2025-11-26 17:47:59');
INSERT INTO `websockets_statistics_entries` VALUES ('861', 'local', '1', '2', '0', '2025-11-26 17:48:59', '2025-11-26 17:48:59');
INSERT INTO `websockets_statistics_entries` VALUES ('862', 'local', '1', '2', '0', '2025-11-26 17:49:59', '2025-11-26 17:49:59');
INSERT INTO `websockets_statistics_entries` VALUES ('863', 'local', '1', '2', '0', '2025-11-26 17:50:59', '2025-11-26 17:50:59');
INSERT INTO `websockets_statistics_entries` VALUES ('864', 'local', '1', '2', '0', '2025-11-26 17:51:59', '2025-11-26 17:51:59');
INSERT INTO `websockets_statistics_entries` VALUES ('865', 'local', '1', '2', '0', '2025-11-26 17:52:59', '2025-11-26 17:52:59');
INSERT INTO `websockets_statistics_entries` VALUES ('866', 'local', '1', '2', '0', '2025-11-26 17:53:59', '2025-11-26 17:53:59');
INSERT INTO `websockets_statistics_entries` VALUES ('867', 'local', '1', '4', '0', '2025-11-26 17:54:59', '2025-11-26 17:54:59');
INSERT INTO `websockets_statistics_entries` VALUES ('868', 'local', '1', '2', '0', '2025-11-26 17:55:59', '2025-11-26 17:55:59');
INSERT INTO `websockets_statistics_entries` VALUES ('869', 'local', '1', '4', '0', '2025-11-26 17:56:59', '2025-11-26 17:56:59');
INSERT INTO `websockets_statistics_entries` VALUES ('870', 'local', '1', '2', '0', '2025-11-26 17:57:59', '2025-11-26 17:57:59');
INSERT INTO `websockets_statistics_entries` VALUES ('871', 'local', '1', '2', '0', '2025-11-26 17:58:59', '2025-11-26 17:58:59');
INSERT INTO `websockets_statistics_entries` VALUES ('872', 'local', '1', '5', '0', '2025-11-26 17:59:59', '2025-11-26 17:59:59');
INSERT INTO `websockets_statistics_entries` VALUES ('873', 'local', '1', '2', '0', '2025-11-26 18:00:59', '2025-11-26 18:00:59');
INSERT INTO `websockets_statistics_entries` VALUES ('874', 'local', '1', '1', '0', '2025-11-26 18:01:59', '2025-11-26 18:01:59');
INSERT INTO `websockets_statistics_entries` VALUES ('875', 'local', '1', '2', '0', '2025-11-26 18:02:59', '2025-11-26 18:02:59');
INSERT INTO `websockets_statistics_entries` VALUES ('876', 'local', '1', '4', '0', '2025-11-26 18:03:59', '2025-11-26 18:03:59');
INSERT INTO `websockets_statistics_entries` VALUES ('877', 'local', '1', '2', '0', '2025-11-26 18:04:59', '2025-11-26 18:04:59');
INSERT INTO `websockets_statistics_entries` VALUES ('878', 'local', '1', '5', '0', '2025-11-26 18:05:59', '2025-11-26 18:05:59');
INSERT INTO `websockets_statistics_entries` VALUES ('879', 'local', '1', '2', '0', '2025-11-26 18:06:59', '2025-11-26 18:06:59');
INSERT INTO `websockets_statistics_entries` VALUES ('880', 'local', '1', '8', '0', '2025-11-26 18:07:59', '2025-11-26 18:07:59');
INSERT INTO `websockets_statistics_entries` VALUES ('881', 'local', '1', '1', '0', '2025-11-26 18:08:59', '2025-11-26 18:08:59');
INSERT INTO `websockets_statistics_entries` VALUES ('882', 'local', '1', '2', '0', '2025-11-26 18:09:59', '2025-11-26 18:09:59');
INSERT INTO `websockets_statistics_entries` VALUES ('883', 'local', '1', '2', '0', '2025-11-26 18:10:59', '2025-11-26 18:10:59');
INSERT INTO `websockets_statistics_entries` VALUES ('884', 'local', '1', '2', '0', '2025-11-26 18:11:59', '2025-11-26 18:11:59');
INSERT INTO `websockets_statistics_entries` VALUES ('885', 'local', '1', '2', '0', '2025-11-26 18:12:59', '2025-11-26 18:12:59');
INSERT INTO `websockets_statistics_entries` VALUES ('886', 'local', '1', '2', '0', '2025-11-26 18:13:59', '2025-11-26 18:13:59');
INSERT INTO `websockets_statistics_entries` VALUES ('887', 'local', '1', '2', '0', '2025-11-26 18:14:59', '2025-11-26 18:14:59');
INSERT INTO `websockets_statistics_entries` VALUES ('888', 'local', '1', '2', '0', '2025-11-26 18:15:59', '2025-11-26 18:15:59');
INSERT INTO `websockets_statistics_entries` VALUES ('889', 'local', '1', '2', '0', '2025-11-26 18:16:59', '2025-11-26 18:16:59');
INSERT INTO `websockets_statistics_entries` VALUES ('890', 'local', '1', '2', '0', '2025-11-26 18:17:59', '2025-11-26 18:17:59');
INSERT INTO `websockets_statistics_entries` VALUES ('891', 'local', '1', '2', '0', '2025-11-26 18:18:59', '2025-11-26 18:18:59');
INSERT INTO `websockets_statistics_entries` VALUES ('892', 'local', '1', '2', '0', '2025-11-26 18:19:59', '2025-11-26 18:19:59');
INSERT INTO `websockets_statistics_entries` VALUES ('893', 'local', '1', '2', '0', '2025-11-26 18:20:59', '2025-11-26 18:20:59');
INSERT INTO `websockets_statistics_entries` VALUES ('894', 'local', '1', '2', '0', '2025-11-26 18:22:00', '2025-11-26 18:22:00');
INSERT INTO `websockets_statistics_entries` VALUES ('895', 'local', '1', '2', '0', '2025-11-26 18:23:00', '2025-11-26 18:23:00');
INSERT INTO `websockets_statistics_entries` VALUES ('896', 'local', '1', '1', '0', '2025-11-26 18:24:00', '2025-11-26 18:24:00');
INSERT INTO `websockets_statistics_entries` VALUES ('897', 'local', '1', '2', '0', '2025-11-26 18:25:00', '2025-11-26 18:25:00');
INSERT INTO `websockets_statistics_entries` VALUES ('898', 'local', '1', '2', '0', '2025-11-26 18:26:00', '2025-11-26 18:26:00');
INSERT INTO `websockets_statistics_entries` VALUES ('899', 'local', '1', '2', '0', '2025-11-26 18:27:00', '2025-11-26 18:27:00');
INSERT INTO `websockets_statistics_entries` VALUES ('900', 'local', '1', '2', '0', '2025-11-26 18:28:00', '2025-11-26 18:28:00');
INSERT INTO `websockets_statistics_entries` VALUES ('901', 'local', '1', '2', '0', '2025-11-26 18:29:00', '2025-11-26 18:29:00');
INSERT INTO `websockets_statistics_entries` VALUES ('902', 'local', '1', '2', '0', '2025-11-26 18:30:00', '2025-11-26 18:30:00');
INSERT INTO `websockets_statistics_entries` VALUES ('903', 'local', '1', '2', '0', '2025-11-26 18:31:00', '2025-11-26 18:31:00');
INSERT INTO `websockets_statistics_entries` VALUES ('904', 'local', '1', '2', '0', '2025-11-26 18:32:00', '2025-11-26 18:32:00');
INSERT INTO `websockets_statistics_entries` VALUES ('905', 'local', '1', '2', '0', '2025-11-26 18:33:00', '2025-11-26 18:33:00');
INSERT INTO `websockets_statistics_entries` VALUES ('906', 'local', '1', '2', '0', '2025-11-26 18:34:00', '2025-11-26 18:34:00');
INSERT INTO `websockets_statistics_entries` VALUES ('907', 'local', '1', '2', '0', '2025-11-26 18:35:00', '2025-11-26 18:35:00');
INSERT INTO `websockets_statistics_entries` VALUES ('908', 'local', '1', '2', '0', '2025-11-26 18:36:00', '2025-11-26 18:36:00');
INSERT INTO `websockets_statistics_entries` VALUES ('909', 'local', '1', '2', '0', '2025-11-26 18:37:00', '2025-11-26 18:37:00');
INSERT INTO `websockets_statistics_entries` VALUES ('910', 'local', '1', '2', '0', '2025-11-26 18:38:00', '2025-11-26 18:38:00');
INSERT INTO `websockets_statistics_entries` VALUES ('911', 'local', '1', '2', '0', '2025-11-26 18:39:00', '2025-11-26 18:39:00');
INSERT INTO `websockets_statistics_entries` VALUES ('912', 'local', '1', '1', '0', '2025-11-26 18:40:00', '2025-11-26 18:40:00');
INSERT INTO `websockets_statistics_entries` VALUES ('913', 'local', '1', '2', '0', '2025-11-26 18:41:00', '2025-11-26 18:41:00');
INSERT INTO `websockets_statistics_entries` VALUES ('914', 'local', '1', '2', '0', '2025-11-26 18:42:00', '2025-11-26 18:42:00');
INSERT INTO `websockets_statistics_entries` VALUES ('915', 'local', '1', '2', '0', '2025-11-26 18:43:00', '2025-11-26 18:43:00');
INSERT INTO `websockets_statistics_entries` VALUES ('916', 'local', '1', '2', '0', '2025-11-26 18:44:00', '2025-11-26 18:44:00');
INSERT INTO `websockets_statistics_entries` VALUES ('917', 'local', '1', '5', '0', '2025-11-26 18:45:00', '2025-11-26 18:45:00');
INSERT INTO `websockets_statistics_entries` VALUES ('918', 'local', '1', '2', '0', '2025-11-26 18:46:00', '2025-11-26 18:46:00');
INSERT INTO `websockets_statistics_entries` VALUES ('919', 'local', '1', '2', '0', '2025-11-26 18:47:00', '2025-11-26 18:47:00');
INSERT INTO `websockets_statistics_entries` VALUES ('920', 'local', '1', '4', '0', '2025-11-26 18:48:00', '2025-11-26 18:48:00');
INSERT INTO `websockets_statistics_entries` VALUES ('921', 'local', '1', '4', '0', '2025-11-26 18:49:00', '2025-11-26 18:49:00');
INSERT INTO `websockets_statistics_entries` VALUES ('922', 'local', '1', '8', '0', '2025-11-26 18:50:00', '2025-11-26 18:50:00');
INSERT INTO `websockets_statistics_entries` VALUES ('923', 'local', '1', '7', '0', '2025-11-26 18:51:00', '2025-11-26 18:51:00');
INSERT INTO `websockets_statistics_entries` VALUES ('924', 'local', '1', '19', '0', '2025-11-26 18:52:00', '2025-11-26 18:52:00');
INSERT INTO `websockets_statistics_entries` VALUES ('925', 'local', '1', '7', '0', '2025-11-26 18:53:00', '2025-11-26 18:53:00');
INSERT INTO `websockets_statistics_entries` VALUES ('926', 'local', '1', '7', '0', '2025-11-26 18:54:00', '2025-11-26 18:54:00');
INSERT INTO `websockets_statistics_entries` VALUES ('927', 'local', '1', '2', '0', '2025-11-26 18:55:00', '2025-11-26 18:55:00');
INSERT INTO `websockets_statistics_entries` VALUES ('928', 'local', '1', '2', '0', '2025-11-26 18:56:00', '2025-11-26 18:56:00');
INSERT INTO `websockets_statistics_entries` VALUES ('929', 'local', '1', '2', '0', '2025-11-26 18:57:00', '2025-11-26 18:57:00');
INSERT INTO `websockets_statistics_entries` VALUES ('930', 'local', '1', '2', '0', '2025-11-26 18:58:00', '2025-11-26 18:58:00');
INSERT INTO `websockets_statistics_entries` VALUES ('931', 'local', '1', '2', '0', '2025-11-26 18:59:00', '2025-11-26 18:59:00');
INSERT INTO `websockets_statistics_entries` VALUES ('932', 'local', '1', '2', '0', '2025-11-26 19:00:00', '2025-11-26 19:00:00');
INSERT INTO `websockets_statistics_entries` VALUES ('933', 'local', '1', '2', '0', '2025-11-26 19:01:00', '2025-11-26 19:01:00');
INSERT INTO `websockets_statistics_entries` VALUES ('934', 'local', '1', '2', '0', '2025-11-26 19:02:00', '2025-11-26 19:02:00');
INSERT INTO `websockets_statistics_entries` VALUES ('935', 'local', '1', '2', '0', '2025-11-26 19:03:00', '2025-11-26 19:03:00');
INSERT INTO `websockets_statistics_entries` VALUES ('936', 'local', '1', '2', '0', '2025-11-26 19:04:00', '2025-11-26 19:04:00');
INSERT INTO `websockets_statistics_entries` VALUES ('937', 'local', '1', '2', '0', '2025-11-26 19:05:00', '2025-11-26 19:05:00');
INSERT INTO `websockets_statistics_entries` VALUES ('938', 'local', '1', '2', '0', '2025-11-26 19:06:00', '2025-11-26 19:06:00');
INSERT INTO `websockets_statistics_entries` VALUES ('939', 'local', '1', '2', '0', '2025-11-26 19:07:00', '2025-11-26 19:07:00');
INSERT INTO `websockets_statistics_entries` VALUES ('940', 'local', '1', '2', '0', '2025-11-26 19:08:00', '2025-11-26 19:08:00');
INSERT INTO `websockets_statistics_entries` VALUES ('941', 'local', '1', '2', '0', '2025-11-26 19:09:00', '2025-11-26 19:09:00');
INSERT INTO `websockets_statistics_entries` VALUES ('942', 'local', '1', '2', '0', '2025-11-26 19:10:00', '2025-11-26 19:10:00');
INSERT INTO `websockets_statistics_entries` VALUES ('943', 'local', '1', '2', '0', '2025-11-26 19:11:00', '2025-11-26 19:11:00');
INSERT INTO `websockets_statistics_entries` VALUES ('944', 'local', '1', '2', '0', '2025-11-26 19:12:00', '2025-11-26 19:12:00');
INSERT INTO `websockets_statistics_entries` VALUES ('945', 'local', '1', '2', '0', '2025-11-26 19:13:00', '2025-11-26 19:13:00');
INSERT INTO `websockets_statistics_entries` VALUES ('946', 'local', '1', '2', '0', '2025-11-26 19:14:00', '2025-11-26 19:14:00');
INSERT INTO `websockets_statistics_entries` VALUES ('947', 'local', '1', '2', '0', '2025-11-26 19:15:00', '2025-11-26 19:15:00');
INSERT INTO `websockets_statistics_entries` VALUES ('948', 'local', '1', '2', '0', '2025-11-26 19:16:00', '2025-11-26 19:16:00');
INSERT INTO `websockets_statistics_entries` VALUES ('949', 'local', '1', '1', '0', '2025-11-26 19:17:00', '2025-11-26 19:17:00');
INSERT INTO `websockets_statistics_entries` VALUES ('950', 'local', '1', '2', '0', '2025-11-26 19:18:00', '2025-11-26 19:18:00');
INSERT INTO `websockets_statistics_entries` VALUES ('951', 'local', '1', '2', '0', '2025-11-26 19:19:00', '2025-11-26 19:19:00');
INSERT INTO `websockets_statistics_entries` VALUES ('952', 'local', '1', '2', '0', '2025-11-26 19:20:00', '2025-11-26 19:20:00');
INSERT INTO `websockets_statistics_entries` VALUES ('953', 'local', '1', '2', '0', '2025-11-26 19:21:00', '2025-11-26 19:21:00');
INSERT INTO `websockets_statistics_entries` VALUES ('954', 'local', '1', '2', '0', '2025-11-26 19:22:00', '2025-11-26 19:22:00');
INSERT INTO `websockets_statistics_entries` VALUES ('955', 'local', '1', '2', '0', '2025-11-26 19:23:00', '2025-11-26 19:23:00');
INSERT INTO `websockets_statistics_entries` VALUES ('956', 'local', '1', '2', '0', '2025-11-26 19:24:00', '2025-11-26 19:24:00');
INSERT INTO `websockets_statistics_entries` VALUES ('957', 'local', '1', '2', '0', '2025-11-26 19:25:00', '2025-11-26 19:25:00');
INSERT INTO `websockets_statistics_entries` VALUES ('958', 'local', '1', '2', '0', '2025-11-26 19:26:00', '2025-11-26 19:26:00');
INSERT INTO `websockets_statistics_entries` VALUES ('959', 'local', '1', '2', '0', '2025-11-26 19:27:00', '2025-11-26 19:27:00');
INSERT INTO `websockets_statistics_entries` VALUES ('960', 'local', '1', '2', '0', '2025-11-26 19:28:00', '2025-11-26 19:28:00');
INSERT INTO `websockets_statistics_entries` VALUES ('961', 'local', '1', '2', '0', '2025-11-26 19:29:00', '2025-11-26 19:29:00');
INSERT INTO `websockets_statistics_entries` VALUES ('962', 'local', '1', '2', '0', '2025-11-26 19:30:00', '2025-11-26 19:30:00');
INSERT INTO `websockets_statistics_entries` VALUES ('963', 'local', '1', '2', '0', '2025-11-26 19:31:00', '2025-11-26 19:31:00');
INSERT INTO `websockets_statistics_entries` VALUES ('964', 'local', '1', '2', '0', '2025-11-26 19:32:00', '2025-11-26 19:32:00');
INSERT INTO `websockets_statistics_entries` VALUES ('965', 'local', '1', '1', '0', '2025-11-26 19:33:00', '2025-11-26 19:33:00');
INSERT INTO `websockets_statistics_entries` VALUES ('966', 'local', '1', '2', '0', '2025-11-26 19:34:00', '2025-11-26 19:34:00');
INSERT INTO `websockets_statistics_entries` VALUES ('967', 'local', '1', '2', '0', '2025-11-26 19:35:00', '2025-11-26 19:35:00');
INSERT INTO `websockets_statistics_entries` VALUES ('968', 'local', '1', '2', '0', '2025-11-26 19:36:00', '2025-11-26 19:36:00');
INSERT INTO `websockets_statistics_entries` VALUES ('969', 'local', '1', '2', '0', '2025-11-26 19:37:00', '2025-11-26 19:37:00');
INSERT INTO `websockets_statistics_entries` VALUES ('970', 'local', '1', '2', '0', '2025-11-26 19:38:00', '2025-11-26 19:38:00');
INSERT INTO `websockets_statistics_entries` VALUES ('971', 'local', '1', '2', '0', '2025-11-26 19:39:00', '2025-11-26 19:39:00');
INSERT INTO `websockets_statistics_entries` VALUES ('972', 'local', '1', '2', '0', '2025-11-26 19:40:00', '2025-11-26 19:40:00');
INSERT INTO `websockets_statistics_entries` VALUES ('973', 'local', '1', '2', '0', '2025-11-26 19:41:00', '2025-11-26 19:41:00');
INSERT INTO `websockets_statistics_entries` VALUES ('974', 'local', '1', '2', '0', '2025-11-26 19:42:00', '2025-11-26 19:42:00');
INSERT INTO `websockets_statistics_entries` VALUES ('975', 'local', '1', '2', '0', '2025-11-26 19:43:00', '2025-11-26 19:43:00');
INSERT INTO `websockets_statistics_entries` VALUES ('976', 'local', '1', '7', '0', '2025-11-26 19:44:00', '2025-11-26 19:44:00');
INSERT INTO `websockets_statistics_entries` VALUES ('977', 'local', '1', '2', '0', '2025-11-26 19:45:00', '2025-11-26 19:45:00');
INSERT INTO `websockets_statistics_entries` VALUES ('978', 'local', '1', '2', '0', '2025-11-26 19:46:00', '2025-11-26 19:46:00');
INSERT INTO `websockets_statistics_entries` VALUES ('979', 'local', '1', '2', '0', '2025-11-26 19:47:00', '2025-11-26 19:47:00');
INSERT INTO `websockets_statistics_entries` VALUES ('980', 'local', '1', '5', '0', '2025-11-26 19:48:00', '2025-11-26 19:48:00');
INSERT INTO `websockets_statistics_entries` VALUES ('981', 'local', '1', '2', '0', '2025-11-26 19:49:00', '2025-11-26 19:49:00');
INSERT INTO `websockets_statistics_entries` VALUES ('982', 'local', '1', '4', '0', '2025-11-26 19:50:00', '2025-11-26 19:50:00');
INSERT INTO `websockets_statistics_entries` VALUES ('983', 'local', '1', '2', '0', '2025-11-26 19:51:00', '2025-11-26 19:51:00');
INSERT INTO `websockets_statistics_entries` VALUES ('984', 'local', '1', '2', '0', '2025-11-26 19:52:00', '2025-11-26 19:52:00');
INSERT INTO `websockets_statistics_entries` VALUES ('985', 'local', '1', '2', '0', '2025-11-26 19:53:00', '2025-11-26 19:53:00');
INSERT INTO `websockets_statistics_entries` VALUES ('986', 'local', '1', '4', '0', '2025-11-26 19:54:00', '2025-11-26 19:54:00');
INSERT INTO `websockets_statistics_entries` VALUES ('987', 'local', '1', '2', '0', '2025-11-26 19:55:00', '2025-11-26 19:55:00');
INSERT INTO `websockets_statistics_entries` VALUES ('988', 'local', '1', '2', '0', '2025-11-26 19:56:00', '2025-11-26 19:56:00');
INSERT INTO `websockets_statistics_entries` VALUES ('989', 'local', '1', '2', '0', '2025-11-26 19:57:00', '2025-11-26 19:57:00');
INSERT INTO `websockets_statistics_entries` VALUES ('990', 'local', '1', '2', '0', '2025-11-26 19:58:00', '2025-11-26 19:58:00');
INSERT INTO `websockets_statistics_entries` VALUES ('991', 'local', '1', '2', '0', '2025-11-26 19:59:00', '2025-11-26 19:59:00');
INSERT INTO `websockets_statistics_entries` VALUES ('992', 'local', '1', '2', '0', '2025-11-26 20:00:00', '2025-11-26 20:00:00');
INSERT INTO `websockets_statistics_entries` VALUES ('993', 'local', '1', '2', '0', '2025-11-26 20:01:00', '2025-11-26 20:01:00');
INSERT INTO `websockets_statistics_entries` VALUES ('994', 'local', '1', '2', '0', '2025-11-26 20:02:00', '2025-11-26 20:02:00');
INSERT INTO `websockets_statistics_entries` VALUES ('995', 'local', '1', '2', '0', '2025-11-26 20:03:00', '2025-11-26 20:03:00');
INSERT INTO `websockets_statistics_entries` VALUES ('996', 'local', '1', '2', '0', '2025-11-26 20:04:00', '2025-11-26 20:04:00');
INSERT INTO `websockets_statistics_entries` VALUES ('997', 'local', '1', '2', '0', '2025-11-26 20:05:00', '2025-11-26 20:05:00');
INSERT INTO `websockets_statistics_entries` VALUES ('998', 'local', '1', '1', '0', '2025-11-26 20:06:00', '2025-11-26 20:06:00');
INSERT INTO `websockets_statistics_entries` VALUES ('999', 'local', '1', '2', '0', '2025-11-26 20:07:00', '2025-11-26 20:07:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1000', 'local', '1', '2', '0', '2025-11-26 20:08:00', '2025-11-26 20:08:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1001', 'local', '1', '2', '0', '2025-11-26 20:09:00', '2025-11-26 20:09:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1002', 'local', '1', '2', '0', '2025-11-26 20:10:00', '2025-11-26 20:10:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1003', 'local', '1', '2', '0', '2025-11-26 20:11:00', '2025-11-26 20:11:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1004', 'local', '1', '2', '0', '2025-11-26 20:12:00', '2025-11-26 20:12:00');
INSERT INTO `websockets_statistics_entries` VALUES ('1005', 'local', '1', '3', '0', '2025-11-27 11:21:37', '2025-11-27 11:21:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1006', 'local', '1', '2', '0', '2025-11-27 11:22:37', '2025-11-27 11:22:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1007', 'local', '1', '2', '0', '2025-11-27 11:23:37', '2025-11-27 11:23:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1008', 'local', '1', '2', '0', '2025-11-27 11:24:37', '2025-11-27 11:24:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1009', 'local', '1', '2', '0', '2025-11-27 11:25:37', '2025-11-27 11:25:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1010', 'local', '1', '2', '0', '2025-11-27 11:26:37', '2025-11-27 11:26:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1011', 'local', '1', '2', '0', '2025-11-27 11:27:37', '2025-11-27 11:27:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1012', 'local', '1', '2', '0', '2025-11-27 11:28:37', '2025-11-27 11:28:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1013', 'local', '1', '2', '0', '2025-11-27 11:29:37', '2025-11-27 11:29:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1014', 'local', '1', '2', '0', '2025-11-27 11:30:37', '2025-11-27 11:30:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1015', 'local', '1', '2', '0', '2025-11-27 11:31:37', '2025-11-27 11:31:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1016', 'local', '1', '2', '0', '2025-11-27 11:32:37', '2025-11-27 11:32:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1017', 'local', '1', '2', '0', '2025-11-27 11:33:37', '2025-11-27 11:33:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1018', 'local', '1', '2', '0', '2025-11-27 11:34:37', '2025-11-27 11:34:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1019', 'local', '1', '2', '0', '2025-11-27 11:35:37', '2025-11-27 11:35:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1020', 'local', '1', '2', '0', '2025-11-27 11:36:37', '2025-11-27 11:36:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1021', 'local', '1', '2', '0', '2025-11-27 11:37:37', '2025-11-27 11:37:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1022', 'local', '1', '2', '0', '2025-11-27 11:38:37', '2025-11-27 11:38:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1023', 'local', '1', '2', '0', '2025-11-27 11:39:37', '2025-11-27 11:39:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1024', 'local', '1', '2', '0', '2025-11-27 11:40:37', '2025-11-27 11:40:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1025', 'local', '1', '2', '0', '2025-11-27 11:41:37', '2025-11-27 11:41:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1026', 'local', '1', '2', '0', '2025-11-27 11:42:37', '2025-11-27 11:42:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1027', 'local', '1', '2', '0', '2025-11-27 11:43:37', '2025-11-27 11:43:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1028', 'local', '1', '1', '0', '2025-11-27 11:44:37', '2025-11-27 11:44:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1029', 'local', '1', '2', '0', '2025-11-27 11:45:37', '2025-11-27 11:45:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1030', 'local', '1', '2', '0', '2025-11-27 11:46:37', '2025-11-27 11:46:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1031', 'local', '1', '2', '0', '2025-11-27 11:47:37', '2025-11-27 11:47:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1032', 'local', '1', '2', '0', '2025-11-27 11:48:37', '2025-11-27 11:48:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1033', 'local', '1', '2', '0', '2025-11-27 11:49:37', '2025-11-27 11:49:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1034', 'local', '1', '2', '0', '2025-11-27 11:50:37', '2025-11-27 11:50:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1035', 'local', '1', '2', '0', '2025-11-27 11:51:37', '2025-11-27 11:51:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1036', 'local', '2', '3', '0', '2025-11-27 11:52:37', '2025-11-27 11:52:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1037', 'local', '2', '3', '0', '2025-11-27 11:53:37', '2025-11-27 11:53:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1038', 'local', '1', '7', '0', '2025-11-27 11:54:37', '2025-11-27 11:54:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1039', 'local', '1', '2', '0', '2025-11-27 11:55:37', '2025-11-27 11:55:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1040', 'local', '1', '2', '0', '2025-11-27 11:56:37', '2025-11-27 11:56:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1041', 'local', '1', '2', '0', '2025-11-27 11:57:37', '2025-11-27 11:57:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1042', 'local', '1', '2', '0', '2025-11-27 11:58:37', '2025-11-27 11:58:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1043', 'local', '1', '2', '0', '2025-11-27 11:59:37', '2025-11-27 11:59:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1044', 'local', '1', '2', '0', '2025-11-27 12:00:37', '2025-11-27 12:00:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1045', 'local', '1', '2', '0', '2025-11-27 12:01:37', '2025-11-27 12:01:37');
INSERT INTO `websockets_statistics_entries` VALUES ('1046', 'local', '1', '2', '0', '2025-11-27 12:02:38', '2025-11-27 12:02:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1047', 'local', '1', '2', '0', '2025-11-27 12:03:38', '2025-11-27 12:03:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1048', 'local', '1', '2', '0', '2025-11-27 12:04:38', '2025-11-27 12:04:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1049', 'local', '1', '2', '0', '2025-11-27 12:05:38', '2025-11-27 12:05:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1050', 'local', '1', '2', '0', '2025-11-27 12:06:38', '2025-11-27 12:06:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1051', 'local', '1', '2', '0', '2025-11-27 12:07:38', '2025-11-27 12:07:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1052', 'local', '1', '2', '0', '2025-11-27 12:08:38', '2025-11-27 12:08:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1053', 'local', '1', '2', '0', '2025-11-27 12:09:38', '2025-11-27 12:09:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1054', 'local', '1', '2', '0', '2025-11-27 12:10:38', '2025-11-27 12:10:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1055', 'local', '1', '2', '0', '2025-11-27 12:11:38', '2025-11-27 12:11:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1056', 'local', '1', '2', '0', '2025-11-27 12:12:38', '2025-11-27 12:12:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1057', 'local', '1', '2', '0', '2025-11-27 12:13:38', '2025-11-27 12:13:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1058', 'local', '1', '2', '0', '2025-11-27 12:14:38', '2025-11-27 12:14:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1059', 'local', '1', '2', '0', '2025-11-27 12:15:38', '2025-11-27 12:15:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1060', 'local', '1', '2', '0', '2025-11-27 12:16:38', '2025-11-27 12:16:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1061', 'local', '1', '2', '0', '2025-11-27 12:17:38', '2025-11-27 12:17:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1062', 'local', '1', '2', '0', '2025-11-27 12:18:38', '2025-11-27 12:18:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1063', 'local', '1', '1', '0', '2025-11-27 12:19:38', '2025-11-27 12:19:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1064', 'local', '1', '2', '0', '2025-11-27 12:20:38', '2025-11-27 12:20:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1065', 'local', '1', '5', '0', '2025-11-27 12:21:38', '2025-11-27 12:21:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1066', 'local', '1', '2', '0', '2025-11-27 12:22:38', '2025-11-27 12:22:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1067', 'local', '1', '2', '0', '2025-11-27 12:23:38', '2025-11-27 12:23:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1068', 'local', '1', '2', '0', '2025-11-27 12:24:38', '2025-11-27 12:24:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1069', 'local', '1', '4', '0', '2025-11-27 12:25:38', '2025-11-27 12:25:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1070', 'local', '1', '5', '0', '2025-11-27 12:26:38', '2025-11-27 12:26:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1071', 'local', '1', '4', '0', '2025-11-27 12:27:38', '2025-11-27 12:27:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1072', 'local', '1', '5', '0', '2025-11-27 12:28:38', '2025-11-27 12:28:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1073', 'local', '1', '2', '0', '2025-11-27 12:29:38', '2025-11-27 12:29:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1074', 'local', '1', '4', '0', '2025-11-27 12:30:38', '2025-11-27 12:30:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1075', 'local', '1', '2', '0', '2025-11-27 12:31:38', '2025-11-27 12:31:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1076', 'local', '1', '2', '0', '2025-11-27 12:32:38', '2025-11-27 12:32:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1077', 'local', '1', '4', '0', '2025-11-27 12:33:38', '2025-11-27 12:33:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1078', 'local', '1', '2', '0', '2025-11-27 12:34:38', '2025-11-27 12:34:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1079', 'local', '1', '5', '0', '2025-11-27 12:35:38', '2025-11-27 12:35:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1080', 'local', '1', '5', '0', '2025-11-27 12:36:38', '2025-11-27 12:36:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1081', 'local', '1', '2', '0', '2025-11-27 12:37:38', '2025-11-27 12:37:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1082', 'local', '1', '2', '0', '2025-11-27 12:38:38', '2025-11-27 12:38:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1083', 'local', '1', '5', '0', '2025-11-27 12:39:38', '2025-11-27 12:39:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1084', 'local', '1', '4', '0', '2025-11-27 12:40:38', '2025-11-27 12:40:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1085', 'local', '1', '2', '0', '2025-11-27 12:41:38', '2025-11-27 12:41:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1086', 'local', '1', '5', '0', '2025-11-27 12:42:38', '2025-11-27 12:42:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1087', 'local', '1', '7', '0', '2025-11-27 12:43:38', '2025-11-27 12:43:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1088', 'local', '1', '4', '0', '2025-11-27 12:44:38', '2025-11-27 12:44:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1089', 'local', '1', '5', '0', '2025-11-27 12:45:38', '2025-11-27 12:45:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1090', 'local', '1', '5', '0', '2025-11-27 12:46:38', '2025-11-27 12:46:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1091', 'local', '1', '2', '0', '2025-11-27 12:47:38', '2025-11-27 12:47:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1092', 'local', '1', '4', '0', '2025-11-27 12:48:38', '2025-11-27 12:48:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1093', 'local', '1', '2', '0', '2025-11-27 12:49:38', '2025-11-27 12:49:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1094', 'local', '1', '2', '0', '2025-11-27 12:50:38', '2025-11-27 12:50:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1095', 'local', '1', '2', '0', '2025-11-27 12:51:38', '2025-11-27 12:51:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1096', 'local', '1', '2', '0', '2025-11-27 12:52:38', '2025-11-27 12:52:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1097', 'local', '1', '2', '0', '2025-11-27 12:53:38', '2025-11-27 12:53:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1098', 'local', '1', '2', '0', '2025-11-27 12:54:38', '2025-11-27 12:54:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1099', 'local', '1', '2', '0', '2025-11-27 12:55:38', '2025-11-27 12:55:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1100', 'local', '1', '1', '0', '2025-11-27 12:56:38', '2025-11-27 12:56:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1101', 'local', '1', '2', '0', '2025-11-27 12:57:38', '2025-11-27 12:57:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1102', 'local', '1', '1', '0', '2025-11-27 12:58:38', '2025-11-27 12:58:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1103', 'local', '1', '7', '0', '2025-11-27 12:59:38', '2025-11-27 12:59:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1104', 'local', '1', '5', '0', '2025-11-27 13:00:38', '2025-11-27 13:00:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1105', 'local', '1', '2', '0', '2025-11-27 13:01:38', '2025-11-27 13:01:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1106', 'local', '1', '2', '0', '2025-11-27 13:02:38', '2025-11-27 13:02:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1107', 'local', '1', '2', '0', '2025-11-27 13:03:38', '2025-11-27 13:03:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1108', 'local', '1', '1', '0', '2025-11-27 13:04:38', '2025-11-27 13:04:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1109', 'local', '1', '2', '0', '2025-11-27 13:05:38', '2025-11-27 13:05:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1110', 'local', '1', '2', '0', '2025-11-27 13:06:38', '2025-11-27 13:06:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1111', 'local', '1', '2', '0', '2025-11-27 13:07:38', '2025-11-27 13:07:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1112', 'local', '1', '2', '0', '2025-11-27 13:08:38', '2025-11-27 13:08:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1113', 'local', '1', '5', '0', '2025-11-27 13:09:38', '2025-11-27 13:09:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1114', 'local', '1', '4', '0', '2025-11-27 13:10:38', '2025-11-27 13:10:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1115', 'local', '1', '2', '0', '2025-11-27 13:11:38', '2025-11-27 13:11:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1116', 'local', '1', '2', '0', '2025-11-27 13:12:38', '2025-11-27 13:12:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1117', 'local', '1', '5', '0', '2025-11-27 13:13:38', '2025-11-27 13:13:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1118', 'local', '2', '3', '0', '2025-11-27 13:14:38', '2025-11-27 13:14:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1119', 'local', '1', '2', '0', '2025-11-27 13:15:38', '2025-11-27 13:15:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1120', 'local', '1', '1', '0', '2025-11-27 13:16:38', '2025-11-27 13:16:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1121', 'local', '2', '9', '0', '2025-11-27 13:17:38', '2025-11-27 13:17:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1122', 'local', '1', '2', '0', '2025-11-27 13:18:38', '2025-11-27 13:18:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1123', 'local', '1', '1', '0', '2025-11-27 13:19:38', '2025-11-27 13:19:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1124', 'local', '1', '2', '0', '2025-11-27 13:20:38', '2025-11-27 13:20:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1125', 'local', '1', '5', '0', '2025-11-27 13:21:38', '2025-11-27 13:21:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1126', 'local', '1', '2', '0', '2025-11-27 13:22:38', '2025-11-27 13:22:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1127', 'local', '1', '3', '0', '2025-11-27 13:23:38', '2025-11-27 13:23:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1128', 'local', '1', '2', '0', '2025-11-27 13:24:38', '2025-11-27 13:24:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1129', 'local', '1', '2', '0', '2025-11-27 13:25:38', '2025-11-27 13:25:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1130', 'local', '1', '2', '0', '2025-11-27 13:26:38', '2025-11-27 13:26:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1131', 'local', '1', '1', '0', '2025-11-27 13:27:38', '2025-11-27 13:27:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1132', 'local', '1', '2', '0', '2025-11-27 13:28:38', '2025-11-27 13:28:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1133', 'local', '1', '2', '0', '2025-11-27 13:29:38', '2025-11-27 13:29:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1134', 'local', '1', '2', '0', '2025-11-27 13:30:38', '2025-11-27 13:30:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1135', 'local', '1', '2', '0', '2025-11-27 13:31:38', '2025-11-27 13:31:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1136', 'local', '1', '2', '0', '2025-11-27 13:32:38', '2025-11-27 13:32:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1137', 'local', '1', '3', '0', '2025-11-27 13:33:38', '2025-11-27 13:33:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1138', 'local', '1', '2', '0', '2025-11-27 13:34:38', '2025-11-27 13:34:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1139', 'local', '1', '2', '0', '2025-11-27 13:35:38', '2025-11-27 13:35:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1140', 'local', '1', '2', '0', '2025-11-27 13:36:38', '2025-11-27 13:36:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1141', 'local', '1', '2', '0', '2025-11-27 13:37:38', '2025-11-27 13:37:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1142', 'local', '1', '2', '0', '2025-11-27 13:38:38', '2025-11-27 13:38:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1143', 'local', '1', '1', '0', '2025-11-27 13:39:38', '2025-11-27 13:39:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1144', 'local', '1', '2', '0', '2025-11-27 13:40:38', '2025-11-27 13:40:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1145', 'local', '1', '2', '0', '2025-11-27 13:41:38', '2025-11-27 13:41:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1146', 'local', '1', '2', '0', '2025-11-27 13:42:38', '2025-11-27 13:42:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1147', 'local', '1', '2', '0', '2025-11-27 13:43:38', '2025-11-27 13:43:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1148', 'local', '1', '2', '0', '2025-11-27 13:44:38', '2025-11-27 13:44:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1149', 'local', '1', '2', '0', '2025-11-27 13:45:38', '2025-11-27 13:45:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1150', 'local', '1', '2', '0', '2025-11-27 13:46:38', '2025-11-27 13:46:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1151', 'local', '1', '2', '0', '2025-11-27 13:47:38', '2025-11-27 13:47:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1152', 'local', '1', '2', '0', '2025-11-27 13:48:38', '2025-11-27 13:48:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1153', 'local', '1', '3', '0', '2025-11-27 13:49:38', '2025-11-27 13:49:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1154', 'local', '1', '2', '0', '2025-11-27 13:50:38', '2025-11-27 13:50:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1155', 'local', '1', '2', '0', '2025-11-27 13:51:38', '2025-11-27 13:51:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1156', 'local', '1', '3', '0', '2025-11-27 13:52:38', '2025-11-27 13:52:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1157', 'local', '1', '2', '0', '2025-11-27 13:53:38', '2025-11-27 13:53:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1158', 'local', '1', '2', '0', '2025-11-27 13:54:38', '2025-11-27 13:54:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1159', 'local', '1', '2', '0', '2025-11-27 13:55:38', '2025-11-27 13:55:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1160', 'local', '1', '2', '0', '2025-11-27 13:56:38', '2025-11-27 13:56:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1161', 'local', '1', '2', '0', '2025-11-27 13:57:38', '2025-11-27 13:57:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1162', 'local', '1', '2', '0', '2025-11-27 13:58:38', '2025-11-27 13:58:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1163', 'local', '1', '2', '0', '2025-11-27 13:59:38', '2025-11-27 13:59:38');
INSERT INTO `websockets_statistics_entries` VALUES ('1164', 'local', '1', '1', '0', '2025-11-27 14:00:39', '2025-11-27 14:00:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1165', 'local', '1', '2', '0', '2025-11-27 14:01:39', '2025-11-27 14:01:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1166', 'local', '1', '2', '0', '2025-11-27 14:02:39', '2025-11-27 14:02:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1167', 'local', '1', '3', '0', '2025-11-27 14:03:39', '2025-11-27 14:03:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1168', 'local', '1', '3', '0', '2025-11-27 14:04:39', '2025-11-27 14:04:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1169', 'local', '1', '2', '0', '2025-11-27 14:05:39', '2025-11-27 14:05:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1170', 'local', '1', '2', '0', '2025-11-27 14:06:39', '2025-11-27 14:06:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1171', 'local', '1', '2', '0', '2025-11-27 14:07:39', '2025-11-27 14:07:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1172', 'local', '1', '3', '0', '2025-11-27 14:08:39', '2025-11-27 14:08:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1173', 'local', '1', '2', '0', '2025-11-27 14:09:39', '2025-11-27 14:09:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1174', 'local', '1', '3', '0', '2025-11-27 14:10:39', '2025-11-27 14:10:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1175', 'local', '1', '2', '0', '2025-11-27 14:11:39', '2025-11-27 14:11:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1176', 'local', '1', '2', '0', '2025-11-27 14:12:39', '2025-11-27 14:12:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1177', 'local', '1', '2', '0', '2025-11-27 14:13:39', '2025-11-27 14:13:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1178', 'local', '1', '1', '0', '2025-11-27 14:14:39', '2025-11-27 14:14:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1179', 'local', '1', '2', '0', '2025-11-27 14:15:39', '2025-11-27 14:15:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1180', 'local', '1', '3', '0', '2025-11-27 14:16:39', '2025-11-27 14:16:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1181', 'local', '1', '2', '0', '2025-11-27 14:17:39', '2025-11-27 14:17:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1182', 'local', '1', '2', '0', '2025-11-27 14:18:39', '2025-11-27 14:18:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1183', 'local', '1', '2', '0', '2025-11-27 14:19:39', '2025-11-27 14:19:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1184', 'local', '1', '3', '0', '2025-11-27 14:20:39', '2025-11-27 14:20:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1185', 'local', '1', '2', '0', '2025-11-27 14:21:39', '2025-11-27 14:21:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1186', 'local', '1', '2', '0', '2025-11-27 14:22:39', '2025-11-27 14:22:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1187', 'local', '1', '2', '0', '2025-11-27 14:23:39', '2025-11-27 14:23:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1188', 'local', '1', '5', '0', '2025-11-27 14:24:39', '2025-11-27 14:24:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1189', 'local', '1', '2', '0', '2025-11-27 14:25:39', '2025-11-27 14:25:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1190', 'local', '1', '2', '0', '2025-11-27 14:26:39', '2025-11-27 14:26:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1191', 'local', '1', '2', '0', '2025-11-27 14:27:39', '2025-11-27 14:27:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1192', 'local', '1', '2', '0', '2025-11-27 14:28:39', '2025-11-27 14:28:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1193', 'local', '1', '2', '0', '2025-11-27 14:29:39', '2025-11-27 14:29:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1194', 'local', '1', '2', '0', '2025-11-27 14:30:39', '2025-11-27 14:30:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1195', 'local', '1', '4', '0', '2025-11-27 14:31:39', '2025-11-27 14:31:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1196', 'local', '1', '2', '0', '2025-11-27 14:32:39', '2025-11-27 14:32:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1197', 'local', '1', '7', '0', '2025-11-27 14:33:39', '2025-11-27 14:33:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1198', 'local', '1', '2', '0', '2025-11-27 14:34:39', '2025-11-27 14:34:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1199', 'local', '1', '4', '0', '2025-11-27 14:35:39', '2025-11-27 14:35:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1200', 'local', '1', '5', '0', '2025-11-27 14:36:39', '2025-11-27 14:36:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1201', 'local', '1', '5', '0', '2025-11-27 14:37:39', '2025-11-27 14:37:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1202', 'local', '1', '2', '0', '2025-11-27 14:38:39', '2025-11-27 14:38:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1203', 'local', '1', '1', '0', '2025-11-27 14:39:39', '2025-11-27 14:39:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1204', 'local', '1', '7', '0', '2025-11-27 14:40:39', '2025-11-27 14:40:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1205', 'local', '1', '2', '0', '2025-11-27 14:41:39', '2025-11-27 14:41:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1206', 'local', '1', '7', '0', '2025-11-27 14:42:39', '2025-11-27 14:42:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1207', 'local', '1', '2', '0', '2025-11-27 14:43:39', '2025-11-27 14:43:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1208', 'local', '1', '2', '0', '2025-11-27 14:44:39', '2025-11-27 14:44:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1209', 'local', '1', '4', '0', '2025-11-27 14:45:39', '2025-11-27 14:45:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1210', 'local', '1', '7', '0', '2025-11-27 14:46:39', '2025-11-27 14:46:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1211', 'local', '1', '2', '0', '2025-11-27 14:47:39', '2025-11-27 14:47:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1212', 'local', '1', '2', '0', '2025-11-27 14:48:39', '2025-11-27 14:48:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1213', 'local', '1', '2', '0', '2025-11-27 14:49:39', '2025-11-27 14:49:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1214', 'local', '1', '2', '0', '2025-11-27 14:50:39', '2025-11-27 14:50:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1215', 'local', '1', '2', '0', '2025-11-27 14:51:39', '2025-11-27 14:51:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1216', 'local', '1', '2', '0', '2025-11-27 14:52:39', '2025-11-27 14:52:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1217', 'local', '1', '2', '0', '2025-11-27 14:53:39', '2025-11-27 14:53:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1218', 'local', '1', '2', '0', '2025-11-27 14:54:39', '2025-11-27 14:54:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1219', 'local', '1', '4', '0', '2025-11-27 14:55:39', '2025-11-27 14:55:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1220', 'local', '1', '2', '0', '2025-11-27 14:56:39', '2025-11-27 14:56:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1221', 'local', '1', '2', '0', '2025-11-27 14:57:39', '2025-11-27 14:57:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1222', 'local', '1', '2', '0', '2025-11-27 14:58:39', '2025-11-27 14:58:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1223', 'local', '1', '2', '0', '2025-11-27 14:59:39', '2025-11-27 14:59:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1224', 'local', '1', '2', '0', '2025-11-27 15:00:39', '2025-11-27 15:00:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1225', 'local', '1', '2', '0', '2025-11-27 15:01:39', '2025-11-27 15:01:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1226', 'local', '1', '4', '0', '2025-11-27 15:02:39', '2025-11-27 15:02:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1227', 'local', '1', '2', '0', '2025-11-27 15:03:39', '2025-11-27 15:03:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1228', 'local', '1', '1', '0', '2025-11-27 15:04:39', '2025-11-27 15:04:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1229', 'local', '1', '2', '0', '2025-11-27 15:05:39', '2025-11-27 15:05:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1230', 'local', '1', '2', '0', '2025-11-27 15:06:39', '2025-11-27 15:06:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1231', 'local', '1', '2', '0', '2025-11-27 15:07:39', '2025-11-27 15:07:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1232', 'local', '1', '2', '0', '2025-11-27 15:08:39', '2025-11-27 15:08:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1233', 'local', '1', '2', '0', '2025-11-27 15:09:39', '2025-11-27 15:09:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1234', 'local', '1', '2', '0', '2025-11-27 15:10:39', '2025-11-27 15:10:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1235', 'local', '1', '5', '0', '2025-11-27 15:11:39', '2025-11-27 15:11:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1236', 'local', '1', '5', '0', '2025-11-27 15:12:39', '2025-11-27 15:12:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1237', 'local', '1', '1', '0', '2025-11-27 15:13:39', '2025-11-27 15:13:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1238', 'local', '1', '2', '0', '2025-11-27 15:14:39', '2025-11-27 15:14:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1239', 'local', '1', '2', '0', '2025-11-27 15:15:39', '2025-11-27 15:15:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1240', 'local', '1', '2', '0', '2025-11-27 15:16:39', '2025-11-27 15:16:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1241', 'local', '1', '2', '0', '2025-11-27 15:17:39', '2025-11-27 15:17:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1242', 'local', '1', '7', '0', '2025-11-27 15:18:39', '2025-11-27 15:18:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1243', 'local', '1', '8', '0', '2025-11-27 15:19:39', '2025-11-27 15:19:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1244', 'local', '1', '10', '0', '2025-11-27 15:20:39', '2025-11-27 15:20:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1245', 'local', '1', '2', '0', '2025-11-27 15:21:39', '2025-11-27 15:21:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1246', 'local', '1', '2', '0', '2025-11-27 15:22:39', '2025-11-27 15:22:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1247', 'local', '1', '4', '0', '2025-11-27 15:23:39', '2025-11-27 15:23:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1248', 'local', '1', '2', '0', '2025-11-27 15:24:39', '2025-11-27 15:24:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1249', 'local', '1', '2', '0', '2025-11-27 15:25:39', '2025-11-27 15:25:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1250', 'local', '1', '2', '0', '2025-11-27 15:26:39', '2025-11-27 15:26:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1251', 'local', '1', '5', '0', '2025-11-27 15:27:39', '2025-11-27 15:27:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1252', 'local', '1', '1', '0', '2025-11-27 15:28:39', '2025-11-27 15:28:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1253', 'local', '1', '10', '0', '2025-11-27 15:29:39', '2025-11-27 15:29:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1254', 'local', '1', '5', '0', '2025-11-27 15:30:39', '2025-11-27 15:30:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1255', 'local', '1', '2', '0', '2025-11-27 15:31:39', '2025-11-27 15:31:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1256', 'local', '1', '2', '0', '2025-11-27 15:32:39', '2025-11-27 15:32:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1257', 'local', '1', '2', '0', '2025-11-27 15:33:39', '2025-11-27 15:33:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1258', 'local', '1', '4', '0', '2025-11-27 15:34:39', '2025-11-27 15:34:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1259', 'local', '1', '2', '0', '2025-11-27 15:35:39', '2025-11-27 15:35:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1260', 'local', '1', '2', '0', '2025-11-27 15:36:39', '2025-11-27 15:36:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1261', 'local', '1', '2', '0', '2025-11-27 15:37:39', '2025-11-27 15:37:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1262', 'local', '2', '3', '0', '2025-11-27 15:38:39', '2025-11-27 15:38:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1263', 'local', '1', '4', '0', '2025-11-27 15:39:39', '2025-11-27 15:39:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1264', 'local', '1', '4', '0', '2025-11-27 15:40:39', '2025-11-27 15:40:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1265', 'local', '1', '4', '0', '2025-11-27 15:41:39', '2025-11-27 15:41:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1266', 'local', '1', '4', '0', '2025-11-27 15:42:39', '2025-11-27 15:42:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1267', 'local', '1', '2', '0', '2025-11-27 15:43:39', '2025-11-27 15:43:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1268', 'local', '1', '4', '4', '2025-11-27 15:44:39', '2025-11-27 15:44:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1269', 'local', '1', '6', '3', '2025-11-27 15:45:39', '2025-11-27 15:45:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1270', 'local', '2', '5', '2', '2025-11-27 15:46:39', '2025-11-27 15:46:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1271', 'local', '1', '2', '0', '2025-11-27 15:47:39', '2025-11-27 15:47:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1272', 'local', '1', '2', '0', '2025-11-27 15:48:39', '2025-11-27 15:48:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1273', 'local', '1', '2', '0', '2025-11-27 15:49:39', '2025-11-27 15:49:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1274', 'local', '1', '2', '0', '2025-11-27 15:50:39', '2025-11-27 15:50:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1275', 'local', '1', '2', '0', '2025-11-27 15:51:39', '2025-11-27 15:51:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1276', 'local', '1', '2', '0', '2025-11-27 15:52:39', '2025-11-27 15:52:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1277', 'local', '1', '2', '0', '2025-11-27 15:53:39', '2025-11-27 15:53:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1278', 'local', '1', '2', '0', '2025-11-27 15:54:39', '2025-11-27 15:54:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1279', 'local', '1', '2', '0', '2025-11-27 15:55:39', '2025-11-27 15:55:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1280', 'local', '1', '2', '0', '2025-11-27 15:56:39', '2025-11-27 15:56:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1281', 'local', '1', '2', '0', '2025-11-27 15:57:39', '2025-11-27 15:57:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1282', 'local', '1', '2', '0', '2025-11-27 15:58:39', '2025-11-27 15:58:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1283', 'local', '1', '2', '0', '2025-11-27 15:59:39', '2025-11-27 15:59:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1284', 'local', '1', '2', '0', '2025-11-27 16:00:39', '2025-11-27 16:00:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1285', 'local', '1', '2', '0', '2025-11-27 16:01:39', '2025-11-27 16:01:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1286', 'local', '1', '2', '0', '2025-11-27 16:02:39', '2025-11-27 16:02:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1287', 'local', '1', '2', '0', '2025-11-27 16:03:39', '2025-11-27 16:03:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1288', 'local', '1', '2', '0', '2025-11-27 16:04:39', '2025-11-27 16:04:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1289', 'local', '1', '2', '0', '2025-11-27 16:05:39', '2025-11-27 16:05:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1290', 'local', '2', '3', '0', '2025-11-27 16:06:39', '2025-11-27 16:06:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1291', 'local', '1', '2', '0', '2025-11-27 16:07:39', '2025-11-27 16:07:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1292', 'local', '1', '2', '0', '2025-11-27 16:08:39', '2025-11-27 16:08:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1293', 'local', '1', '2', '0', '2025-11-27 16:09:39', '2025-11-27 16:09:39');
INSERT INTO `websockets_statistics_entries` VALUES ('1294', 'local', '1', '2', '0', '2025-11-27 16:10:40', '2025-11-27 16:10:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1295', 'local', '1', '2', '0', '2025-11-27 16:11:40', '2025-11-27 16:11:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1296', 'local', '1', '5', '0', '2025-11-27 16:12:40', '2025-11-27 16:12:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1297', 'local', '1', '2', '0', '2025-11-27 16:13:40', '2025-11-27 16:13:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1298', 'local', '1', '6', '0', '2025-11-27 16:14:40', '2025-11-27 16:14:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1299', 'local', '1', '2', '0', '2025-11-27 16:15:40', '2025-11-27 16:15:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1300', 'local', '1', '2', '0', '2025-11-27 16:16:40', '2025-11-27 16:16:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1301', 'local', '1', '7', '0', '2025-11-27 16:17:40', '2025-11-27 16:17:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1302', 'local', '1', '2', '0', '2025-11-27 16:18:40', '2025-11-27 16:18:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1303', 'local', '1', '2', '0', '2025-11-27 16:19:40', '2025-11-27 16:19:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1304', 'local', '1', '2', '0', '2025-11-27 16:20:40', '2025-11-27 16:20:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1305', 'local', '1', '2', '0', '2025-11-27 16:21:40', '2025-11-27 16:21:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1306', 'local', '1', '2', '0', '2025-11-27 16:22:40', '2025-11-27 16:22:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1307', 'local', '1', '4', '0', '2025-11-27 16:23:40', '2025-11-27 16:23:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1308', 'local', '1', '2', '0', '2025-11-27 16:24:40', '2025-11-27 16:24:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1309', 'local', '1', '2', '0', '2025-11-27 16:25:40', '2025-11-27 16:25:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1310', 'local', '1', '4', '0', '2025-11-27 16:26:40', '2025-11-27 16:26:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1311', 'local', '1', '4', '0', '2025-11-27 16:27:40', '2025-11-27 16:27:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1312', 'local', '1', '2', '0', '2025-11-27 16:28:40', '2025-11-27 16:28:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1313', 'local', '1', '2', '0', '2025-11-27 16:29:40', '2025-11-27 16:29:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1314', 'local', '1', '5', '0', '2025-11-27 16:30:40', '2025-11-27 16:30:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1315', 'local', '1', '2', '0', '2025-11-27 16:31:40', '2025-11-27 16:31:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1316', 'local', '1', '2', '0', '2025-11-27 16:32:40', '2025-11-27 16:32:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1317', 'local', '1', '4', '0', '2025-11-27 16:33:40', '2025-11-27 16:33:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1318', 'local', '1', '4', '0', '2025-11-27 16:34:40', '2025-11-27 16:34:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1319', 'local', '1', '2', '0', '2025-11-27 16:35:40', '2025-11-27 16:35:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1320', 'local', '1', '2', '0', '2025-11-27 16:36:40', '2025-11-27 16:36:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1321', 'local', '1', '2', '0', '2025-11-27 16:37:40', '2025-11-27 16:37:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1322', 'local', '1', '2', '0', '2025-11-27 16:38:40', '2025-11-27 16:38:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1323', 'local', '1', '2', '0', '2025-11-27 16:39:40', '2025-11-27 16:39:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1324', 'local', '1', '2', '0', '2025-11-27 16:40:40', '2025-11-27 16:40:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1325', 'local', '1', '2', '0', '2025-11-27 16:41:40', '2025-11-27 16:41:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1326', 'local', '1', '2', '0', '2025-11-27 16:42:40', '2025-11-27 16:42:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1327', 'local', '1', '2', '0', '2025-11-27 16:43:40', '2025-11-27 16:43:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1328', 'local', '1', '2', '0', '2025-11-27 16:44:40', '2025-11-27 16:44:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1329', 'local', '1', '4', '0', '2025-11-27 16:45:40', '2025-11-27 16:45:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1330', 'local', '1', '2', '0', '2025-11-27 16:46:40', '2025-11-27 16:46:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1331', 'local', '1', '2', '0', '2025-11-27 16:47:40', '2025-11-27 16:47:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1332', 'local', '1', '2', '0', '2025-11-27 16:48:40', '2025-11-27 16:48:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1333', 'local', '1', '2', '0', '2025-11-27 16:49:40', '2025-11-27 16:49:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1334', 'local', '1', '2', '0', '2025-11-27 16:50:40', '2025-11-27 16:50:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1335', 'local', '1', '2', '0', '2025-11-27 16:51:40', '2025-11-27 16:51:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1336', 'local', '1', '1', '0', '2025-11-27 16:52:40', '2025-11-27 16:52:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1337', 'local', '1', '2', '0', '2025-11-27 16:53:40', '2025-11-27 16:53:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1338', 'local', '1', '2', '0', '2025-11-27 16:54:40', '2025-11-27 16:54:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1339', 'local', '1', '2', '0', '2025-11-27 16:55:40', '2025-11-27 16:55:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1340', 'local', '1', '2', '0', '2025-11-27 16:56:40', '2025-11-27 16:56:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1341', 'local', '1', '2', '0', '2025-11-27 16:57:40', '2025-11-27 16:57:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1342', 'local', '1', '2', '0', '2025-11-27 16:58:40', '2025-11-27 16:58:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1343', 'local', '1', '2', '0', '2025-11-27 16:59:40', '2025-11-27 16:59:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1344', 'local', '1', '2', '0', '2025-11-27 17:00:40', '2025-11-27 17:00:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1345', 'local', '1', '2', '0', '2025-11-27 17:01:40', '2025-11-27 17:01:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1346', 'local', '1', '2', '0', '2025-11-27 17:02:40', '2025-11-27 17:02:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1347', 'local', '1', '2', '0', '2025-11-27 17:03:40', '2025-11-27 17:03:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1348', 'local', '1', '2', '0', '2025-11-27 17:04:40', '2025-11-27 17:04:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1349', 'local', '1', '2', '0', '2025-11-27 17:05:40', '2025-11-27 17:05:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1350', 'local', '1', '2', '0', '2025-11-27 17:06:40', '2025-11-27 17:06:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1351', 'local', '1', '1', '0', '2025-11-27 17:07:40', '2025-11-27 17:07:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1352', 'local', '1', '2', '0', '2025-11-27 17:08:40', '2025-11-27 17:08:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1353', 'local', '1', '2', '0', '2025-11-27 17:09:40', '2025-11-27 17:09:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1354', 'local', '1', '2', '0', '2025-11-27 17:10:40', '2025-11-27 17:10:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1355', 'local', '1', '5', '0', '2025-11-27 17:11:40', '2025-11-27 17:11:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1356', 'local', '1', '4', '0', '2025-11-27 17:12:40', '2025-11-27 17:12:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1357', 'local', '1', '2', '0', '2025-11-27 17:13:40', '2025-11-27 17:13:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1358', 'local', '1', '5', '0', '2025-11-27 17:14:40', '2025-11-27 17:14:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1359', 'local', '1', '2', '0', '2025-11-27 17:15:40', '2025-11-27 17:15:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1360', 'local', '1', '2', '0', '2025-11-27 17:16:40', '2025-11-27 17:16:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1361', 'local', '1', '2', '0', '2025-11-27 17:17:40', '2025-11-27 17:17:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1362', 'local', '1', '4', '0', '2025-11-27 17:18:40', '2025-11-27 17:18:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1363', 'local', '1', '2', '0', '2025-11-27 17:19:40', '2025-11-27 17:19:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1364', 'local', '1', '2', '0', '2025-11-27 17:20:40', '2025-11-27 17:20:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1365', 'local', '1', '2', '0', '2025-11-27 17:21:40', '2025-11-27 17:21:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1366', 'local', '1', '5', '0', '2025-11-27 17:22:40', '2025-11-27 17:22:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1367', 'local', '1', '4', '0', '2025-11-27 17:23:40', '2025-11-27 17:23:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1368', 'local', '1', '2', '0', '2025-11-27 17:24:40', '2025-11-27 17:24:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1369', 'local', '1', '2', '0', '2025-11-27 17:25:40', '2025-11-27 17:25:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1370', 'local', '1', '4', '0', '2025-11-27 17:26:40', '2025-11-27 17:26:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1371', 'local', '1', '2', '0', '2025-11-27 17:27:40', '2025-11-27 17:27:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1372', 'local', '1', '2', '0', '2025-11-27 17:28:40', '2025-11-27 17:28:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1373', 'local', '1', '2', '0', '2025-11-27 17:29:40', '2025-11-27 17:29:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1374', 'local', '1', '2', '0', '2025-11-27 17:30:40', '2025-11-27 17:30:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1375', 'local', '1', '2', '0', '2025-11-27 17:31:40', '2025-11-27 17:31:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1376', 'local', '1', '2', '0', '2025-11-27 17:32:40', '2025-11-27 17:32:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1377', 'local', '1', '2', '0', '2025-11-27 17:33:40', '2025-11-27 17:33:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1378', 'local', '1', '2', '0', '2025-11-27 17:34:40', '2025-11-27 17:34:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1379', 'local', '1', '2', '0', '2025-11-27 17:35:40', '2025-11-27 17:35:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1380', 'local', '1', '2', '0', '2025-11-27 17:36:40', '2025-11-27 17:36:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1381', 'local', '1', '5', '0', '2025-11-27 17:37:40', '2025-11-27 17:37:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1382', 'local', '1', '2', '0', '2025-11-27 17:38:40', '2025-11-27 17:38:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1383', 'local', '1', '1', '0', '2025-11-27 17:39:40', '2025-11-27 17:39:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1384', 'local', '1', '2', '0', '2025-11-27 17:40:40', '2025-11-27 17:40:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1385', 'local', '1', '2', '0', '2025-11-27 17:41:40', '2025-11-27 17:41:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1386', 'local', '1', '5', '0', '2025-11-27 17:42:40', '2025-11-27 17:42:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1387', 'local', '1', '10', '0', '2025-11-27 17:43:40', '2025-11-27 17:43:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1388', 'local', '1', '5', '0', '2025-11-27 17:44:40', '2025-11-27 17:44:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1389', 'local', '1', '2', '0', '2025-11-27 17:45:40', '2025-11-27 17:45:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1390', 'local', '1', '1', '0', '2025-11-27 17:46:40', '2025-11-27 17:46:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1391', 'local', '1', '2', '0', '2025-11-27 17:47:40', '2025-11-27 17:47:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1392', 'local', '1', '2', '0', '2025-11-27 17:48:40', '2025-11-27 17:48:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1393', 'local', '1', '2', '0', '2025-11-27 17:49:40', '2025-11-27 17:49:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1394', 'local', '1', '2', '0', '2025-11-27 17:50:40', '2025-11-27 17:50:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1395', 'local', '1', '2', '0', '2025-11-27 17:51:40', '2025-11-27 17:51:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1396', 'local', '1', '2', '0', '2025-11-27 17:52:40', '2025-11-27 17:52:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1397', 'local', '1', '2', '0', '2025-11-27 17:53:40', '2025-11-27 17:53:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1398', 'local', '1', '2', '0', '2025-11-27 17:54:40', '2025-11-27 17:54:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1399', 'local', '1', '2', '0', '2025-11-27 17:55:40', '2025-11-27 17:55:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1400', 'local', '1', '5', '0', '2025-11-27 17:56:40', '2025-11-27 17:56:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1401', 'local', '1', '2', '0', '2025-11-27 17:57:40', '2025-11-27 17:57:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1402', 'local', '1', '1', '0', '2025-11-27 17:58:40', '2025-11-27 17:58:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1403', 'local', '1', '2', '0', '2025-11-27 17:59:40', '2025-11-27 17:59:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1404', 'local', '1', '5', '0', '2025-11-27 18:00:40', '2025-11-27 18:00:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1405', 'local', '1', '2', '0', '2025-11-27 18:01:40', '2025-11-27 18:01:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1406', 'local', '1', '2', '0', '2025-11-27 18:02:40', '2025-11-27 18:02:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1407', 'local', '1', '2', '0', '2025-11-27 18:03:40', '2025-11-27 18:03:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1408', 'local', '1', '4', '0', '2025-11-27 18:04:40', '2025-11-27 18:04:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1409', 'local', '1', '2', '0', '2025-11-27 18:05:40', '2025-11-27 18:05:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1410', 'local', '1', '2', '0', '2025-11-27 18:06:40', '2025-11-27 18:06:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1411', 'local', '1', '2', '0', '2025-11-27 18:07:40', '2025-11-27 18:07:40');
INSERT INTO `websockets_statistics_entries` VALUES ('1412', 'local', '1', '4', '0', '2025-11-27 18:08:41', '2025-11-27 18:08:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1413', 'local', '1', '0', '0', '2025-11-27 18:09:41', '2025-11-27 18:09:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1414', 'local', '1', '6', '0', '2025-11-27 18:18:41', '2025-11-27 18:18:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1415', 'local', '1', '1', '1', '2025-11-27 18:19:41', '2025-11-27 18:19:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1416', 'local', '1', '2', '0', '2025-11-27 18:20:41', '2025-11-27 18:20:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1417', 'local', '1', '2', '0', '2025-11-27 18:21:41', '2025-11-27 18:21:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1418', 'local', '1', '2', '0', '2025-11-27 18:22:41', '2025-11-27 18:22:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1419', 'local', '1', '2', '0', '2025-11-27 18:23:41', '2025-11-27 18:23:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1420', 'local', '1', '2', '0', '2025-11-27 18:24:41', '2025-11-27 18:24:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1421', 'local', '1', '2', '0', '2025-11-27 18:25:41', '2025-11-27 18:25:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1422', 'local', '1', '2', '0', '2025-11-27 18:26:41', '2025-11-27 18:26:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1423', 'local', '1', '2', '0', '2025-11-27 18:27:41', '2025-11-27 18:27:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1424', 'local', '1', '2', '0', '2025-11-27 18:28:41', '2025-11-27 18:28:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1425', 'local', '1', '2', '0', '2025-11-27 18:29:41', '2025-11-27 18:29:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1426', 'local', '1', '2', '0', '2025-11-27 18:30:41', '2025-11-27 18:30:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1427', 'local', '1', '2', '0', '2025-11-27 18:31:41', '2025-11-27 18:31:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1428', 'local', '1', '2', '0', '2025-11-27 18:32:41', '2025-11-27 18:32:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1429', 'local', '1', '2', '0', '2025-11-27 18:33:41', '2025-11-27 18:33:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1430', 'local', '1', '1', '0', '2025-11-27 18:34:41', '2025-11-27 18:34:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1431', 'local', '1', '2', '0', '2025-11-27 18:35:41', '2025-11-27 18:35:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1432', 'local', '1', '2', '0', '2025-11-27 18:36:41', '2025-11-27 18:36:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1433', 'local', '1', '2', '0', '2025-11-27 18:37:41', '2025-11-27 18:37:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1434', 'local', '1', '2', '0', '2025-11-27 18:38:41', '2025-11-27 18:38:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1435', 'local', '1', '4', '0', '2025-11-27 18:39:41', '2025-11-27 18:39:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1436', 'local', '1', '2', '0', '2025-11-27 18:40:41', '2025-11-27 18:40:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1437', 'local', '1', '5', '0', '2025-11-27 18:41:41', '2025-11-27 18:41:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1438', 'local', '1', '2', '0', '2025-11-27 18:42:41', '2025-11-27 18:42:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1439', 'local', '1', '2', '0', '2025-11-27 18:43:41', '2025-11-27 18:43:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1440', 'local', '1', '2', '0', '2025-11-27 18:44:41', '2025-11-27 18:44:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1441', 'local', '1', '2', '0', '2025-11-27 18:45:41', '2025-11-27 18:45:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1442', 'local', '1', '2', '0', '2025-11-27 18:46:41', '2025-11-27 18:46:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1443', 'local', '1', '2', '0', '2025-11-27 18:47:41', '2025-11-27 18:47:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1444', 'local', '1', '1', '0', '2025-11-27 18:48:41', '2025-11-27 18:48:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1445', 'local', '1', '2', '0', '2025-11-27 18:49:41', '2025-11-27 18:49:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1446', 'local', '1', '2', '0', '2025-11-27 18:50:41', '2025-11-27 18:50:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1447', 'local', '1', '2', '0', '2025-11-27 18:51:41', '2025-11-27 18:51:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1448', 'local', '1', '2', '0', '2025-11-27 18:52:41', '2025-11-27 18:52:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1449', 'local', '1', '5', '0', '2025-11-27 18:53:41', '2025-11-27 18:53:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1450', 'local', '1', '2', '0', '2025-11-27 18:54:41', '2025-11-27 18:54:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1451', 'local', '1', '4', '0', '2025-11-27 18:55:41', '2025-11-27 18:55:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1452', 'local', '1', '2', '0', '2025-11-27 18:56:41', '2025-11-27 18:56:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1453', 'local', '1', '2', '0', '2025-11-27 18:57:41', '2025-11-27 18:57:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1454', 'local', '1', '2', '0', '2025-11-27 18:58:41', '2025-11-27 18:58:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1455', 'local', '1', '2', '0', '2025-11-27 18:59:41', '2025-11-27 18:59:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1456', 'local', '1', '2', '0', '2025-11-27 19:00:41', '2025-11-27 19:00:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1457', 'local', '1', '2', '0', '2025-11-27 19:01:41', '2025-11-27 19:01:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1458', 'local', '1', '2', '0', '2025-11-27 19:02:41', '2025-11-27 19:02:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1459', 'local', '1', '2', '0', '2025-11-27 19:03:41', '2025-11-27 19:03:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1460', 'local', '1', '2', '0', '2025-11-27 19:04:41', '2025-11-27 19:04:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1461', 'local', '1', '2', '0', '2025-11-27 19:05:41', '2025-11-27 19:05:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1462', 'local', '1', '2', '0', '2025-11-27 19:06:41', '2025-11-27 19:06:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1463', 'local', '1', '1', '0', '2025-11-27 19:07:41', '2025-11-27 19:07:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1464', 'local', '1', '2', '0', '2025-11-27 19:08:41', '2025-11-27 19:08:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1465', 'local', '1', '2', '0', '2025-11-27 19:09:41', '2025-11-27 19:09:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1466', 'local', '1', '2', '0', '2025-11-27 19:10:41', '2025-11-27 19:10:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1467', 'local', '1', '2', '0', '2025-11-27 19:11:41', '2025-11-27 19:11:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1468', 'local', '1', '2', '0', '2025-11-27 19:12:41', '2025-11-27 19:12:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1469', 'local', '1', '2', '0', '2025-11-27 19:13:41', '2025-11-27 19:13:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1470', 'local', '1', '2', '0', '2025-11-27 19:14:41', '2025-11-27 19:14:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1471', 'local', '1', '2', '0', '2025-11-27 19:15:41', '2025-11-27 19:15:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1472', 'local', '1', '2', '0', '2025-11-27 19:16:41', '2025-11-27 19:16:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1473', 'local', '1', '2', '0', '2025-11-27 19:17:41', '2025-11-27 19:17:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1474', 'local', '1', '2', '0', '2025-11-27 19:18:41', '2025-11-27 19:18:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1475', 'local', '1', '2', '0', '2025-11-27 19:19:41', '2025-11-27 19:19:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1476', 'local', '1', '2', '0', '2025-11-27 19:20:41', '2025-11-27 19:20:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1477', 'local', '1', '2', '0', '2025-11-27 19:21:41', '2025-11-27 19:21:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1478', 'local', '1', '1', '0', '2025-11-27 19:22:41', '2025-11-27 19:22:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1479', 'local', '1', '2', '0', '2025-11-27 19:23:41', '2025-11-27 19:23:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1480', 'local', '1', '2', '0', '2025-11-27 19:24:41', '2025-11-27 19:24:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1481', 'local', '1', '2', '0', '2025-11-27 19:25:41', '2025-11-27 19:25:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1482', 'local', '1', '2', '0', '2025-11-27 19:26:41', '2025-11-27 19:26:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1483', 'local', '1', '2', '0', '2025-11-27 19:27:41', '2025-11-27 19:27:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1484', 'local', '1', '2', '0', '2025-11-27 19:28:41', '2025-11-27 19:28:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1485', 'local', '1', '2', '0', '2025-11-27 19:29:41', '2025-11-27 19:29:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1486', 'local', '1', '2', '0', '2025-11-27 19:30:41', '2025-11-27 19:30:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1487', 'local', '1', '2', '0', '2025-11-27 19:31:41', '2025-11-27 19:31:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1488', 'local', '1', '2', '0', '2025-11-27 19:32:41', '2025-11-27 19:32:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1489', 'local', '1', '2', '0', '2025-11-27 19:33:41', '2025-11-27 19:33:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1490', 'local', '1', '2', '0', '2025-11-27 19:34:41', '2025-11-27 19:34:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1491', 'local', '1', '2', '0', '2025-11-27 19:35:41', '2025-11-27 19:35:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1492', 'local', '1', '2', '0', '2025-11-27 19:36:41', '2025-11-27 19:36:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1493', 'local', '1', '2', '0', '2025-11-27 19:37:41', '2025-11-27 19:37:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1494', 'local', '1', '1', '0', '2025-11-27 19:38:41', '2025-11-27 19:38:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1495', 'local', '1', '2', '0', '2025-11-27 19:39:41', '2025-11-27 19:39:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1496', 'local', '1', '2', '0', '2025-11-27 19:40:41', '2025-11-27 19:40:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1497', 'local', '1', '2', '0', '2025-11-27 19:41:41', '2025-11-27 19:41:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1498', 'local', '1', '2', '0', '2025-11-27 19:42:41', '2025-11-27 19:42:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1499', 'local', '1', '2', '0', '2025-11-27 19:43:41', '2025-11-27 19:43:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1500', 'local', '1', '2', '0', '2025-11-27 19:44:41', '2025-11-27 19:44:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1501', 'local', '1', '2', '0', '2025-11-27 19:45:41', '2025-11-27 19:45:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1502', 'local', '1', '2', '0', '2025-11-27 19:46:41', '2025-11-27 19:46:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1503', 'local', '1', '2', '0', '2025-11-27 19:47:41', '2025-11-27 19:47:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1504', 'local', '1', '2', '0', '2025-11-27 19:48:41', '2025-11-27 19:48:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1505', 'local', '1', '2', '0', '2025-11-27 19:49:41', '2025-11-27 19:49:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1506', 'local', '1', '2', '0', '2025-11-27 19:50:41', '2025-11-27 19:50:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1507', 'local', '1', '2', '0', '2025-11-27 19:51:41', '2025-11-27 19:51:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1508', 'local', '1', '2', '0', '2025-11-27 19:52:41', '2025-11-27 19:52:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1509', 'local', '1', '2', '0', '2025-11-27 19:53:41', '2025-11-27 19:53:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1510', 'local', '1', '1', '0', '2025-11-27 19:54:41', '2025-11-27 19:54:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1511', 'local', '1', '2', '0', '2025-11-27 19:55:41', '2025-11-27 19:55:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1512', 'local', '1', '2', '0', '2025-11-27 19:56:41', '2025-11-27 19:56:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1513', 'local', '1', '2', '0', '2025-11-27 19:57:41', '2025-11-27 19:57:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1514', 'local', '1', '2', '0', '2025-11-27 19:58:42', '2025-11-27 19:58:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1515', 'local', '1', '2', '0', '2025-11-27 19:59:42', '2025-11-27 19:59:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1516', 'local', '1', '2', '0', '2025-11-27 20:00:42', '2025-11-27 20:00:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1517', 'local', '1', '2', '0', '2025-11-27 20:01:42', '2025-11-27 20:01:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1518', 'local', '1', '2', '0', '2025-11-27 20:02:42', '2025-11-27 20:02:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1519', 'local', '1', '2', '0', '2025-11-27 20:03:42', '2025-11-27 20:03:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1520', 'local', '1', '2', '0', '2025-11-27 20:04:42', '2025-11-27 20:04:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1521', 'local', '1', '2', '0', '2025-11-27 20:05:42', '2025-11-27 20:05:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1522', 'local', '1', '2', '0', '2025-11-27 20:06:42', '2025-11-27 20:06:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1523', 'local', '1', '2', '0', '2025-11-27 20:07:42', '2025-11-27 20:07:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1524', 'local', '1', '2', '0', '2025-11-27 20:08:42', '2025-11-27 20:08:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1525', 'local', '1', '1', '0', '2025-11-27 20:09:42', '2025-11-27 20:09:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1526', 'local', '1', '2', '0', '2025-11-27 20:10:42', '2025-11-27 20:10:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1527', 'local', '1', '2', '0', '2025-11-27 20:11:42', '2025-11-27 20:11:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1528', 'local', '1', '2', '0', '2025-11-27 20:12:42', '2025-11-27 20:12:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1529', 'local', '1', '2', '0', '2025-11-27 20:13:42', '2025-11-27 20:13:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1530', 'local', '1', '2', '0', '2025-11-27 20:14:42', '2025-11-27 20:14:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1531', 'local', '1', '2', '0', '2025-11-27 20:15:42', '2025-11-27 20:15:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1532', 'local', '1', '2', '0', '2025-11-27 20:16:42', '2025-11-27 20:16:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1533', 'local', '1', '2', '0', '2025-11-27 20:17:42', '2025-11-27 20:17:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1534', 'local', '1', '2', '0', '2025-11-27 20:18:42', '2025-11-27 20:18:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1535', 'local', '1', '2', '0', '2025-11-27 20:19:42', '2025-11-27 20:19:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1536', 'local', '1', '2', '0', '2025-11-27 20:20:42', '2025-11-27 20:20:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1537', 'local', '1', '2', '0', '2025-11-27 20:21:42', '2025-11-27 20:21:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1538', 'local', '1', '2', '0', '2025-11-27 20:22:42', '2025-11-27 20:22:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1539', 'local', '1', '2', '0', '2025-11-27 20:23:42', '2025-11-27 20:23:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1540', 'local', '1', '2', '0', '2025-11-27 20:24:42', '2025-11-27 20:24:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1541', 'local', '1', '1', '0', '2025-11-27 20:25:42', '2025-11-27 20:25:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1542', 'local', '1', '2', '0', '2025-11-27 20:26:42', '2025-11-27 20:26:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1543', 'local', '1', '2', '0', '2025-11-27 20:27:42', '2025-11-27 20:27:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1544', 'local', '1', '2', '0', '2025-11-27 20:28:42', '2025-11-27 20:28:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1545', 'local', '1', '2', '0', '2025-11-27 20:29:42', '2025-11-27 20:29:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1546', 'local', '1', '2', '0', '2025-11-27 20:30:42', '2025-11-27 20:30:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1547', 'local', '1', '2', '0', '2025-11-27 20:31:42', '2025-11-27 20:31:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1548', 'local', '1', '2', '0', '2025-11-27 20:32:42', '2025-11-27 20:32:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1549', 'local', '1', '2', '0', '2025-11-27 20:33:42', '2025-11-27 20:33:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1550', 'local', '1', '2', '0', '2025-11-27 20:34:42', '2025-11-27 20:34:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1551', 'local', '1', '2', '0', '2025-11-27 20:35:42', '2025-11-27 20:35:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1552', 'local', '1', '2', '0', '2025-11-27 20:36:42', '2025-11-27 20:36:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1553', 'local', '1', '2', '0', '2025-11-27 20:37:42', '2025-11-27 20:37:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1554', 'local', '1', '2', '0', '2025-11-27 20:38:42', '2025-11-27 20:38:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1555', 'local', '1', '2', '0', '2025-11-27 20:39:42', '2025-11-27 20:39:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1556', 'local', '1', '2', '0', '2025-11-27 20:40:42', '2025-11-27 20:40:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1557', 'local', '1', '1', '0', '2025-11-27 20:41:42', '2025-11-27 20:41:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1558', 'local', '1', '2', '0', '2025-11-27 20:42:42', '2025-11-27 20:42:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1559', 'local', '1', '2', '0', '2025-11-27 20:43:42', '2025-11-27 20:43:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1560', 'local', '1', '2', '0', '2025-11-27 20:44:42', '2025-11-27 20:44:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1561', 'local', '1', '2', '0', '2025-11-27 20:45:42', '2025-11-27 20:45:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1562', 'local', '1', '2', '0', '2025-11-27 20:46:42', '2025-11-27 20:46:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1563', 'local', '1', '2', '0', '2025-11-27 20:47:42', '2025-11-27 20:47:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1564', 'local', '1', '2', '0', '2025-11-27 20:48:42', '2025-11-27 20:48:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1565', 'local', '1', '2', '0', '2025-11-27 20:49:42', '2025-11-27 20:49:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1566', 'local', '1', '2', '0', '2025-11-27 20:50:42', '2025-11-27 20:50:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1567', 'local', '1', '2', '0', '2025-11-27 20:51:42', '2025-11-27 20:51:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1568', 'local', '1', '2', '0', '2025-11-27 20:52:42', '2025-11-27 20:52:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1569', 'local', '1', '2', '0', '2025-11-27 20:53:42', '2025-11-27 20:53:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1570', 'local', '1', '2', '0', '2025-11-27 20:54:42', '2025-11-27 20:54:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1571', 'local', '1', '2', '0', '2025-11-27 20:55:42', '2025-11-27 20:55:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1572', 'local', '1', '1', '0', '2025-11-27 20:56:42', '2025-11-27 20:56:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1573', 'local', '1', '2', '0', '2025-11-27 20:57:42', '2025-11-27 20:57:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1574', 'local', '1', '2', '0', '2025-11-27 20:58:42', '2025-11-27 20:58:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1575', 'local', '1', '2', '0', '2025-11-27 20:59:42', '2025-11-27 20:59:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1576', 'local', '1', '2', '0', '2025-11-27 21:00:42', '2025-11-27 21:00:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1577', 'local', '1', '2', '0', '2025-11-27 21:01:42', '2025-11-27 21:01:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1578', 'local', '1', '2', '0', '2025-11-27 21:02:42', '2025-11-27 21:02:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1579', 'local', '1', '2', '0', '2025-11-27 21:03:42', '2025-11-27 21:03:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1580', 'local', '1', '2', '0', '2025-11-27 21:04:42', '2025-11-27 21:04:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1581', 'local', '1', '2', '0', '2025-11-27 21:05:42', '2025-11-27 21:05:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1582', 'local', '1', '2', '0', '2025-11-27 21:06:42', '2025-11-27 21:06:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1583', 'local', '1', '2', '0', '2025-11-27 21:07:42', '2025-11-27 21:07:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1584', 'local', '1', '2', '0', '2025-11-27 21:08:42', '2025-11-27 21:08:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1585', 'local', '1', '2', '0', '2025-11-27 21:09:42', '2025-11-27 21:09:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1586', 'local', '1', '2', '0', '2025-11-27 21:10:42', '2025-11-27 21:10:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1587', 'local', '1', '2', '0', '2025-11-27 21:11:42', '2025-11-27 21:11:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1588', 'local', '1', '1', '0', '2025-11-27 21:12:42', '2025-11-27 21:12:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1589', 'local', '1', '2', '0', '2025-11-27 21:13:42', '2025-11-27 21:13:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1590', 'local', '1', '2', '0', '2025-11-27 21:14:42', '2025-11-27 21:14:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1591', 'local', '1', '2', '0', '2025-11-27 21:15:42', '2025-11-27 21:15:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1592', 'local', '1', '2', '0', '2025-11-27 21:16:42', '2025-11-27 21:16:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1593', 'local', '1', '2', '0', '2025-11-27 21:17:42', '2025-11-27 21:17:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1594', 'local', '1', '2', '0', '2025-11-27 21:18:42', '2025-11-27 21:18:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1595', 'local', '1', '2', '0', '2025-11-27 21:19:42', '2025-11-27 21:19:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1596', 'local', '1', '2', '0', '2025-11-27 21:20:42', '2025-11-27 21:20:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1597', 'local', '1', '2', '0', '2025-11-27 21:21:42', '2025-11-27 21:21:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1598', 'local', '1', '2', '0', '2025-11-27 21:22:42', '2025-11-27 21:22:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1599', 'local', '1', '2', '0', '2025-11-27 21:23:42', '2025-11-27 21:23:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1600', 'local', '1', '2', '0', '2025-11-27 21:24:42', '2025-11-27 21:24:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1601', 'local', '1', '2', '0', '2025-11-27 21:25:42', '2025-11-27 21:25:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1602', 'local', '1', '2', '0', '2025-11-27 21:26:42', '2025-11-27 21:26:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1603', 'local', '1', '1', '0', '2025-11-27 21:27:42', '2025-11-27 21:27:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1604', 'local', '1', '2', '0', '2025-11-27 21:28:42', '2025-11-27 21:28:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1605', 'local', '1', '2', '0', '2025-11-27 21:29:42', '2025-11-27 21:29:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1606', 'local', '1', '2', '0', '2025-11-27 21:30:42', '2025-11-27 21:30:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1607', 'local', '1', '2', '0', '2025-11-27 21:31:42', '2025-11-27 21:31:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1608', 'local', '1', '2', '0', '2025-11-27 21:32:42', '2025-11-27 21:32:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1609', 'local', '1', '2', '0', '2025-11-27 21:33:42', '2025-11-27 21:33:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1610', 'local', '1', '2', '0', '2025-11-27 21:34:42', '2025-11-27 21:34:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1611', 'local', '1', '2', '0', '2025-11-27 21:35:42', '2025-11-27 21:35:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1612', 'local', '1', '2', '0', '2025-11-27 21:36:42', '2025-11-27 21:36:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1613', 'local', '1', '2', '0', '2025-11-27 21:37:42', '2025-11-27 21:37:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1614', 'local', '1', '2', '0', '2025-11-27 21:38:42', '2025-11-27 21:38:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1615', 'local', '1', '2', '0', '2025-11-27 21:39:42', '2025-11-27 21:39:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1616', 'local', '1', '2', '0', '2025-11-27 21:40:42', '2025-11-27 21:40:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1617', 'local', '1', '2', '0', '2025-11-27 21:41:42', '2025-11-27 21:41:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1618', 'local', '1', '2', '0', '2025-11-27 21:42:42', '2025-11-27 21:42:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1619', 'local', '1', '1', '0', '2025-11-27 21:43:42', '2025-11-27 21:43:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1620', 'local', '1', '2', '0', '2025-11-27 21:44:42', '2025-11-27 21:44:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1621', 'local', '1', '2', '0', '2025-11-27 21:45:42', '2025-11-27 21:45:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1622', 'local', '1', '2', '0', '2025-11-27 21:46:42', '2025-11-27 21:46:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1623', 'local', '1', '2', '0', '2025-11-27 21:47:42', '2025-11-27 21:47:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1624', 'local', '1', '2', '0', '2025-11-27 21:48:42', '2025-11-27 21:48:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1625', 'local', '1', '2', '0', '2025-11-27 21:49:42', '2025-11-27 21:49:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1626', 'local', '1', '2', '0', '2025-11-27 21:50:42', '2025-11-27 21:50:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1627', 'local', '1', '2', '0', '2025-11-27 21:51:42', '2025-11-27 21:51:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1628', 'local', '1', '2', '0', '2025-11-27 21:52:42', '2025-11-27 21:52:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1629', 'local', '1', '2', '0', '2025-11-27 21:53:42', '2025-11-27 21:53:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1630', 'local', '1', '2', '0', '2025-11-27 21:54:42', '2025-11-27 21:54:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1631', 'local', '1', '2', '0', '2025-11-27 21:55:42', '2025-11-27 21:55:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1632', 'local', '1', '2', '0', '2025-11-27 21:56:42', '2025-11-27 21:56:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1633', 'local', '1', '2', '0', '2025-11-27 21:57:42', '2025-11-27 21:57:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1634', 'local', '1', '1', '0', '2025-11-27 21:58:42', '2025-11-27 21:58:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1635', 'local', '1', '2', '0', '2025-11-27 21:59:42', '2025-11-27 21:59:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1636', 'local', '1', '2', '0', '2025-11-27 22:00:42', '2025-11-27 22:00:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1637', 'local', '1', '2', '0', '2025-11-27 22:01:42', '2025-11-27 22:01:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1638', 'local', '1', '2', '0', '2025-11-27 22:02:42', '2025-11-27 22:02:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1639', 'local', '1', '2', '0', '2025-11-27 22:03:42', '2025-11-27 22:03:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1640', 'local', '1', '2', '0', '2025-11-27 22:04:42', '2025-11-27 22:04:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1641', 'local', '1', '2', '0', '2025-11-27 22:05:42', '2025-11-27 22:05:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1642', 'local', '1', '2', '0', '2025-11-27 22:06:42', '2025-11-27 22:06:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1643', 'local', '1', '2', '0', '2025-11-27 22:07:43', '2025-11-27 22:07:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1644', 'local', '1', '2', '0', '2025-11-27 22:08:43', '2025-11-27 22:08:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1645', 'local', '1', '2', '0', '2025-11-27 22:09:43', '2025-11-27 22:09:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1646', 'local', '1', '2', '0', '2025-11-27 22:10:43', '2025-11-27 22:10:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1647', 'local', '1', '2', '0', '2025-11-27 22:11:43', '2025-11-27 22:11:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1648', 'local', '1', '2', '0', '2025-11-27 22:12:43', '2025-11-27 22:12:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1649', 'local', '1', '2', '0', '2025-11-27 22:13:43', '2025-11-27 22:13:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1650', 'local', '1', '1', '0', '2025-11-27 22:14:43', '2025-11-27 22:14:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1651', 'local', '1', '2', '0', '2025-11-27 22:15:43', '2025-11-27 22:15:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1652', 'local', '1', '2', '0', '2025-11-27 22:16:43', '2025-11-27 22:16:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1653', 'local', '1', '2', '0', '2025-11-27 22:17:43', '2025-11-27 22:17:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1654', 'local', '1', '2', '0', '2025-11-27 22:18:43', '2025-11-27 22:18:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1655', 'local', '1', '2', '0', '2025-11-27 22:19:43', '2025-11-27 22:19:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1656', 'local', '1', '2', '0', '2025-11-27 22:20:43', '2025-11-27 22:20:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1657', 'local', '1', '2', '0', '2025-11-27 22:21:43', '2025-11-27 22:21:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1658', 'local', '1', '2', '0', '2025-11-27 22:22:43', '2025-11-27 22:22:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1659', 'local', '1', '2', '0', '2025-11-27 22:23:43', '2025-11-27 22:23:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1660', 'local', '1', '2', '0', '2025-11-27 22:24:43', '2025-11-27 22:24:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1661', 'local', '1', '2', '0', '2025-11-27 22:25:43', '2025-11-27 22:25:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1662', 'local', '1', '2', '0', '2025-11-27 22:26:43', '2025-11-27 22:26:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1663', 'local', '1', '2', '0', '2025-11-27 22:27:43', '2025-11-27 22:27:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1664', 'local', '1', '2', '0', '2025-11-27 22:28:43', '2025-11-27 22:28:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1665', 'local', '1', '2', '0', '2025-11-27 22:29:43', '2025-11-27 22:29:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1666', 'local', '1', '1', '0', '2025-11-27 22:30:43', '2025-11-27 22:30:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1667', 'local', '1', '2', '0', '2025-11-27 22:31:43', '2025-11-27 22:31:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1668', 'local', '1', '2', '0', '2025-11-27 22:32:43', '2025-11-27 22:32:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1669', 'local', '1', '2', '0', '2025-11-27 22:33:43', '2025-11-27 22:33:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1670', 'local', '1', '2', '0', '2025-11-27 22:34:43', '2025-11-27 22:34:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1671', 'local', '1', '2', '0', '2025-11-27 22:35:43', '2025-11-27 22:35:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1672', 'local', '1', '2', '0', '2025-11-27 22:36:43', '2025-11-27 22:36:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1673', 'local', '1', '2', '0', '2025-11-27 22:37:43', '2025-11-27 22:37:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1674', 'local', '1', '2', '0', '2025-11-27 22:38:43', '2025-11-27 22:38:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1675', 'local', '1', '2', '0', '2025-11-27 22:39:43', '2025-11-27 22:39:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1676', 'local', '1', '2', '0', '2025-11-27 22:40:43', '2025-11-27 22:40:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1677', 'local', '1', '2', '0', '2025-11-27 22:41:43', '2025-11-27 22:41:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1678', 'local', '1', '2', '0', '2025-11-27 22:42:43', '2025-11-27 22:42:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1679', 'local', '1', '2', '0', '2025-11-27 22:43:43', '2025-11-27 22:43:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1680', 'local', '1', '2', '0', '2025-11-27 22:44:43', '2025-11-27 22:44:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1681', 'local', '1', '1', '0', '2025-11-27 22:45:43', '2025-11-27 22:45:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1682', 'local', '1', '2', '0', '2025-11-27 22:46:43', '2025-11-27 22:46:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1683', 'local', '1', '2', '0', '2025-11-27 22:47:43', '2025-11-27 22:47:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1684', 'local', '1', '2', '0', '2025-11-27 22:48:43', '2025-11-27 22:48:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1685', 'local', '1', '2', '0', '2025-11-27 22:49:43', '2025-11-27 22:49:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1686', 'local', '1', '2', '0', '2025-11-27 22:50:43', '2025-11-27 22:50:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1687', 'local', '1', '2', '0', '2025-11-27 22:51:43', '2025-11-27 22:51:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1688', 'local', '1', '2', '0', '2025-11-27 22:52:43', '2025-11-27 22:52:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1689', 'local', '1', '2', '0', '2025-11-27 22:53:43', '2025-11-27 22:53:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1690', 'local', '1', '2', '0', '2025-11-27 22:54:43', '2025-11-27 22:54:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1691', 'local', '1', '2', '0', '2025-11-27 22:55:43', '2025-11-27 22:55:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1692', 'local', '1', '2', '0', '2025-11-27 22:56:43', '2025-11-27 22:56:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1693', 'local', '1', '2', '0', '2025-11-27 22:57:43', '2025-11-27 22:57:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1694', 'local', '1', '2', '0', '2025-11-27 22:58:43', '2025-11-27 22:58:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1695', 'local', '1', '2', '0', '2025-11-27 22:59:43', '2025-11-27 22:59:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1696', 'local', '1', '2', '0', '2025-11-27 23:00:43', '2025-11-27 23:00:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1697', 'local', '1', '1', '0', '2025-11-27 23:01:43', '2025-11-27 23:01:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1698', 'local', '1', '2', '0', '2025-11-27 23:02:43', '2025-11-27 23:02:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1699', 'local', '1', '2', '0', '2025-11-27 23:03:43', '2025-11-27 23:03:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1700', 'local', '1', '2', '0', '2025-11-27 23:04:43', '2025-11-27 23:04:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1701', 'local', '1', '2', '0', '2025-11-27 23:05:43', '2025-11-27 23:05:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1702', 'local', '1', '2', '0', '2025-11-27 23:06:43', '2025-11-27 23:06:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1703', 'local', '1', '2', '0', '2025-11-27 23:07:43', '2025-11-27 23:07:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1704', 'local', '1', '2', '0', '2025-11-27 23:08:43', '2025-11-27 23:08:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1705', 'local', '1', '2', '0', '2025-11-27 23:09:43', '2025-11-27 23:09:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1706', 'local', '1', '2', '0', '2025-11-27 23:10:43', '2025-11-27 23:10:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1707', 'local', '1', '2', '0', '2025-11-27 23:11:43', '2025-11-27 23:11:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1708', 'local', '1', '2', '0', '2025-11-27 23:12:43', '2025-11-27 23:12:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1709', 'local', '1', '2', '0', '2025-11-27 23:13:43', '2025-11-27 23:13:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1710', 'local', '1', '2', '0', '2025-11-27 23:14:43', '2025-11-27 23:14:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1711', 'local', '1', '2', '0', '2025-11-27 23:15:43', '2025-11-27 23:15:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1712', 'local', '1', '1', '0', '2025-11-27 23:16:43', '2025-11-27 23:16:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1713', 'local', '1', '2', '0', '2025-11-27 23:17:43', '2025-11-27 23:17:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1714', 'local', '1', '2', '0', '2025-11-27 23:18:43', '2025-11-27 23:18:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1715', 'local', '1', '2', '0', '2025-11-27 23:19:43', '2025-11-27 23:19:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1716', 'local', '1', '2', '0', '2025-11-27 23:20:43', '2025-11-27 23:20:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1717', 'local', '1', '2', '0', '2025-11-27 23:21:43', '2025-11-27 23:21:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1718', 'local', '1', '2', '0', '2025-11-27 23:22:43', '2025-11-27 23:22:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1719', 'local', '1', '2', '0', '2025-11-27 23:23:43', '2025-11-27 23:23:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1720', 'local', '1', '2', '0', '2025-11-27 23:24:43', '2025-11-27 23:24:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1721', 'local', '1', '2', '0', '2025-11-27 23:25:43', '2025-11-27 23:25:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1722', 'local', '1', '2', '0', '2025-11-27 23:26:43', '2025-11-27 23:26:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1723', 'local', '1', '2', '0', '2025-11-27 23:27:43', '2025-11-27 23:27:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1724', 'local', '1', '2', '0', '2025-11-27 23:28:43', '2025-11-27 23:28:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1725', 'local', '1', '2', '0', '2025-11-27 23:29:43', '2025-11-27 23:29:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1726', 'local', '1', '2', '0', '2025-11-27 23:30:43', '2025-11-27 23:30:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1727', 'local', '1', '2', '0', '2025-11-27 23:31:43', '2025-11-27 23:31:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1728', 'local', '1', '1', '0', '2025-11-27 23:32:43', '2025-11-27 23:32:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1729', 'local', '1', '2', '0', '2025-11-27 23:33:43', '2025-11-27 23:33:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1730', 'local', '1', '2', '0', '2025-11-27 23:34:43', '2025-11-27 23:34:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1731', 'local', '1', '2', '0', '2025-11-27 23:35:43', '2025-11-27 23:35:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1732', 'local', '1', '2', '0', '2025-11-27 23:36:43', '2025-11-27 23:36:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1733', 'local', '1', '2', '0', '2025-11-27 23:37:43', '2025-11-27 23:37:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1734', 'local', '1', '2', '0', '2025-11-27 23:38:43', '2025-11-27 23:38:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1735', 'local', '1', '2', '0', '2025-11-27 23:39:43', '2025-11-27 23:39:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1736', 'local', '1', '2', '0', '2025-11-27 23:40:43', '2025-11-27 23:40:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1737', 'local', '1', '2', '0', '2025-11-27 23:41:43', '2025-11-27 23:41:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1738', 'local', '1', '2', '0', '2025-11-27 23:42:43', '2025-11-27 23:42:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1739', 'local', '1', '2', '0', '2025-11-27 23:43:43', '2025-11-27 23:43:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1740', 'local', '1', '2', '0', '2025-11-27 23:44:43', '2025-11-27 23:44:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1741', 'local', '1', '2', '0', '2025-11-27 23:45:43', '2025-11-27 23:45:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1742', 'local', '1', '2', '0', '2025-11-27 23:46:43', '2025-11-27 23:46:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1743', 'local', '1', '1', '0', '2025-11-27 23:47:43', '2025-11-27 23:47:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1744', 'local', '1', '2', '0', '2025-11-27 23:48:43', '2025-11-27 23:48:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1745', 'local', '1', '2', '0', '2025-11-27 23:49:43', '2025-11-27 23:49:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1746', 'local', '1', '2', '0', '2025-11-27 23:50:43', '2025-11-27 23:50:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1747', 'local', '1', '2', '0', '2025-11-27 23:51:43', '2025-11-27 23:51:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1748', 'local', '1', '2', '0', '2025-11-27 23:52:43', '2025-11-27 23:52:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1749', 'local', '1', '2', '0', '2025-11-27 23:53:43', '2025-11-27 23:53:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1750', 'local', '1', '2', '0', '2025-11-27 23:54:43', '2025-11-27 23:54:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1751', 'local', '1', '2', '0', '2025-11-27 23:55:43', '2025-11-27 23:55:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1752', 'local', '1', '2', '0', '2025-11-27 23:56:43', '2025-11-27 23:56:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1753', 'local', '1', '2', '0', '2025-11-27 23:57:43', '2025-11-27 23:57:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1754', 'local', '1', '2', '0', '2025-11-27 23:58:43', '2025-11-27 23:58:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1755', 'local', '1', '2', '0', '2025-11-27 23:59:43', '2025-11-27 23:59:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1756', 'local', '1', '2', '0', '2025-11-28 00:00:43', '2025-11-28 00:00:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1757', 'local', '1', '2', '0', '2025-11-28 00:01:43', '2025-11-28 00:01:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1758', 'local', '1', '2', '0', '2025-11-28 00:02:43', '2025-11-28 00:02:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1759', 'local', '1', '1', '0', '2025-11-28 00:03:43', '2025-11-28 00:03:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1760', 'local', '1', '2', '0', '2025-11-28 00:04:44', '2025-11-28 00:04:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1761', 'local', '1', '2', '0', '2025-11-28 00:05:44', '2025-11-28 00:05:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1762', 'local', '1', '2', '0', '2025-11-28 00:06:44', '2025-11-28 00:06:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1763', 'local', '1', '2', '0', '2025-11-28 00:07:44', '2025-11-28 00:07:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1764', 'local', '1', '2', '0', '2025-11-28 00:08:44', '2025-11-28 00:08:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1765', 'local', '1', '2', '0', '2025-11-28 00:09:44', '2025-11-28 00:09:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1766', 'local', '1', '2', '0', '2025-11-28 00:10:44', '2025-11-28 00:10:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1767', 'local', '1', '2', '0', '2025-11-28 00:11:44', '2025-11-28 00:11:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1768', 'local', '1', '2', '0', '2025-11-28 00:12:44', '2025-11-28 00:12:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1769', 'local', '1', '2', '0', '2025-11-28 00:13:44', '2025-11-28 00:13:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1770', 'local', '1', '2', '0', '2025-11-28 00:14:44', '2025-11-28 00:14:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1771', 'local', '1', '2', '0', '2025-11-28 00:15:44', '2025-11-28 00:15:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1772', 'local', '1', '2', '0', '2025-11-28 00:16:44', '2025-11-28 00:16:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1773', 'local', '1', '2', '0', '2025-11-28 00:17:44', '2025-11-28 00:17:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1774', 'local', '1', '1', '0', '2025-11-28 00:18:44', '2025-11-28 00:18:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1775', 'local', '1', '2', '0', '2025-11-28 00:19:44', '2025-11-28 00:19:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1776', 'local', '1', '2', '0', '2025-11-28 00:20:44', '2025-11-28 00:20:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1777', 'local', '1', '2', '0', '2025-11-28 00:21:44', '2025-11-28 00:21:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1778', 'local', '1', '2', '0', '2025-11-28 00:22:44', '2025-11-28 00:22:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1779', 'local', '1', '2', '0', '2025-11-28 00:23:44', '2025-11-28 00:23:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1780', 'local', '1', '2', '0', '2025-11-28 00:24:44', '2025-11-28 00:24:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1781', 'local', '1', '2', '0', '2025-11-28 00:25:44', '2025-11-28 00:25:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1782', 'local', '1', '2', '0', '2025-11-28 00:26:44', '2025-11-28 00:26:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1783', 'local', '1', '2', '0', '2025-11-28 00:27:44', '2025-11-28 00:27:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1784', 'local', '1', '2', '0', '2025-11-28 00:28:44', '2025-11-28 00:28:44');
INSERT INTO `websockets_statistics_entries` VALUES ('1785', 'local', '1', '5', '0', '2025-11-28 14:27:41', '2025-11-28 14:27:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1786', 'local', '1', '2', '0', '2025-11-28 14:28:41', '2025-11-28 14:28:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1787', 'local', '1', '2', '0', '2025-11-28 14:29:41', '2025-11-28 14:29:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1788', 'local', '1', '2', '0', '2025-11-28 14:30:41', '2025-11-28 14:30:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1789', 'local', '1', '2', '0', '2025-11-28 14:31:41', '2025-11-28 14:31:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1790', 'local', '1', '2', '0', '2025-11-28 14:32:41', '2025-11-28 14:32:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1791', 'local', '1', '2', '0', '2025-11-28 14:33:41', '2025-11-28 14:33:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1792', 'local', '1', '2', '0', '2025-11-28 14:34:41', '2025-11-28 14:34:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1793', 'local', '1', '2', '0', '2025-11-28 14:35:41', '2025-11-28 14:35:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1794', 'local', '1', '2', '0', '2025-11-28 14:36:41', '2025-11-28 14:36:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1795', 'local', '1', '7', '0', '2025-11-28 14:37:41', '2025-11-28 14:37:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1796', 'local', '1', '2', '0', '2025-11-28 14:38:41', '2025-11-28 14:38:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1797', 'local', '1', '2', '0', '2025-11-28 14:39:41', '2025-11-28 14:39:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1798', 'local', '1', '8', '0', '2025-11-28 14:40:41', '2025-11-28 14:40:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1799', 'local', '1', '2', '0', '2025-11-28 14:41:41', '2025-11-28 14:41:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1800', 'local', '1', '9', '0', '2025-11-28 14:42:41', '2025-11-28 14:42:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1801', 'local', '1', '2', '0', '2025-11-28 14:43:41', '2025-11-28 14:43:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1802', 'local', '1', '2', '0', '2025-11-28 14:44:41', '2025-11-28 14:44:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1803', 'local', '1', '2', '0', '2025-11-28 14:45:41', '2025-11-28 14:45:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1804', 'local', '1', '2', '0', '2025-11-28 14:46:41', '2025-11-28 14:46:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1805', 'local', '1', '2', '0', '2025-11-28 14:47:41', '2025-11-28 14:47:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1806', 'local', '1', '7', '0', '2025-11-28 14:48:41', '2025-11-28 14:48:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1807', 'local', '1', '2', '0', '2025-11-28 14:49:41', '2025-11-28 14:49:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1808', 'local', '1', '2', '0', '2025-11-28 14:50:41', '2025-11-28 14:50:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1809', 'local', '1', '2', '0', '2025-11-28 14:51:41', '2025-11-28 14:51:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1810', 'local', '1', '2', '0', '2025-11-28 14:52:41', '2025-11-28 14:52:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1811', 'local', '1', '2', '0', '2025-11-28 14:53:41', '2025-11-28 14:53:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1812', 'local', '1', '2', '0', '2025-11-28 14:54:41', '2025-11-28 14:54:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1813', 'local', '1', '2', '0', '2025-11-28 14:55:41', '2025-11-28 14:55:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1814', 'local', '1', '2', '0', '2025-11-28 14:56:41', '2025-11-28 14:56:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1815', 'local', '1', '2', '0', '2025-11-28 14:57:41', '2025-11-28 14:57:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1816', 'local', '1', '2', '0', '2025-11-28 14:58:41', '2025-11-28 14:58:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1817', 'local', '1', '2', '0', '2025-11-28 14:59:41', '2025-11-28 14:59:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1818', 'local', '1', '2', '0', '2025-11-28 15:00:41', '2025-11-28 15:00:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1819', 'local', '1', '2', '0', '2025-11-28 15:01:41', '2025-11-28 15:01:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1820', 'local', '1', '2', '0', '2025-11-28 15:02:41', '2025-11-28 15:02:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1821', 'local', '1', '2', '0', '2025-11-28 15:03:41', '2025-11-28 15:03:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1822', 'local', '1', '1', '0', '2025-11-28 15:04:41', '2025-11-28 15:04:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1823', 'local', '1', '2', '0', '2025-11-28 15:05:41', '2025-11-28 15:05:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1824', 'local', '1', '2', '0', '2025-11-28 15:06:41', '2025-11-28 15:06:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1825', 'local', '1', '2', '0', '2025-11-28 15:07:41', '2025-11-28 15:07:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1826', 'local', '1', '2', '0', '2025-11-28 15:08:41', '2025-11-28 15:08:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1827', 'local', '1', '2', '0', '2025-11-28 15:09:41', '2025-11-28 15:09:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1828', 'local', '1', '4', '0', '2025-11-28 15:10:41', '2025-11-28 15:10:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1829', 'local', '1', '2', '0', '2025-11-28 15:11:41', '2025-11-28 15:11:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1830', 'local', '1', '5', '0', '2025-11-28 15:12:41', '2025-11-28 15:12:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1831', 'local', '1', '2', '0', '2025-11-28 15:13:41', '2025-11-28 15:13:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1832', 'local', '1', '2', '0', '2025-11-28 15:14:41', '2025-11-28 15:14:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1833', 'local', '1', '2', '0', '2025-11-28 15:15:41', '2025-11-28 15:15:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1834', 'local', '1', '2', '0', '2025-11-28 15:16:41', '2025-11-28 15:16:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1835', 'local', '1', '4', '0', '2025-11-28 15:17:41', '2025-11-28 15:17:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1836', 'local', '1', '2', '0', '2025-11-28 15:18:41', '2025-11-28 15:18:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1837', 'local', '1', '4', '0', '2025-11-28 15:19:41', '2025-11-28 15:19:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1838', 'local', '1', '2', '0', '2025-11-28 15:20:41', '2025-11-28 15:20:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1839', 'local', '1', '2', '0', '2025-11-28 15:21:41', '2025-11-28 15:21:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1840', 'local', '1', '2', '0', '2025-11-28 15:22:41', '2025-11-28 15:22:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1841', 'local', '1', '2', '0', '2025-11-28 15:23:41', '2025-11-28 15:23:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1842', 'local', '1', '2', '0', '2025-11-28 15:24:41', '2025-11-28 15:24:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1843', 'local', '1', '2', '0', '2025-11-28 15:25:41', '2025-11-28 15:25:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1844', 'local', '1', '5', '0', '2025-11-28 15:26:41', '2025-11-28 15:26:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1845', 'local', '1', '1', '0', '2025-11-28 15:27:41', '2025-11-28 15:27:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1846', 'local', '1', '5', '0', '2025-11-28 15:28:41', '2025-11-28 15:28:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1847', 'local', '1', '2', '0', '2025-11-28 15:29:41', '2025-11-28 15:29:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1848', 'local', '1', '5', '0', '2025-11-28 15:30:41', '2025-11-28 15:30:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1849', 'local', '1', '1', '0', '2025-11-28 15:31:41', '2025-11-28 15:31:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1850', 'local', '1', '2', '0', '2025-11-28 15:32:41', '2025-11-28 15:32:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1851', 'local', '1', '2', '0', '2025-11-28 15:33:41', '2025-11-28 15:33:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1852', 'local', '1', '2', '0', '2025-11-28 15:34:41', '2025-11-28 15:34:41');
INSERT INTO `websockets_statistics_entries` VALUES ('1853', 'local', '1', '2', '0', '2025-11-28 15:35:42', '2025-11-28 15:35:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1854', 'local', '1', '2', '0', '2025-11-28 15:36:42', '2025-11-28 15:36:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1855', 'local', '1', '2', '0', '2025-11-28 15:37:42', '2025-11-28 15:37:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1856', 'local', '1', '2', '0', '2025-11-28 15:38:42', '2025-11-28 15:38:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1857', 'local', '1', '2', '0', '2025-11-28 15:39:42', '2025-11-28 15:39:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1858', 'local', '1', '2', '0', '2025-11-28 15:40:42', '2025-11-28 15:40:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1859', 'local', '1', '2', '0', '2025-11-28 15:41:42', '2025-11-28 15:41:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1860', 'local', '1', '2', '0', '2025-11-28 15:42:42', '2025-11-28 15:42:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1861', 'local', '1', '2', '0', '2025-11-28 15:43:42', '2025-11-28 15:43:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1862', 'local', '1', '2', '0', '2025-11-28 15:44:42', '2025-11-28 15:44:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1863', 'local', '1', '2', '0', '2025-11-28 15:45:42', '2025-11-28 15:45:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1864', 'local', '1', '2', '0', '2025-11-28 15:46:42', '2025-11-28 15:46:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1865', 'local', '1', '1', '0', '2025-11-28 15:47:42', '2025-11-28 15:47:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1866', 'local', '1', '2', '0', '2025-11-28 15:48:42', '2025-11-28 15:48:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1867', 'local', '1', '2', '0', '2025-11-28 15:49:42', '2025-11-28 15:49:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1868', 'local', '1', '2', '0', '2025-11-28 15:50:42', '2025-11-28 15:50:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1869', 'local', '1', '2', '0', '2025-11-28 15:51:42', '2025-11-28 15:51:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1870', 'local', '1', '2', '0', '2025-11-28 15:52:42', '2025-11-28 15:52:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1871', 'local', '1', '2', '0', '2025-11-28 15:53:42', '2025-11-28 15:53:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1872', 'local', '1', '2', '0', '2025-11-28 15:54:42', '2025-11-28 15:54:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1873', 'local', '1', '2', '0', '2025-11-28 15:55:42', '2025-11-28 15:55:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1874', 'local', '1', '2', '0', '2025-11-28 15:56:42', '2025-11-28 15:56:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1875', 'local', '1', '2', '0', '2025-11-28 15:57:42', '2025-11-28 15:57:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1876', 'local', '1', '2', '0', '2025-11-28 15:58:42', '2025-11-28 15:58:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1877', 'local', '1', '2', '0', '2025-11-28 15:59:42', '2025-11-28 15:59:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1878', 'local', '1', '2', '0', '2025-11-28 16:00:42', '2025-11-28 16:00:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1879', 'local', '1', '2', '0', '2025-11-28 16:01:42', '2025-11-28 16:01:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1880', 'local', '1', '1', '0', '2025-11-28 16:02:42', '2025-11-28 16:02:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1881', 'local', '2', '4', '0', '2025-11-28 16:03:42', '2025-11-28 16:03:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1882', 'local', '2', '6', '0', '2025-11-28 16:04:42', '2025-11-28 16:04:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1883', 'local', '2', '4', '0', '2025-11-28 16:05:42', '2025-11-28 16:05:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1884', 'local', '2', '6', '0', '2025-11-28 16:06:42', '2025-11-28 16:06:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1885', 'local', '2', '4', '0', '2025-11-28 16:07:42', '2025-11-28 16:07:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1886', 'local', '2', '4', '0', '2025-11-28 16:08:42', '2025-11-28 16:08:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1887', 'local', '2', '6', '0', '2025-11-28 16:09:42', '2025-11-28 16:09:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1888', 'local', '2', '4', '0', '2025-11-28 16:10:42', '2025-11-28 16:10:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1889', 'local', '2', '7', '0', '2025-11-28 16:11:42', '2025-11-28 16:11:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1890', 'local', '2', '4', '0', '2025-11-28 16:12:42', '2025-11-28 16:12:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1891', 'local', '2', '4', '0', '2025-11-28 16:13:42', '2025-11-28 16:13:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1892', 'local', '2', '4', '0', '2025-11-28 16:14:42', '2025-11-28 16:14:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1893', 'local', '2', '6', '0', '2025-11-28 16:15:42', '2025-11-28 16:15:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1894', 'local', '2', '4', '0', '2025-11-28 16:16:42', '2025-11-28 16:16:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1895', 'local', '2', '4', '0', '2025-11-28 16:17:42', '2025-11-28 16:17:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1896', 'local', '2', '3', '0', '2025-11-28 16:18:42', '2025-11-28 16:18:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1897', 'local', '2', '7', '0', '2025-11-28 16:19:42', '2025-11-28 16:19:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1898', 'local', '2', '6', '0', '2025-11-28 16:20:42', '2025-11-28 16:20:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1899', 'local', '2', '6', '0', '2025-11-28 16:21:42', '2025-11-28 16:21:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1900', 'local', '2', '11', '0', '2025-11-28 16:22:42', '2025-11-28 16:22:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1901', 'local', '2', '4', '0', '2025-11-28 16:23:42', '2025-11-28 16:23:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1902', 'local', '2', '4', '0', '2025-11-28 16:24:42', '2025-11-28 16:24:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1903', 'local', '2', '4', '0', '2025-11-28 16:25:42', '2025-11-28 16:25:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1904', 'local', '2', '7', '0', '2025-11-28 16:26:42', '2025-11-28 16:26:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1905', 'local', '2', '7', '0', '2025-11-28 16:27:42', '2025-11-28 16:27:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1906', 'local', '2', '6', '0', '2025-11-28 16:28:42', '2025-11-28 16:28:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1907', 'local', '2', '4', '0', '2025-11-28 16:29:42', '2025-11-28 16:29:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1908', 'local', '2', '6', '0', '2025-11-28 16:30:42', '2025-11-28 16:30:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1909', 'local', '2', '4', '0', '2025-11-28 16:31:42', '2025-11-28 16:31:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1910', 'local', '2', '3', '0', '2025-11-28 16:32:42', '2025-11-28 16:32:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1911', 'local', '2', '6', '0', '2025-11-28 16:33:42', '2025-11-28 16:33:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1912', 'local', '2', '4', '0', '2025-11-28 16:34:42', '2025-11-28 16:34:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1913', 'local', '2', '4', '0', '2025-11-28 16:35:42', '2025-11-28 16:35:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1914', 'local', '2', '4', '0', '2025-11-28 16:36:42', '2025-11-28 16:36:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1915', 'local', '2', '4', '0', '2025-11-28 16:37:42', '2025-11-28 16:37:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1916', 'local', '2', '3', '0', '2025-11-28 16:38:42', '2025-11-28 16:38:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1917', 'local', '2', '7', '0', '2025-11-28 16:39:42', '2025-11-28 16:39:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1918', 'local', '2', '6', '0', '2025-11-28 16:40:42', '2025-11-28 16:40:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1919', 'local', '2', '4', '0', '2025-11-28 16:41:42', '2025-11-28 16:41:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1920', 'local', '2', '4', '0', '2025-11-28 16:42:42', '2025-11-28 16:42:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1921', 'local', '2', '4', '0', '2025-11-28 16:43:42', '2025-11-28 16:43:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1922', 'local', '2', '4', '0', '2025-11-28 16:44:42', '2025-11-28 16:44:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1923', 'local', '2', '4', '0', '2025-11-28 16:45:42', '2025-11-28 16:45:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1924', 'local', '2', '4', '0', '2025-11-28 16:46:42', '2025-11-28 16:46:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1925', 'local', '2', '4', '0', '2025-11-28 16:47:42', '2025-11-28 16:47:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1926', 'local', '2', '4', '0', '2025-11-28 16:48:42', '2025-11-28 16:48:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1927', 'local', '2', '4', '0', '2025-11-28 16:49:42', '2025-11-28 16:49:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1928', 'local', '1', '4', '0', '2025-11-28 16:50:42', '2025-11-28 16:50:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1929', 'local', '1', '2', '0', '2025-11-28 16:51:42', '2025-11-28 16:51:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1930', 'local', '1', '2', '0', '2025-11-28 16:52:42', '2025-11-28 16:52:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1931', 'local', '1', '2', '0', '2025-11-28 16:53:42', '2025-11-28 16:53:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1932', 'local', '1', '2', '0', '2025-11-28 16:54:42', '2025-11-28 16:54:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1933', 'local', '1', '2', '0', '2025-11-28 16:55:42', '2025-11-28 16:55:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1934', 'local', '1', '2', '0', '2025-11-28 16:56:42', '2025-11-28 16:56:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1935', 'local', '1', '2', '0', '2025-11-28 16:57:42', '2025-11-28 16:57:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1936', 'local', '1', '2', '0', '2025-11-28 16:58:42', '2025-11-28 16:58:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1937', 'local', '1', '4', '0', '2025-11-28 16:59:42', '2025-11-28 16:59:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1938', 'local', '1', '2', '0', '2025-11-28 17:00:42', '2025-11-28 17:00:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1939', 'local', '1', '2', '0', '2025-11-28 17:01:42', '2025-11-28 17:01:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1940', 'local', '1', '2', '0', '2025-11-28 17:02:42', '2025-11-28 17:02:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1941', 'local', '1', '2', '0', '2025-11-28 17:03:42', '2025-11-28 17:03:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1942', 'local', '1', '1', '0', '2025-11-28 17:04:42', '2025-11-28 17:04:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1943', 'local', '1', '2', '0', '2025-11-28 17:05:42', '2025-11-28 17:05:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1944', 'local', '1', '2', '0', '2025-11-28 17:06:42', '2025-11-28 17:06:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1945', 'local', '1', '2', '0', '2025-11-28 17:07:42', '2025-11-28 17:07:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1946', 'local', '1', '2', '0', '2025-11-28 17:08:42', '2025-11-28 17:08:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1947', 'local', '1', '5', '0', '2025-11-28 17:09:42', '2025-11-28 17:09:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1948', 'local', '1', '2', '0', '2025-11-28 17:10:42', '2025-11-28 17:10:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1949', 'local', '1', '2', '0', '2025-11-28 17:11:42', '2025-11-28 17:11:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1950', 'local', '1', '4', '0', '2025-11-28 17:12:42', '2025-11-28 17:12:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1951', 'local', '1', '5', '0', '2025-11-28 17:13:42', '2025-11-28 17:13:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1952', 'local', '1', '2', '0', '2025-11-28 17:14:42', '2025-11-28 17:14:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1953', 'local', '1', '2', '0', '2025-11-28 17:15:42', '2025-11-28 17:15:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1954', 'local', '1', '5', '0', '2025-11-28 17:16:42', '2025-11-28 17:16:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1955', 'local', '1', '2', '0', '2025-11-28 17:17:42', '2025-11-28 17:17:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1956', 'local', '1', '2', '0', '2025-11-28 17:18:42', '2025-11-28 17:18:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1957', 'local', '1', '2', '0', '2025-11-28 17:19:42', '2025-11-28 17:19:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1958', 'local', '1', '7', '0', '2025-11-28 17:20:42', '2025-11-28 17:20:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1959', 'local', '1', '2', '0', '2025-11-28 17:21:42', '2025-11-28 17:21:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1960', 'local', '1', '1', '0', '2025-11-28 17:22:42', '2025-11-28 17:22:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1961', 'local', '1', '2', '1', '2025-11-28 17:23:42', '2025-11-28 17:23:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1962', 'local', '1', '2', '0', '2025-11-28 17:24:42', '2025-11-28 17:24:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1963', 'local', '1', '2', '0', '2025-11-28 17:25:42', '2025-11-28 17:25:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1964', 'local', '1', '1', '0', '2025-11-28 17:26:42', '2025-11-28 17:26:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1965', 'local', '1', '2', '1', '2025-11-28 17:27:42', '2025-11-28 17:27:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1966', 'local', '1', '2', '0', '2025-11-28 17:28:42', '2025-11-28 17:28:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1967', 'local', '1', '2', '0', '2025-11-28 17:29:42', '2025-11-28 17:29:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1968', 'local', '1', '2', '0', '2025-11-28 17:30:42', '2025-11-28 17:30:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1969', 'local', '1', '2', '0', '2025-11-28 17:31:42', '2025-11-28 17:31:42');
INSERT INTO `websockets_statistics_entries` VALUES ('1970', 'local', '1', '1', '1', '2025-11-28 17:32:43', '2025-11-28 17:32:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1971', 'local', '1', '2', '0', '2025-11-28 17:33:43', '2025-11-28 17:33:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1972', 'local', '1', '2', '0', '2025-11-28 17:34:43', '2025-11-28 17:34:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1973', 'local', '1', '4', '0', '2025-11-28 17:35:43', '2025-11-28 17:35:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1974', 'local', '1', '2', '0', '2025-11-28 17:36:43', '2025-11-28 17:36:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1975', 'local', '1', '2', '0', '2025-11-28 17:37:43', '2025-11-28 17:37:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1976', 'local', '1', '2', '0', '2025-11-28 17:38:43', '2025-11-28 17:38:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1977', 'local', '1', '2', '0', '2025-11-28 17:39:43', '2025-11-28 17:39:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1978', 'local', '1', '2', '0', '2025-11-28 17:40:43', '2025-11-28 17:40:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1979', 'local', '1', '2', '0', '2025-11-28 17:41:43', '2025-11-28 17:41:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1980', 'local', '1', '2', '0', '2025-11-28 17:42:43', '2025-11-28 17:42:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1981', 'local', '1', '2', '0', '2025-11-28 17:43:43', '2025-11-28 17:43:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1982', 'local', '1', '2', '0', '2025-11-28 17:44:43', '2025-11-28 17:44:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1983', 'local', '1', '2', '0', '2025-11-28 17:45:43', '2025-11-28 17:45:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1984', 'local', '1', '2', '0', '2025-11-28 17:46:43', '2025-11-28 17:46:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1985', 'local', '1', '1', '0', '2025-11-28 17:47:43', '2025-11-28 17:47:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1986', 'local', '1', '2', '0', '2025-11-28 17:48:43', '2025-11-28 17:48:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1987', 'local', '1', '2', '0', '2025-11-28 17:49:43', '2025-11-28 17:49:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1988', 'local', '1', '2', '0', '2025-11-28 17:50:43', '2025-11-28 17:50:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1989', 'local', '1', '2', '0', '2025-11-28 17:51:43', '2025-11-28 17:51:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1990', 'local', '1', '2', '0', '2025-11-28 17:52:43', '2025-11-28 17:52:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1991', 'local', '1', '2', '0', '2025-11-28 17:53:43', '2025-11-28 17:53:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1992', 'local', '1', '2', '0', '2025-11-28 17:54:43', '2025-11-28 17:54:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1993', 'local', '1', '2', '0', '2025-11-28 17:55:43', '2025-11-28 17:55:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1994', 'local', '1', '2', '0', '2025-11-28 17:56:43', '2025-11-28 17:56:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1995', 'local', '1', '2', '0', '2025-11-28 17:57:43', '2025-11-28 17:57:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1996', 'local', '1', '2', '0', '2025-11-28 17:58:43', '2025-11-28 17:58:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1997', 'local', '1', '2', '0', '2025-11-28 17:59:43', '2025-11-28 17:59:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1998', 'local', '1', '2', '0', '2025-11-28 18:00:43', '2025-11-28 18:00:43');
INSERT INTO `websockets_statistics_entries` VALUES ('1999', 'local', '1', '2', '0', '2025-11-28 18:01:43', '2025-11-28 18:01:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2000', 'local', '1', '2', '0', '2025-11-28 18:02:43', '2025-11-28 18:02:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2001', 'local', '1', '1', '0', '2025-11-28 18:03:43', '2025-11-28 18:03:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2002', 'local', '1', '2', '0', '2025-11-28 18:04:43', '2025-11-28 18:04:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2003', 'local', '1', '2', '0', '2025-11-28 18:05:43', '2025-11-28 18:05:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2004', 'local', '1', '2', '0', '2025-11-28 18:06:43', '2025-11-28 18:06:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2005', 'local', '1', '2', '0', '2025-11-28 18:07:43', '2025-11-28 18:07:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2006', 'local', '1', '2', '0', '2025-11-28 18:08:43', '2025-11-28 18:08:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2007', 'local', '1', '2', '0', '2025-11-28 18:09:43', '2025-11-28 18:09:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2008', 'local', '1', '2', '0', '2025-11-28 18:10:43', '2025-11-28 18:10:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2009', 'local', '1', '2', '0', '2025-11-28 18:11:43', '2025-11-28 18:11:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2010', 'local', '1', '2', '0', '2025-11-28 18:12:43', '2025-11-28 18:12:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2011', 'local', '1', '2', '0', '2025-11-28 18:13:43', '2025-11-28 18:13:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2012', 'local', '1', '2', '0', '2025-11-28 18:14:43', '2025-11-28 18:14:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2013', 'local', '1', '2', '0', '2025-11-28 18:15:43', '2025-11-28 18:15:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2014', 'local', '1', '2', '0', '2025-11-28 18:16:43', '2025-11-28 18:16:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2015', 'local', '1', '2', '0', '2025-11-28 18:17:43', '2025-11-28 18:17:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2016', 'local', '1', '1', '0', '2025-11-28 18:18:43', '2025-11-28 18:18:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2017', 'local', '1', '2', '0', '2025-11-28 18:19:43', '2025-11-28 18:19:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2018', 'local', '1', '2', '0', '2025-11-28 18:20:43', '2025-11-28 18:20:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2019', 'local', '1', '2', '0', '2025-11-28 18:21:43', '2025-11-28 18:21:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2020', 'local', '1', '2', '0', '2025-11-28 18:22:43', '2025-11-28 18:22:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2021', 'local', '1', '2', '0', '2025-11-28 18:23:43', '2025-11-28 18:23:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2022', 'local', '1', '2', '0', '2025-11-28 18:24:43', '2025-11-28 18:24:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2023', 'local', '1', '2', '0', '2025-11-28 18:25:43', '2025-11-28 18:25:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2024', 'local', '1', '2', '0', '2025-11-28 18:26:43', '2025-11-28 18:26:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2025', 'local', '1', '2', '0', '2025-11-28 18:27:43', '2025-11-28 18:27:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2026', 'local', '1', '2', '0', '2025-11-28 18:28:43', '2025-11-28 18:28:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2027', 'local', '1', '2', '0', '2025-11-28 18:29:43', '2025-11-28 18:29:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2028', 'local', '1', '2', '0', '2025-11-28 18:30:43', '2025-11-28 18:30:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2029', 'local', '1', '2', '0', '2025-11-28 18:31:43', '2025-11-28 18:31:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2030', 'local', '1', '2', '0', '2025-11-28 18:32:43', '2025-11-28 18:32:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2031', 'local', '1', '2', '0', '2025-11-28 18:33:43', '2025-11-28 18:33:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2032', 'local', '1', '1', '0', '2025-11-28 18:34:43', '2025-11-28 18:34:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2033', 'local', '1', '2', '0', '2025-11-28 18:35:43', '2025-11-28 18:35:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2034', 'local', '1', '2', '0', '2025-11-28 18:36:43', '2025-11-28 18:36:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2035', 'local', '1', '2', '0', '2025-11-28 18:37:43', '2025-11-28 18:37:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2036', 'local', '1', '2', '0', '2025-11-28 18:38:43', '2025-11-28 18:38:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2037', 'local', '1', '2', '0', '2025-11-28 18:39:43', '2025-11-28 18:39:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2038', 'local', '1', '2', '0', '2025-11-28 18:40:43', '2025-11-28 18:40:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2039', 'local', '1', '2', '0', '2025-11-28 18:41:43', '2025-11-28 18:41:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2040', 'local', '1', '2', '0', '2025-11-28 18:42:43', '2025-11-28 18:42:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2041', 'local', '1', '2', '0', '2025-11-28 18:43:43', '2025-11-28 18:43:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2042', 'local', '1', '2', '0', '2025-11-28 18:44:43', '2025-11-28 18:44:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2043', 'local', '1', '2', '0', '2025-11-28 18:45:43', '2025-11-28 18:45:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2044', 'local', '1', '2', '0', '2025-11-28 18:46:43', '2025-11-28 18:46:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2045', 'local', '1', '2', '0', '2025-11-28 18:47:43', '2025-11-28 18:47:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2046', 'local', '1', '2', '0', '2025-11-28 18:48:43', '2025-11-28 18:48:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2047', 'local', '1', '1', '0', '2025-11-28 18:49:43', '2025-11-28 18:49:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2048', 'local', '1', '2', '0', '2025-11-28 18:50:43', '2025-11-28 18:50:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2049', 'local', '1', '2', '0', '2025-11-28 18:51:43', '2025-11-28 18:51:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2050', 'local', '1', '2', '0', '2025-11-28 18:52:43', '2025-11-28 18:52:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2051', 'local', '1', '2', '0', '2025-11-28 18:53:43', '2025-11-28 18:53:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2052', 'local', '1', '2', '0', '2025-11-28 18:54:43', '2025-11-28 18:54:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2053', 'local', '1', '2', '0', '2025-11-28 18:55:43', '2025-11-28 18:55:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2054', 'local', '1', '2', '0', '2025-11-28 18:56:43', '2025-11-28 18:56:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2055', 'local', '1', '2', '0', '2025-11-28 18:57:43', '2025-11-28 18:57:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2056', 'local', '1', '2', '0', '2025-11-28 18:58:43', '2025-11-28 18:58:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2057', 'local', '1', '2', '0', '2025-11-28 18:59:43', '2025-11-28 18:59:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2058', 'local', '1', '2', '0', '2025-11-28 19:00:43', '2025-11-28 19:00:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2059', 'local', '1', '2', '0', '2025-11-28 19:01:43', '2025-11-28 19:01:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2060', 'local', '1', '2', '0', '2025-11-28 19:02:43', '2025-11-28 19:02:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2061', 'local', '1', '2', '0', '2025-11-28 19:03:43', '2025-11-28 19:03:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2062', 'local', '1', '2', '0', '2025-11-28 19:04:43', '2025-11-28 19:04:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2063', 'local', '1', '1', '0', '2025-11-28 19:05:43', '2025-11-28 19:05:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2064', 'local', '1', '2', '0', '2025-11-28 19:06:43', '2025-11-28 19:06:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2065', 'local', '1', '2', '0', '2025-11-28 19:07:43', '2025-11-28 19:07:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2066', 'local', '1', '2', '0', '2025-11-28 19:08:43', '2025-11-28 19:08:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2067', 'local', '1', '2', '0', '2025-11-28 19:09:43', '2025-11-28 19:09:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2068', 'local', '1', '2', '0', '2025-11-28 19:10:43', '2025-11-28 19:10:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2069', 'local', '1', '2', '0', '2025-11-28 19:11:43', '2025-11-28 19:11:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2070', 'local', '1', '2', '0', '2025-11-28 19:12:43', '2025-11-28 19:12:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2071', 'local', '1', '2', '0', '2025-11-28 19:13:43', '2025-11-28 19:13:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2072', 'local', '1', '2', '0', '2025-11-28 19:14:43', '2025-11-28 19:14:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2073', 'local', '1', '2', '0', '2025-11-28 19:15:43', '2025-11-28 19:15:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2074', 'local', '1', '2', '0', '2025-11-28 19:16:43', '2025-11-28 19:16:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2075', 'local', '1', '2', '0', '2025-11-28 19:17:43', '2025-11-28 19:17:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2076', 'local', '1', '2', '0', '2025-11-28 19:18:43', '2025-11-28 19:18:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2077', 'local', '1', '2', '0', '2025-11-28 19:19:43', '2025-11-28 19:19:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2078', 'local', '1', '2', '0', '2025-11-28 19:20:43', '2025-11-28 19:20:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2079', 'local', '1', '1', '0', '2025-11-28 19:21:43', '2025-11-28 19:21:43');
INSERT INTO `websockets_statistics_entries` VALUES ('2080', 'local', '1', '2', '0', '2025-11-28 19:22:44', '2025-11-28 19:22:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2081', 'local', '1', '2', '0', '2025-11-28 19:23:44', '2025-11-28 19:23:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2082', 'local', '1', '2', '0', '2025-11-28 19:24:44', '2025-11-28 19:24:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2083', 'local', '1', '2', '0', '2025-11-28 19:25:44', '2025-11-28 19:25:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2084', 'local', '1', '2', '0', '2025-11-28 19:26:44', '2025-11-28 19:26:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2085', 'local', '1', '2', '0', '2025-11-28 19:27:44', '2025-11-28 19:27:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2086', 'local', '1', '2', '0', '2025-11-28 19:28:44', '2025-11-28 19:28:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2087', 'local', '1', '2', '0', '2025-11-28 19:29:44', '2025-11-28 19:29:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2088', 'local', '1', '2', '0', '2025-11-28 19:30:44', '2025-11-28 19:30:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2089', 'local', '1', '2', '0', '2025-11-28 19:31:44', '2025-11-28 19:31:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2090', 'local', '1', '2', '0', '2025-11-28 19:32:44', '2025-11-28 19:32:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2091', 'local', '1', '2', '0', '2025-11-28 19:33:44', '2025-11-28 19:33:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2092', 'local', '1', '2', '0', '2025-11-28 19:34:44', '2025-11-28 19:34:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2093', 'local', '1', '2', '0', '2025-11-28 19:35:44', '2025-11-28 19:35:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2094', 'local', '1', '2', '0', '2025-11-28 19:36:44', '2025-11-28 19:36:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2095', 'local', '1', '1', '0', '2025-11-28 19:37:44', '2025-11-28 19:37:44');
INSERT INTO `websockets_statistics_entries` VALUES ('2096', 'local', '1', '2', '0', '2025-11-28 19:38:44', '2025-11-28 19:38:44');
