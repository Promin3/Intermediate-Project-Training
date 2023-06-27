/*
 Navicat Premium Data Transfer

 Source Server         : localhst
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : TX

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 27/06/2023 16:55:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for User表
-- ----------------------------
DROP TABLE IF EXISTS `User表`;
CREATE TABLE `User表` (
  `User_Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `commentLicense` tinyint NOT NULL DEFAULT '1' COMMENT '评论权限，0表示无权限',
  `postLicense` tinyint NOT NULL DEFAULT '1' COMMENT '发帖权限，0表示无权限',
  `Persontitle` varchar(32) DEFAULT NULL COMMENT '头衔称号',
  `Avater` varchar(50) DEFAULT NULL COMMENT '头像',
  `Points` int DEFAULT '0' COMMENT '周积分',
  `Description` varchar(255) DEFAULT NULL COMMENT '简介',
  `p1` varchar(255) DEFAULT NULL COMMENT '预留',
  `p2` varchar(255) DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Comment表
-- ----------------------------
DROP TABLE IF EXISTS `Comment表`;
CREATE TABLE `Comment表` (
  `Comment_Id` varchar(255) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `date` datetime NOT NULL COMMENT '评论时间',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论的回复',
  PRIMARY KEY (`Comment_Id`),
  KEY `fk_com_uid` (`uid`),
  KEY `fk_com_pid` (`pid`),
  CONSTRAINT `fk_com_pid` FOREIGN KEY (`pid`) REFERENCES `Post表` (`Post_Id`),
  CONSTRAINT `fk_com_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Favorite表
-- ----------------------------
DROP TABLE IF EXISTS `Favorite表`;
CREATE TABLE `Favorite表` (
  `uid` varchar(32) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `Favortime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`,`pid`),
  KEY `fk_favor_pid` (`pid`),
  CONSTRAINT `fk_favor_pid` FOREIGN KEY (`pid`) REFERENCES `Post表` (`Post_Id`),
  CONSTRAINT `fk_favor_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Follow表
-- ----------------------------
DROP TABLE IF EXISTS `Follow表`;
CREATE TABLE `Follow表` (
  `follower_id` varchar(32) NOT NULL COMMENT '关注用户',
  `follow_id` varchar(32) NOT NULL COMMENT '被关注用户',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`follower_id`,`follow_id`),
  KEY `fk_follow_uid` (`follow_id`),
  CONSTRAINT `fk_follow_uid` FOREIGN KEY (`follow_id`) REFERENCES `User表` (`User_Id`),
  CONSTRAINT `fk_follower_uid` FOREIGN KEY (`follower_id`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Like表
-- ----------------------------
DROP TABLE IF EXISTS `Like表`;
CREATE TABLE `Like表` (
  `uid` varchar(32) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `time` datetime DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`uid`,`pid`),
  KEY `fk_like_pid` (`pid`),
  CONSTRAINT `fk_like_pid` FOREIGN KEY (`pid`) REFERENCES `Post表` (`Post_Id`),
  CONSTRAINT `fk_like_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for LoginLog表
-- ----------------------------
DROP TABLE IF EXISTS `LoginLog表`;
CREATE TABLE `LoginLog表` (
  `LogId` varchar(20) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `OS` varchar(20) NOT NULL,
  `Browser` varchar(20) NOT NULL,
  `LoginTime` datetime NOT NULL,
  PRIMARY KEY (`LogId`),
  KEY `fk_log_uid` (`uid`),
  CONSTRAINT `fk_log_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Message表
-- ----------------------------
DROP TABLE IF EXISTS `Message表`;
CREATE TABLE `Message表` (
  `message_Id` varchar(255) NOT NULL,
  `send_uid` varchar(32) NOT NULL COMMENT '发送者id',
  `rec_uid` varchar(32) NOT NULL COMMENT '接收者id',
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`message_Id`),
  KEY `fk_send_uid` (`send_uid`),
  KEY `fk_rec_uid` (`rec_uid`),
  CONSTRAINT `fk_rec_uid` FOREIGN KEY (`rec_uid`) REFERENCES `User表` (`User_Id`),
  CONSTRAINT `fk_send_uid` FOREIGN KEY (`send_uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Post表
-- ----------------------------
DROP TABLE IF EXISTS `Post表`;
CREATE TABLE `Post表` (
  `Post_Id` varchar(20) NOT NULL COMMENT '帖子编号',
  `uid` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `PostTitle` varchar(80) DEFAULT NULL COMMENT '标题',
  `PostContent` varchar(255) DEFAULT NULL COMMENT '内容',
  `PostDate` date DEFAULT NULL COMMENT '创建时间',
  `TotalLike` int DEFAULT NULL COMMENT '点赞数',
  `TotalFavourite` int DEFAULT NULL COMMENT '收藏数',
  PRIMARY KEY (`Post_Id`),
  KEY `fk_Post_uid` (`uid`),
  CONSTRAINT `fk_Post_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for RecommendedVideo
-- ----------------------------
DROP TABLE IF EXISTS `RecommendedVideo`;
CREATE TABLE `RecommendedVideo` (
  `ID` varchar(255) NOT NULL,
  `User_Id` varchar(32) NOT NULL COMMENT '用户编号',
  `Video_Id` int NOT NULL COMMENT '视频编号',
  `IsStar` tinyint DEFAULT '0' COMMENT '0表示未收藏，1表示收藏',
  PRIMARY KEY (`ID`),
  KEY `fk_uid` (`User_Id`),
  KEY `fk_vid` (`Video_Id`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`User_Id`) REFERENCES `User表` (`User_Id`),
  CONSTRAINT `fk_vid` FOREIGN KEY (`Video_Id`) REFERENCES `Video表` (`Video_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Schedule表
-- ----------------------------
DROP TABLE IF EXISTS `Schedule表`;
CREATE TABLE `Schedule表` (
  `Schedule_Id` varchar(20) NOT NULL COMMENT '日程Id',
  `uid` varchar(32) NOT NULL COMMENT '用户编号',
  `Content` varchar(255) DEFAULT NULL COMMENT '日程内容',
  `date` date NOT NULL COMMENT '日程对应日期',
  `SPoints` int DEFAULT '0' COMMENT '积分',
  `IsFinished` tinyint DEFAULT '0' COMMENT '是否完成，0未完成，1完成',
  PRIMARY KEY (`Schedule_Id`),
  KEY `fk_Schedule_uid` (`uid`),
  CONSTRAINT `fk_Schedule_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Team_Member表
-- ----------------------------
DROP TABLE IF EXISTS `Team_Member表`;
CREATE TABLE `Team_Member表` (
  `TeamId` varchar(255) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `IsLeader` tinyint DEFAULT '0' COMMENT '0否，1是',
  PRIMARY KEY (`TeamId`,`uid`),
  KEY `fk_TM_uid` (`uid`),
  CONSTRAINT `fk_TM_tid` FOREIGN KEY (`TeamId`) REFERENCES `Team表` (`Team_Id`),
  CONSTRAINT `fk_TM_uid` FOREIGN KEY (`uid`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Team表
-- ----------------------------
DROP TABLE IF EXISTS `Team表`;
CREATE TABLE `Team表` (
  `Team_Id` varchar(255) NOT NULL,
  `Teamname` varchar(255) NOT NULL,
  `Teamleader_Id` varchar(32) NOT NULL,
  `Points` int DEFAULT '0',
  `Bonus` int DEFAULT '0',
  `Tavater` varchar(100) DEFAULT NULL,
  `TDes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Team_Id`),
  KEY `fk_team_uid` (`Teamleader_Id`),
  CONSTRAINT `fk_team_uid` FOREIGN KEY (`Teamleader_Id`) REFERENCES `User表` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ----------------------------
-- Table structure for Video表
-- ----------------------------
DROP TABLE IF EXISTS `Video表`;
CREATE TABLE `Video表` (
  `Video_Id` int NOT NULL AUTO_INCREMENT,
  `VideoContent` varchar(255) DEFAULT NULL COMMENT '视频网址',
  `VideoCover` varchar(255) DEFAULT NULL COMMENT '视频封面',
  `TotalStar` int DEFAULT '0' COMMENT '视频收藏数',
  PRIMARY KEY (`Video_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
