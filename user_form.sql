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

 Date: 05/09/2025 12:59:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_form
-- ----------------------------
DROP TABLE IF EXISTS `user_form`;
CREATE TABLE `user_form`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `size` int NOT NULL,
  `weight` double NOT NULL,
  `num` int NOT NULL,
  `strength` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `testcasenum` int NULL DEFAULT NULL,
  `times` double NULL DEFAULT NULL,
  `coverednum` int NULL DEFAULT NULL,
  `algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'nichepso',
  `coveragerate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_form
-- ----------------------------
INSERT INTO `user_form` VALUES (62, 8, 8, 0.2, 3, '2,2,2', '1,2;1,3;2,3', '[4,4,4]', '2 3 1;1 2 3;4 3 3;1 1 2;2 2 4;4 4 4;2 4 3;1 3 4;3 4 2;4 2 2;3 2 1;3 1 4;1 4 1;4 1 1;3 3 2;2 1 2;3 1 3', 17, 0.0083321, 16, 'nichepso', '6.250000% 12.500000% 18.750000% 25.000000% 31.250000% 37.500000% 43.750000% 50.000000% 56.250000% 62.500000% 68.750000% 75.000000% 81.250000% 87.500000% 91.666667% 95.833333% 100.000000%');
INSERT INTO `user_form` VALUES (67, 9, 9, 0.6, 3, '2,2,2', '1,2;1,3;2,3', '[4,4,4]', '1 4 2;2 2 3;4 4 1;1 3 3;3 1 2;3 2 4;1 1 4;4 3 4;2 3 2;2 4 4;3 3 1;2 1 1;4 1 3;4 2 2;1 2 1;3 4 3', 16, 0.0071066, 16, 'nichepso', '6.250000% 12.500000% 18.750000% 25.000000% 31.250000% 37.500000% 43.750000% 50.000000% 56.250000% 62.500000% 68.750000% 75.000000% 81.250000% 87.500000% 93.750000% 100.000000%');

SET FOREIGN_KEY_CHECKS = 1;
