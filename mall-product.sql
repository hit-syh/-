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

 Date: 16/03/2024 20:50:34
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
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '智能手表', 1, 1, '高性能智能手表，支持多种运动模式', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (2, '蓝牙耳机', 2, 1, '高清音质，长续航蓝牙耳机', 200, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (3, '游戏手柄', 3, 1, '适用于各种平台的游戏手柄', 150, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (4, '无线充电器', 4, 1, '快速无线充电，兼容多种设备', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (5, '智能灯泡', 5, 1, '可通过App控制的智能灯泡', 200, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (6, '电子书阅读器', 6, 1, '护眼屏幕，携带方便的电子书阅读器', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (7, '便携式扬声器', 7, 1, '小巧便携，音质出众的扬声器', 150, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (8, '行动电源', 8, 1, '大容量，快速充电的行动电源', 200, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (9, '智能门锁', 9, 1, '安全可靠的智能门锁，支持多种解锁方式', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (10, 'VR头盔', 10, 1, '沉浸式体验的VR头盔', 50, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (11, '男士外套', 11, 2, '时尚保暖的男士外套', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (12, '女士手提包', 12, 2, '优质材料，设计精美的女士手提包', 150, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (13, '运动鞋', 13, 2, '舒适透气，专为运动设计的运动鞋', 200, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (14, '正装裤', 14, 2, '商务场合必备的正装裤', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (15, '夏季连衣裙', 15, 2, '轻盈舒适，夏日时尚的连衣裙', 150, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (16, 'T恤', 16, 2, '多色可选，日常必备的T恤', 200, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (17, '牛仔裤', 17, 2, '经典时尚，舒适耐穿的牛仔裤', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (18, '羽绒服', 18, 2, '冬季保暖必备的羽绒服', 50, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (19, '运动背心', 19, 2, '运动时的舒适选择，运动背心', 150, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (20, '围巾', 20, 2, '保暖时尚的必备配饰，围巾', 100, '2024-03-16 18:24:34', '2024-03-16 18:24:34');
INSERT INTO `product_info` VALUES (21, '小米智能手环5', 1, 1, '具备心率监测和睡眠追踪功能的智能手环', 150, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (22, '华为P40手机', 1, 1, '搭载最新摄影技术的旗舰智能手机', 100, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (23, '苹果iPad Air', 1, 1, '轻薄强大，适合各种创作和日常使用', 100, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (24, 'Kindle电子书阅读器', 1, 1, '长续航，护眼屏幕，让阅读更舒适', 200, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (25, '索尼降噪耳机', 1, 1, '行业领先的降噪技术，提供纯净音质体验', 150, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (26, '戴尔XPS13笔记本', 1, 1, '轻薄便携，性能强大的笔记本电脑', 100, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (27, '雷蛇游戏鼠标', 1, 1, '为游戏玩家设计的高精度游戏鼠标', 200, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (28, '三星4K电视', 1, 1, '高清画质，智能连接，家庭娱乐的理想选择', 50, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (29, 'Bose蓝牙音箱', 1, 1, '出色的音质和便携性能，音乐爱好者的首选', 150, '2024-03-16 18:25:58', '2024-03-16 18:25:58');
INSERT INTO `product_info` VALUES (30, 'Apple Watch Series 6', 1, 1, '全面健康监测，是健康生活的理想伴侣', 100, '2024-03-16 18:25:58', '2024-03-16 18:25:58');

-- ----------------------------
-- Table structure for product_overview
-- ----------------------------
DROP TABLE IF EXISTS `product_overview`;
CREATE TABLE `product_overview`  (
  `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品标题',
  `product_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片url',
  `price` decimal(8, 2) NOT NULL COMMENT '商品销售价格',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `category_id` int UNSIGNED NOT NULL COMMENT '类别id',
  `publish_status` tinyint NOT NULL DEFAULT 0 COMMENT '上下架状态：0下架1上架',
  `audit_status` tinyint NOT NULL DEFAULT 0 COMMENT '审核状态：0未审核，1已审核',
  `product_order` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '排序',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品概括表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_overview
-- ----------------------------
INSERT INTO `product_overview` VALUES (1, '智能手表', 'http://example.com/smartwatch.jpg', 1200.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000001);
INSERT INTO `product_overview` VALUES (2, '蓝牙耳机', 'http://example.com/bluetoothheadphones.jpg', 300.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000002);
INSERT INTO `product_overview` VALUES (3, '游戏手柄', 'http://example.com/gamecontroller.jpg', 500.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000003);
INSERT INTO `product_overview` VALUES (4, '无线充电器', 'http://example.com/wirelesscharger.jpg', 150.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000004);
INSERT INTO `product_overview` VALUES (5, '智能灯泡', 'http://example.com/smartbulb.jpg', 100.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000005);
INSERT INTO `product_overview` VALUES (6, '电子书阅读器', 'http://example.com/ereader.jpg', 800.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000006);
INSERT INTO `product_overview` VALUES (7, '便携式扬声器', 'http://example.com/portablespeaker.jpg', 400.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000007);
INSERT INTO `product_overview` VALUES (8, '行动电源', 'http://example.com/powerbank.jpg', 200.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000008);
INSERT INTO `product_overview` VALUES (9, '智能门锁', 'http://example.com/smartlock.jpg', 1000.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000009);
INSERT INTO `product_overview` VALUES (10, 'VR头盔', 'http://example.com/vrheadset.jpg', 1500.00, '2024-03-16 12:06:48', 1, 1, 1, 0000000010);
INSERT INTO `product_overview` VALUES (11, '男士外套', 'http://example.com/mensjacket.jpg', 700.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000011);
INSERT INTO `product_overview` VALUES (12, '女士手提包', 'http://example.com/womenshandbag.jpg', 800.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000012);
INSERT INTO `product_overview` VALUES (13, '运动鞋', 'http://example.com/sneakers.jpg', 600.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000013);
INSERT INTO `product_overview` VALUES (14, '正装裤', 'http://example.com/dresspants.jpg', 500.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000014);
INSERT INTO `product_overview` VALUES (15, '夏季连衣裙', 'http://example.com/summerdress.jpg', 450.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000015);
INSERT INTO `product_overview` VALUES (16, 'T恤', 'http://example.com/tshirt.jpg', 150.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000016);
INSERT INTO `product_overview` VALUES (17, '牛仔裤', 'http://example.com/jeans.jpg', 350.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000017);
INSERT INTO `product_overview` VALUES (18, '羽绒服', 'http://example.com/downjacket.jpg', 950.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000018);
INSERT INTO `product_overview` VALUES (19, '运动背心', 'http://example.com/sportvest.jpg', 200.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000019);
INSERT INTO `product_overview` VALUES (20, '围巾', 'http://example.com/scarf.jpg', 250.00, '2024-03-16 12:06:48', 2, 1, 1, 0000000020);
INSERT INTO `product_overview` VALUES (21, '小米智能手环5', 'http://example.com/miband5.jpg', 199.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000001);
INSERT INTO `product_overview` VALUES (22, '华为P40手机', 'http://example.com/huaweip40.jpg', 4999.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000002);
INSERT INTO `product_overview` VALUES (23, '苹果iPad Air', 'http://example.com/ipadair.jpg', 5999.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000003);
INSERT INTO `product_overview` VALUES (24, 'Kindle电子书阅读器', 'http://example.com/kindle.jpg', 998.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000004);
INSERT INTO `product_overview` VALUES (25, '索尼降噪耳机', 'http://example.com/sonyheadphone.jpg', 1599.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000005);
INSERT INTO `product_overview` VALUES (26, '戴尔XPS13笔记本', 'http://example.com/dellxps13.jpg', 8999.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000006);
INSERT INTO `product_overview` VALUES (27, '雷蛇游戏鼠标', 'http://example.com/razermouse.jpg', 499.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000007);
INSERT INTO `product_overview` VALUES (28, '三星4K电视', 'http://example.com/samsung4ktv.jpg', 7999.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000008);
INSERT INTO `product_overview` VALUES (29, 'Bose蓝牙音箱', 'http://example.com/bose.jpg', 2599.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000009);
INSERT INTO `product_overview` VALUES (30, 'Apple Watch Series 6', 'http://example.com/applewatch.jpg', 3199.00, '2024-03-16 16:45:29', 1, 1, 1, 0000000010);

SET FOREIGN_KEY_CHECKS = 1;
