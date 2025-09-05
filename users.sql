/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : my_db_01

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 05/09/2025 12:59:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `year` int NULL DEFAULT NULL,
  `month` int NULL DEFAULT NULL,
  `date` int NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (49, '1233', '1123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (50, '2', '1', NULL, 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (51, '北极涛', 'a short introduction', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (52, 'testname', 'textintroduction', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (53, '北极涛', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (54, '北极涛', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (55, '北极涛', 'a short introdution111', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (56, '北极涛', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (57, '北极涛', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (58, '北极涛gH_L', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (59, '1111', 'a short introdution', 'man', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (60, 'id', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (61, '北极涛_gHlj', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (62, '北极涛_gHljll', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (63, '北极涛_gH', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (65, '北极涛_gHik', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');
INSERT INTO `users` VALUES (66, 'sett', 'a short introdution', 'woman', 1990, 1, 1, '内蒙古自治区', '呼和浩特市');

SET FOREIGN_KEY_CHECKS = 1;
