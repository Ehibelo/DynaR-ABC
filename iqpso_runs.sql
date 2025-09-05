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

 Date: 05/09/2025 12:59:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iqpso_runs
-- ----------------------------
DROP TABLE IF EXISTS `iqpso_runs`;
CREATE TABLE `iqpso_runs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_way` int NOT NULL COMMENT '覆盖强度',
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '原始参数数组',
  `test_cases` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '测试用例集',
  `test_case_count` int NULL DEFAULT NULL COMMENT '实际用例数量',
  `execution_time` float NULL DEFAULT NULL COMMENT '执行耗时（秒）',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'IQPSO测试结果记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iqpso_runs
-- ----------------------------
INSERT INTO `iqpso_runs` VALUES (4, 2, '[4,3,4]', '0,1,2;3,2,1;3,0,0;2,0,2;2,1,0;1,2,2;0,2,3;0,0,1;1,1,1;3,1,3;1,0,3;2,2,3;1,2,0;3,2,2;2,2,1;0,2,0;', 16, 0.697, '2025-05-24 22:38:47', '2025-05-24 22:38:47');
INSERT INTO `iqpso_runs` VALUES (11, 2, '[6,6,6]', '0,2,3;1,3,0;0,3,4;3,2,4;5,3,5;1,4,4;0,4,5;2,3,2;4,3,3;5,1,4;3,0,5;4,0,2;3,5,3;4,2,0;3,1,1;3,4,2;2,5,0;5,5,2;5,0,3;2,4,3;2,0,4;1,1,5;1,0,1;2,2,5;5,4,1;4,5,4;0,5,1;1,2,2;0,1,0;2,3,1;5,0,0;3,4,0;4,4,5;1,5,5;5,2,1;4,1,3;2,1,2;0,0,2;3,3,3;1,0,3;4,2,1;', 41, 1.888, '2025-06-27 21:01:01', '2025-06-27 21:01:01');
INSERT INTO `iqpso_runs` VALUES (14, 2, '[5,5,5]', '3,2,3;4,2,0;0,3,0;3,3,4;4,4,4;2,4,2;1,3,2;2,2,4;2,3,3;0,0,3;0,2,2;2,0,0;2,1,1;3,1,2;1,0,1;1,1,0;0,4,1;4,3,1;4,1,3;4,0,2;3,4,0;0,1,4;1,4,3;1,2,4;3,0,4;3,2,1;', 26, 0.429, '2025-06-29 18:32:03', '2025-06-29 18:32:03');

SET FOREIGN_KEY_CHECKS = 1;
