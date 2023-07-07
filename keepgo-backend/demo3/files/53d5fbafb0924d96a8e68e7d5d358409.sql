/*
 Navicat Premium Data Transfer

 Source Server         : demo03
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 26/07/2022 21:15:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  `enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章概述',
  `userid` int NULL DEFAULT NULL COMMENT '作者的id',
  `typeid` int NULL DEFAULT NULL COMMENT '文章类型的id',
  `readnumber` int NULL DEFAULT NULL COMMENT '阅读次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (10, '123', '123', '王浩', '2022-07-15 11:09:53', NULL, NULL, '单纯为了更好看一些', 107, 4, 8);
INSERT INTO `article` VALUES (11, '阿斯顿撒', 'sad', '王浩', '2022-07-15 11:10:00', NULL, NULL, NULL, 107, 4, 1);
INSERT INTO `article` VALUES (15, NULL, 'sadasdsad', '王浩', '2022-07-16 11:04:25', NULL, NULL, NULL, 107, 4, 0);
INSERT INTO `article` VALUES (16, 'asdasdsadsaASDASDSADDSA', 'dasdsadasdsadsadsDSADSADSADSADSAD', '王浩', '2022-07-16 11:09:20', NULL, NULL, NULL, 107, 1, 1);
INSERT INTO `article` VALUES (17, 'ASD', 'SAD', '王浩', '2022-07-16 11:11:50', NULL, NULL, NULL, 107, 1, 0);
INSERT INTO `article` VALUES (18, 'ASD', 'SAD', '王浩', '2022-07-16 11:11:57', NULL, NULL, NULL, 107, 1, 0);
INSERT INTO `article` VALUES (19, '初识Vue', '# 初识vue\n\n## 学习vue所需要的前置知识\n\n1. html标签语言\n2. css（网页布局的美容师），负责帮助渲染不同样式与主题的网页见面\n3. js \n\n|html|css|javascrip|\n|-|-|-|\n|标签语言|负责帮助渲染不同样式与主题的网页见面|网页响应事件|\n\n\n', '王浩', '2022-07-16 11:16:35', NULL, NULL, NULL, 107, 2, 3);
INSERT INTO `article` VALUES (20, '敖德萨多', '敖德萨多撒', '王浩', '2022-07-16 11:18:05', NULL, NULL, NULL, 107, 2, 0);
INSERT INTO `article` VALUES (21, '撒的', '阿萨德', '王浩', '2022-07-16 13:45:01', NULL, NULL, NULL, 107, 2, 0);
INSERT INTO `article` VALUES (29, '小白初始springboot', '# 初始springboot\n\n## 学习springboot前你所需要掌握的知识\n\n```java\n\npublic void HelloWorld(){\n\n	Sytem.out.println(\"hello,World!\");\n\n\n}\n\n```\n', '王浩', '2022-07-16 22:47:58', NULL, NULL, '如何学习springboot', 107, 3, 1);
INSERT INTO `article` VALUES (30, 'Oracle 就集体诉讼案达成和解！', NULL, '王浩', '2022-07-17 19:12:12', NULL, NULL, '150万美元', 107, 3, 0);
INSERT INTO `article` VALUES (31, '200亿文本生成的图像模型惊呆...', NULL, '王浩', '2022-07-17 19:12:27', NULL, NULL, '谷歌亮出最新文本到图像生成模型', 107, NULL, 4);
INSERT INTO `article` VALUES (32, '马斯克“抢”来的 AI 大牛离职', NULL, '王浩', '2022-07-17 19:12:37', NULL, NULL, '特斯拉自动驾驶要“黄”？', 107, NULL, 0);
INSERT INTO `article` VALUES (33, '微软：“我爱Linux”的20年', NULL, '王浩', '2022-07-17 19:12:45', NULL, NULL, '从“开源是毒瘤”的大转变', 107, NULL, 0);
INSERT INTO `article` VALUES (34, '红帽官宣新任总裁兼 CEO！', NULL, '王浩', '2022-07-17 19:12:53', NULL, NULL, '转型关键人物 Paul Cormier “退而不', 107, NULL, 0);
INSERT INTO `article` VALUES (35, '历史上的今天：软银收购 ARM', NULL, '王浩', '2022-07-17 19:14:58', NULL, NULL, '软银收购 ARM', 107, NULL, 0);
INSERT INTO `article` VALUES (114, '学习springboot的一些新得', '# 初始springboot\n \n## 学习spring的前置知识\n|java|javaweb|spring|mmc|\n|-|-|-|-|\n|中等|较难|较难|困难|\n\n本文中的一些内容引用这篇文章\n> [百度](baidu.com)\n\n\n```java\npublic void test(){\n\n\n	return null;\n}\n\n```\n\n\n\n\n**谢谢您的观看！**\n', '张三', '2022-07-25 00:54:44', NULL, NULL, '关于笔者在学习springboot中的一些心得体会', 114, 3, 17);
INSERT INTO `article` VALUES (115, 'asdasd', 'sadasdsa', '王浩', '2022-07-25 09:41:11', NULL, NULL, '申请为期完成', 107, 3, 5);

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图简介',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图指向的网页地址',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enable` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (8, '微信小程序.png', '微信小程序专题，精品小程序源码合集等你来看。', 'http://localhost:9090/carousel/c758efa5ac694624be3805f9fd00717b.png', NULL, NULL, 'ffb7517915f99914ada91a0e82291780', 0);
INSERT INTO `carousel` VALUES (9, 'e4aec0496f142474f21517ba627d5352.jpeg', '初学者怎么学习springboot，答案就在这里。', 'http://localhost:9090/carousel/78664237c0e048778f2b4d12e3ea790f.jpeg', NULL, NULL, 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `articleid` int NULL DEFAULT NULL COMMENT '收藏的文章的id',
  `userid` int NULL DEFAULT NULL COMMENT '收藏人的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (44, '960df05a939e46e5b4384840667e405d (3).png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (45, '960df05a939e46e5b4384840667e405d (4).png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (46, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (47, '精彩时刻，星星，五角星.png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (48, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (49, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (50, 'e4aec0496f142474f21517ba627d5352.jpeg', 'jpeg', 50, 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0, 1);
INSERT INTO `sys_file` VALUES (51, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (52, 'mainland.csv', 'csv', 0, 'http://localhost:9090/file/1fa1c45409974e8181e541be1e2f9230.csv', 'e9814282f8500f972f8db28e7138c6d0', 0, 1);
INSERT INTO `sys_file` VALUES (53, '资源.png', 'png', 1, 'http://localhost:9090/file/32b4caf8095f4690a741e0c654d322af.png', '151db5e7e31c9f084c35d49e91cf29cc', 0, 1);
INSERT INTO `sys_file` VALUES (54, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (55, '精彩时刻，星星，五角星.png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (56, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (57, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (58, '960df05a939e46e5b4384840667e405d (4).png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (59, 'e4aec0496f142474f21517ba627d5352.jpeg', 'jpeg', 50, 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0, 1);
INSERT INTO `sys_file` VALUES (60, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (61, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (62, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (63, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (64, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (65, 'e4aec0496f142474f21517ba627d5352.jpeg', 'jpeg', 50, 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0, 1);
INSERT INTO `sys_file` VALUES (66, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (67, 'e4aec0496f142474f21517ba627d5352.jpeg', 'jpeg', 50, 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0, 1);
INSERT INTO `sys_file` VALUES (68, '56CC86C392C68987BC09D3B2AF499969.png', 'png', 108, 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', '56cc86c392c68987bc09d3b2af499969', 0, 1);
INSERT INTO `sys_file` VALUES (69, '960df05a939e46e5b4384840667e405d (4).png', 'png', 1, 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', '9b66659b1313d43650009c6f15c73cc6', 0, 1);
INSERT INTO `sys_file` VALUES (70, '1365411358C5027F4B4EF4F0E489B835.png', 'png', 417, 'http://localhost:9090/file/88502871303149319aa4dcc9463691c7.png', '1365411358c5027f4b4ef4f0e489b835', 0, 1);
INSERT INTO `sys_file` VALUES (71, '教育部学籍在线验证报告_王浩.pdf', 'pdf', 235, 'http://localhost:9090/file/0aa0c8ba826c4dbcb298cf56c20749f1.pdf', 'fe50cd498e9a0f94340c02d39695f79a', 0, 1);
INSERT INTO `sys_file` VALUES (72, 'vue (1).js', 'js', 335, 'http://localhost:9090/file/59315d6e32394b24ab3fde25adfddbe3.js', '3e2664e064c50a0e8d3ba83081826a2c', 0, 1);
INSERT INTO `sys_file` VALUES (73, 'demo.html', 'html', 7, 'http://localhost:9090/file/83dd3a42f65a4dcfb581f9d5718f3de2.html', '4cd4bb6a8a6dc3cb41bbbac6bbcadc9e', 0, 1);
INSERT INTO `sys_file` VALUES (74, 'T%XP9U29$UZYQP$$BDF2EKD.png', 'png', 110, 'http://localhost:9090/file/3b8829a7fffc458c877c44530b1dcbbd.png', 'b848475d5ee548162f5377d3d3eee9dd', 0, 1);
INSERT INTO `sys_file` VALUES (75, 'recomand.png', 'png', 0, 'http://localhost:9090/file/419641ac7526484d8b30220ee30e6c45.png', '0f6d256f3ce7c99aa99c038519db723a', 0, 1);
INSERT INTO `sys_file` VALUES (76, 'T%XP9U29$UZYQP$$BDF2EKD.png', 'png', 110, 'http://localhost:9090/file/3b8829a7fffc458c877c44530b1dcbbd.png', 'b848475d5ee548162f5377d3d3eee9dd', 0, 1);
INSERT INTO `sys_file` VALUES (77, 'e4aec0496f142474f21517ba627d5352.jpeg', 'jpeg', 50, 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', 'fc1d0b3709d6c5d126b4219d3f33d3f6', 0, 1);
INSERT INTO `sys_file` VALUES (78, 'J4YN{I~H{6G27`}GRPR2L`F.png', 'png', 380, 'http://localhost:9090/file/c6fad73a5b16474f86b17e2f0873d39a.png', '0178797a9c54e91c4694bd937a75dd5a', 0, 1);
INSERT INTO `sys_file` VALUES (80, 'weixinxiaochengxu.png', 'png', 298, 'http://localhost:9090/file/3e601905633542df99d25b5d879bbd25.png', '948a85f4165032cc6c21d58e15358393', 0, 1);
INSERT INTO `sys_file` VALUES (81, '20220715114621.png', 'png', 374, 'http://localhost:9090/file/60d64712c1904e2e9b2e25dde95d56d6.png', 'c5af82ef28d832430c6254434ab81a6b', 0, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `nameOfShcool` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学校名称',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `schoolTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (97, '213123', '123456', '123123', '123123@qq.com', '1234456', '中国石油大学(华东)', '2022-07-26 16:29:54', 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', NULL, '奥术大师多', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (98, '33', '123456', 'admin1', '123123@qq.com', '1234456', '中国石油大学(华东)', '2022-07-26 16:20:54', 'http://localhost:9090/file/c6fad73a5b16474f86b17e2f0873d39a.png', NULL, '啊实打实', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 'admin2', '123456', '王浩', '1111', '1111', '山东省青岛市黄岛区', '2022-07-26 16:31:42', 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', '男', 'ssadsadsad', '2020.12.03', '中国石油大学(华东)', '高中', '软件工程', '2022.9');
INSERT INTO `sys_user` VALUES (114, 'admin', '123456', '张三', '1', '', NULL, '2022-07-26 16:20:53', 'http://localhost:9090/file/52c0e6f7bbb74a5fb464ca5a74f0b2bd.png', NULL, '打算', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (116, 'admin1', '123456', '王五', '1', '1', '山东省青岛市黄岛区', '2022-07-26 16:28:57', 'http://localhost:9090/file/51995474f5624d4d8d0453c3f54ba959.png', NULL, '感谢关注', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `user_id` int NULL DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论时间',
  `pid` int NULL DEFAULT NULL COMMENT '父id',
  `origin_id` int NULL DEFAULT NULL COMMENT '最上级评论',
  `article_id` int NULL DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2101407746 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (-2046820351, '撒打算', 107, '2022-07-24 14:28:31', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-2017456126, '的', 98, '2022-07-20 14:49:05', 1514205185, 1514205185, 35);
INSERT INTO `t_comment` VALUES (-1967067134, 'sad撒多', 107, '2022-07-19 15:01:53', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-1904185342, '444', 98, '2022-07-20 05:16:07', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1904091134, '阿萨德撒大', 114, '2022-07-21 10:51:48', -1602195454, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1711206399, 'asd', 107, '2022-07-24 17:54:25', -167649278, -167649278, 35);
INSERT INTO `t_comment` VALUES (-1673523199, '阿斯顿撒多', 107, '2022-07-20 14:52:20', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-1602195454, 'asdsas', 98, '2022-07-20 05:17:04', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1568657407, 'sad ', 107, '2022-07-24 13:40:00', -398446591, 1744887810, 19);
INSERT INTO `t_comment` VALUES (-1551835135, '按市场', 107, '2022-07-21 00:42:38', 1644224513, 1644224513, 19);
INSERT INTO `t_comment` VALUES (-1438642174, '萨达', 98, '2022-07-20 14:42:33', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-1283457023, '213', 107, '2022-07-24 14:29:01', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (-1124012030, '姜晨吃屁', 107, '2022-07-19 14:43:55', NULL, NULL, 7);
INSERT INTO `t_comment` VALUES (-1073647614, 'sadasdsad', 98, '2022-07-22 13:57:03', -742297599, -398450686, 33);
INSERT INTO `t_comment` VALUES (-1061154815, 'asdad', 107, '2022-07-25 09:42:04', 356519938, 356519938, 19);
INSERT INTO `t_comment` VALUES (-889184255, 'sad', 107, '2022-07-21 12:23:28', 1119887361, 1119887361, 34);
INSERT INTO `t_comment` VALUES (-834662398, '单位', 98, '2022-07-20 14:52:05', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-742297599, 'asdsad', 98, '2022-07-22 13:57:00', -398450686, -398450686, 33);
INSERT INTO `t_comment` VALUES (-708833279, 'sad ', 98, '2022-07-20 07:00:30', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-671084542, 'asd', 98, '2022-07-21 09:17:48', -1551835135, 1644224513, 19);
INSERT INTO `t_comment` VALUES (-633270271, 'asd', 107, '2022-07-24 17:54:12', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (-532668414, '测试', 107, '2022-07-21 16:43:59', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` VALUES (-398450686, 'ass大所', 107, '2022-07-21 12:23:15', NULL, NULL, 33);
INSERT INTO `t_comment` VALUES (-276754431, 'asd', 107, '2022-07-24 17:54:26', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-260046847, 'asdasd', 107, '2022-07-24 16:13:30', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-222244863, '呈现出', 107, '2022-07-24 20:42:46', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-201322495, 'sadsad', 107, '2022-07-25 10:41:19', 1656754178, 1656754178, 114);
INSERT INTO `t_comment` VALUES (-167649278, '哈哈哈哈哈哈哈哈或或或', 114, '2022-07-21 10:52:31', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-138403839, '测试2', 107, '2022-07-21 19:10:51', -532668414, 1958797314, 19);
INSERT INTO `t_comment` VALUES (-16654335, '红红火火恍恍惚惚或或或或或', 114, '2022-07-21 10:52:52', 1124077570, 1644224513, 19);
INSERT INTO `t_comment` VALUES (247525378, '真', 107, '2022-07-19 14:43:45', NULL, NULL, 7);
INSERT INTO `t_comment` VALUES (281141250, '嗷嗷嗷', 114, '2022-07-21 10:51:43', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (356519938, '呃呃呃 ', 107, '2022-07-25 09:00:16', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (448798722, '嘿嘿嘿', 107, '2022-07-21 12:23:04', 1698754561, 1698754561, 32);
INSERT INTO `t_comment` VALUES (453107713, '阿萨德sad撒多撒', 107, '2022-07-19 19:25:47', NULL, NULL, 30);
INSERT INTO `t_comment` VALUES (645935106, 'sd ', 107, '2022-07-24 13:39:46', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` VALUES (1086332930, '撒大声地', 107, '2022-07-24 17:13:42', NULL, NULL, 29);
INSERT INTO `t_comment` VALUES (1111490561, '213', 107, '2022-07-24 14:28:59', -1568657407, 1744887810, 19);
INSERT INTO `t_comment` VALUES (1119887361, '阿斯顿撒', 107, '2022-07-21 12:23:24', NULL, NULL, 34);
INSERT INTO `t_comment` VALUES (1124077570, '哈哈哈哈', 107, '2022-07-21 09:18:12', -671084542, 1644224513, 19);
INSERT INTO `t_comment` VALUES (1266683906, '阿萨德sad撒', 98, '2022-07-20 14:42:47', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (1300238338, 'asdasd', 107, '2022-07-25 10:41:16', NULL, NULL, 114);
INSERT INTO `t_comment` VALUES (1459671041, '阿萨德', 107, '2022-07-24 20:42:54', 281141250, -1967067134, 35);
INSERT INTO `t_comment` VALUES (1501564930, 'sad', 98, '2022-07-20 14:36:32', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (1656754178, 'asdsa', 107, '2022-07-25 09:42:43', NULL, NULL, 114);
INSERT INTO `t_comment` VALUES (1698754561, 'sadsadsad', 98, '2022-07-19 14:40:10', NULL, NULL, 32);
INSERT INTO `t_comment` VALUES (1744887810, '666', 98, '2022-07-21 01:42:46', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (1757429762, 'w ', 107, '2022-07-22 17:27:39', -532668414, 1958797314, 19);
INSERT INTO `t_comment` VALUES (2038435841, 'asdsa', 107, '2022-07-25 09:41:53', 1744887810, 1744887810, 19);
INSERT INTO `t_comment` VALUES (2076250114, 'asd', 107, '2022-07-24 17:54:09', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (2097221633, 'asdasd', 107, '2022-07-24 17:54:14', NULL, NULL, 19);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章类型名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章类型概述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章背景图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '微信小程序源码合集', '微信小程序，简称小程序，英文名Mini Program，是一种不需要下载安装即可使用的应用，它实现了应用\"触手可及\"的梦想，用户扫一扫或搜一下即可打开应用。', 'http://localhost:9090/file/3e601905633542df99d25b5d879bbd25.png');
INSERT INTO `type` VALUES (3, '\r\n微信小程序商城源码合集', '\r\n微信小程序商城源码合集\r\n微信小程序是一种无需下载安装即可使用的应用，能以最低的成本触达用户。掌握了微信小程序开发技术，等同于打通了手机应用开发蓝海的出海口！ ', 'http://localhost:9090/file/60d64712c1904e2e9b2e25dde95d56d6.png');
INSERT INTO `type` VALUES (4, 'c', '好用厉害', 'http://localhost:9090/file/3e601905633542df99d25b5d879bbd25.png');

SET FOREIGN_KEY_CHECKS = 1;
