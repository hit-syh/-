/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : mall-customer

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 05/04/2024 16:12:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer_addr
-- ----------------------------
DROP TABLE IF EXISTS `customer_addr`;
CREATE TABLE `customer_addr`  (
  `customer_addr_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `customer_id` int UNSIGNED NOT NULL COMMENT 'customer_login表的自增ID',
  `zip` smallint NOT NULL COMMENT '邮编',
  `province` smallint NOT NULL COMMENT '地区表中省份的ID',
  `city` smallint NOT NULL COMMENT '地区表中城市的ID',
  `district` smallint NOT NULL COMMENT '地区表中的区ID',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体的地址门牌号',
  `is_default` tinyint NOT NULL COMMENT '是否默认',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_addr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_addr
-- ----------------------------

-- ----------------------------
-- Table structure for customer_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `customer_balance_log`;
CREATE TABLE `customer_balance_log`  (
  `balance_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '余额日志ID',
  `customer_id` int UNSIGNED NOT NULL COMMENT '用户ID',
  `source` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '记录来源：1订单，2退货单',
  `source_sn` int UNSIGNED NOT NULL COMMENT '相关单据ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录生成时间',
  `amount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '变动金额',
  PRIMARY KEY (`balance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for customer_inf
-- ----------------------------
DROP TABLE IF EXISTS `customer_inf`;
CREATE TABLE `customer_inf`  (
  `customer_id` int UNSIGNED NOT NULL COMMENT 'customer_login表的自增ID',
  `customer_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户真实姓名',
  `identity_card_type` tinyint NOT NULL DEFAULT 1 COMMENT '证件类型：1 身份证，2 军官证，3 护照',
  `identity_card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '证件号码',
  `mobile_phone` int UNSIGNED NULL DEFAULT NULL COMMENT '手机号',
  `customer_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `user_point` int NOT NULL DEFAULT 0 COMMENT '用户积分',
  `register_time` timestamp NOT NULL COMMENT '注册时间',
  `birthday` datetime NULL DEFAULT NULL COMMENT '会员生日',
  `customer_level` tinyint NOT NULL DEFAULT 1 COMMENT '会员级别：1 普通会员，2 青铜，3白银，4黄金，5钻石',
  `user_money` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_inf
-- ----------------------------
INSERT INTO `customer_inf` VALUES (1, '史云浩', 1, '23023222222222222', 1312521122, '', NULL, 0, '2024-03-29 19:01:09', NULL, 1, 50000.00, '2024-03-16 19:01:16');

-- ----------------------------
-- Table structure for customer_login
-- ----------------------------
DROP TABLE IF EXISTS `customer_login`;
CREATE TABLE `customer_login`  (
  `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `mail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录邮箱',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'md5加密的密码',
  `user_status` tinyint NOT NULL DEFAULT 1 COMMENT '用户状态',
  `salt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_login
-- ----------------------------
INSERT INTO `customer_login` VALUES (1, 'root', 'syh', 'ea48576f30be1669971699c09ad05c94', 1, '123456', '2024-03-15 18:02:25');

SET FOREIGN_KEY_CHECKS = 1;
