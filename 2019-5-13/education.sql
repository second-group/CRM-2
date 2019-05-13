/*
 Navicat Premium Data Transfer

 Source Server         : CRM
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : education

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 13/05/2019 22:23:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for askers
-- ----------------------------
DROP TABLE IF EXISTS `askers`;
CREATE TABLE `askers`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `a_studentid` int(11) NULL DEFAULT NULL COMMENT '学生编号',
  `a_checkstate` int(11) NULL DEFAULT NULL COMMENT '学生状态',
  `a_createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `a_weight` int(11) NULL DEFAULT NULL COMMENT '权重',
  `a_userid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `a_bakcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注内容',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `m_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `m_parentid` int(11) NULL DEFAULT NULL COMMENT '父模块编号',
  `m_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块路径',
  `m_weight` int(11) NULL DEFAULT NULL COMMENT '权重',
  `Ops` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字符串',
  `Int0` int(11) NULL DEFAULT NULL COMMENT '预留整数',
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES (1, '用户管理', 3, 'users.jsp', 100, NULL, NULL);
INSERT INTO `modules` VALUES (2, '角色管理', 3, 'role.jsp', 101, NULL, NULL);
INSERT INTO `modules` VALUES (3, '系统管理', 0, '', NULL, NULL, NULL);
INSERT INTO `modules` VALUES (4, '客户管理', 0, '', NULL, NULL, NULL);
INSERT INTO `modules` VALUES (5, '客户详情', 4, 'kh.jsp', 101, NULL, NULL);
INSERT INTO `modules` VALUES (6, '模块管理', 3, 'modules.jsp', 102, NULL, NULL);
INSERT INTO `modules` VALUES (7, '客户详情', 4, 'students.jsp', 103, NULL, NULL);

-- ----------------------------
-- Table structure for netrollows
-- ----------------------------
DROP TABLE IF EXISTS `netrollows`;
CREATE TABLE `netrollows`  (
  `n_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `n_ studentid` int(11) NULL DEFAULT NULL COMMENT '学生编号',
  `n_studentname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生名称',
  `n_followtime` datetime(0) NULL DEFAULT NULL COMMENT '开始跟踪时间',
  `n_nextfollowtime` datetime(0) NULL DEFAULT NULL COMMENT '结束跟踪时间',
  `n_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访记录',
  `n_userid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `n_followtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟踪类型',
  `n_createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `n_followstate` int(11) NULL DEFAULT NULL COMMENT '跟踪状态',
  PRIMARY KEY (`n_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rolemodules
-- ----------------------------
DROP TABLE IF EXISTS `rolemodules`;
CREATE TABLE `rolemodules`  (
  `rm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `rm_roleid` int(11) NULL DEFAULT NULL COMMENT '角色编号',
  `rm_moduleid` int(11) NULL DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`rm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemodules
-- ----------------------------
INSERT INTO `rolemodules` VALUES (1, 1, 1);
INSERT INTO `rolemodules` VALUES (2, 1, 2);
INSERT INTO `rolemodules` VALUES (3, 1, 3);
INSERT INTO `rolemodules` VALUES (4, 3, 4);
INSERT INTO `rolemodules` VALUES (5, 3, 5);
INSERT INTO `rolemodules` VALUES (6, 1, 6);
INSERT INTO `rolemodules` VALUES (7, 4, 4);
INSERT INTO `rolemodules` VALUES (8, 4, 7);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `r_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `Int()` int(255) NULL DEFAULT NULL COMMENT '预留int',
  `String0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字符串',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理员', NULL, NULL);
INSERT INTO `roles` VALUES (2, '咨询经理', NULL, NULL);
INSERT INTO `roles` VALUES (3, '咨询师', NULL, NULL);
INSERT INTO `roles` VALUES (4, '网络咨询师', NULL, NULL);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员编号',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学员姓名',
  `s_age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `s_sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `s_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `s_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人状态',
  `s_msgsource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源渠道',
  `s_sourceurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源网站',
  `s_sourcekeyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源关键词',
  `s_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在区域',
  `s_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学员qq',
  `s_weixin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户微信',
  `s_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `s_createtime` date NULL DEFAULT NULL COMMENT '创建时间',
  `s_isvalid` int(11) NULL DEFAULT NULL COMMENT '是否有效',
  `s_record` int(11) NULL DEFAULT NULL COMMENT '打分',
  `s_isreturnvist` int(11) NULL DEFAULT NULL COMMENT '是否回访',
  `s_firstvisittime` date NULL DEFAULT NULL COMMENT '首次回访时间',
  `s_ishome` int(11) NULL DEFAULT NULL COMMENT '是否上门',
  `s_hometime` date NULL DEFAULT NULL COMMENT '上门时间',
  `s_lostvalid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无效原因	',
  `s_ispay` int(11) NULL DEFAULT NULL COMMENT '是否缴费',
  `s_paytime` date NULL DEFAULT NULL COMMENT '缴费时间',
  `s_money` decimal(10, 0) NULL DEFAULT NULL COMMENT '缴费金额',
  `s_isreturnmoney` int(11) NULL DEFAULT NULL COMMENT '是否退费',
  `s_isinclass` int(11) NULL DEFAULT NULL COMMENT '是否进班',
  `s_inclasstime` date NULL DEFAULT NULL COMMENT '进班时间',
  `s_inclasscontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进班备注',
  `s_isdel` int(11) NULL DEFAULT NULL COMMENT '是否删除',
  `s_frompart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源部门',
  `s_concern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关注',
  `s_isbaobei` int(11) NULL DEFAULT NULL COMMENT '是否报备',
  `s_userid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `s_returnmoneycontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退费原因',
  `s_premoney` decimal(10, 0) NULL DEFAULT NULL COMMENT '定金金额',
  `s_premoneytime` date NULL DEFAULT NULL COMMENT '定金时间',
  `s_education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `s_stuclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程方向',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, '张三', 12, 1, '123', '正常', '网络', '百度', '学习', '中国', '123', '321', '许嵩', '2019-05-01', 1, 111, 1, '2019-05-01', 123, '2019-05-01', '1', 1, '2019-05-02', 123, 1213, 0, '2019-05-15', '哈哈', 1, '格式', '二百', 1, 1, '1', 32, '2019-05-07', '大学', 'python');
INSERT INTO `students` VALUES (2, '里斯', 21, 0, '213', '正常', '现实', '搜狐', '肥胖', '美国', '3333333', '2222222', '哒哒', '2019-05-01', 0, 9999, 0, '2019-05-07', 322312, '2019-05-03', '1', 1, '2019-05-01', 2222, 33333, 1, '2019-05-09', '热热热', 0, '环境', '订单', 0, 2, '1', 333, '2019-05-09', '小学', 'java');

-- ----------------------------
-- Table structure for userchaecks
-- ----------------------------
DROP TABLE IF EXISTS `userchaecks`;
CREATE TABLE `userchaecks`  (
  `uc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `uc_userid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `uc_loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `uc_checkintime` datetime(0) NULL DEFAULT NULL COMMENT '签到开始时间',
  `uc_checkstate` int(11) NULL DEFAULT NULL COMMENT '签到状态',
  `uc_iscancel` int(11) NULL DEFAULT NULL COMMENT '是否取消签到',
  `uc_checkouttime` datetime(0) NULL DEFAULT NULL COMMENT '签到结束时间',
  PRIMARY KEY (`uc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userroles
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles`  (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `ur_userid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `ur_roleid` int(11) NULL DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`ur_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userroles
-- ----------------------------
INSERT INTO `userroles` VALUES (1, 1, 1);
INSERT INTO `userroles` VALUES (2, 2, 3);
INSERT INTO `userroles` VALUES (3, 3, 2);
INSERT INTO `userroles` VALUES (4, 4, 4);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键自增)',
  `u_loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名称',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `u_islockout` int(11) NULL DEFAULT NULL COMMENT '是否锁定',
  `u_lastlogintime` date NULL DEFAULT NULL COMMENT '最后登录时间',
  `u_createtime` date NULL DEFAULT NULL COMMENT '创建时间',
  `u_psdwrongtime` int(11) NULL DEFAULT NULL COMMENT '密码错误次数',
  `u_locktime` date NULL DEFAULT NULL COMMENT '被锁定时间',
  `u_protectemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `u_protectmtel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '邝成坤', '123456', 0, '2019-05-12', '2019-05-08', NULL, NULL, '18272870272@163.com', '18272870272');
INSERT INTO `users` VALUES (2, '秦迪', '123456', 0, '2019-05-12', '2019-05-12', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, '马梦焕', '12719', 0, '2019-05-12', '2019-05-12', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, '王爱新', '123456', 0, '2019-05-12', '2019-05-12', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
