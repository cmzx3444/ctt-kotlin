/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : petfood2

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 30/11/2020 20:26:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `receiver` varchar(16) NOT NULL COMMENT '收货人',
  `mobile` varchar(16) NOT NULL COMMENT '联系电话',
  `postal_code` varchar(8) NOT NULL DEFAULT '' COMMENT '邮编',
  `province` varchar(8) NOT NULL COMMENT '收货地址-省份',
  `city` varchar(8) NOT NULL COMMENT '收货地址-城市',
  `area` varchar(8) NOT NULL COMMENT '收货地址-县市',
  `detail` varchar(128) NOT NULL COMMENT '收货地址-详细地址',
  `is_default` tinyint NOT NULL COMMENT '是否默认地址 0 否，1 是',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户收货地址表';

-- ----------------------------
-- Records of t_address
-- ----------------------------
BEGIN;
INSERT INTO `t_address` VALUES (1, 1, '1', '020-81167888', '', '广东省', '广州市', '海珠区', '新港中路397号', 0, 0, '2020-11-09 20:02:15', '2020-11-18 14:17:16');
INSERT INTO `t_address` VALUES (7, 1, '张三', '020-81167888', '', '广东省', '广州市', '海珠区', '新港中路397号', 0, 0, '2020-11-18 14:19:20', '2020-11-18 14:19:20');
INSERT INTO `t_address` VALUES (8, 1, '张三', '020-81167888', '', '广东省', '广州市', '海珠区', '新港中路397号', 0, 0, '2020-11-18 14:57:12', '2020-11-18 14:57:12');
INSERT INTO `t_address` VALUES (9, 1, '张三', '13867458172', '311100', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', 0, 0, '2020-11-18 14:58:24', '2020-11-19 12:43:13');
INSERT INTO `t_address` VALUES (10, 1, '叶方林', '13867458172', '311100', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', 1, 0, '2020-11-19 12:43:33', '2020-11-19 15:53:59');
INSERT INTO `t_address` VALUES (11, 2, '张三', '020-81167888', '510000', '广东省', '广州市', '海珠区', '新港中路397号', 0, 0, '2020-11-21 20:02:39', '2020-11-21 20:02:39');
INSERT INTO `t_address` VALUES (12, 2, '张三', '020-81167888', '510000', '广东省', '广州市', '海珠区', '新港中路397号', 0, 0, '2020-11-21 20:02:42', '2020-11-21 20:02:42');
INSERT INTO `t_address` VALUES (13, 2, '张三', '020-81167888', '510000', '广东省', '广州市', '海珠区', '新港中路397号', 1, 0, '2020-11-21 20:02:58', '2020-11-21 20:02:58');
INSERT INTO `t_address` VALUES (14, 3, '接收者一号', '18667130809', '', '浙江', '台州', 'd玉环', '干江镇', 1, 0, '2020-11-29 20:20:41', '2020-11-29 20:20:41');
COMMIT;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，md5 32位字符串',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `status` tinyint NOT NULL COMMENT '??',
  `last_login` datetime NOT NULL COMMENT '最近登陆时间',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '18667130809', 1, '2020-11-29 21:08:46', 0, '2020-11-29 21:04:47', '2020-11-29 21:08:46');
COMMIT;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` int NOT NULL,
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `name` varchar(16) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='县市';

-- ----------------------------
-- Records of t_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `cover_url` varchar(1024) NOT NULL COMMENT '封面url',
  `content` varchar(4096) NOT NULL COMMENT '品牌介绍',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌';

-- ----------------------------
-- Records of t_brand
-- ----------------------------
BEGIN;
INSERT INTO `t_brand` VALUES (3, 'ORIJEN/渴望', '', '', 0, '2020-08-11 22:55:56', '2020-08-11 22:55:56');
COMMIT;

-- ----------------------------
-- Table structure for t_city
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int NOT NULL,
  `province_id` int NOT NULL,
  `name` varchar(16) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='城市';

-- ----------------------------
-- Records of t_city
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_discount_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_discount_notice`;
CREATE TABLE `t_discount_notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `product_id` int NOT NULL COMMENT '产品Id',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='降价通知';

-- ----------------------------
-- Records of t_discount_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_express_log
-- ----------------------------
DROP TABLE IF EXISTS `t_express_log`;
CREATE TABLE `t_express_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `express_no` varchar(30) NOT NULL COMMENT '快递单号',
  `order_no` varchar(20) NOT NULL COMMENT '所属订单号',
  `delivery_id` int NOT NULL COMMENT '所属配送单id',
  `status` tinyint NOT NULL COMMENT '配送状态',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_delivery_id` (`delivery_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_express_no` (`express_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='快递变更记录';

-- ----------------------------
-- Records of t_express_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_follow_product
-- ----------------------------
DROP TABLE IF EXISTS `t_follow_product`;
CREATE TABLE `t_follow_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `product_id` int NOT NULL COMMENT '产品Id',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品收藏表';

-- ----------------------------
-- Records of t_follow_product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_follow_store
-- ----------------------------
DROP TABLE IF EXISTS `t_follow_store`;
CREATE TABLE `t_follow_store` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `store_id` int NOT NULL COMMENT '产品Id',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家的商家';

-- ----------------------------
-- Records of t_follow_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_notice_record
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_record`;
CREATE TABLE `t_notice_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `notice_id` int NOT NULL COMMENT '降价通知Id',
  `is_read` tinyint NOT NULL COMMENT '是否已读，0 已读，1 已读',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notice_id` (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='降价通知记录';

-- ----------------------------
-- Records of t_notice_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `type` tinyint NOT NULL COMMENT '订单类型 1: 单独购买，2：周期配送，3：试吃',
  `amount` int NOT NULL COMMENT '订单金额',
  `qty` tinyint NOT NULL COMMENT 'quantity 购买总数量',
  `status` tinyint NOT NULL COMMENT '订单状态, 具体值待完善',
  `delivery_count` tinyint NOT NULL COMMENT '配送计划 配送期数',
  `delivery_unit` tinyint NOT NULL COMMENT '配送计划 没隔几个月发一期',
  `delivery_qty` tinyint NOT NULL COMMENT '配送计划 每次发货数量',
  `recv_name` varchar(10) NOT NULL COMMENT '收货人',
  `recv_mobile` varchar(16) NOT NULL COMMENT '联系电话',
  `recv_province` varchar(8) NOT NULL COMMENT '收货地址-省份',
  `recv_city` varchar(8) NOT NULL COMMENT '收货地址-城市',
  `recv_area` varchar(8) NOT NULL COMMENT '收货地址-县市',
  `recv_detail` varchar(128) NOT NULL COMMENT '收货地址-详细地址',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '快递单号',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, 1, 'SO16050090669371045', 1, 100, 1, 1, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 19:51:07', '2020-11-10 19:51:07');
INSERT INTO `t_order` VALUES (2, 1, 'SO16050093881881085', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 19:56:28', '2020-11-10 19:56:28');
INSERT INTO `t_order` VALUES (3, 1, 'SO16050094071461004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 19:56:47', '2020-11-10 19:56:47');
INSERT INTO `t_order` VALUES (4, 1, 'SO16050103672451006', 1, 2, 2, 2, 0, 0, 2, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:12:47', '2020-11-10 20:12:47');
INSERT INTO `t_order` VALUES (5, 1, 'SO16050105545561004', 1, 2, 2, 2, 0, 0, 2, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:15:55', '2020-11-10 20:15:55');
INSERT INTO `t_order` VALUES (6, 1, 'SO16050110339391004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:23:54', '2020-11-10 20:23:54');
INSERT INTO `t_order` VALUES (7, 1, 'SO16050113552341010', 1, 2, 2, 2, 0, 0, 2, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:29:15', '2020-11-10 20:29:15');
INSERT INTO `t_order` VALUES (8, 1, 'SO16050129960511004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:56:36', '2020-11-10 20:56:36');
INSERT INTO `t_order` VALUES (9, 1, 'SO16050130638731004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 20:57:44', '2020-11-10 20:57:44');
INSERT INTO `t_order` VALUES (10, 1, 'SO16050136883641092', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 21:08:08', '2020-11-10 21:08:08');
INSERT INTO `t_order` VALUES (11, 1, 'SO16050144545831027', 1, 2, 2, 4, 0, 0, 2, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-10 21:20:55', '2020-11-10 21:20:55');
INSERT INTO `t_order` VALUES (12, 1, 'SO16056126097581004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-17 19:30:10', '2020-11-17 19:30:10');
INSERT INTO `t_order` VALUES (13, 1, 'SO16056177705781004', 1, 1, 1, 2, 0, 0, 1, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-17 20:56:11', '2020-11-17 20:56:11');
INSERT INTO `t_order` VALUES (14, 1, 'SO16056178635931018', 1, 2, 2, 2, 0, 0, 2, '1', '1', '1', '1', '1', '1', '', 0, '2020-11-17 20:57:44', '2020-11-17 20:57:44');
INSERT INTO `t_order` VALUES (15, 1, 'SO16056976706431058', 3, 6, 6, 4, 6, 1, 1, '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', 0, '2020-11-18 19:07:51', '2020-11-18 19:07:51');
INSERT INTO `t_order` VALUES (16, 1, 'SO16056983473281004', 1, 2, 2, 2, 6, 1, 2, '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', 0, '2020-11-18 19:19:07', '2020-11-18 19:19:07');
INSERT INTO `t_order` VALUES (17, 1, 'SO16057610274001094', 3, 3, 3, 4, 3, 1, 1, '张三', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', 0, '2020-11-19 12:43:47', '2020-11-19 12:43:47');
INSERT INTO `t_order` VALUES (18, 2, 'SO16059635727722013', 3, 3, 3, 2, 3, 1, 1, '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', 0, '2020-11-21 20:59:33', '2020-11-21 20:59:33');
INSERT INTO `t_order` VALUES (19, 2, 'SO16059635971382004', 3, 3, 3, 4, 3, 1, 1, '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', 0, '2020-11-21 20:59:57', '2020-11-21 20:59:57');
INSERT INTO `t_order` VALUES (20, 1, 'SO16064019414781070', 3, 6, 6, 3, 6, 1, 1, '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', 0, '2020-11-26 22:45:41', '2020-11-26 22:45:41');
INSERT INTO `t_order` VALUES (23, 3, 'SO16066526725603084', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:24:33', '2020-11-29 20:24:33');
INSERT INTO `t_order` VALUES (24, 3, 'SO16066528272803017', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:27:07', '2020-11-29 20:27:07');
INSERT INTO `t_order` VALUES (25, 3, 'SO16066542464443048', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:50:46', '2020-11-29 20:50:46');
INSERT INTO `t_order` VALUES (26, 3, 'SO16066544077283067', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:53:28', '2020-11-29 20:53:28');
INSERT INTO `t_order` VALUES (27, 3, 'SO16066545525763015', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:55:53', '2020-11-29 20:55:53');
INSERT INTO `t_order` VALUES (28, 3, 'SO16066545814013081', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:56:21', '2020-11-29 20:56:21');
INSERT INTO `t_order` VALUES (29, 3, 'SO16066547151943045', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 20:58:35', '2020-11-29 20:58:35');
INSERT INTO `t_order` VALUES (30, 3, 'SO16066547998713059', 3, 30, 30, 3, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-29 21:00:00', '2020-11-29 21:00:00');
INSERT INTO `t_order` VALUES (31, 3, 'SO16067281400893022', 3, 30, 30, 1, 3, 1, 10, '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', 0, '2020-11-30 17:22:20', '2020-11-30 17:22:20');
COMMIT;

-- ----------------------------
-- Table structure for t_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `t_order_delivery`;
CREATE TABLE `t_order_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '所属订单号',
  `status` tinyint NOT NULL COMMENT '配送状态??',
  `qty` int NOT NULL COMMENT '配送数量',
  `periods` tinyint NOT NULL COMMENT '第几个配送周期',
  `amount` int NOT NULL COMMENT '当前配送单金额',
  `product_id` int NOT NULL COMMENT '关联产品id',
  `product_name` varchar(128) NOT NULL COMMENT '关联产品sku名称',
  `sku_id` int NOT NULL COMMENT '关联sku id',
  `sku_spec` varchar(64) NOT NULL COMMENT '关联产品sku规格',
  `recv_name` varchar(10) NOT NULL COMMENT '收货人',
  `recv_mobile` varchar(16) NOT NULL COMMENT '联系电话',
  `recv_province` varchar(8) NOT NULL COMMENT '收货地址-省份',
  `recv_city` varchar(8) NOT NULL COMMENT '收货地址-城市',
  `recv_area` varchar(16) NOT NULL COMMENT '收货地址-县市',
  `recv_detail` varchar(128) NOT NULL COMMENT '收货地址-详细地址',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '快递单号',
  `delivery_date` date DEFAULT NULL COMMENT '计划配送时间',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_express_no` (`express_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配送单';

-- ----------------------------
-- Records of t_order_delivery
-- ----------------------------
BEGIN;
INSERT INTO `t_order_delivery` VALUES (1, 1, 'SO16056976706431058', 1, 1, 1, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2020-11-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (2, 1, 'SO16056976706431058', 1, 1, 2, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-01-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (3, 1, 'SO16056976706431058', 1, 1, 3, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-02-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (4, 1, 'SO16056976706431058', 1, 1, 4, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-03-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (5, 1, 'SO16056976706431058', 1, 1, 5, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-04-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (6, 1, 'SO16056976706431058', 1, 1, 6, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-05-20', 0, '2020-11-18 19:07:51', '2020-11-18 19:08:27');
INSERT INTO `t_order_delivery` VALUES (7, 1, 'SO16057610274001094', 1, 1, 1, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', '2020-11-21', 0, '2020-11-19 12:43:47', '2020-11-19 12:43:55');
INSERT INTO `t_order_delivery` VALUES (8, 1, 'SO16057610274001094', 1, 1, 2, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', '2021-01-21', 0, '2020-11-19 12:43:47', '2020-11-19 12:43:55');
INSERT INTO `t_order_delivery` VALUES (9, 1, 'SO16057610274001094', 1, 1, 3, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', '2021-02-21', 0, '2020-11-19 12:43:47', '2020-11-19 12:43:55');
INSERT INTO `t_order_delivery` VALUES (10, 2, 'SO16059635727722013', 1, 1, 1, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', NULL, 0, '2020-11-21 20:59:33', '2020-11-21 20:59:33');
INSERT INTO `t_order_delivery` VALUES (11, 2, 'SO16059635727722013', 1, 1, 2, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', NULL, 0, '2020-11-21 20:59:33', '2020-11-21 20:59:33');
INSERT INTO `t_order_delivery` VALUES (12, 2, 'SO16059635727722013', 1, 1, 3, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', NULL, 0, '2020-11-21 20:59:33', '2020-11-21 20:59:33');
INSERT INTO `t_order_delivery` VALUES (13, 2, 'SO16059635971382004', 1, 1, 1, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2020-11-23', 0, '2020-11-21 20:59:57', '2020-11-21 21:00:11');
INSERT INTO `t_order_delivery` VALUES (14, 2, 'SO16059635971382004', 1, 1, 2, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-01-23', 0, '2020-11-21 20:59:57', '2020-11-21 21:00:11');
INSERT INTO `t_order_delivery` VALUES (15, 2, 'SO16059635971382004', 1, 1, 3, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '', '2021-02-23', 0, '2020-11-21 20:59:57', '2020-11-21 21:00:11');
INSERT INTO `t_order_delivery` VALUES (16, 1, 'SO16064019414781070', 1, 1, 1, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (17, 1, 'SO16064019414781070', 1, 1, 2, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (18, 1, 'SO16064019414781070', 1, 1, 3, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (19, 1, 'SO16064019414781070', 1, 1, 4, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (20, 1, 'SO16064019414781070', 1, 1, 5, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (21, 1, 'SO16064019414781070', 1, 1, 6, 1, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '叶方林', '13867458172', '浙江省', '杭州市', '余杭区', '城东路大华·海派风范沁园7-1-704', '', NULL, 0, '2020-11-26 22:45:42', '2020-11-26 22:45:42');
INSERT INTO `t_order_delivery` VALUES (22, 3, 'SO16066526725603084', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:24:33', '2020-11-29 20:24:33');
INSERT INTO `t_order_delivery` VALUES (23, 3, 'SO16066526725603084', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:24:33', '2020-11-29 20:24:33');
INSERT INTO `t_order_delivery` VALUES (24, 3, 'SO16066526725603084', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:24:33', '2020-11-29 20:24:33');
INSERT INTO `t_order_delivery` VALUES (25, 3, 'SO16066528272803017', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:27:07', '2020-11-29 20:27:07');
INSERT INTO `t_order_delivery` VALUES (26, 3, 'SO16066528272803017', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:27:07', '2020-11-29 20:27:07');
INSERT INTO `t_order_delivery` VALUES (27, 3, 'SO16066528272803017', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:27:07', '2020-11-29 20:27:07');
INSERT INTO `t_order_delivery` VALUES (28, 3, 'SO16066542464443048', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:50:46', '2020-11-29 20:50:46');
INSERT INTO `t_order_delivery` VALUES (29, 3, 'SO16066542464443048', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:50:46', '2020-11-29 20:50:46');
INSERT INTO `t_order_delivery` VALUES (30, 3, 'SO16066542464443048', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', NULL, 0, '2020-11-29 20:50:46', '2020-11-29 20:50:46');
INSERT INTO `t_order_delivery` VALUES (31, 3, 'SO16066544077283067', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:53:28', '2020-11-29 20:53:28');
INSERT INTO `t_order_delivery` VALUES (32, 3, 'SO16066544077283067', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:53:28', '2020-11-29 20:53:28');
INSERT INTO `t_order_delivery` VALUES (33, 3, 'SO16066544077283067', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-09', 0, '2020-11-29 20:53:28', '2020-11-29 20:53:28');
INSERT INTO `t_order_delivery` VALUES (34, 3, 'SO16066545525763015', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:55:53', '2020-11-29 20:55:53');
INSERT INTO `t_order_delivery` VALUES (35, 3, 'SO16066545525763015', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:55:53', '2020-11-29 20:55:53');
INSERT INTO `t_order_delivery` VALUES (36, 3, 'SO16066545525763015', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-09', 0, '2020-11-29 20:55:53', '2020-11-29 20:55:53');
INSERT INTO `t_order_delivery` VALUES (37, 3, 'SO16066545814013081', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:56:21', '2020-11-29 20:56:21');
INSERT INTO `t_order_delivery` VALUES (38, 3, 'SO16066545814013081', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-01-09', 0, '2020-11-29 20:56:21', '2020-11-29 20:56:21');
INSERT INTO `t_order_delivery` VALUES (39, 3, 'SO16066545814013081', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-09', 0, '2020-11-29 20:56:21', '2020-11-29 20:56:21');
INSERT INTO `t_order_delivery` VALUES (40, 3, 'SO16066547151943045', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 20:58:35', '2020-11-29 20:58:35');
INSERT INTO `t_order_delivery` VALUES (41, 3, 'SO16066547151943045', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-09', 0, '2020-11-29 20:58:35', '2020-11-29 20:58:35');
INSERT INTO `t_order_delivery` VALUES (42, 3, 'SO16066547151943045', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-03-09', 0, '2020-11-29 20:58:35', '2020-11-29 20:58:35');
INSERT INTO `t_order_delivery` VALUES (43, 3, 'SO16066547998713059', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-09', 0, '2020-11-29 21:00:00', '2020-11-29 21:00:00');
INSERT INTO `t_order_delivery` VALUES (44, 3, 'SO16066547998713059', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-01-09', 0, '2020-11-29 21:00:00', '2020-11-29 21:00:00');
INSERT INTO `t_order_delivery` VALUES (45, 3, 'SO16066547998713059', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-09', 0, '2020-11-29 21:00:00', '2020-11-29 21:00:00');
INSERT INTO `t_order_delivery` VALUES (46, 3, 'SO16067281400893022', 1, 10, 1, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2020-12-10', 0, '2020-11-30 17:22:20', '2020-11-30 17:22:20');
INSERT INTO `t_order_delivery` VALUES (47, 3, 'SO16067281400893022', 1, 10, 2, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-01-10', 0, '2020-11-30 17:22:20', '2020-11-30 17:22:20');
INSERT INTO `t_order_delivery` VALUES (48, 3, 'SO16067281400893022', 1, 10, 3, 10, 42, 'Orijen渴望六鱼11.4', 1, '1斤装', '接收者一号', '18667130809', '浙江', '台州', 'd玉环', '干江镇', '', '2021-02-10', 0, '2020-11-30 17:22:20', '2020-11-30 17:22:20');
COMMIT;

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `product_id` int NOT NULL COMMENT '产品Id',
  `product_name` varchar(128) NOT NULL COMMENT '产品名称',
  `product_detail_url` varchar(64) NOT NULL DEFAULT '' COMMENT '产品图片url',
  `product_cover_url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '产品封面图片',
  `sku_id` int NOT NULL COMMENT '产品sku',
  `sku_spec` varchar(64) NOT NULL COMMENT '产品sku规格',
  `type` tinyint NOT NULL COMMENT '产品类型，1 普通商品，2 优惠券',
  `amount` int NOT NULL COMMENT '金额',
  `price` int NOT NULL COMMENT '单价',
  `qty` tinyint NOT NULL COMMENT '数量',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单条目表';

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
BEGIN;
INSERT INTO `t_order_item` VALUES (1, 1, 'SO16050090669371045', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 100, 100, 1, 0, '2020-11-10 19:51:07', '2020-11-10 19:51:07');
INSERT INTO `t_order_item` VALUES (2, 1, 'SO16050093881881085', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 1, 1, 1, 0, '2020-11-10 19:56:28', '2020-11-10 19:56:28');
INSERT INTO `t_order_item` VALUES (3, 1, 'SO16050094071461004', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 1, 1, 1, 0, '2020-11-10 19:56:47', '2020-11-10 19:56:47');
INSERT INTO `t_order_item` VALUES (4, 1, 'SO16050103672451006', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 2, 1, 2, 0, '2020-11-10 20:12:47', '2020-11-10 20:12:47');
INSERT INTO `t_order_item` VALUES (5, 1, 'SO16050105545561004', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 2, 1, 2, 0, '2020-11-10 20:15:55', '2020-11-10 20:15:55');
INSERT INTO `t_order_item` VALUES (6, 1, 'SO16050110339391004', 43, '六种鱼', '', '', 3, '1斤装', 1, 1, 1, 1, 0, '2020-11-10 20:23:54', '2020-11-10 20:23:54');
INSERT INTO `t_order_item` VALUES (7, 1, 'SO16050113552341010', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 2, 1, 2, 0, '2020-11-10 20:29:15', '2020-11-10 20:29:15');
INSERT INTO `t_order_item` VALUES (8, 1, 'SO16050129960511004', 43, '六种鱼', '', '', 3, '1斤装', 1, 1, 1, 1, 0, '2020-11-10 20:56:36', '2020-11-10 20:56:36');
INSERT INTO `t_order_item` VALUES (9, 1, 'SO16050130638731004', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 1, 1, 1, 0, '2020-11-10 20:57:44', '2020-11-10 20:57:44');
INSERT INTO `t_order_item` VALUES (10, 1, 'SO16050136883641092', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 1, 1, 1, 0, '2020-11-10 21:08:08', '2020-11-10 21:08:08');
INSERT INTO `t_order_item` VALUES (11, 1, 'SO16050144545831027', 43, '六种鱼', '', '', 3, '1斤装', 1, 2, 1, 2, 0, '2020-11-10 21:20:55', '2020-11-10 21:20:55');
INSERT INTO `t_order_item` VALUES (12, 1, 'SO16056126097581004', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 1, 1, 1, 0, '2020-11-17 19:30:10', '2020-11-17 19:30:10');
INSERT INTO `t_order_item` VALUES (13, 1, 'SO16056177705781004', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 1, 1, 1, 0, '2020-11-17 20:56:11', '2020-11-17 20:56:11');
INSERT INTO `t_order_item` VALUES (14, 1, 'SO16056178635931018', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 2, 1, 2, 0, '2020-11-17 20:57:44', '2020-11-17 20:57:44');
INSERT INTO `t_order_item` VALUES (15, 1, 'SO16056976706431058', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 6, 1, 6, 0, '2020-11-18 19:07:51', '2020-11-18 19:07:51');
INSERT INTO `t_order_item` VALUES (16, 1, 'SO16056983473281004', 42, 'Orijen渴望六鱼11.4', '', '', 2, '2斤装', 1, 2, 1, 2, 0, '2020-11-18 19:19:07', '2020-11-18 19:19:07');
INSERT INTO `t_order_item` VALUES (17, 1, 'SO16057610274001094', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 3, 1, 3, 0, '2020-11-19 12:43:47', '2020-11-19 12:43:47');
INSERT INTO `t_order_item` VALUES (18, 2, 'SO16059635727722013', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 3, 1, 3, 0, '2020-11-21 20:59:33', '2020-11-21 20:59:33');
INSERT INTO `t_order_item` VALUES (19, 2, 'SO16059635971382004', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 3, 1, 3, 0, '2020-11-21 20:59:57', '2020-11-21 20:59:57');
INSERT INTO `t_order_item` VALUES (20, 1, 'SO16064019414781070', 42, 'Orijen渴望六鱼11.4', '', '', 1, '1斤装', 1, 6, 1, 6, 0, '2020-11-26 22:45:41', '2020-11-26 22:45:41');
INSERT INTO `t_order_item` VALUES (21, 3, 'SO16066526725603084', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:24:33', '2020-11-29 20:24:33');
INSERT INTO `t_order_item` VALUES (22, 3, 'SO16066528272803017', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:27:07', '2020-11-29 20:27:07');
INSERT INTO `t_order_item` VALUES (23, 3, 'SO16066542464443048', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:50:46', '2020-11-29 20:50:46');
INSERT INTO `t_order_item` VALUES (24, 3, 'SO16066544077283067', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:53:28', '2020-11-29 20:53:28');
INSERT INTO `t_order_item` VALUES (25, 3, 'SO16066545525763015', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:55:53', '2020-11-29 20:55:53');
INSERT INTO `t_order_item` VALUES (26, 3, 'SO16066545814013081', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:56:21', '2020-11-29 20:56:21');
INSERT INTO `t_order_item` VALUES (27, 3, 'SO16066547151943045', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 20:58:35', '2020-11-29 20:58:35');
INSERT INTO `t_order_item` VALUES (28, 3, 'SO16066547998713059', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-29 21:00:00', '2020-11-29 21:00:00');
INSERT INTO `t_order_item` VALUES (29, 3, 'SO16067281400893022', 42, 'Orijen渴望六鱼11.4', 'c5cd9d74bc9f6a15.jpg', '005a1a558f46f96c.jpg', 1, '1斤装', 1, 30, 1, 30, 0, '2020-11-30 17:22:20', '2020-11-30 17:22:20');
COMMIT;

-- ----------------------------
-- Table structure for t_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_order_pay`;
CREATE TABLE `t_order_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '所属订单号',
  `pay_no` varchar(64) NOT NULL COMMENT '支付流水号',
  `amount` int NOT NULL COMMENT '实际收到金额',
  `wx_transaction_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信支付流水号',
  `type` tinyint NOT NULL COMMENT '1 购买，2 退货',
  `status` tinyint NOT NULL COMMENT '支付状态 0 未支付，1 支付成功，2支付失败',
  `channel` varchar(16) NOT NULL COMMENT '支付渠道 wechat alipay',
  `platform` varchar(16) NOT NULL COMMENT '客户端平台 android ios wechat alipay',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_pay_no` (`pay_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单支付记录';

-- ----------------------------
-- Records of t_order_pay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_order_refund`;
CREATE TABLE `t_order_refund` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '所属订单号',
  `delivery_id` int NOT NULL COMMENT '所属配送单id',
  `type` tinyint NOT NULL COMMENT '售后类型 1 退货，2 换货',
  `refund_no` varchar(20) NOT NULL COMMENT '退货单号',
  `status` tinyint NOT NULL COMMENT '退货状态???',
  `qty` int NOT NULL COMMENT '数量',
  `amount` int NOT NULL COMMENT '金额',
  `reason` varchar(256) NOT NULL COMMENT '退换货原因',
  `proof_pics` varchar(1024) NOT NULL DEFAULT '' COMMENT '凭证图片，以逗号隔开',
  `refund_amount` int NOT NULL COMMENT '退款金额',
  `refund_name` varchar(100) NOT NULL COMMENT '退货人姓名',
  `refund_mobile` varchar(16) NOT NULL COMMENT '退货人电话',
  `recv_name` varchar(10) NOT NULL COMMENT '收货人',
  `recv_mobile` varchar(16) NOT NULL COMMENT '收货人联系电话',
  `recv_province` varchar(8) NOT NULL COMMENT '收货地址-省份',
  `recv_city` varchar(8) NOT NULL COMMENT '收货地址-城市',
  `recv_area` varchar(16) NOT NULL COMMENT '收货地址-县市',
  `recv_detail` varchar(128) NOT NULL COMMENT '收货地址-详细地址',
  `product_id` int NOT NULL COMMENT '关联产品id',
  `product_name` varchar(128) NOT NULL COMMENT '关联产品名称',
  `sku_id` int NOT NULL COMMENT '关联sku id',
  `sku_spec` varchar(64) NOT NULL COMMENT '关联产品sku规格',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='售后单';

-- ----------------------------
-- Records of t_order_refund
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `t_order_refund_log`;
CREATE TABLE `t_order_refund_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户Id',
  `order_no` varchar(20) NOT NULL COMMENT '所属订单号',
  `delivery_id` int NOT NULL COMMENT '所属配送单id',
  `refund_no` varchar(20) NOT NULL COMMENT '所属售后单号',
  `status` tinyint NOT NULL COMMENT '状态',
  `handle_note` varchar(500) NOT NULL COMMENT '处理备注',
  `handle_man` varchar(20) NOT NULL COMMENT '处理人员',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_refund_no` (`refund_no`),
  KEY `idx_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='售后处理日志';

-- ----------------------------
-- Records of t_order_refund_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_pet
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `category_id` int NOT NULL COMMENT '分类Id',
  `age` tinyint NOT NULL COMMENT '年龄',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户的宠物';

-- ----------------------------
-- Records of t_pet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_pet_category
-- ----------------------------
DROP TABLE IF EXISTS `t_pet_category`;
CREATE TABLE `t_pet_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(16) NOT NULL COMMENT '宠物分类',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物分类';

-- ----------------------------
-- Records of t_pet_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `product_id` int NOT NULL COMMENT '产品Id',
  `title` varchar(1024) NOT NULL COMMENT '帖子标题',
  `likes` int NOT NULL COMMENT '点赞数量',
  `views` int NOT NULL COMMENT '阅读数量',
  `comments` int NOT NULL COMMENT '评论数量',
  `replies` int NOT NULL COMMENT '回复数量',
  `content` varchar(4096) NOT NULL COMMENT '内容',
  `cover_url` varchar(1024) NOT NULL COMMENT '封面URL',
  `detail_url` varchar(1024) NOT NULL COMMENT '内容图片URl',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子';

-- ----------------------------
-- Records of t_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_post_comment`;
CREATE TABLE `t_post_comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `post_id` int NOT NULL COMMENT '帖子Id',
  `content` varchar(4096) NOT NULL COMMENT '内容',
  `cover_url` varchar(1024) NOT NULL COMMENT '封面URL',
  `detail_url` varchar(1024) NOT NULL COMMENT '内容图片URl',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子回复';

-- ----------------------------
-- Records of t_post_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `brand_id` int NOT NULL COMMENT '品牌Id',
  `category_id` int NOT NULL COMMENT '分类Id',
  `name` varchar(128) NOT NULL COMMENT '产品名称',
  `stage` varchar(128) NOT NULL COMMENT '宠物可以使用的阶段',
  `origin` varchar(128) NOT NULL COMMENT '产地，来源',
  `likes` int NOT NULL COMMENT '收藏数',
  `views` int NOT NULL COMMENT '浏览量',
  `comments` int NOT NULL COMMENT '评论数',
  `content` varchar(4096) NOT NULL COMMENT '产品描述',
  `cover_url` varchar(1024) NOT NULL COMMENT '封面图片url',
  `detail_url` varchar(1024) NOT NULL COMMENT '详情页面图片url',
  `status` tinyint NOT NULL COMMENT '0 未上架，1 上架中',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品表';

-- ----------------------------
-- Records of t_product
-- ----------------------------
BEGIN;
INSERT INTO `t_product` VALUES (42, 3, 7, 'Orijen渴望六鱼11.4', '幼犬', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'c5cd9d74bc9f6a15.jpg', 1, 0, '2020-08-11 23:02:51', '2020-08-12 10:20:02');
INSERT INTO `t_product` VALUES (43, 3, 7, '六种鱼', '全犬期', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'O1CN01wePgw129ICSxnEkmz_!!2274378044.png_50x50.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:51', '2020-08-12 10:20:36');
INSERT INTO `t_product` VALUES (44, 3, 7, '渴望狗粮', '全犬期', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'O1CN015umxGB20F9N3jaKEB_!!398586819.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:51', '2020-08-12 10:20:37');
INSERT INTO `t_product` VALUES (45, 3, 7, 'Orijen渴望鱼6kg', '离乳期', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'dcdcbfd0bb9e7c0d.jpg', 1, 0, '2020-08-11 23:02:52', '2020-08-12 10:20:04');
INSERT INTO `t_product` VALUES (46, 3, 7, '原始猎食渴望', '全犬期', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'O1CNA1JPwqQe100ca557f9ff0b153775000a_!!139458108-0-picassodesign.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:52', '2020-08-12 10:20:46');
INSERT INTO `t_product` VALUES (47, 3, 7, 'Orijen原味犬2', '幼犬', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', '6496e1aaf4c560bf.jpg', 1, 0, '2020-08-11 23:02:53', '2020-08-12 10:20:07');
INSERT INTO `t_product` VALUES (48, 3, 7, '狗粮', '幼犬', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', 'O1CNA1x4Jj7T100ca557df940b153775000i_!!139458108-0-picassodesign.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:53', '2020-08-12 10:20:30');
INSERT INTO `t_product` VALUES (49, 3, 7, 'Orijen渴望六鱼', '离乳期', '加拿大', 0, 0, 0, '', '005a1a558f46f96c.jpg', '49c043c00f7d580c.jpg', 1, 0, '2020-08-11 23:02:53', '2020-08-12 10:20:08');
INSERT INTO `t_product` VALUES (50, 3, 8, '渴望', '全犬期', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'O1CN011WUWi01dfUzcXL7xx_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:54', '2020-08-12 10:20:46');
INSERT INTO `t_product` VALUES (51, 3, 7, 'Orijen加拿大进口原味犬粮成犬幼犬1KG鸡肉', '', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', '7aa161f93b861577.jpg', 1, 0, '2020-08-11 23:02:55', '2020-08-12 10:20:11');
INSERT INTO `t_product` VALUES (52, 3, 7, 'Orijen加拿大进口六种鱼犬粮1KG 成犬幼犬', '', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', '85abc6e543d7485d.jpg', 1, 0, '2020-08-11 23:02:55', '2020-08-12 10:20:11');
INSERT INTO `t_product` VALUES (53, 3, 7, '渴望狗粮Orijen加拿大进口无谷成犬泰迪柯基犬粮 原味犬2kg', '全阶段', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'f5abae912d42f5b9.jpg', 1, 0, '2020-08-11 23:02:55', '2020-08-12 10:20:39');
INSERT INTO `t_product` VALUES (54, 3, 8, '全犬期鸡肉犬粮犬粮 1000g', '全犬期', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'TB25h7UDb1YBuNjSszeXXablFXa_!!6000000002873-0-tbvideo.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:56', '2020-08-12 10:20:40');
INSERT INTO `t_product` VALUES (55, 3, 7, '渴望狗粮Orijen加拿大进口无谷成犬泰迪柯基犬粮 原味犬1kg', '全阶段', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'e3ff63e6c1163758.png', 1, 0, '2020-08-11 23:02:56', '2020-08-12 10:20:13');
INSERT INTO `t_product` VALUES (56, 3, 7, 'Orijen渴望老犬2kg', '', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'f7164ad995f5eb54.jpg', 1, 0, '2020-08-11 23:02:56', '2020-08-12 10:20:14');
INSERT INTO `t_product` VALUES (57, 3, 8, '老年犬鸡肉配方粮犬粮 2000g', '老年犬', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'O1CN01D4LNyx1vWwgG6aacS_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:57', '2020-08-12 10:20:18');
INSERT INTO `t_product` VALUES (58, 3, 7, '渴望狗粮Orijen加拿大进口无谷成犬泰迪柯基犬粮 原味犬6kg', '全阶段', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', '27d205654853f824.jpg', 1, 0, '2020-08-11 23:02:57', '2020-08-12 10:20:15');
INSERT INTO `t_product` VALUES (59, 3, 8, '原味犬粮', '全犬期', '加拿大', 0, 0, 0, '', '004a006e69197aa7.jpg', 'O1CN01xgBHde258LXpgH5Cz_!!33777481.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:57', '2020-08-12 10:20:38');
INSERT INTO `t_product` VALUES (60, 3, 7, 'Orijen渴望老犬11.4kg', '', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', '91b2526363e65d17.jpg', 1, 0, '2020-08-11 23:02:58', '2020-08-12 10:20:16');
INSERT INTO `t_product` VALUES (61, 3, 8, '无谷类高龄犬粮', '老年犬', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', 'O1CN01gYq7031aikxrZGju1_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:02:58', '2020-08-12 10:20:17');
INSERT INTO `t_product` VALUES (62, 3, 7, 'Orijen渴望老犬6kg', '', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', '821d3e82b61fa156.jpg', 1, 0, '2020-08-11 23:02:59', '2020-08-12 10:20:18');
INSERT INTO `t_product` VALUES (63, 3, 7, '渴望狗粮Orijen加拿大进口无谷幼犬成犬犬粮 六种鱼11.4kg', '全阶段', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', '161ab7da0a947b6e.png', 1, 0, '2020-08-11 23:02:59', '2020-08-12 10:20:19');
INSERT INTO `t_product` VALUES (64, 3, 7, '渴望狗粮Orijen加拿大进口无谷幼犬成犬犬粮 六种鱼2kg', '全阶段', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', 'a322e6b2d3f294e1.png', 1, 0, '2020-08-11 23:03:06', '2020-08-12 10:20:22');
INSERT INTO `t_product` VALUES (65, 3, 7, '渴望狗粮Orijen加拿大进口无谷幼犬成犬犬粮 六种鱼1kg', '全阶段', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', 'c0017a4b839be9de.png', 1, 0, '2020-08-11 23:03:07', '2020-08-12 10:20:24');
INSERT INTO `t_product` VALUES (66, 3, 7, '渴望Orign狗粮成犬幼犬通用型六种鱼无谷天然粮原始猎食加拿大原装进口 六种鱼 6kg', '', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', 'ad66749cb33ba775.png', 1, 0, '2020-08-11 23:03:08', '2020-08-12 10:20:25');
INSERT INTO `t_product` VALUES (67, 3, 7, '渴望Orign狗粮成犬幼犬通用型六种鱼无谷天然粮原始猎食加拿大原装进口 六种鱼 1kg', '全阶段', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', 'b563cf1d29440918.jpg', 1, 0, '2020-08-11 23:03:10', '2020-08-12 10:20:28');
INSERT INTO `t_product` VALUES (68, 3, 7, '渴望Orign鸡肉味狗粮成犬幼犬通用型天然无谷粮原始猎食加拿大原装进口 鸡肉味 1kg', '', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', '614b04a1b2331c4b.jpg', 1, 0, '2020-08-11 23:03:10', '2020-08-12 10:20:28');
INSERT INTO `t_product` VALUES (69, 3, 7, '渴望Orign鸡肉味狗粮成犬幼犬通用型天然无谷粮原始猎食加拿大原装进口 鸡肉味 6kg', '', '加拿大', 0, 0, 0, '', '004a7668fa47c65e.jpg', '5646de619f3a089e.png', 1, 0, '2020-08-11 23:03:11', '2020-08-12 10:20:29');
INSERT INTO `t_product` VALUES (70, 3, 7, '渴望Orign鸡肉味狗粮成犬幼犬通用型天然无谷粮原始猎食加拿大原装进口 鸡肉味 2kg', '', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', '0e0cb36870c2c5c3.png', 1, 0, '2020-08-11 23:03:11', '2020-08-12 10:20:30');
INSERT INTO `t_product` VALUES (71, 3, 7, '渴望Orign狗粮成犬幼犬通用型六种鱼无谷天然粮原始猎食加拿大原装进口 六种鱼 2kg', '', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'd9b6ad44b1abbe75.png', 1, 0, '2020-08-11 23:03:12', '2020-08-12 10:20:31');
INSERT INTO `t_product` VALUES (72, 3, 7, '渴望Orign狗粮成犬幼犬通用型六种鱼无谷天然粮原始猎食加拿大原装进口 六种鱼 11.4kg', '', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'ef22e8b54862986e.png', 1, 0, '2020-08-11 23:03:14', '2020-08-12 10:20:34');
INSERT INTO `t_product` VALUES (73, 3, 7, 'Orijen加拿大进口爱猫猫粮鸡肉1kg成猫幼猫', '', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'f05cadca0a6dde4a.jpg', 1, 0, '2020-08-11 23:03:21', '2020-08-12 10:20:42');
INSERT INTO `t_product` VALUES (74, 3, 7, '渴望猫粮Orijen加拿大进口无谷幼猫成猫猫粮 六种鱼1kg', '全阶段', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'f7f52ae4642f301d.jpg', 1, 0, '2020-08-11 23:03:21', '2020-08-12 10:20:47');
INSERT INTO `t_product` VALUES (75, 3, 7, '渴望Orign六种鱼猫粮加拿大原装进口成猫幼猫全猫龄原始猎食通用型 六种鱼 1kg', '', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'bcf778ad0428aa97.jpg', 1, 0, '2020-08-11 23:03:21', '2020-08-12 10:20:43');
INSERT INTO `t_product` VALUES (76, 3, 7, '鸡肉成犬', '全犬期', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'O1CN01nNiAok1vWwgAT0DT1_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:03:22', '2020-08-12 10:20:44');
INSERT INTO `t_product` VALUES (77, 3, 8, '原味全犬11.4公斤', '全犬期', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'O1CN01PlEKK01aikxn7ZHXY_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:03:22', '2020-08-12 10:20:44');
INSERT INTO `t_product` VALUES (78, 3, 7, '渴汪', '全犬期', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'O1CN01m0WUrW1T5dmfsQFEZ_!!1657852331.jpg_400x400.jpg', 1, 0, '2020-08-11 23:03:23', '2020-08-12 10:20:45');
INSERT INTO `t_product` VALUES (79, 3, 7, '鸡肉狗粮', '全犬期', '加拿大', 0, 0, 0, '', '003d6718ea0ae264.jpg', 'O1CN01lN9BtB1vWwgG6cs1A_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:03:23', '2020-08-12 10:20:45');
INSERT INTO `t_product` VALUES (80, 3, 7, '渴望成犬11.4kg', '成犬', '加拿大', 0, 0, 0, '', '001a2061ca41e2d3.jpg', 'O1CN01KU8OoE1okV5pWNlRg_!!0-item_pic.jpg_400x400.jpg', 1, 0, '2020-08-11 23:03:25', '2020-08-12 10:20:47');
INSERT INTO `t_product` VALUES (81, 3, 7, '加拿大原装进口（Orijen）六种鱼猫粮深海鱼天然猫粮鸡肉味幼猫成猫通用粮 鸡肉味 1kg', '全阶段', '加拿大', 0, 0, 0, '', '001a2061ca41e2d3.jpg', '329ddbd1cd5d073a.jpg', 1, 0, '2020-08-11 23:03:26', '2020-08-12 10:20:48');
INSERT INTO `t_product` VALUES (82, 3, 7, '加拿大原装进口（Orijen）六种鱼猫粮深海鱼天然猫粮鸡肉味幼猫成猫通用粮 六种鱼1kg', '全阶段', '加拿大', 0, 0, 0, '', '001a2061ca41e2d3.jpg', 'f9ec0c4c3598ef8c.jpg', 1, 0, '2020-08-11 23:03:26', '2020-08-12 10:20:48');
COMMIT;

-- ----------------------------
-- Table structure for t_product_category
-- ----------------------------
DROP TABLE IF EXISTS `t_product_category`;
CREATE TABLE `t_product_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(128) NOT NULL COMMENT '分类名称',
  `cover_url` varchar(1024) NOT NULL COMMENT '封面图片url',
  `lft` int NOT NULL,
  `rght` int NOT NULL,
  `tree_id` int NOT NULL,
  `level` int NOT NULL COMMENT '分类层级',
  `parent_id` int NOT NULL COMMENT '分类Id',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品分类表';

-- ----------------------------
-- Records of t_product_category
-- ----------------------------
BEGIN;
INSERT INTO `t_product_category` VALUES (6, '狗类', '004a7668fa47c65e.jpg', 1, 6, 1, 0, 0, 0, '2020-08-11 22:55:56', '2020-08-11 22:55:56');
INSERT INTO `t_product_category` VALUES (7, '干粮', '005a1a558f46f96c.jpg', 2, 3, 1, 1, 6, 0, '2020-08-11 22:56:41', '2020-08-11 22:56:41');
INSERT INTO `t_product_category` VALUES (8, '粮', '004da95337e4602d.jpg', 4, 5, 1, 1, 6, 0, '2020-08-11 22:56:42', '2020-08-11 22:56:42');
INSERT INTO `t_product_category` VALUES (9, '猫类', '004fdf15ef17e01a.jpg', 1, 2, 2, 0, 0, 0, '2020-08-11 22:56:56', '2020-08-11 22:56:56');
COMMIT;

-- ----------------------------
-- Table structure for t_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_product_comment`;
CREATE TABLE `t_product_comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int NOT NULL COMMENT '用户Id',
  `product_id` int NOT NULL COMMENT '产品Id',
  `content` varchar(4096) NOT NULL COMMENT '内容',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品回复';

-- ----------------------------
-- Records of t_product_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sku`;
CREATE TABLE `t_product_sku` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `product_id` int NOT NULL DEFAULT '0' COMMENT '产品id',
  `name` varchar(128) NOT NULL COMMENT '产品名称',
  `spec` varchar(64) NOT NULL COMMENT '产品sku规格',
  `sale_flag` int NOT NULL COMMENT '试吃，单独购买，周期配送标志位，第一位：试吃，第二位：单独购买，第三位：周期配送',
  `inventory` int NOT NULL COMMENT '库存',
  `price_taste` int NOT NULL COMMENT '价格 试吃',
  `price_single` int NOT NULL COMMENT '价格 单独购买',
  `price_period` int NOT NULL COMMENT '价格 周期配送',
  `status` tinyint NOT NULL COMMENT '0 未上架，1 上架中',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品SKU表';

-- ----------------------------
-- Records of t_product_sku
-- ----------------------------
BEGIN;
INSERT INTO `t_product_sku` VALUES (1, 42, 'sku1', '1斤装', 111, 1000, 1, 1, 1, 1, 0, '2020-11-09 19:09:29', '2020-11-09 19:09:31');
INSERT INTO `t_product_sku` VALUES (2, 42, 'sku2', '2斤装', 111, 1000, 1, 1, 1, 1, 0, '2020-11-09 19:09:29', '2020-11-09 19:09:31');
INSERT INTO `t_product_sku` VALUES (3, 43, 'sku1', '1斤装', 111, 1000, 1, 1, 1, 1, 0, '2020-11-09 19:09:29', '2020-11-09 19:09:31');
INSERT INTO `t_product_sku` VALUES (4, 44, 'sku1', '1斤装', 111, 1000, 1, 1, 1, 1, 0, '2020-11-09 19:09:29', '2020-11-09 19:09:31');
COMMIT;

-- ----------------------------
-- Table structure for t_province
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `id` int NOT NULL,
  `name` varchar(8) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='省份';

-- ----------------------------
-- Records of t_province
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_store
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(128) NOT NULL COMMENT '商家名称',
  `type` tinyint NOT NULL COMMENT '0 淘宝，1 京东',
  `link` varchar(1024) NOT NULL COMMENT '商家链接',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家';

-- ----------------------------
-- Records of t_store
-- ----------------------------
BEGIN;
INSERT INTO `t_store` VALUES (35, 'Orijen京东自营官方旗舰店', 1, 'https://item.jd.com/8523979.html', 0, '2020-08-11 22:56:41', '2020-08-11 22:56:41');
INSERT INTO `t_store` VALUES (36, '然然加拿大代购', 0, 'https://item.taobao.com/item.htm?id=540239769299&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:41', '2020-08-11 22:56:41');
INSERT INTO `t_store` VALUES (37, '优品铺宠物商店', 0, 'https://item.taobao.com/item.htm?id=583596698180&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:41', '2020-08-11 22:56:41');
INSERT INTO `t_store` VALUES (38, 'YOYO宠物小馆YOYO宠物', 0, 'https://item.taobao.com/item.htm?id=1446983338&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:42', '2020-08-11 22:56:42');
INSERT INTO `t_store` VALUES (39, '白猪商店 BAICHEW STO', 0, 'https://item.taobao.com/item.htm?id=538456631889&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:42', '2020-08-11 22:56:42');
INSERT INTO `t_store` VALUES (40, 'MOMOの纸糖屋宠物用品', 0, 'https://item.taobao.com/item.htm?id=568617596606&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:44', '2020-08-11 22:56:44');
INSERT INTO `t_store` VALUES (41, '鸿通达宠物生活旗舰店', 1, 'https://item.jd.com/40241228787.html', 0, '2020-08-11 22:56:45', '2020-08-11 22:56:45');
INSERT INTO `t_store` VALUES (42, '沫家宠物商店', 0, 'https://item.taobao.com/item.htm?id=607403378158&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:45', '2020-08-11 22:56:45');
INSERT INTO `t_store` VALUES (43, '大胖商店', 0, 'https://item.taobao.com/item.htm?id=610283636388&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:46', '2020-08-11 22:56:46');
INSERT INTO `t_store` VALUES (44, '贱狗铺子', 0, 'https://item.taobao.com/item.htm?id=574463395158&ns=1&abbucket=13#detail', 0, '2020-08-11 22:56:46', '2020-08-11 22:56:46');
INSERT INTO `t_store` VALUES (45, '日月草宠物用品专营店', 1, 'https://item.jd.com/67999377964.html', 0, '2020-08-11 22:56:50', '2020-08-11 22:56:50');
INSERT INTO `t_store` VALUES (46, '爱犀宠物生活旗舰店', 1, 'https://item.jd.com/54056535577.html', 0, '2020-08-11 22:56:55', '2020-08-11 22:56:55');
INSERT INTO `t_store` VALUES (47, '小熊维尼宠物店', 0, 'https://item.taobao.com/item.htm?id=520416966707&ns=1&abbucket=13#detail', 0, '2020-08-11 23:03:23', '2020-08-11 23:03:23');
INSERT INTO `t_store` VALUES (48, '小猪宠物精品馆', 0, 'https://item.taobao.com/item.htm?id=43548246367&ns=1&abbucket=13#detail', 0, '2020-08-11 23:03:24', '2020-08-11 23:03:24');
INSERT INTO `t_store` VALUES (49, '我是一只小法斗', 0, 'https://item.taobao.com/item.htm?id=597907939856&ns=1&abbucket=13#detail', 0, '2020-08-11 23:03:25', '2020-08-11 23:03:25');
INSERT INTO `t_store` VALUES (50, '麒麟宠物官方旗舰店', 1, 'https://item.jd.com/35236707262.html', 0, '2020-08-11 23:03:25', '2020-08-11 23:03:25');
INSERT INTO `t_store` VALUES (51, '疯狂的小狗旗舰店', 1, 'https://item.jd.com/67100430990.html', 0, '2020-08-11 23:03:26', '2020-08-11 23:03:26');
COMMIT;

-- ----------------------------
-- Table structure for t_store_price
-- ----------------------------
DROP TABLE IF EXISTS `t_store_price`;
CREATE TABLE `t_store_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `record_date` date DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_store_price
-- ----------------------------
BEGIN;
INSERT INTO `t_store_price` VALUES (1, 290.00, NULL, NULL, NULL, 50, 40);
INSERT INTO `t_store_price` VALUES (2, 1125.00, NULL, NULL, NULL, 73, 35);
INSERT INTO `t_store_price` VALUES (3, 1125.00, NULL, NULL, NULL, 42, 35);
INSERT INTO `t_store_price` VALUES (4, 1125.00, NULL, NULL, NULL, 45, 35);
INSERT INTO `t_store_price` VALUES (5, 1125.00, NULL, NULL, NULL, 47, 35);
INSERT INTO `t_store_price` VALUES (6, 1125.00, NULL, NULL, NULL, 49, 35);
INSERT INTO `t_store_price` VALUES (7, 1125.00, NULL, NULL, NULL, 51, 35);
INSERT INTO `t_store_price` VALUES (8, 1125.00, NULL, NULL, NULL, 52, 35);
INSERT INTO `t_store_price` VALUES (9, 1125.00, NULL, NULL, NULL, 56, 35);
INSERT INTO `t_store_price` VALUES (10, 1125.00, NULL, NULL, NULL, 60, 35);
INSERT INTO `t_store_price` VALUES (11, 1125.00, NULL, NULL, NULL, 62, 35);
INSERT INTO `t_store_price` VALUES (12, 1125.00, NULL, NULL, NULL, 43, 36);
INSERT INTO `t_store_price` VALUES (13, 249.00, NULL, NULL, NULL, 74, 41);
INSERT INTO `t_store_price` VALUES (14, 705.00, NULL, NULL, NULL, 75, 45);
INSERT INTO `t_store_price` VALUES (15, 240.00, NULL, NULL, NULL, 76, 43);
INSERT INTO `t_store_price` VALUES (16, 975.00, NULL, NULL, NULL, 78, 47);
INSERT INTO `t_store_price` VALUES (17, 240.00, NULL, NULL, NULL, 79, 43);
INSERT INTO `t_store_price` VALUES (18, 975.00, NULL, NULL, NULL, 50, 48);
INSERT INTO `t_store_price` VALUES (19, 240.00, NULL, NULL, NULL, 46, 43);
INSERT INTO `t_store_price` VALUES (20, 975.00, NULL, NULL, NULL, 80, 49);
INSERT INTO `t_store_price` VALUES (21, 185.00, NULL, NULL, NULL, 74, 50);
INSERT INTO `t_store_price` VALUES (22, 163.00, NULL, NULL, NULL, 81, 51);
INSERT INTO `t_store_price` VALUES (23, 163.00, NULL, NULL, NULL, 82, 51);
INSERT INTO `t_store_price` VALUES (24, 1125.00, NULL, NULL, NULL, 44, 37);
INSERT INTO `t_store_price` VALUES (25, 675.00, NULL, NULL, NULL, 43, 38);
INSERT INTO `t_store_price` VALUES (26, 675.00, NULL, NULL, NULL, 46, 39);
INSERT INTO `t_store_price` VALUES (27, 675.00, NULL, NULL, NULL, 48, 39);
INSERT INTO `t_store_price` VALUES (28, 249.00, NULL, NULL, NULL, 53, 41);
INSERT INTO `t_store_price` VALUES (29, 240.00, NULL, NULL, NULL, 54, 42);
INSERT INTO `t_store_price` VALUES (30, 249.00, NULL, NULL, NULL, 55, 41);
INSERT INTO `t_store_price` VALUES (31, 240.00, NULL, NULL, NULL, 57, 43);
INSERT INTO `t_store_price` VALUES (32, 249.00, NULL, NULL, NULL, 58, 41);
INSERT INTO `t_store_price` VALUES (33, 600.00, NULL, NULL, NULL, 59, 44);
INSERT INTO `t_store_price` VALUES (34, 675.00, NULL, NULL, NULL, 61, 38);
INSERT INTO `t_store_price` VALUES (35, 249.00, NULL, NULL, NULL, 63, 41);
INSERT INTO `t_store_price` VALUES (36, 249.00, NULL, NULL, NULL, 64, 41);
INSERT INTO `t_store_price` VALUES (37, 249.00, NULL, NULL, NULL, 65, 41);
INSERT INTO `t_store_price` VALUES (38, 705.00, NULL, NULL, NULL, 66, 45);
INSERT INTO `t_store_price` VALUES (39, 705.00, NULL, NULL, NULL, 67, 45);
INSERT INTO `t_store_price` VALUES (40, 705.00, NULL, NULL, NULL, 68, 45);
INSERT INTO `t_store_price` VALUES (41, 705.00, NULL, NULL, NULL, 69, 45);
INSERT INTO `t_store_price` VALUES (42, 705.00, NULL, NULL, NULL, 70, 45);
INSERT INTO `t_store_price` VALUES (43, 705.00, NULL, NULL, NULL, 71, 45);
INSERT INTO `t_store_price` VALUES (44, 705.00, NULL, NULL, NULL, 72, 45);
INSERT INTO `t_store_price` VALUES (45, 675.00, NULL, NULL, NULL, 77, 38);
INSERT INTO `t_store_price` VALUES (46, 675.00, NULL, NULL, NULL, 43, 38);
INSERT INTO `t_store_price` VALUES (47, 675.00, NULL, NULL, NULL, 61, 38);
COMMIT;

-- ----------------------------
-- Table structure for t_store_product
-- ----------------------------
DROP TABLE IF EXISTS `t_store_product`;
CREATE TABLE `t_store_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_store_product
-- ----------------------------
BEGIN;
INSERT INTO `t_store_product` VALUES (1, 50, 40);
INSERT INTO `t_store_product` VALUES (2, 73, 35);
INSERT INTO `t_store_product` VALUES (3, 74, 41);
INSERT INTO `t_store_product` VALUES (4, 75, 45);
INSERT INTO `t_store_product` VALUES (5, 76, 43);
INSERT INTO `t_store_product` VALUES (6, 77, 38);
INSERT INTO `t_store_product` VALUES (7, 78, 47);
INSERT INTO `t_store_product` VALUES (8, 79, 43);
INSERT INTO `t_store_product` VALUES (9, 50, 48);
INSERT INTO `t_store_product` VALUES (10, 46, 43);
INSERT INTO `t_store_product` VALUES (11, 80, 49);
INSERT INTO `t_store_product` VALUES (12, 74, 50);
INSERT INTO `t_store_product` VALUES (13, 81, 51);
INSERT INTO `t_store_product` VALUES (14, 82, 51);
INSERT INTO `t_store_product` VALUES (15, 42, 35);
INSERT INTO `t_store_product` VALUES (16, 43, 36);
INSERT INTO `t_store_product` VALUES (17, 44, 37);
INSERT INTO `t_store_product` VALUES (18, 45, 35);
INSERT INTO `t_store_product` VALUES (19, 43, 38);
INSERT INTO `t_store_product` VALUES (20, 46, 39);
INSERT INTO `t_store_product` VALUES (21, 47, 35);
INSERT INTO `t_store_product` VALUES (22, 48, 39);
INSERT INTO `t_store_product` VALUES (23, 49, 35);
INSERT INTO `t_store_product` VALUES (24, 51, 35);
INSERT INTO `t_store_product` VALUES (25, 52, 35);
INSERT INTO `t_store_product` VALUES (26, 53, 41);
INSERT INTO `t_store_product` VALUES (27, 54, 42);
INSERT INTO `t_store_product` VALUES (28, 55, 41);
INSERT INTO `t_store_product` VALUES (29, 56, 35);
INSERT INTO `t_store_product` VALUES (30, 57, 43);
INSERT INTO `t_store_product` VALUES (31, 58, 41);
INSERT INTO `t_store_product` VALUES (32, 59, 44);
INSERT INTO `t_store_product` VALUES (33, 60, 35);
INSERT INTO `t_store_product` VALUES (34, 61, 38);
INSERT INTO `t_store_product` VALUES (35, 62, 35);
INSERT INTO `t_store_product` VALUES (36, 63, 41);
INSERT INTO `t_store_product` VALUES (37, 64, 41);
INSERT INTO `t_store_product` VALUES (38, 65, 41);
INSERT INTO `t_store_product` VALUES (39, 66, 45);
INSERT INTO `t_store_product` VALUES (40, 67, 45);
INSERT INTO `t_store_product` VALUES (41, 68, 45);
INSERT INTO `t_store_product` VALUES (42, 69, 45);
INSERT INTO `t_store_product` VALUES (43, 70, 45);
INSERT INTO `t_store_product` VALUES (44, 71, 45);
INSERT INTO `t_store_product` VALUES (45, 72, 45);
INSERT INTO `t_store_product` VALUES (46, 53, 46);
COMMIT;

-- ----------------------------
-- Table structure for t_street
-- ----------------------------
DROP TABLE IF EXISTS `t_street`;
CREATE TABLE `t_street` (
  `id` int NOT NULL,
  `province_id` int NOT NULL,
  `city_id` int NOT NULL,
  `area_id` int NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='乡级（乡镇、街道）';

-- ----------------------------
-- Records of t_street
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码，md5 32位字符串',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信union_id',
  `open_id` varchar(64) DEFAULT '' COMMENT '微信open_id',
  `session_key` varchar(32) NOT NULL DEFAULT '' COMMENT '微信session_key',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '??',
  `flag` tinyint NOT NULL DEFAULT '0' COMMENT '??',
  `last_login` datetime NOT NULL COMMENT '最近登陆时间',
  `deleted` tinyint NOT NULL COMMENT '逻辑删除，0 未删除，1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES (1, 'oU63z5AqBbCcWE7d8xC_8OMOukzI', '27c34647d057baf48faa8e355f059d88', 'oU63z5AqBbCcWE7d8xC_8OMOukzI', '', '', 'oU63z5AqBbCcWE7d8xC_8OMOukzI ', 'QeIYlbGyO8Z42xHzNBpk9Q==', 0, 0, '2020-11-29 18:25:20', 0, '2020-11-09 19:36:53', '2020-11-29 18:25:20');
INSERT INTO `t_user` VALUES (2, 'oU63z5Ge0TsaIHksRIQWpgU8IrTw', '', 'oU63z5Ge0TsaIHksRIQWpgU8IrTw', '', '', 'oU63z5Ge0TsaIHksRIQWpgU8IrTw', '47w+kujU00Tg1VexWR9/5w==', 0, 0, '2020-11-21 20:03:07', 0, '2020-11-21 20:02:06', '2020-11-21 20:03:07');
INSERT INTO `t_user` VALUES (3, '18667130808', '', '18667130808', '18667130808', '', '', '', 0, 0, '2020-11-29 20:19:20', 0, '2020-11-29 20:19:20', '2020-11-29 20:19:20');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
