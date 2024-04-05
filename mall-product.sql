/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : mall-product

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 05/04/2024 16:12:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `category_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_status` tinyint NOT NULL DEFAULT 1 COMMENT '分类状态',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '电子产品', 1, '2024-03-15 19:09:42');
INSERT INTO `product_category` VALUES (2, '服饰类', 1, '2024-03-15 19:10:00');
INSERT INTO `product_category` VALUES (3, '化妆品', 1, '2024-03-15 19:11:32');
INSERT INTO `product_category` VALUES (4, '食品类', 1, '2024-03-15 19:11:44');
INSERT INTO `product_category` VALUES (5, '游戏产品', 1, '2024-03-15 19:11:55');
INSERT INTO `product_category` VALUES (6, '厨房用品', 1, '2024-03-16 10:27:02');
INSERT INTO `product_category` VALUES (7, '电脑配件', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (8, '家电', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (9, '珠宝首饰', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (10, '书籍', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (11, '户外装备', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (12, '玩具', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (13, '宠物用品', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (14, '运动健身', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (15, '音乐器材', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (16, '办公用品', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (17, '汽车用品', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (18, '摄影器材', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (19, '手机配件', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (20, '视频游戏', 1, '2024-03-16 12:02:42');
INSERT INTO `product_category` VALUES (21, '个人护理', 1, '2024-03-16 12:02:42');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `brand_id` int UNSIGNED NULL DEFAULT NULL COMMENT '品牌表的ID',
  `seller_id` int UNSIGNED NOT NULL COMMENT '商品的供应商ID',
  `descript` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述',
  `stock` int UNSIGNED NOT NULL COMMENT '商品库存',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品录入时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `image_url_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片url描述',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '智能手表', 1, 1, '高性能智能手表，支持多种运动模式', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (2, '蓝牙耳机', 2, 1, '高清音质，长续航蓝牙耳机', 200, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (3, '游戏手柄', 3, 1, '适用于各种平台的游戏手柄', 150, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (4, '无线充电器', 4, 1, '快速无线充电，兼容多种设备', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (5, '智能灯泡', 5, 1, '可通过App控制的智能灯泡', 200, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (6, '电子书阅读器', 6, 1, '护眼屏幕，携带方便的电子书阅读器', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (7, '便携式扬声器', 7, 1, '小巧便携，音质出众的扬声器', 150, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (8, '行动电源', 8, 1, '大容量，快速充电的行动电源', 200, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (9, '智能门锁', 9, 1, '安全可靠的智能门锁，支持多种解锁方式', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (10, 'VR头盔', 10, 1, '沉浸式体验的VR头盔', 50, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (11, '男士外套', 11, 2, '时尚保暖的男士外套', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (12, '女士手提包', 12, 2, '优质材料，设计精美的女士手提包', 150, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (13, '运动鞋', 13, 2, '舒适透气，专为运动设计的运动鞋', 200, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (14, '正装裤', 14, 2, '商务场合必备的正装裤', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (15, '夏季连衣裙', 15, 2, '轻盈舒适，夏日时尚的连衣裙', 150, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (16, 'T恤', 16, 2, '多色可选，日常必备的T恤', 200, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (17, '牛仔裤', 17, 2, '经典时尚，舒适耐穿的牛仔裤', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (18, '羽绒服', 18, 2, '冬季保暖必备的羽绒服', 50, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (19, '运动背心', 19, 2, '运动时的舒适选择，运动背心', 150, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (20, '围巾', 20, 2, '保暖时尚的必备配饰，围巾', 100, '2024-03-16 18:24:34', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (21, '小米智能手环5', 1, 1, '具备心率监测和睡眠追踪功能的智能手环', 150, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (22, '华为P40手机', 1, 1, '搭载最新摄影技术的旗舰智能手机', 100, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (23, '苹果iPad Air', 1, 1, '轻薄强大，适合各种创作和日常使用', 100, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (24, 'Kindle电子书阅读器', 1, 1, '长续航，护眼屏幕，让阅读更舒适', 200, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (25, '索尼降噪耳机', 1, 1, '行业领先的降噪技术，提供纯净音质体验', 150, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (26, '戴尔XPS13笔记本', 1, 1, '轻薄便携，性能强大的笔记本电脑', 100, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (27, '雷蛇游戏鼠标', 1, 1, '为游戏玩家设计的高精度游戏鼠标', 200, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (28, '三星4K电视', 1, 1, '高清画质，智能连接，家庭娱乐的理想选择', 50, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (29, 'Bose蓝牙音箱', 1, 1, '出色的音质和便携性能，音乐爱好者的首选', 150, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (30, 'Apple Watch Series 6', 1, 1, '全面健康监测，是健康生活的理想伴侣', 100, '2024-03-16 18:25:58', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (31, 'python', NULL, 1, '可以吃的python', 5, '2024-03-27 13:47:02', '2024-03-27 14:24:31', 'null');
INSERT INTO `product_info` VALUES (32, 'python', NULL, 1, 'pythonpythonpython', 2, '2024-03-27 14:27:27', '2024-03-27 14:27:27', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/09a4a211-0485-47f1-886d-d3ba8cce434e.jpg,https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/a90b0a6f-52ef-4405-b458-453b6d855bb5.jpg');
INSERT INTO `product_info` VALUES (33, 'python', NULL, 1, 'pythonpythonpython', 2, '2024-03-27 14:27:35', '2024-03-27 14:27:35', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/03797a4d-e63c-4b70-be4e-fe6b4d8f58c7.jpg,https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cde6422b-f04c-4d69-8165-f4443c4f13ac.jpg');
INSERT INTO `product_info` VALUES (34, 'javajava', NULL, 1, 'javajava', 2, '2024-03-27 14:29:35', '2024-03-27 14:29:35', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/ff5b18a2-27cd-4b62-bca0-552f8e4eff43.jpg,https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/a94987c7-ae21-4ffa-9314-01a68fadc55c.jpg');
INSERT INTO `product_info` VALUES (35, 'java语法java语法', NULL, 1, 'java语法java语法', 2, '2024-03-27 14:30:38', '2024-03-27 14:30:38', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/d169c906-3fc9-4d58-9615-4c18c246662b.jpg');
INSERT INTO `product_info` VALUES (36, '大数据', NULL, 1, '大数据大数据大数据', 5, '2024-03-27 14:32:45', '2024-03-27 14:32:45', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cd694b4f-a443-4719-82e2-e7c6ec4f8dee.jpg');
INSERT INTO `product_info` VALUES (37, '大数据', NULL, 1, '大数据', 2, '2024-03-27 14:34:12', '2024-03-27 14:34:12', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/633ff3bc-cc58-4ec0-ba49-e2a65b360291.jpg');
INSERT INTO `product_info` VALUES (38, '外星人', NULL, 1, '外星人外星人', 2, '2024-03-27 14:35:46', '2024-03-27 14:35:46', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/58ed45a7-0e09-4fda-b201-e7cae2489767.jpg');
INSERT INTO `product_info` VALUES (39, '珠宝珠宝', NULL, 1, '珠宝珠宝', 7, '2024-03-27 14:37:23', '2024-03-27 14:37:23', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/a4ceec1f-586c-4830-a541-78ef5c606495.jpg');
INSERT INTO `product_info` VALUES (40, '珠宝珠宝', NULL, 1, '珠宝珠宝', 7, '2024-03-27 14:37:38', '2024-03-27 14:37:38', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/feddb249-6bb7-4997-9716-8692e356a8ab.jpg');
INSERT INTO `product_info` VALUES (41, 'pythonpython', NULL, 1, 'pythonpython', 1, '2024-03-27 14:38:15', '2024-03-27 14:38:15', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/ba9df9f2-587e-46a9-8c24-5ec5a6d801be.jpg');
INSERT INTO `product_info` VALUES (42, '化妆品化妆品化妆品', NULL, 1, '化妆品化妆品化妆品', 6, '2024-03-27 14:40:46', '2024-03-27 14:40:46', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/4c474aff-d4f4-42f0-869d-461eb63c6907.jpg');
INSERT INTO `product_info` VALUES (43, '化妆品化妆品化妆品', NULL, 1, '化妆品化妆品化妆品', 6, '2024-03-27 14:40:53', '2024-03-27 14:40:53', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/c082bf72-95a3-40f6-a2d2-6150d129c552.jpg');
INSERT INTO `product_info` VALUES (44, '书书', NULL, 1, '书书书', 4, '2024-03-27 14:42:44', '2024-03-27 14:42:44', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cf22ff77-ed85-4f8c-aa90-59734497a743.jpg');
INSERT INTO `product_info` VALUES (47, 'productDial', NULL, 1, 'productDialogIsShow.value=false', 2, '2024-03-27 14:44:21', '2024-03-27 14:44:21', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cfffa29b-406c-4772-ac3b-b32fdd774ffd.jpg');
INSERT INTO `product_info` VALUES (48, 'productDial', NULL, 1, 'productDialogIsShow.value=false', 2, '2024-03-27 14:45:34', '2024-03-27 14:45:34', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/254b72b1-404d-4184-89cf-58d69eac1c58.jpg');
INSERT INTO `product_info` VALUES (49, '大数据大数据', NULL, 1, '大数据大数据', 5, '2024-03-27 18:36:51', '2024-03-27 18:36:51', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/5091db84-6a2b-4489-8c6d-d1407cdb10e3.jpg');

-- ----------------------------
-- Table structure for product_overview
-- ----------------------------
DROP TABLE IF EXISTS `product_overview`;
CREATE TABLE `product_overview`  (
  `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品标题',
  `product_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片url',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '商品销售价格',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `category_id` int UNSIGNED NOT NULL COMMENT '类别id',
  `publish_status` tinyint NOT NULL DEFAULT 1 COMMENT '上下架状态：0下架1上架',
  `audit_status` tinyint NOT NULL DEFAULT 1 COMMENT '审核状态：0未审核，1已审核',
  `product_order` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000 COMMENT '排序',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品概括表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_overview
-- ----------------------------
INSERT INTO `product_overview` VALUES (1, '智能手表', 'null', 1200.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000001);
INSERT INTO `product_overview` VALUES (2, '蓝牙耳机', 'null', 300.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000002);
INSERT INTO `product_overview` VALUES (3, '游戏手柄', 'null', 500.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000003);
INSERT INTO `product_overview` VALUES (4, '无线充电器', 'null', 150.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000004);
INSERT INTO `product_overview` VALUES (5, '智能灯泡', 'null', 100.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000005);
INSERT INTO `product_overview` VALUES (6, '电子书阅读器', 'null', 800.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000006);
INSERT INTO `product_overview` VALUES (7, '便携式扬声器', 'null', 400.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000007);
INSERT INTO `product_overview` VALUES (8, '行动电源', 'null', 200.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000008);
INSERT INTO `product_overview` VALUES (9, '智能门锁', 'null', 1000.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000009);
INSERT INTO `product_overview` VALUES (10, 'VR头盔', 'null', 1500.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000010);
INSERT INTO `product_overview` VALUES (11, '男士外套', 'null', 700.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000011);
INSERT INTO `product_overview` VALUES (12, '女士手提包', 'null', 800.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000012);
INSERT INTO `product_overview` VALUES (13, '运动鞋', 'null', 600.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000013);
INSERT INTO `product_overview` VALUES (14, '正装裤', 'null', 500.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000014);
INSERT INTO `product_overview` VALUES (15, '夏季连衣裙', 'null', 450.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000015);
INSERT INTO `product_overview` VALUES (16, 'T恤', 'null', 150.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000016);
INSERT INTO `product_overview` VALUES (17, '牛仔裤', 'null', 350.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000017);
INSERT INTO `product_overview` VALUES (18, '羽绒服', 'null', 950.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000018);
INSERT INTO `product_overview` VALUES (19, '运动背心', 'null', 200.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000019);
INSERT INTO `product_overview` VALUES (20, '围巾', 'null', 250.00, '2024-03-27 14:24:18', 2, 1, 1, 0000000020);
INSERT INTO `product_overview` VALUES (21, '小米智能手环5', 'null', 199.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000001);
INSERT INTO `product_overview` VALUES (22, '华为P40手机', 'null', 4999.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000002);
INSERT INTO `product_overview` VALUES (23, '苹果iPad Air', 'null', 5999.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000003);
INSERT INTO `product_overview` VALUES (24, 'Kindle电子书阅读器', 'null', 998.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000004);
INSERT INTO `product_overview` VALUES (25, '索尼降噪耳机', 'null', 1599.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000005);
INSERT INTO `product_overview` VALUES (26, '戴尔XPS13笔记本', 'null', 8999.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000006);
INSERT INTO `product_overview` VALUES (27, '雷蛇游戏鼠标', 'null', 499.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000007);
INSERT INTO `product_overview` VALUES (28, '三星4K电视', 'null', 7999.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000008);
INSERT INTO `product_overview` VALUES (29, 'Bose蓝牙音箱', 'null', 2599.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000009);
INSERT INTO `product_overview` VALUES (30, 'Apple Watch Series 6', 'null', 3199.00, '2024-03-27 14:24:18', 1, 1, 1, 0000000010);
INSERT INTO `product_overview` VALUES (31, '吃py', 'null', 4.00, '2024-03-27 14:24:18', 4, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (32, 'python书', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/09a4a211-0485-47f1-886d-d3ba8cce434e.jpg', 5.00, '2024-03-27 14:27:27', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (33, 'python书', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/03797a4d-e63c-4b70-be4e-fe6b4d8f58c7.jpg', 5.00, '2024-03-27 14:27:35', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (34, 'java', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/ff5b18a2-27cd-4b62-bca0-552f8e4eff43.jpg', 10.00, '2024-03-27 14:29:35', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (35, 'java语法', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/d169c906-3fc9-4d58-9615-4c18c246662b.jpg', 4.00, '2024-03-27 14:30:38', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (36, '大数据', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cd694b4f-a443-4719-82e2-e7c6ec4f8dee.jpg', 1.00, '2024-03-27 14:32:45', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (37, '大数据', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/633ff3bc-cc58-4ec0-ba49-e2a65b360291.jpg', 1.00, '2024-03-27 14:34:12', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (38, '外星人', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/58ed45a7-0e09-4fda-b201-e7cae2489767.jpg', 10000.00, '2024-03-27 14:35:46', 7, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (39, '珠宝', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/a4ceec1f-586c-4830-a541-78ef5c606495.jpg', 4.00, '2024-03-27 14:37:23', 9, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (40, '珠宝', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/feddb249-6bb7-4997-9716-8692e356a8ab.jpg', 4.00, '2024-03-27 14:37:38', 9, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (41, 'python', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/ba9df9f2-587e-46a9-8c24-5ec5a6d801be.jpg', 5.00, '2024-03-27 14:38:15', 7, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (42, '化妆品', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/4c474aff-d4f4-42f0-869d-461eb63c6907.jpg', 4.00, '2024-03-27 14:40:46', 3, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (43, '化妆品', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/c082bf72-95a3-40f6-a2d2-6150d129c552.jpg', 4.00, '2024-03-27 14:40:53', 3, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (44, '书', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cf22ff77-ed85-4f8c-aa90-59734497a743.jpg', 3.00, '2024-03-27 14:42:44', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (47, 'productDialog', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/cfffa29b-406c-4772-ac3b-b32fdd774ffd.jpg', 5.00, '2024-03-27 14:44:21', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (48, 'productDialog', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/254b72b1-404d-4184-89cf-58d69eac1c58.jpg', 5.00, '2024-03-27 14:45:34', 10, 1, 1, 0000000000);
INSERT INTO `product_overview` VALUES (49, '大数据', 'https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/5091db84-6a2b-4489-8c6d-d1407cdb10e3.jpg', 5.00, '2024-03-27 18:36:51', 10, 1, 1, 0000000000);

SET FOREIGN_KEY_CHECKS = 1;
