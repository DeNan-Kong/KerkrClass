/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : kerkr_class

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-02 20:50:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ke_activity
-- ----------------------------
DROP TABLE IF EXISTS `ke_activity`;
CREATE TABLE `ke_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `qq` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'QQ号',
  `order_num` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '排名',
  `prize` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖品',
  `receive` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否已领取 0:未领 1:已领',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_activity
-- ----------------------------

-- ----------------------------
-- Table structure for ke_call_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_call_record`;
CREATE TABLE `ke_call_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `start_time` datetime DEFAULT NULL COMMENT '通话开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '通话结束时间',
  `time_cost` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通话时长(分)',
  `oil_cost` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消耗油量(L)',
  `create_time` datetime DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_call_record
-- ----------------------------

-- ----------------------------
-- Table structure for ke_city
-- ----------------------------
DROP TABLE IF EXISTS `ke_city`;
CREATE TABLE `ke_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `city_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市代码',
  `city_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_city
-- ----------------------------
INSERT INTO `ke_city` VALUES ('1', '110000', '北京市');
INSERT INTO `ke_city` VALUES ('2', '110100', '东城区');
INSERT INTO `ke_city` VALUES ('3', '110200', '西城区');
INSERT INTO `ke_city` VALUES ('4', '110300', '崇文区');
INSERT INTO `ke_city` VALUES ('5', '110400', '宣武区');
INSERT INTO `ke_city` VALUES ('6', '110500', '朝阳区');
INSERT INTO `ke_city` VALUES ('7', '110600', '丰台区');
INSERT INTO `ke_city` VALUES ('8', '110700', '石景山区');
INSERT INTO `ke_city` VALUES ('9', '110800', '海淀区');
INSERT INTO `ke_city` VALUES ('10', '110900', '门头沟区');
INSERT INTO `ke_city` VALUES ('11', '111000', '房山区');
INSERT INTO `ke_city` VALUES ('12', '111100', '通州区');
INSERT INTO `ke_city` VALUES ('13', '111200', '顺义区');
INSERT INTO `ke_city` VALUES ('14', '111300', '昌平区');
INSERT INTO `ke_city` VALUES ('15', '111400', '大兴区');
INSERT INTO `ke_city` VALUES ('16', '111500', '怀柔区');
INSERT INTO `ke_city` VALUES ('17', '111600', '平谷区');
INSERT INTO `ke_city` VALUES ('18', '111700', '密云县');
INSERT INTO `ke_city` VALUES ('19', '111800', '延庆县');
INSERT INTO `ke_city` VALUES ('20', '120000', '天津市');
INSERT INTO `ke_city` VALUES ('21', '120100', '和平区');
INSERT INTO `ke_city` VALUES ('22', '120200', '河东区');
INSERT INTO `ke_city` VALUES ('23', '120300', '河西区');
INSERT INTO `ke_city` VALUES ('24', '120400', '南开区');
INSERT INTO `ke_city` VALUES ('25', '120500', '河北区');
INSERT INTO `ke_city` VALUES ('26', '120600', '红桥区');
INSERT INTO `ke_city` VALUES ('27', '120700', '塘沽区');
INSERT INTO `ke_city` VALUES ('28', '120800', '汉沽区');
INSERT INTO `ke_city` VALUES ('29', '120900', '大港区');
INSERT INTO `ke_city` VALUES ('30', '121000', '东丽区');
INSERT INTO `ke_city` VALUES ('31', '121100', '西青区');
INSERT INTO `ke_city` VALUES ('32', '121200', '津南区');
INSERT INTO `ke_city` VALUES ('33', '121300', '北辰区');
INSERT INTO `ke_city` VALUES ('34', '121400', '武清区');
INSERT INTO `ke_city` VALUES ('35', '121500', '宝坻区');
INSERT INTO `ke_city` VALUES ('36', '121600', '蓟县');
INSERT INTO `ke_city` VALUES ('37', '121700', '宁河县');
INSERT INTO `ke_city` VALUES ('38', '121800', '静海县');
INSERT INTO `ke_city` VALUES ('39', '130000', '河北省');
INSERT INTO `ke_city` VALUES ('40', '130100', '石家庄市');
INSERT INTO `ke_city` VALUES ('41', '130200', '唐山市');
INSERT INTO `ke_city` VALUES ('42', '130300', '秦皇岛市');
INSERT INTO `ke_city` VALUES ('43', '130400', '邯郸市');
INSERT INTO `ke_city` VALUES ('44', '130500', '邢台市');
INSERT INTO `ke_city` VALUES ('45', '130600', '保定市');
INSERT INTO `ke_city` VALUES ('46', '130700', '张家口市');
INSERT INTO `ke_city` VALUES ('47', '130800', '承德市');
INSERT INTO `ke_city` VALUES ('48', '130900', '沧州市');
INSERT INTO `ke_city` VALUES ('49', '131000', '廊坊市');
INSERT INTO `ke_city` VALUES ('50', '131100', '衡水市');
INSERT INTO `ke_city` VALUES ('51', '140000', '山西省');
INSERT INTO `ke_city` VALUES ('52', '140100', '太原市');
INSERT INTO `ke_city` VALUES ('53', '140200', '大同市');
INSERT INTO `ke_city` VALUES ('54', '140300', '阳泉市');
INSERT INTO `ke_city` VALUES ('55', '140400', '长治市');
INSERT INTO `ke_city` VALUES ('56', '140500', '晋城市');
INSERT INTO `ke_city` VALUES ('57', '140600', '朔州市');
INSERT INTO `ke_city` VALUES ('58', '140700', '晋中市');
INSERT INTO `ke_city` VALUES ('59', '140800', '运城市');
INSERT INTO `ke_city` VALUES ('60', '140900', '忻州市');
INSERT INTO `ke_city` VALUES ('61', '141000', '临汾市');
INSERT INTO `ke_city` VALUES ('62', '141100', '吕梁市');
INSERT INTO `ke_city` VALUES ('63', '150000', '内蒙古');
INSERT INTO `ke_city` VALUES ('64', '150100', '呼和浩特市');
INSERT INTO `ke_city` VALUES ('65', '150200', '包头市');
INSERT INTO `ke_city` VALUES ('66', '150300', '乌海市');
INSERT INTO `ke_city` VALUES ('67', '150400', '赤峰市');
INSERT INTO `ke_city` VALUES ('68', '150500', '通辽市');
INSERT INTO `ke_city` VALUES ('69', '150600', '鄂尔多斯市');
INSERT INTO `ke_city` VALUES ('70', '150700', '呼伦贝尔市');
INSERT INTO `ke_city` VALUES ('71', '150800', '巴彦淖尔市');
INSERT INTO `ke_city` VALUES ('72', '150900', '乌兰察布市');
INSERT INTO `ke_city` VALUES ('73', '152200', '兴安盟');
INSERT INTO `ke_city` VALUES ('74', '152500', '锡林郭勒盟');
INSERT INTO `ke_city` VALUES ('75', '152900', '阿拉善盟');
INSERT INTO `ke_city` VALUES ('76', '210000', '辽宁省');
INSERT INTO `ke_city` VALUES ('77', '210100', '沈阳市');
INSERT INTO `ke_city` VALUES ('78', '210200', '大连市');
INSERT INTO `ke_city` VALUES ('79', '210300', '鞍山市');
INSERT INTO `ke_city` VALUES ('80', '210400', '抚顺市');
INSERT INTO `ke_city` VALUES ('81', '210500', '本溪市');
INSERT INTO `ke_city` VALUES ('82', '210600', '丹东市');
INSERT INTO `ke_city` VALUES ('83', '210700', '锦州市');
INSERT INTO `ke_city` VALUES ('84', '210800', '营口市');
INSERT INTO `ke_city` VALUES ('85', '210900', '阜新市');
INSERT INTO `ke_city` VALUES ('86', '211000', '辽阳市');
INSERT INTO `ke_city` VALUES ('87', '211100', '盘锦市');
INSERT INTO `ke_city` VALUES ('88', '211200', '铁岭市');
INSERT INTO `ke_city` VALUES ('89', '211300', '朝阳市');
INSERT INTO `ke_city` VALUES ('90', '211400', '葫芦岛市');
INSERT INTO `ke_city` VALUES ('91', '220000', '吉林省');
INSERT INTO `ke_city` VALUES ('92', '220100', '长春市');
INSERT INTO `ke_city` VALUES ('93', '220200', '吉林市');
INSERT INTO `ke_city` VALUES ('94', '220300', '四平市');
INSERT INTO `ke_city` VALUES ('95', '220400', '辽源市');
INSERT INTO `ke_city` VALUES ('96', '220500', '通化市');
INSERT INTO `ke_city` VALUES ('97', '220600', '白山市');
INSERT INTO `ke_city` VALUES ('98', '220700', '松原市');
INSERT INTO `ke_city` VALUES ('99', '220800', '白城市');
INSERT INTO `ke_city` VALUES ('100', '222400', '延边朝鲜族自治州');
INSERT INTO `ke_city` VALUES ('101', '230000', '黑龙江省');
INSERT INTO `ke_city` VALUES ('102', '230100', '哈尔滨市');
INSERT INTO `ke_city` VALUES ('103', '230200', '齐齐哈尔市');
INSERT INTO `ke_city` VALUES ('104', '230300', '鸡西市');
INSERT INTO `ke_city` VALUES ('105', '230400', '鹤岗市');
INSERT INTO `ke_city` VALUES ('106', '230500', '双鸭山市');
INSERT INTO `ke_city` VALUES ('107', '230600', '大庆市');
INSERT INTO `ke_city` VALUES ('108', '230700', '伊春市');
INSERT INTO `ke_city` VALUES ('109', '230800', '佳木斯市');
INSERT INTO `ke_city` VALUES ('110', '230900', '七台河市');
INSERT INTO `ke_city` VALUES ('111', '231000', '牡丹江市');
INSERT INTO `ke_city` VALUES ('112', '231100', '黑河市');
INSERT INTO `ke_city` VALUES ('113', '231200', '绥化市');
INSERT INTO `ke_city` VALUES ('114', '232700', '大兴安岭地区');
INSERT INTO `ke_city` VALUES ('115', '310000', '上海市');
INSERT INTO `ke_city` VALUES ('116', '310100', '黄浦区');
INSERT INTO `ke_city` VALUES ('118', '310300', '徐汇区');
INSERT INTO `ke_city` VALUES ('119', '310400', '长宁区');
INSERT INTO `ke_city` VALUES ('120', '310500', '静安区');
INSERT INTO `ke_city` VALUES ('121', '310600', '普陀区');
INSERT INTO `ke_city` VALUES ('123', '310800', '虹口区');
INSERT INTO `ke_city` VALUES ('124', '310900', '杨浦区');
INSERT INTO `ke_city` VALUES ('125', '311000', '闵行区');
INSERT INTO `ke_city` VALUES ('126', '311100', '宝山区');
INSERT INTO `ke_city` VALUES ('127', '311200', '嘉定区');
INSERT INTO `ke_city` VALUES ('128', '311300', '浦东新区');
INSERT INTO `ke_city` VALUES ('129', '311400', '金山区');
INSERT INTO `ke_city` VALUES ('130', '311500', '松江区');
INSERT INTO `ke_city` VALUES ('131', '311600', '青浦区');
INSERT INTO `ke_city` VALUES ('133', '311800', '奉贤区');
INSERT INTO `ke_city` VALUES ('134', '311900', '崇明县');
INSERT INTO `ke_city` VALUES ('135', '320000', '江苏省');
INSERT INTO `ke_city` VALUES ('136', '320100', '南京市');
INSERT INTO `ke_city` VALUES ('137', '320200', '无锡市');
INSERT INTO `ke_city` VALUES ('138', '320300', '徐州市');
INSERT INTO `ke_city` VALUES ('139', '320400', '常州市');
INSERT INTO `ke_city` VALUES ('140', '320500', '苏州市');
INSERT INTO `ke_city` VALUES ('141', '320600', '南通市');
INSERT INTO `ke_city` VALUES ('142', '320700', '连云港市');
INSERT INTO `ke_city` VALUES ('143', '320800', '淮安市');
INSERT INTO `ke_city` VALUES ('144', '320900', '盐城市');
INSERT INTO `ke_city` VALUES ('145', '321000', '扬州市');
INSERT INTO `ke_city` VALUES ('146', '321100', '镇江市');
INSERT INTO `ke_city` VALUES ('147', '321200', '泰州市');
INSERT INTO `ke_city` VALUES ('148', '321300', '宿迁市');
INSERT INTO `ke_city` VALUES ('149', '330000', '浙江省');
INSERT INTO `ke_city` VALUES ('150', '330100', '杭州市');
INSERT INTO `ke_city` VALUES ('151', '330200', '宁波市');
INSERT INTO `ke_city` VALUES ('152', '330300', '温州市');
INSERT INTO `ke_city` VALUES ('153', '330400', '嘉兴市');
INSERT INTO `ke_city` VALUES ('154', '330500', '湖州市');
INSERT INTO `ke_city` VALUES ('155', '330600', '绍兴市');
INSERT INTO `ke_city` VALUES ('156', '330700', '金华市');
INSERT INTO `ke_city` VALUES ('157', '330800', '衢州市');
INSERT INTO `ke_city` VALUES ('158', '330900', '舟山市');
INSERT INTO `ke_city` VALUES ('159', '331000', '台州市');
INSERT INTO `ke_city` VALUES ('160', '331100', '丽水市');
INSERT INTO `ke_city` VALUES ('161', '340000', '安徽省');
INSERT INTO `ke_city` VALUES ('162', '340100', '合肥市');
INSERT INTO `ke_city` VALUES ('163', '340200', '芜湖市');
INSERT INTO `ke_city` VALUES ('164', '340300', '蚌埠市');
INSERT INTO `ke_city` VALUES ('165', '340400', '淮南市');
INSERT INTO `ke_city` VALUES ('166', '340500', '马鞍山市');
INSERT INTO `ke_city` VALUES ('167', '340600', '淮北市');
INSERT INTO `ke_city` VALUES ('168', '340700', '铜陵市');
INSERT INTO `ke_city` VALUES ('169', '340800', '安庆市');
INSERT INTO `ke_city` VALUES ('170', '341000', '黄山市');
INSERT INTO `ke_city` VALUES ('171', '341100', '滁州市');
INSERT INTO `ke_city` VALUES ('172', '341200', '阜阳市');
INSERT INTO `ke_city` VALUES ('173', '341300', '宿州市');
INSERT INTO `ke_city` VALUES ('174', '341400', '巢湖市');
INSERT INTO `ke_city` VALUES ('175', '341500', '六安市');
INSERT INTO `ke_city` VALUES ('176', '341600', '亳州市');
INSERT INTO `ke_city` VALUES ('177', '341700', '池州市');
INSERT INTO `ke_city` VALUES ('178', '341800', '宣城市');
INSERT INTO `ke_city` VALUES ('179', '350000', '福建省');
INSERT INTO `ke_city` VALUES ('180', '350100', '福州市');
INSERT INTO `ke_city` VALUES ('181', '350200', '厦门市');
INSERT INTO `ke_city` VALUES ('182', '350300', '莆田市');
INSERT INTO `ke_city` VALUES ('183', '350400', '三明市');
INSERT INTO `ke_city` VALUES ('184', '350500', '泉州市');
INSERT INTO `ke_city` VALUES ('185', '350600', '漳州市');
INSERT INTO `ke_city` VALUES ('186', '350700', '南平市');
INSERT INTO `ke_city` VALUES ('187', '350800', '龙岩市');
INSERT INTO `ke_city` VALUES ('188', '350900', '宁德市');
INSERT INTO `ke_city` VALUES ('189', '360000', '江西省');
INSERT INTO `ke_city` VALUES ('190', '360100', '南昌市');
INSERT INTO `ke_city` VALUES ('191', '360200', '景德镇市');
INSERT INTO `ke_city` VALUES ('192', '360300', '萍乡市');
INSERT INTO `ke_city` VALUES ('193', '360400', '九江市');
INSERT INTO `ke_city` VALUES ('194', '360500', '新余市');
INSERT INTO `ke_city` VALUES ('195', '360600', '鹰潭市');
INSERT INTO `ke_city` VALUES ('196', '360700', '赣州市');
INSERT INTO `ke_city` VALUES ('197', '360800', '吉安市');
INSERT INTO `ke_city` VALUES ('198', '360900', '宜春市');
INSERT INTO `ke_city` VALUES ('199', '361000', '抚州市');
INSERT INTO `ke_city` VALUES ('200', '361100', '上饶市');
INSERT INTO `ke_city` VALUES ('201', '370000', '山东省');
INSERT INTO `ke_city` VALUES ('202', '370100', '济南市');
INSERT INTO `ke_city` VALUES ('203', '370200', '青岛市');
INSERT INTO `ke_city` VALUES ('204', '370300', '淄博市');
INSERT INTO `ke_city` VALUES ('205', '370400', '枣庄市');
INSERT INTO `ke_city` VALUES ('206', '370500', '东营市');
INSERT INTO `ke_city` VALUES ('207', '370600', '烟台市');
INSERT INTO `ke_city` VALUES ('208', '370700', '潍坊市');
INSERT INTO `ke_city` VALUES ('209', '370800', '济宁市');
INSERT INTO `ke_city` VALUES ('210', '370900', '泰安市');
INSERT INTO `ke_city` VALUES ('211', '371000', '威海市');
INSERT INTO `ke_city` VALUES ('212', '371100', '日照市');
INSERT INTO `ke_city` VALUES ('213', '371200', '莱芜市');
INSERT INTO `ke_city` VALUES ('214', '371300', '临沂市');
INSERT INTO `ke_city` VALUES ('215', '371400', '德州市');
INSERT INTO `ke_city` VALUES ('216', '371500', '聊城市');
INSERT INTO `ke_city` VALUES ('217', '371600', '滨州市');
INSERT INTO `ke_city` VALUES ('218', '371700', '菏泽市');
INSERT INTO `ke_city` VALUES ('219', '410000', '河南省');
INSERT INTO `ke_city` VALUES ('220', '410100', '郑州市');
INSERT INTO `ke_city` VALUES ('221', '410200', '开封市');
INSERT INTO `ke_city` VALUES ('222', '410300', '洛阳市');
INSERT INTO `ke_city` VALUES ('223', '410400', '平顶山市');
INSERT INTO `ke_city` VALUES ('224', '410500', '安阳市');
INSERT INTO `ke_city` VALUES ('225', '410600', '鹤壁市');
INSERT INTO `ke_city` VALUES ('226', '410700', '新乡市');
INSERT INTO `ke_city` VALUES ('227', '410800', '焦作市');
INSERT INTO `ke_city` VALUES ('228', '410900', '濮阳市');
INSERT INTO `ke_city` VALUES ('229', '411000', '许昌市');
INSERT INTO `ke_city` VALUES ('230', '411100', '漯河市');
INSERT INTO `ke_city` VALUES ('231', '411200', '三门峡市');
INSERT INTO `ke_city` VALUES ('232', '411300', '南阳市');
INSERT INTO `ke_city` VALUES ('233', '411400', '商丘市');
INSERT INTO `ke_city` VALUES ('234', '411500', '信阳市');
INSERT INTO `ke_city` VALUES ('235', '411600', '周口市');
INSERT INTO `ke_city` VALUES ('236', '411700', '驻马店市');
INSERT INTO `ke_city` VALUES ('237', '411800', '济源市');
INSERT INTO `ke_city` VALUES ('238', '420000', '湖北省');
INSERT INTO `ke_city` VALUES ('239', '420100', '武汉市');
INSERT INTO `ke_city` VALUES ('240', '420200', '黄石市');
INSERT INTO `ke_city` VALUES ('241', '420300', '十堰市');
INSERT INTO `ke_city` VALUES ('242', '420500', '宜昌市');
INSERT INTO `ke_city` VALUES ('243', '420600', '襄樊市');
INSERT INTO `ke_city` VALUES ('244', '420700', '鄂州市');
INSERT INTO `ke_city` VALUES ('245', '420800', '荆门市');
INSERT INTO `ke_city` VALUES ('246', '420900', '孝感市');
INSERT INTO `ke_city` VALUES ('247', '421000', '荆州市');
INSERT INTO `ke_city` VALUES ('248', '421100', '黄冈市');
INSERT INTO `ke_city` VALUES ('249', '421200', '咸宁市');
INSERT INTO `ke_city` VALUES ('250', '421300', '随州市');
INSERT INTO `ke_city` VALUES ('251', '422800', '恩施市');
INSERT INTO `ke_city` VALUES ('252', '423000', '潜江市');
INSERT INTO `ke_city` VALUES ('253', '423100', '仙桃市');
INSERT INTO `ke_city` VALUES ('254', '423200', '天门市');
INSERT INTO `ke_city` VALUES ('255', '423300', '神农架林区');
INSERT INTO `ke_city` VALUES ('256', '430000', '湖南省');
INSERT INTO `ke_city` VALUES ('257', '430100', '长沙市');
INSERT INTO `ke_city` VALUES ('258', '430200', '株洲市');
INSERT INTO `ke_city` VALUES ('259', '430300', '湘潭市');
INSERT INTO `ke_city` VALUES ('260', '430400', '衡阳市');
INSERT INTO `ke_city` VALUES ('261', '430500', '邵阳市');
INSERT INTO `ke_city` VALUES ('262', '430600', '岳阳市');
INSERT INTO `ke_city` VALUES ('263', '430700', '常德市');
INSERT INTO `ke_city` VALUES ('264', '430800', '张家界市');
INSERT INTO `ke_city` VALUES ('265', '430900', '益阳市');
INSERT INTO `ke_city` VALUES ('266', '431000', '郴州市');
INSERT INTO `ke_city` VALUES ('267', '431100', '永州市');
INSERT INTO `ke_city` VALUES ('268', '431200', '怀化市');
INSERT INTO `ke_city` VALUES ('269', '431300', '娄底市');
INSERT INTO `ke_city` VALUES ('270', '433100', '湘西自治州');
INSERT INTO `ke_city` VALUES ('271', '440000', '广东省');
INSERT INTO `ke_city` VALUES ('272', '440100', '广州市');
INSERT INTO `ke_city` VALUES ('273', '440200', '韶关市');
INSERT INTO `ke_city` VALUES ('274', '440300', '深圳市');
INSERT INTO `ke_city` VALUES ('275', '440400', '珠海市');
INSERT INTO `ke_city` VALUES ('276', '440500', '汕头市');
INSERT INTO `ke_city` VALUES ('277', '440600', '佛山市');
INSERT INTO `ke_city` VALUES ('278', '440700', '江门市');
INSERT INTO `ke_city` VALUES ('279', '440800', '湛江市');
INSERT INTO `ke_city` VALUES ('280', '440900', '茂名市');
INSERT INTO `ke_city` VALUES ('281', '441200', '肇庆市');
INSERT INTO `ke_city` VALUES ('282', '441300', '惠州市');
INSERT INTO `ke_city` VALUES ('283', '441400', '梅州市');
INSERT INTO `ke_city` VALUES ('284', '441500', '汕尾市');
INSERT INTO `ke_city` VALUES ('285', '441600', '河源市');
INSERT INTO `ke_city` VALUES ('286', '441700', '阳江市');
INSERT INTO `ke_city` VALUES ('287', '441800', '清远市');
INSERT INTO `ke_city` VALUES ('288', '441900', '东莞市');
INSERT INTO `ke_city` VALUES ('289', '442000', '中山市');
INSERT INTO `ke_city` VALUES ('290', '445100', '潮州市');
INSERT INTO `ke_city` VALUES ('291', '445200', '揭阳市');
INSERT INTO `ke_city` VALUES ('292', '445300', '云浮市');
INSERT INTO `ke_city` VALUES ('293', '450000', '广西');
INSERT INTO `ke_city` VALUES ('294', '450100', '南宁市');
INSERT INTO `ke_city` VALUES ('295', '450200', '柳州市');
INSERT INTO `ke_city` VALUES ('296', '450300', '桂林市');
INSERT INTO `ke_city` VALUES ('297', '450400', '梧州市');
INSERT INTO `ke_city` VALUES ('298', '450500', '北海市');
INSERT INTO `ke_city` VALUES ('299', '450600', '防城港市');
INSERT INTO `ke_city` VALUES ('300', '450700', '钦州市');
INSERT INTO `ke_city` VALUES ('301', '450800', '贵港市');
INSERT INTO `ke_city` VALUES ('302', '450900', '玉林市');
INSERT INTO `ke_city` VALUES ('303', '451000', '百色市');
INSERT INTO `ke_city` VALUES ('304', '451100', '贺州市');
INSERT INTO `ke_city` VALUES ('305', '451200', '河池市');
INSERT INTO `ke_city` VALUES ('306', '451300', '来宾市');
INSERT INTO `ke_city` VALUES ('307', '451400', '崇左市');
INSERT INTO `ke_city` VALUES ('308', '460000', '海南省');
INSERT INTO `ke_city` VALUES ('309', '460100', '海口市');
INSERT INTO `ke_city` VALUES ('310', '460200', '三亚市');
INSERT INTO `ke_city` VALUES ('311', '460300', '三沙市');
INSERT INTO `ke_city` VALUES ('312', '460400', '儋州市');
INSERT INTO `ke_city` VALUES ('313', '460500', '五指山市');
INSERT INTO `ke_city` VALUES ('314', '460600', '琼海市');
INSERT INTO `ke_city` VALUES ('315', '460700', '文昌市');
INSERT INTO `ke_city` VALUES ('316', '460800', '万宁市');
INSERT INTO `ke_city` VALUES ('317', '460900', '东方市');
INSERT INTO `ke_city` VALUES ('318', '461000', '定安县');
INSERT INTO `ke_city` VALUES ('319', '461100', '屯昌县');
INSERT INTO `ke_city` VALUES ('320', '461200', '澄迈县');
INSERT INTO `ke_city` VALUES ('321', '461300', '临高县');
INSERT INTO `ke_city` VALUES ('322', '461400', '白沙自治县');
INSERT INTO `ke_city` VALUES ('323', '461500', '昌江自治县');
INSERT INTO `ke_city` VALUES ('324', '461600', '乐东自治县');
INSERT INTO `ke_city` VALUES ('325', '461700', '陵水自治县');
INSERT INTO `ke_city` VALUES ('326', '461800', '保亭自治县');
INSERT INTO `ke_city` VALUES ('327', '500000', '重庆市');
INSERT INTO `ke_city` VALUES ('328', '501100', '万州区');
INSERT INTO `ke_city` VALUES ('329', '501200', '涪陵区');
INSERT INTO `ke_city` VALUES ('330', '501300', '渝中区');
INSERT INTO `ke_city` VALUES ('331', '501400', '大渡口区');
INSERT INTO `ke_city` VALUES ('332', '501500', '江北区');
INSERT INTO `ke_city` VALUES ('333', '501600', '沙坪坝区');
INSERT INTO `ke_city` VALUES ('334', '501700', '九龙坡区');
INSERT INTO `ke_city` VALUES ('335', '501800', '南岸区');
INSERT INTO `ke_city` VALUES ('336', '501900', '北碚区');
INSERT INTO `ke_city` VALUES ('337', '502100', '万盛区');
INSERT INTO `ke_city` VALUES ('338', '502200', '双桥区');
INSERT INTO `ke_city` VALUES ('339', '502300', '渝北区');
INSERT INTO `ke_city` VALUES ('340', '502400', '巴南区');
INSERT INTO `ke_city` VALUES ('341', '502500', '黔江区');
INSERT INTO `ke_city` VALUES ('342', '502600', '长寿区');
INSERT INTO `ke_city` VALUES ('343', '502700', '江津区');
INSERT INTO `ke_city` VALUES ('344', '502800', '合川区');
INSERT INTO `ke_city` VALUES ('345', '502900', '永川区');
INSERT INTO `ke_city` VALUES ('346', '503100', '南川区');
INSERT INTO `ke_city` VALUES ('347', '503200', '綦江县');
INSERT INTO `ke_city` VALUES ('348', '503300', '潼南县');
INSERT INTO `ke_city` VALUES ('349', '503400', '铜梁县');
INSERT INTO `ke_city` VALUES ('350', '503500', '大足县');
INSERT INTO `ke_city` VALUES ('351', '503600', '荣昌县');
INSERT INTO `ke_city` VALUES ('352', '503700', '璧山县');
INSERT INTO `ke_city` VALUES ('353', '503800', '梁平县');
INSERT INTO `ke_city` VALUES ('354', '503900', '城口县');
INSERT INTO `ke_city` VALUES ('355', '504100', '丰都县');
INSERT INTO `ke_city` VALUES ('356', '504200', '垫江县');
INSERT INTO `ke_city` VALUES ('357', '504300', '武隆县');
INSERT INTO `ke_city` VALUES ('358', '504400', '忠县');
INSERT INTO `ke_city` VALUES ('359', '504500', '开县');
INSERT INTO `ke_city` VALUES ('360', '504600', '云阳县');
INSERT INTO `ke_city` VALUES ('361', '504700', '奉节县');
INSERT INTO `ke_city` VALUES ('362', '504800', '巫山县');
INSERT INTO `ke_city` VALUES ('363', '504900', '巫溪县');
INSERT INTO `ke_city` VALUES ('364', '505100', '石柱自治县');
INSERT INTO `ke_city` VALUES ('365', '505200', '秀山自治县');
INSERT INTO `ke_city` VALUES ('366', '505300', '酉阳自治县');
INSERT INTO `ke_city` VALUES ('367', '505400', '彭水自治县');
INSERT INTO `ke_city` VALUES ('368', '510000', '四川省');
INSERT INTO `ke_city` VALUES ('369', '510100', '成都市');
INSERT INTO `ke_city` VALUES ('370', '510300', '自贡市');
INSERT INTO `ke_city` VALUES ('371', '510400', '攀枝花市');
INSERT INTO `ke_city` VALUES ('372', '510500', '泸州市');
INSERT INTO `ke_city` VALUES ('373', '510600', '德阳市');
INSERT INTO `ke_city` VALUES ('374', '510700', '绵阳市');
INSERT INTO `ke_city` VALUES ('375', '510800', '广元市');
INSERT INTO `ke_city` VALUES ('376', '510900', '遂宁市');
INSERT INTO `ke_city` VALUES ('377', '511000', '内江市');
INSERT INTO `ke_city` VALUES ('378', '511100', '乐山市');
INSERT INTO `ke_city` VALUES ('379', '511300', '南充市');
INSERT INTO `ke_city` VALUES ('380', '511400', '眉山市');
INSERT INTO `ke_city` VALUES ('381', '511500', '宜宾市');
INSERT INTO `ke_city` VALUES ('382', '511600', '广安市');
INSERT INTO `ke_city` VALUES ('383', '511700', '达州市');
INSERT INTO `ke_city` VALUES ('384', '511800', '雅安市');
INSERT INTO `ke_city` VALUES ('385', '511900', '巴中市');
INSERT INTO `ke_city` VALUES ('386', '512000', '资阳市');
INSERT INTO `ke_city` VALUES ('387', '513200', '阿坝自治州');
INSERT INTO `ke_city` VALUES ('388', '513300', '甘孜藏族自治州');
INSERT INTO `ke_city` VALUES ('389', '513400', '凉山彝族自治州');
INSERT INTO `ke_city` VALUES ('390', '520000', '贵州省');
INSERT INTO `ke_city` VALUES ('391', '520100', '贵阳市');
INSERT INTO `ke_city` VALUES ('392', '520200', '六盘水市');
INSERT INTO `ke_city` VALUES ('393', '520300', '遵义市');
INSERT INTO `ke_city` VALUES ('394', '520400', '安顺市');
INSERT INTO `ke_city` VALUES ('395', '522200', '铜仁地区');
INSERT INTO `ke_city` VALUES ('396', '522300', '黔西南自治州');
INSERT INTO `ke_city` VALUES ('397', '522400', '毕节地区');
INSERT INTO `ke_city` VALUES ('398', '522600', '黔东南自治州');
INSERT INTO `ke_city` VALUES ('399', '522700', '黔南自治州');
INSERT INTO `ke_city` VALUES ('400', '530000', '云南省');
INSERT INTO `ke_city` VALUES ('401', '530100', '昆明市');
INSERT INTO `ke_city` VALUES ('402', '530300', '曲靖市');
INSERT INTO `ke_city` VALUES ('403', '530400', '玉溪市');
INSERT INTO `ke_city` VALUES ('404', '530500', '保山市');
INSERT INTO `ke_city` VALUES ('405', '530600', '昭通市');
INSERT INTO `ke_city` VALUES ('406', '530700', '丽江市');
INSERT INTO `ke_city` VALUES ('407', '530800', '普洱市');
INSERT INTO `ke_city` VALUES ('408', '530900', '临沧市');
INSERT INTO `ke_city` VALUES ('409', '532300', '楚雄彝族自治州');
INSERT INTO `ke_city` VALUES ('410', '532500', '红河自治州');
INSERT INTO `ke_city` VALUES ('411', '532600', '文山自治州');
INSERT INTO `ke_city` VALUES ('412', '532800', '西双版纳自治州');
INSERT INTO `ke_city` VALUES ('413', '532900', '大理白族自治州');
INSERT INTO `ke_city` VALUES ('414', '533100', '德宏自治州');
INSERT INTO `ke_city` VALUES ('415', '533300', '怒江傈僳族自治州');
INSERT INTO `ke_city` VALUES ('416', '533400', '迪庆藏族自治州');
INSERT INTO `ke_city` VALUES ('417', '540000', '西藏');
INSERT INTO `ke_city` VALUES ('418', '540100', '拉萨市');
INSERT INTO `ke_city` VALUES ('419', '542100', '昌都地区');
INSERT INTO `ke_city` VALUES ('420', '542200', '山南地区');
INSERT INTO `ke_city` VALUES ('421', '542300', '日喀则地区');
INSERT INTO `ke_city` VALUES ('422', '542400', '那曲地区');
INSERT INTO `ke_city` VALUES ('423', '542500', '阿里地区');
INSERT INTO `ke_city` VALUES ('424', '542600', '林芝地区');
INSERT INTO `ke_city` VALUES ('425', '610000', '陕西省');
INSERT INTO `ke_city` VALUES ('426', '610100', '西安市');
INSERT INTO `ke_city` VALUES ('427', '610200', '铜川市');
INSERT INTO `ke_city` VALUES ('428', '610300', '宝鸡市');
INSERT INTO `ke_city` VALUES ('429', '610400', '咸阳市');
INSERT INTO `ke_city` VALUES ('430', '610500', '渭南市');
INSERT INTO `ke_city` VALUES ('431', '610600', '延安市');
INSERT INTO `ke_city` VALUES ('432', '610700', '汉中市');
INSERT INTO `ke_city` VALUES ('433', '610800', '榆林市');
INSERT INTO `ke_city` VALUES ('434', '610900', '安康市');
INSERT INTO `ke_city` VALUES ('435', '611000', '商洛市');
INSERT INTO `ke_city` VALUES ('436', '620000', '甘肃省');
INSERT INTO `ke_city` VALUES ('437', '620100', '兰州市');
INSERT INTO `ke_city` VALUES ('438', '620200', '嘉峪关市');
INSERT INTO `ke_city` VALUES ('439', '620300', '金昌市');
INSERT INTO `ke_city` VALUES ('440', '620400', '白银市');
INSERT INTO `ke_city` VALUES ('441', '620500', '天水市');
INSERT INTO `ke_city` VALUES ('442', '620600', '武威市');
INSERT INTO `ke_city` VALUES ('443', '620700', '张掖市');
INSERT INTO `ke_city` VALUES ('444', '620800', '平凉市');
INSERT INTO `ke_city` VALUES ('445', '620900', '酒泉市');
INSERT INTO `ke_city` VALUES ('446', '621000', '庆阳市');
INSERT INTO `ke_city` VALUES ('447', '621100', '定西市');
INSERT INTO `ke_city` VALUES ('448', '621200', '陇南市');
INSERT INTO `ke_city` VALUES ('449', '622900', '临夏回族自治州');
INSERT INTO `ke_city` VALUES ('450', '623000', '甘南藏族自治州');
INSERT INTO `ke_city` VALUES ('451', '630000', '青海省');
INSERT INTO `ke_city` VALUES ('452', '630100', '西宁市');
INSERT INTO `ke_city` VALUES ('453', '632100', '海东地区');
INSERT INTO `ke_city` VALUES ('454', '632200', '海北藏族自治州');
INSERT INTO `ke_city` VALUES ('455', '632300', '黄南藏族自治州');
INSERT INTO `ke_city` VALUES ('456', '632500', '海南藏族自治州');
INSERT INTO `ke_city` VALUES ('457', '632600', '果洛藏族自治州');
INSERT INTO `ke_city` VALUES ('458', '632700', '玉树藏族自治州');
INSERT INTO `ke_city` VALUES ('459', '632800', '海西自治州');
INSERT INTO `ke_city` VALUES ('460', '640000', '宁夏');
INSERT INTO `ke_city` VALUES ('461', '640100', '银川市');
INSERT INTO `ke_city` VALUES ('462', '640200', '石嘴山市');
INSERT INTO `ke_city` VALUES ('463', '640300', '吴忠市');
INSERT INTO `ke_city` VALUES ('464', '640400', '固原市');
INSERT INTO `ke_city` VALUES ('465', '640500', '中卫市');
INSERT INTO `ke_city` VALUES ('466', '650000', '新疆');
INSERT INTO `ke_city` VALUES ('467', '650100', '乌鲁木齐市');
INSERT INTO `ke_city` VALUES ('468', '650200', '克拉玛依市');
INSERT INTO `ke_city` VALUES ('469', '652100', '吐鲁番地区');
INSERT INTO `ke_city` VALUES ('470', '652200', '哈密地区');
INSERT INTO `ke_city` VALUES ('471', '652300', '昌吉回族自治州');
INSERT INTO `ke_city` VALUES ('472', '652700', '博尔塔拉自治州');
INSERT INTO `ke_city` VALUES ('473', '652800', '巴音郭楞自治州');
INSERT INTO `ke_city` VALUES ('474', '652900', '阿克苏地区');
INSERT INTO `ke_city` VALUES ('475', '653000', '克孜勒苏自治州');
INSERT INTO `ke_city` VALUES ('476', '653100', '喀什地区');
INSERT INTO `ke_city` VALUES ('477', '653200', '和田地区');
INSERT INTO `ke_city` VALUES ('478', '654000', '伊犁哈萨克自治州');
INSERT INTO `ke_city` VALUES ('479', '654200', '塔城地区');
INSERT INTO `ke_city` VALUES ('480', '654300', '阿勒泰地区');
INSERT INTO `ke_city` VALUES ('481', '655100', '五家渠市');
INSERT INTO `ke_city` VALUES ('482', '655200', '图木舒克市');
INSERT INTO `ke_city` VALUES ('483', '655300', '阿拉尔市');
INSERT INTO `ke_city` VALUES ('484', '655400', '石河子市');
INSERT INTO `ke_city` VALUES ('485', '710000', '台湾');
INSERT INTO `ke_city` VALUES ('486', '710100', '台北市');
INSERT INTO `ke_city` VALUES ('487', '710200', '高雄市');
INSERT INTO `ke_city` VALUES ('488', '710300', '基隆市');
INSERT INTO `ke_city` VALUES ('489', '710400', '新竹市');
INSERT INTO `ke_city` VALUES ('490', '710500', '台中市');
INSERT INTO `ke_city` VALUES ('491', '710600', '嘉义市');
INSERT INTO `ke_city` VALUES ('492', '710700', '台南市');
INSERT INTO `ke_city` VALUES ('493', '710800', '新北市');
INSERT INTO `ke_city` VALUES ('494', '710900', '桃园市');
INSERT INTO `ke_city` VALUES ('495', '711000', '新竹县');
INSERT INTO `ke_city` VALUES ('496', '711100', '宜兰县');
INSERT INTO `ke_city` VALUES ('497', '711200', '苗栗县');
INSERT INTO `ke_city` VALUES ('498', '711400', '彰化县');
INSERT INTO `ke_city` VALUES ('499', '711500', '南投县');
INSERT INTO `ke_city` VALUES ('500', '711600', '云林县');
INSERT INTO `ke_city` VALUES ('501', '711700', '嘉义县');
INSERT INTO `ke_city` VALUES ('502', '712000', '屏东县');
INSERT INTO `ke_city` VALUES ('503', '712100', '台东县');
INSERT INTO `ke_city` VALUES ('504', '712200', '花莲县');
INSERT INTO `ke_city` VALUES ('505', '712300', '澎湖县');
INSERT INTO `ke_city` VALUES ('506', '910000', '中国');
INSERT INTO `ke_city` VALUES ('507', '811100', '香港');
INSERT INTO `ke_city` VALUES ('509', '821100', '澳门');
INSERT INTO `ke_city` VALUES ('511', '910100', '大陆');

-- ----------------------------
-- Table structure for ke_code
-- ----------------------------
DROP TABLE IF EXISTS `ke_code`;
CREATE TABLE `ke_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `key_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码号',
  `code_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '优惠码类型(0:免费,1:优惠)',
  `discount_amount` decimal(15,2) DEFAULT NULL COMMENT '优惠金额',
  `count_pay` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '可优惠使用次数（可使用1000次）',
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态0:有效、1:作废',
  `create_time` datetime DEFAULT NULL COMMENT '数据插入时间',
  `start_time` datetime DEFAULT NULL COMMENT '码号的使用开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '码号的使用结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_code
-- ----------------------------
INSERT INTO `ke_code` VALUES ('23', '154829', '1', '30.00', '500', '0', '2016-10-31 16:13:11', '2016-10-31 16:13:11', '2017-10-31 16:13:11');
INSERT INTO `ke_code` VALUES ('24', '987602', '1', '30.00', '500', '0', '2017-08-30 17:51:05', '2017-08-30 17:51:05', '2018-08-30 17:51:05');

-- ----------------------------
-- Table structure for ke_date
-- ----------------------------
DROP TABLE IF EXISTS `ke_date`;
CREATE TABLE `ke_date` (
  `regTime` date NOT NULL COMMENT '时间序列',
  PRIMARY KEY (`regTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_date
-- ----------------------------
INSERT INTO `ke_date` VALUES ('2015-08-01');
INSERT INTO `ke_date` VALUES ('2015-08-02');
INSERT INTO `ke_date` VALUES ('2015-08-03');
INSERT INTO `ke_date` VALUES ('2015-08-04');
INSERT INTO `ke_date` VALUES ('2015-08-05');
INSERT INTO `ke_date` VALUES ('2015-08-06');
INSERT INTO `ke_date` VALUES ('2015-08-07');
INSERT INTO `ke_date` VALUES ('2015-08-08');
INSERT INTO `ke_date` VALUES ('2015-08-09');
INSERT INTO `ke_date` VALUES ('2015-08-10');
INSERT INTO `ke_date` VALUES ('2015-08-11');
INSERT INTO `ke_date` VALUES ('2015-08-12');
INSERT INTO `ke_date` VALUES ('2015-08-13');
INSERT INTO `ke_date` VALUES ('2015-08-14');
INSERT INTO `ke_date` VALUES ('2015-08-15');
INSERT INTO `ke_date` VALUES ('2015-08-16');
INSERT INTO `ke_date` VALUES ('2015-08-17');
INSERT INTO `ke_date` VALUES ('2015-08-18');
INSERT INTO `ke_date` VALUES ('2015-08-19');
INSERT INTO `ke_date` VALUES ('2015-08-20');
INSERT INTO `ke_date` VALUES ('2015-08-21');
INSERT INTO `ke_date` VALUES ('2015-08-22');
INSERT INTO `ke_date` VALUES ('2015-08-23');
INSERT INTO `ke_date` VALUES ('2015-08-24');
INSERT INTO `ke_date` VALUES ('2015-08-25');
INSERT INTO `ke_date` VALUES ('2015-08-26');
INSERT INTO `ke_date` VALUES ('2015-08-27');
INSERT INTO `ke_date` VALUES ('2015-08-28');
INSERT INTO `ke_date` VALUES ('2015-08-29');
INSERT INTO `ke_date` VALUES ('2015-08-30');
INSERT INTO `ke_date` VALUES ('2015-08-31');
INSERT INTO `ke_date` VALUES ('2015-09-01');
INSERT INTO `ke_date` VALUES ('2015-09-02');
INSERT INTO `ke_date` VALUES ('2015-09-03');
INSERT INTO `ke_date` VALUES ('2015-09-04');
INSERT INTO `ke_date` VALUES ('2015-09-05');
INSERT INTO `ke_date` VALUES ('2015-09-06');
INSERT INTO `ke_date` VALUES ('2015-09-07');
INSERT INTO `ke_date` VALUES ('2015-09-08');
INSERT INTO `ke_date` VALUES ('2015-09-09');
INSERT INTO `ke_date` VALUES ('2015-09-10');
INSERT INTO `ke_date` VALUES ('2015-09-11');
INSERT INTO `ke_date` VALUES ('2015-09-12');
INSERT INTO `ke_date` VALUES ('2015-09-13');
INSERT INTO `ke_date` VALUES ('2015-09-14');
INSERT INTO `ke_date` VALUES ('2015-09-15');
INSERT INTO `ke_date` VALUES ('2015-09-16');
INSERT INTO `ke_date` VALUES ('2015-09-17');
INSERT INTO `ke_date` VALUES ('2015-09-18');
INSERT INTO `ke_date` VALUES ('2015-09-19');
INSERT INTO `ke_date` VALUES ('2015-09-20');
INSERT INTO `ke_date` VALUES ('2015-09-21');
INSERT INTO `ke_date` VALUES ('2015-09-22');
INSERT INTO `ke_date` VALUES ('2015-09-23');
INSERT INTO `ke_date` VALUES ('2015-09-24');
INSERT INTO `ke_date` VALUES ('2015-09-25');
INSERT INTO `ke_date` VALUES ('2015-09-26');
INSERT INTO `ke_date` VALUES ('2015-09-27');
INSERT INTO `ke_date` VALUES ('2015-09-28');
INSERT INTO `ke_date` VALUES ('2015-09-29');
INSERT INTO `ke_date` VALUES ('2015-09-30');
INSERT INTO `ke_date` VALUES ('2015-10-01');
INSERT INTO `ke_date` VALUES ('2015-10-02');
INSERT INTO `ke_date` VALUES ('2015-10-03');
INSERT INTO `ke_date` VALUES ('2015-10-04');
INSERT INTO `ke_date` VALUES ('2015-10-05');
INSERT INTO `ke_date` VALUES ('2015-10-06');
INSERT INTO `ke_date` VALUES ('2015-10-07');
INSERT INTO `ke_date` VALUES ('2015-10-08');
INSERT INTO `ke_date` VALUES ('2015-10-09');
INSERT INTO `ke_date` VALUES ('2015-10-10');
INSERT INTO `ke_date` VALUES ('2015-10-11');
INSERT INTO `ke_date` VALUES ('2015-10-12');
INSERT INTO `ke_date` VALUES ('2015-10-13');
INSERT INTO `ke_date` VALUES ('2015-10-14');
INSERT INTO `ke_date` VALUES ('2015-10-15');
INSERT INTO `ke_date` VALUES ('2015-10-16');
INSERT INTO `ke_date` VALUES ('2015-10-17');
INSERT INTO `ke_date` VALUES ('2015-10-18');
INSERT INTO `ke_date` VALUES ('2015-10-19');
INSERT INTO `ke_date` VALUES ('2015-10-20');
INSERT INTO `ke_date` VALUES ('2015-10-21');
INSERT INTO `ke_date` VALUES ('2015-10-22');
INSERT INTO `ke_date` VALUES ('2015-10-23');
INSERT INTO `ke_date` VALUES ('2015-10-24');
INSERT INTO `ke_date` VALUES ('2015-10-25');
INSERT INTO `ke_date` VALUES ('2015-10-26');
INSERT INTO `ke_date` VALUES ('2015-10-27');
INSERT INTO `ke_date` VALUES ('2015-10-28');
INSERT INTO `ke_date` VALUES ('2015-10-29');
INSERT INTO `ke_date` VALUES ('2015-10-30');
INSERT INTO `ke_date` VALUES ('2015-10-31');
INSERT INTO `ke_date` VALUES ('2015-11-01');
INSERT INTO `ke_date` VALUES ('2015-11-02');
INSERT INTO `ke_date` VALUES ('2015-11-03');
INSERT INTO `ke_date` VALUES ('2015-11-04');
INSERT INTO `ke_date` VALUES ('2015-11-05');
INSERT INTO `ke_date` VALUES ('2015-11-06');
INSERT INTO `ke_date` VALUES ('2015-11-07');
INSERT INTO `ke_date` VALUES ('2015-11-08');
INSERT INTO `ke_date` VALUES ('2015-11-09');
INSERT INTO `ke_date` VALUES ('2015-11-10');
INSERT INTO `ke_date` VALUES ('2015-11-11');
INSERT INTO `ke_date` VALUES ('2015-11-12');
INSERT INTO `ke_date` VALUES ('2015-11-13');
INSERT INTO `ke_date` VALUES ('2015-11-14');
INSERT INTO `ke_date` VALUES ('2015-11-15');
INSERT INTO `ke_date` VALUES ('2015-11-16');
INSERT INTO `ke_date` VALUES ('2015-11-17');
INSERT INTO `ke_date` VALUES ('2015-11-18');
INSERT INTO `ke_date` VALUES ('2015-11-19');
INSERT INTO `ke_date` VALUES ('2015-11-20');
INSERT INTO `ke_date` VALUES ('2015-11-21');
INSERT INTO `ke_date` VALUES ('2015-11-22');
INSERT INTO `ke_date` VALUES ('2015-11-23');
INSERT INTO `ke_date` VALUES ('2015-11-24');
INSERT INTO `ke_date` VALUES ('2015-11-25');
INSERT INTO `ke_date` VALUES ('2015-11-26');
INSERT INTO `ke_date` VALUES ('2015-11-27');
INSERT INTO `ke_date` VALUES ('2015-11-28');
INSERT INTO `ke_date` VALUES ('2015-11-29');
INSERT INTO `ke_date` VALUES ('2015-11-30');
INSERT INTO `ke_date` VALUES ('2015-12-01');
INSERT INTO `ke_date` VALUES ('2015-12-02');
INSERT INTO `ke_date` VALUES ('2015-12-03');
INSERT INTO `ke_date` VALUES ('2015-12-04');
INSERT INTO `ke_date` VALUES ('2015-12-05');
INSERT INTO `ke_date` VALUES ('2015-12-06');
INSERT INTO `ke_date` VALUES ('2015-12-07');
INSERT INTO `ke_date` VALUES ('2015-12-08');
INSERT INTO `ke_date` VALUES ('2015-12-09');
INSERT INTO `ke_date` VALUES ('2015-12-10');
INSERT INTO `ke_date` VALUES ('2015-12-11');
INSERT INTO `ke_date` VALUES ('2015-12-12');
INSERT INTO `ke_date` VALUES ('2015-12-13');
INSERT INTO `ke_date` VALUES ('2015-12-14');
INSERT INTO `ke_date` VALUES ('2015-12-15');
INSERT INTO `ke_date` VALUES ('2015-12-16');
INSERT INTO `ke_date` VALUES ('2015-12-17');
INSERT INTO `ke_date` VALUES ('2015-12-18');
INSERT INTO `ke_date` VALUES ('2015-12-19');
INSERT INTO `ke_date` VALUES ('2015-12-20');
INSERT INTO `ke_date` VALUES ('2015-12-21');
INSERT INTO `ke_date` VALUES ('2015-12-22');
INSERT INTO `ke_date` VALUES ('2015-12-23');
INSERT INTO `ke_date` VALUES ('2015-12-24');
INSERT INTO `ke_date` VALUES ('2015-12-25');
INSERT INTO `ke_date` VALUES ('2015-12-26');
INSERT INTO `ke_date` VALUES ('2015-12-27');
INSERT INTO `ke_date` VALUES ('2015-12-28');
INSERT INTO `ke_date` VALUES ('2015-12-29');
INSERT INTO `ke_date` VALUES ('2015-12-30');
INSERT INTO `ke_date` VALUES ('2015-12-31');
INSERT INTO `ke_date` VALUES ('2016-01-01');
INSERT INTO `ke_date` VALUES ('2016-01-02');
INSERT INTO `ke_date` VALUES ('2016-01-03');
INSERT INTO `ke_date` VALUES ('2016-01-04');
INSERT INTO `ke_date` VALUES ('2016-01-05');
INSERT INTO `ke_date` VALUES ('2016-01-06');
INSERT INTO `ke_date` VALUES ('2016-01-07');
INSERT INTO `ke_date` VALUES ('2016-01-08');
INSERT INTO `ke_date` VALUES ('2016-01-09');
INSERT INTO `ke_date` VALUES ('2016-01-10');
INSERT INTO `ke_date` VALUES ('2016-01-11');
INSERT INTO `ke_date` VALUES ('2016-01-12');
INSERT INTO `ke_date` VALUES ('2016-01-13');
INSERT INTO `ke_date` VALUES ('2016-01-14');
INSERT INTO `ke_date` VALUES ('2016-01-15');
INSERT INTO `ke_date` VALUES ('2016-01-16');
INSERT INTO `ke_date` VALUES ('2016-01-17');
INSERT INTO `ke_date` VALUES ('2016-01-18');
INSERT INTO `ke_date` VALUES ('2016-01-19');
INSERT INTO `ke_date` VALUES ('2016-01-20');
INSERT INTO `ke_date` VALUES ('2016-01-21');
INSERT INTO `ke_date` VALUES ('2016-01-22');
INSERT INTO `ke_date` VALUES ('2016-01-23');
INSERT INTO `ke_date` VALUES ('2016-01-24');
INSERT INTO `ke_date` VALUES ('2016-01-25');
INSERT INTO `ke_date` VALUES ('2016-01-26');
INSERT INTO `ke_date` VALUES ('2016-01-27');
INSERT INTO `ke_date` VALUES ('2016-01-28');
INSERT INTO `ke_date` VALUES ('2016-01-29');
INSERT INTO `ke_date` VALUES ('2016-01-30');
INSERT INTO `ke_date` VALUES ('2016-01-31');
INSERT INTO `ke_date` VALUES ('2016-02-01');
INSERT INTO `ke_date` VALUES ('2016-02-02');
INSERT INTO `ke_date` VALUES ('2016-02-03');
INSERT INTO `ke_date` VALUES ('2016-02-04');
INSERT INTO `ke_date` VALUES ('2016-02-05');
INSERT INTO `ke_date` VALUES ('2016-02-06');
INSERT INTO `ke_date` VALUES ('2016-02-07');
INSERT INTO `ke_date` VALUES ('2016-02-08');
INSERT INTO `ke_date` VALUES ('2016-02-09');
INSERT INTO `ke_date` VALUES ('2016-02-10');
INSERT INTO `ke_date` VALUES ('2016-02-11');
INSERT INTO `ke_date` VALUES ('2016-02-12');
INSERT INTO `ke_date` VALUES ('2016-02-13');
INSERT INTO `ke_date` VALUES ('2016-02-14');
INSERT INTO `ke_date` VALUES ('2016-02-15');
INSERT INTO `ke_date` VALUES ('2016-02-16');
INSERT INTO `ke_date` VALUES ('2016-02-17');
INSERT INTO `ke_date` VALUES ('2016-02-18');
INSERT INTO `ke_date` VALUES ('2016-02-19');
INSERT INTO `ke_date` VALUES ('2016-02-20');
INSERT INTO `ke_date` VALUES ('2016-02-21');
INSERT INTO `ke_date` VALUES ('2016-02-22');
INSERT INTO `ke_date` VALUES ('2016-02-23');
INSERT INTO `ke_date` VALUES ('2016-02-24');
INSERT INTO `ke_date` VALUES ('2016-02-25');
INSERT INTO `ke_date` VALUES ('2016-02-26');
INSERT INTO `ke_date` VALUES ('2016-02-27');
INSERT INTO `ke_date` VALUES ('2016-02-28');
INSERT INTO `ke_date` VALUES ('2016-02-29');
INSERT INTO `ke_date` VALUES ('2016-03-01');
INSERT INTO `ke_date` VALUES ('2016-03-02');
INSERT INTO `ke_date` VALUES ('2016-03-03');
INSERT INTO `ke_date` VALUES ('2016-03-04');
INSERT INTO `ke_date` VALUES ('2016-03-05');
INSERT INTO `ke_date` VALUES ('2016-03-06');
INSERT INTO `ke_date` VALUES ('2016-03-07');
INSERT INTO `ke_date` VALUES ('2016-03-08');
INSERT INTO `ke_date` VALUES ('2016-03-09');
INSERT INTO `ke_date` VALUES ('2016-03-10');
INSERT INTO `ke_date` VALUES ('2016-03-11');
INSERT INTO `ke_date` VALUES ('2016-03-12');
INSERT INTO `ke_date` VALUES ('2016-03-13');
INSERT INTO `ke_date` VALUES ('2016-03-14');
INSERT INTO `ke_date` VALUES ('2016-03-15');
INSERT INTO `ke_date` VALUES ('2016-03-16');
INSERT INTO `ke_date` VALUES ('2016-03-17');
INSERT INTO `ke_date` VALUES ('2016-03-18');
INSERT INTO `ke_date` VALUES ('2016-03-19');
INSERT INTO `ke_date` VALUES ('2016-03-20');
INSERT INTO `ke_date` VALUES ('2016-03-21');
INSERT INTO `ke_date` VALUES ('2016-03-22');
INSERT INTO `ke_date` VALUES ('2016-03-23');
INSERT INTO `ke_date` VALUES ('2016-03-24');
INSERT INTO `ke_date` VALUES ('2016-03-25');
INSERT INTO `ke_date` VALUES ('2016-03-26');
INSERT INTO `ke_date` VALUES ('2016-03-27');
INSERT INTO `ke_date` VALUES ('2016-03-28');
INSERT INTO `ke_date` VALUES ('2016-03-29');
INSERT INTO `ke_date` VALUES ('2016-03-30');
INSERT INTO `ke_date` VALUES ('2016-03-31');
INSERT INTO `ke_date` VALUES ('2016-04-01');
INSERT INTO `ke_date` VALUES ('2016-04-02');
INSERT INTO `ke_date` VALUES ('2016-04-03');
INSERT INTO `ke_date` VALUES ('2016-04-04');
INSERT INTO `ke_date` VALUES ('2016-04-05');
INSERT INTO `ke_date` VALUES ('2016-04-06');
INSERT INTO `ke_date` VALUES ('2016-04-07');
INSERT INTO `ke_date` VALUES ('2016-04-08');
INSERT INTO `ke_date` VALUES ('2016-04-09');
INSERT INTO `ke_date` VALUES ('2016-04-10');
INSERT INTO `ke_date` VALUES ('2016-04-11');
INSERT INTO `ke_date` VALUES ('2016-04-12');
INSERT INTO `ke_date` VALUES ('2016-04-13');
INSERT INTO `ke_date` VALUES ('2016-04-14');
INSERT INTO `ke_date` VALUES ('2016-04-15');
INSERT INTO `ke_date` VALUES ('2016-04-16');
INSERT INTO `ke_date` VALUES ('2016-04-17');
INSERT INTO `ke_date` VALUES ('2016-04-18');
INSERT INTO `ke_date` VALUES ('2016-04-19');
INSERT INTO `ke_date` VALUES ('2016-04-20');
INSERT INTO `ke_date` VALUES ('2016-04-21');
INSERT INTO `ke_date` VALUES ('2016-04-22');
INSERT INTO `ke_date` VALUES ('2016-04-23');
INSERT INTO `ke_date` VALUES ('2016-04-24');
INSERT INTO `ke_date` VALUES ('2016-04-25');
INSERT INTO `ke_date` VALUES ('2016-04-26');
INSERT INTO `ke_date` VALUES ('2016-04-27');
INSERT INTO `ke_date` VALUES ('2016-04-28');
INSERT INTO `ke_date` VALUES ('2016-04-29');
INSERT INTO `ke_date` VALUES ('2016-04-30');
INSERT INTO `ke_date` VALUES ('2016-05-01');
INSERT INTO `ke_date` VALUES ('2016-05-02');
INSERT INTO `ke_date` VALUES ('2016-05-03');
INSERT INTO `ke_date` VALUES ('2016-05-04');
INSERT INTO `ke_date` VALUES ('2016-05-05');
INSERT INTO `ke_date` VALUES ('2016-05-06');
INSERT INTO `ke_date` VALUES ('2016-05-07');
INSERT INTO `ke_date` VALUES ('2016-05-08');
INSERT INTO `ke_date` VALUES ('2016-05-09');
INSERT INTO `ke_date` VALUES ('2016-05-10');
INSERT INTO `ke_date` VALUES ('2016-05-11');
INSERT INTO `ke_date` VALUES ('2016-05-12');
INSERT INTO `ke_date` VALUES ('2016-05-13');
INSERT INTO `ke_date` VALUES ('2016-05-14');
INSERT INTO `ke_date` VALUES ('2016-05-15');
INSERT INTO `ke_date` VALUES ('2016-05-16');
INSERT INTO `ke_date` VALUES ('2016-05-17');
INSERT INTO `ke_date` VALUES ('2016-05-18');
INSERT INTO `ke_date` VALUES ('2016-05-19');
INSERT INTO `ke_date` VALUES ('2016-05-20');
INSERT INTO `ke_date` VALUES ('2016-05-21');
INSERT INTO `ke_date` VALUES ('2016-05-22');
INSERT INTO `ke_date` VALUES ('2016-05-23');
INSERT INTO `ke_date` VALUES ('2016-05-24');
INSERT INTO `ke_date` VALUES ('2016-05-25');
INSERT INTO `ke_date` VALUES ('2016-05-26');
INSERT INTO `ke_date` VALUES ('2016-05-27');
INSERT INTO `ke_date` VALUES ('2016-05-28');
INSERT INTO `ke_date` VALUES ('2016-05-29');
INSERT INTO `ke_date` VALUES ('2016-05-30');
INSERT INTO `ke_date` VALUES ('2016-05-31');
INSERT INTO `ke_date` VALUES ('2016-06-01');
INSERT INTO `ke_date` VALUES ('2016-06-02');
INSERT INTO `ke_date` VALUES ('2016-06-03');
INSERT INTO `ke_date` VALUES ('2016-06-04');
INSERT INTO `ke_date` VALUES ('2016-06-05');
INSERT INTO `ke_date` VALUES ('2016-06-06');
INSERT INTO `ke_date` VALUES ('2016-06-07');
INSERT INTO `ke_date` VALUES ('2016-06-08');
INSERT INTO `ke_date` VALUES ('2016-06-09');
INSERT INTO `ke_date` VALUES ('2016-06-10');
INSERT INTO `ke_date` VALUES ('2016-06-11');
INSERT INTO `ke_date` VALUES ('2016-06-12');
INSERT INTO `ke_date` VALUES ('2016-06-13');
INSERT INTO `ke_date` VALUES ('2016-06-14');
INSERT INTO `ke_date` VALUES ('2016-06-15');
INSERT INTO `ke_date` VALUES ('2016-06-16');
INSERT INTO `ke_date` VALUES ('2016-06-17');
INSERT INTO `ke_date` VALUES ('2016-06-18');
INSERT INTO `ke_date` VALUES ('2016-06-19');
INSERT INTO `ke_date` VALUES ('2016-06-20');
INSERT INTO `ke_date` VALUES ('2016-06-21');
INSERT INTO `ke_date` VALUES ('2016-06-22');
INSERT INTO `ke_date` VALUES ('2016-06-23');
INSERT INTO `ke_date` VALUES ('2016-06-24');
INSERT INTO `ke_date` VALUES ('2016-06-25');
INSERT INTO `ke_date` VALUES ('2016-06-26');
INSERT INTO `ke_date` VALUES ('2016-06-27');
INSERT INTO `ke_date` VALUES ('2016-06-28');
INSERT INTO `ke_date` VALUES ('2016-06-29');
INSERT INTO `ke_date` VALUES ('2016-06-30');
INSERT INTO `ke_date` VALUES ('2016-07-01');
INSERT INTO `ke_date` VALUES ('2016-07-02');
INSERT INTO `ke_date` VALUES ('2016-07-03');
INSERT INTO `ke_date` VALUES ('2016-07-04');
INSERT INTO `ke_date` VALUES ('2016-07-05');
INSERT INTO `ke_date` VALUES ('2016-07-06');
INSERT INTO `ke_date` VALUES ('2016-07-07');
INSERT INTO `ke_date` VALUES ('2016-07-08');
INSERT INTO `ke_date` VALUES ('2016-07-09');
INSERT INTO `ke_date` VALUES ('2016-07-10');
INSERT INTO `ke_date` VALUES ('2016-07-11');
INSERT INTO `ke_date` VALUES ('2016-07-12');
INSERT INTO `ke_date` VALUES ('2016-07-13');
INSERT INTO `ke_date` VALUES ('2016-07-14');
INSERT INTO `ke_date` VALUES ('2016-07-15');
INSERT INTO `ke_date` VALUES ('2016-07-16');
INSERT INTO `ke_date` VALUES ('2016-07-17');
INSERT INTO `ke_date` VALUES ('2016-07-18');
INSERT INTO `ke_date` VALUES ('2016-07-19');
INSERT INTO `ke_date` VALUES ('2016-07-20');
INSERT INTO `ke_date` VALUES ('2016-07-21');
INSERT INTO `ke_date` VALUES ('2016-07-22');
INSERT INTO `ke_date` VALUES ('2016-07-23');
INSERT INTO `ke_date` VALUES ('2016-07-24');
INSERT INTO `ke_date` VALUES ('2016-07-25');
INSERT INTO `ke_date` VALUES ('2016-07-26');
INSERT INTO `ke_date` VALUES ('2016-07-27');
INSERT INTO `ke_date` VALUES ('2016-07-28');
INSERT INTO `ke_date` VALUES ('2016-07-29');
INSERT INTO `ke_date` VALUES ('2016-07-30');
INSERT INTO `ke_date` VALUES ('2016-07-31');
INSERT INTO `ke_date` VALUES ('2016-08-01');
INSERT INTO `ke_date` VALUES ('2016-08-02');
INSERT INTO `ke_date` VALUES ('2016-08-03');
INSERT INTO `ke_date` VALUES ('2016-08-04');
INSERT INTO `ke_date` VALUES ('2016-08-05');
INSERT INTO `ke_date` VALUES ('2016-08-06');
INSERT INTO `ke_date` VALUES ('2016-08-07');
INSERT INTO `ke_date` VALUES ('2016-08-08');
INSERT INTO `ke_date` VALUES ('2016-08-09');
INSERT INTO `ke_date` VALUES ('2016-08-10');
INSERT INTO `ke_date` VALUES ('2016-08-11');
INSERT INTO `ke_date` VALUES ('2016-08-12');
INSERT INTO `ke_date` VALUES ('2016-08-13');
INSERT INTO `ke_date` VALUES ('2016-08-14');
INSERT INTO `ke_date` VALUES ('2016-08-15');
INSERT INTO `ke_date` VALUES ('2016-08-16');
INSERT INTO `ke_date` VALUES ('2016-08-17');
INSERT INTO `ke_date` VALUES ('2016-08-18');
INSERT INTO `ke_date` VALUES ('2016-08-19');
INSERT INTO `ke_date` VALUES ('2016-08-20');
INSERT INTO `ke_date` VALUES ('2016-08-21');
INSERT INTO `ke_date` VALUES ('2016-08-22');
INSERT INTO `ke_date` VALUES ('2016-08-23');
INSERT INTO `ke_date` VALUES ('2016-08-24');
INSERT INTO `ke_date` VALUES ('2016-08-25');
INSERT INTO `ke_date` VALUES ('2016-08-26');
INSERT INTO `ke_date` VALUES ('2016-08-27');
INSERT INTO `ke_date` VALUES ('2016-08-28');
INSERT INTO `ke_date` VALUES ('2016-08-29');
INSERT INTO `ke_date` VALUES ('2016-08-30');
INSERT INTO `ke_date` VALUES ('2016-08-31');
INSERT INTO `ke_date` VALUES ('2016-09-01');
INSERT INTO `ke_date` VALUES ('2016-09-02');
INSERT INTO `ke_date` VALUES ('2016-09-03');
INSERT INTO `ke_date` VALUES ('2016-09-04');
INSERT INTO `ke_date` VALUES ('2016-09-05');
INSERT INTO `ke_date` VALUES ('2016-09-06');
INSERT INTO `ke_date` VALUES ('2016-09-07');
INSERT INTO `ke_date` VALUES ('2016-09-08');
INSERT INTO `ke_date` VALUES ('2016-09-09');
INSERT INTO `ke_date` VALUES ('2016-09-10');
INSERT INTO `ke_date` VALUES ('2016-09-11');
INSERT INTO `ke_date` VALUES ('2016-09-12');
INSERT INTO `ke_date` VALUES ('2016-09-13');
INSERT INTO `ke_date` VALUES ('2016-09-14');
INSERT INTO `ke_date` VALUES ('2016-09-15');
INSERT INTO `ke_date` VALUES ('2016-09-16');
INSERT INTO `ke_date` VALUES ('2016-09-17');
INSERT INTO `ke_date` VALUES ('2016-09-18');
INSERT INTO `ke_date` VALUES ('2016-09-19');
INSERT INTO `ke_date` VALUES ('2016-09-20');
INSERT INTO `ke_date` VALUES ('2016-09-21');
INSERT INTO `ke_date` VALUES ('2016-09-22');
INSERT INTO `ke_date` VALUES ('2016-09-23');
INSERT INTO `ke_date` VALUES ('2016-09-24');
INSERT INTO `ke_date` VALUES ('2016-09-25');
INSERT INTO `ke_date` VALUES ('2016-09-26');
INSERT INTO `ke_date` VALUES ('2016-09-27');
INSERT INTO `ke_date` VALUES ('2016-09-28');
INSERT INTO `ke_date` VALUES ('2016-09-29');
INSERT INTO `ke_date` VALUES ('2016-09-30');
INSERT INTO `ke_date` VALUES ('2016-10-01');
INSERT INTO `ke_date` VALUES ('2016-10-02');
INSERT INTO `ke_date` VALUES ('2016-10-03');
INSERT INTO `ke_date` VALUES ('2016-10-04');
INSERT INTO `ke_date` VALUES ('2016-10-05');
INSERT INTO `ke_date` VALUES ('2016-10-06');
INSERT INTO `ke_date` VALUES ('2016-10-07');
INSERT INTO `ke_date` VALUES ('2016-10-08');
INSERT INTO `ke_date` VALUES ('2016-10-09');
INSERT INTO `ke_date` VALUES ('2016-10-10');
INSERT INTO `ke_date` VALUES ('2016-10-11');
INSERT INTO `ke_date` VALUES ('2016-10-12');
INSERT INTO `ke_date` VALUES ('2016-10-13');
INSERT INTO `ke_date` VALUES ('2016-10-14');
INSERT INTO `ke_date` VALUES ('2016-10-15');
INSERT INTO `ke_date` VALUES ('2016-10-16');
INSERT INTO `ke_date` VALUES ('2016-10-17');
INSERT INTO `ke_date` VALUES ('2016-10-18');
INSERT INTO `ke_date` VALUES ('2016-10-19');
INSERT INTO `ke_date` VALUES ('2016-10-20');
INSERT INTO `ke_date` VALUES ('2016-10-21');
INSERT INTO `ke_date` VALUES ('2016-10-22');
INSERT INTO `ke_date` VALUES ('2016-10-23');
INSERT INTO `ke_date` VALUES ('2016-10-24');
INSERT INTO `ke_date` VALUES ('2016-10-25');
INSERT INTO `ke_date` VALUES ('2016-10-26');
INSERT INTO `ke_date` VALUES ('2016-10-27');
INSERT INTO `ke_date` VALUES ('2016-10-28');
INSERT INTO `ke_date` VALUES ('2016-10-29');
INSERT INTO `ke_date` VALUES ('2016-10-30');
INSERT INTO `ke_date` VALUES ('2016-10-31');
INSERT INTO `ke_date` VALUES ('2016-11-01');
INSERT INTO `ke_date` VALUES ('2016-11-02');
INSERT INTO `ke_date` VALUES ('2016-11-03');
INSERT INTO `ke_date` VALUES ('2016-11-04');
INSERT INTO `ke_date` VALUES ('2016-11-05');
INSERT INTO `ke_date` VALUES ('2016-11-06');
INSERT INTO `ke_date` VALUES ('2016-11-07');
INSERT INTO `ke_date` VALUES ('2016-11-08');
INSERT INTO `ke_date` VALUES ('2016-11-09');
INSERT INTO `ke_date` VALUES ('2016-11-10');
INSERT INTO `ke_date` VALUES ('2016-11-11');
INSERT INTO `ke_date` VALUES ('2016-11-12');
INSERT INTO `ke_date` VALUES ('2016-11-13');
INSERT INTO `ke_date` VALUES ('2016-11-14');
INSERT INTO `ke_date` VALUES ('2016-11-15');
INSERT INTO `ke_date` VALUES ('2016-11-16');
INSERT INTO `ke_date` VALUES ('2016-11-17');
INSERT INTO `ke_date` VALUES ('2016-11-18');
INSERT INTO `ke_date` VALUES ('2016-11-19');
INSERT INTO `ke_date` VALUES ('2016-11-20');
INSERT INTO `ke_date` VALUES ('2016-11-21');
INSERT INTO `ke_date` VALUES ('2016-11-22');
INSERT INTO `ke_date` VALUES ('2016-11-23');
INSERT INTO `ke_date` VALUES ('2016-11-24');
INSERT INTO `ke_date` VALUES ('2016-11-25');
INSERT INTO `ke_date` VALUES ('2016-11-26');
INSERT INTO `ke_date` VALUES ('2016-11-27');
INSERT INTO `ke_date` VALUES ('2016-11-28');
INSERT INTO `ke_date` VALUES ('2016-11-29');
INSERT INTO `ke_date` VALUES ('2016-11-30');
INSERT INTO `ke_date` VALUES ('2016-12-01');
INSERT INTO `ke_date` VALUES ('2016-12-02');
INSERT INTO `ke_date` VALUES ('2016-12-03');
INSERT INTO `ke_date` VALUES ('2016-12-04');
INSERT INTO `ke_date` VALUES ('2016-12-05');
INSERT INTO `ke_date` VALUES ('2016-12-06');
INSERT INTO `ke_date` VALUES ('2016-12-07');
INSERT INTO `ke_date` VALUES ('2016-12-08');
INSERT INTO `ke_date` VALUES ('2016-12-09');
INSERT INTO `ke_date` VALUES ('2016-12-10');
INSERT INTO `ke_date` VALUES ('2016-12-11');
INSERT INTO `ke_date` VALUES ('2016-12-12');
INSERT INTO `ke_date` VALUES ('2016-12-13');
INSERT INTO `ke_date` VALUES ('2016-12-14');
INSERT INTO `ke_date` VALUES ('2016-12-15');
INSERT INTO `ke_date` VALUES ('2016-12-16');
INSERT INTO `ke_date` VALUES ('2016-12-17');
INSERT INTO `ke_date` VALUES ('2016-12-18');
INSERT INTO `ke_date` VALUES ('2016-12-19');
INSERT INTO `ke_date` VALUES ('2016-12-20');
INSERT INTO `ke_date` VALUES ('2016-12-21');
INSERT INTO `ke_date` VALUES ('2016-12-22');
INSERT INTO `ke_date` VALUES ('2016-12-23');
INSERT INTO `ke_date` VALUES ('2016-12-24');
INSERT INTO `ke_date` VALUES ('2016-12-25');
INSERT INTO `ke_date` VALUES ('2016-12-26');
INSERT INTO `ke_date` VALUES ('2016-12-27');
INSERT INTO `ke_date` VALUES ('2016-12-28');
INSERT INTO `ke_date` VALUES ('2016-12-29');
INSERT INTO `ke_date` VALUES ('2016-12-30');
INSERT INTO `ke_date` VALUES ('2016-12-31');
INSERT INTO `ke_date` VALUES ('2017-01-01');
INSERT INTO `ke_date` VALUES ('2017-01-02');
INSERT INTO `ke_date` VALUES ('2017-01-03');
INSERT INTO `ke_date` VALUES ('2017-01-04');
INSERT INTO `ke_date` VALUES ('2017-01-05');
INSERT INTO `ke_date` VALUES ('2017-01-06');
INSERT INTO `ke_date` VALUES ('2017-01-07');
INSERT INTO `ke_date` VALUES ('2017-01-08');
INSERT INTO `ke_date` VALUES ('2017-01-09');
INSERT INTO `ke_date` VALUES ('2017-01-10');
INSERT INTO `ke_date` VALUES ('2017-01-11');
INSERT INTO `ke_date` VALUES ('2017-01-12');
INSERT INTO `ke_date` VALUES ('2017-01-13');
INSERT INTO `ke_date` VALUES ('2017-01-14');
INSERT INTO `ke_date` VALUES ('2017-01-15');
INSERT INTO `ke_date` VALUES ('2017-01-16');
INSERT INTO `ke_date` VALUES ('2017-01-17');
INSERT INTO `ke_date` VALUES ('2017-01-18');
INSERT INTO `ke_date` VALUES ('2017-01-19');
INSERT INTO `ke_date` VALUES ('2017-01-20');
INSERT INTO `ke_date` VALUES ('2017-01-21');
INSERT INTO `ke_date` VALUES ('2017-01-22');
INSERT INTO `ke_date` VALUES ('2017-01-23');
INSERT INTO `ke_date` VALUES ('2017-01-24');
INSERT INTO `ke_date` VALUES ('2017-01-25');
INSERT INTO `ke_date` VALUES ('2017-01-26');
INSERT INTO `ke_date` VALUES ('2017-01-27');
INSERT INTO `ke_date` VALUES ('2017-01-28');
INSERT INTO `ke_date` VALUES ('2017-01-29');
INSERT INTO `ke_date` VALUES ('2017-01-30');
INSERT INTO `ke_date` VALUES ('2017-01-31');
INSERT INTO `ke_date` VALUES ('2017-02-01');
INSERT INTO `ke_date` VALUES ('2017-02-02');
INSERT INTO `ke_date` VALUES ('2017-02-03');
INSERT INTO `ke_date` VALUES ('2017-02-04');
INSERT INTO `ke_date` VALUES ('2017-02-05');
INSERT INTO `ke_date` VALUES ('2017-02-06');
INSERT INTO `ke_date` VALUES ('2017-02-07');
INSERT INTO `ke_date` VALUES ('2017-02-08');
INSERT INTO `ke_date` VALUES ('2017-02-09');
INSERT INTO `ke_date` VALUES ('2017-02-10');
INSERT INTO `ke_date` VALUES ('2017-02-11');
INSERT INTO `ke_date` VALUES ('2017-02-12');
INSERT INTO `ke_date` VALUES ('2017-02-13');
INSERT INTO `ke_date` VALUES ('2017-02-14');
INSERT INTO `ke_date` VALUES ('2017-02-15');
INSERT INTO `ke_date` VALUES ('2017-02-16');
INSERT INTO `ke_date` VALUES ('2017-02-17');
INSERT INTO `ke_date` VALUES ('2017-02-18');
INSERT INTO `ke_date` VALUES ('2017-02-19');
INSERT INTO `ke_date` VALUES ('2017-02-20');
INSERT INTO `ke_date` VALUES ('2017-02-21');
INSERT INTO `ke_date` VALUES ('2017-02-22');
INSERT INTO `ke_date` VALUES ('2017-02-23');
INSERT INTO `ke_date` VALUES ('2017-02-24');
INSERT INTO `ke_date` VALUES ('2017-02-25');
INSERT INTO `ke_date` VALUES ('2017-02-26');
INSERT INTO `ke_date` VALUES ('2017-02-27');
INSERT INTO `ke_date` VALUES ('2017-02-28');
INSERT INTO `ke_date` VALUES ('2017-03-01');
INSERT INTO `ke_date` VALUES ('2017-03-02');
INSERT INTO `ke_date` VALUES ('2017-03-03');
INSERT INTO `ke_date` VALUES ('2017-03-04');
INSERT INTO `ke_date` VALUES ('2017-03-05');
INSERT INTO `ke_date` VALUES ('2017-03-06');
INSERT INTO `ke_date` VALUES ('2017-03-07');
INSERT INTO `ke_date` VALUES ('2017-03-08');
INSERT INTO `ke_date` VALUES ('2017-03-09');
INSERT INTO `ke_date` VALUES ('2017-03-10');
INSERT INTO `ke_date` VALUES ('2017-03-11');
INSERT INTO `ke_date` VALUES ('2017-03-12');
INSERT INTO `ke_date` VALUES ('2017-03-13');
INSERT INTO `ke_date` VALUES ('2017-03-14');
INSERT INTO `ke_date` VALUES ('2017-03-15');
INSERT INTO `ke_date` VALUES ('2017-03-16');
INSERT INTO `ke_date` VALUES ('2017-03-17');
INSERT INTO `ke_date` VALUES ('2017-03-18');
INSERT INTO `ke_date` VALUES ('2017-03-19');
INSERT INTO `ke_date` VALUES ('2017-03-20');
INSERT INTO `ke_date` VALUES ('2017-03-21');
INSERT INTO `ke_date` VALUES ('2017-03-22');
INSERT INTO `ke_date` VALUES ('2017-03-23');
INSERT INTO `ke_date` VALUES ('2017-03-24');
INSERT INTO `ke_date` VALUES ('2017-03-25');
INSERT INTO `ke_date` VALUES ('2017-03-26');
INSERT INTO `ke_date` VALUES ('2017-03-27');
INSERT INTO `ke_date` VALUES ('2017-03-28');
INSERT INTO `ke_date` VALUES ('2017-03-29');
INSERT INTO `ke_date` VALUES ('2017-03-30');
INSERT INTO `ke_date` VALUES ('2017-03-31');
INSERT INTO `ke_date` VALUES ('2017-04-01');
INSERT INTO `ke_date` VALUES ('2017-04-02');
INSERT INTO `ke_date` VALUES ('2017-04-03');
INSERT INTO `ke_date` VALUES ('2017-04-04');
INSERT INTO `ke_date` VALUES ('2017-04-05');
INSERT INTO `ke_date` VALUES ('2017-04-06');
INSERT INTO `ke_date` VALUES ('2017-04-07');
INSERT INTO `ke_date` VALUES ('2017-04-08');
INSERT INTO `ke_date` VALUES ('2017-04-09');
INSERT INTO `ke_date` VALUES ('2017-04-10');
INSERT INTO `ke_date` VALUES ('2017-04-11');
INSERT INTO `ke_date` VALUES ('2017-04-12');
INSERT INTO `ke_date` VALUES ('2017-04-13');
INSERT INTO `ke_date` VALUES ('2017-04-14');
INSERT INTO `ke_date` VALUES ('2017-04-15');
INSERT INTO `ke_date` VALUES ('2017-04-16');
INSERT INTO `ke_date` VALUES ('2017-04-17');
INSERT INTO `ke_date` VALUES ('2017-04-18');
INSERT INTO `ke_date` VALUES ('2017-04-19');
INSERT INTO `ke_date` VALUES ('2017-04-20');
INSERT INTO `ke_date` VALUES ('2017-04-21');
INSERT INTO `ke_date` VALUES ('2017-04-22');
INSERT INTO `ke_date` VALUES ('2017-04-23');
INSERT INTO `ke_date` VALUES ('2017-04-24');
INSERT INTO `ke_date` VALUES ('2017-04-25');
INSERT INTO `ke_date` VALUES ('2017-04-26');
INSERT INTO `ke_date` VALUES ('2017-04-27');
INSERT INTO `ke_date` VALUES ('2017-04-28');
INSERT INTO `ke_date` VALUES ('2017-04-29');
INSERT INTO `ke_date` VALUES ('2017-04-30');
INSERT INTO `ke_date` VALUES ('2017-05-01');
INSERT INTO `ke_date` VALUES ('2017-05-02');
INSERT INTO `ke_date` VALUES ('2017-05-03');
INSERT INTO `ke_date` VALUES ('2017-05-04');
INSERT INTO `ke_date` VALUES ('2017-05-05');
INSERT INTO `ke_date` VALUES ('2017-05-06');
INSERT INTO `ke_date` VALUES ('2017-05-07');
INSERT INTO `ke_date` VALUES ('2017-05-08');
INSERT INTO `ke_date` VALUES ('2017-05-09');
INSERT INTO `ke_date` VALUES ('2017-05-10');
INSERT INTO `ke_date` VALUES ('2017-05-11');
INSERT INTO `ke_date` VALUES ('2017-05-12');
INSERT INTO `ke_date` VALUES ('2017-05-13');
INSERT INTO `ke_date` VALUES ('2017-05-14');
INSERT INTO `ke_date` VALUES ('2017-05-15');
INSERT INTO `ke_date` VALUES ('2017-05-16');
INSERT INTO `ke_date` VALUES ('2017-05-17');
INSERT INTO `ke_date` VALUES ('2017-05-18');
INSERT INTO `ke_date` VALUES ('2017-05-19');
INSERT INTO `ke_date` VALUES ('2017-05-20');
INSERT INTO `ke_date` VALUES ('2017-05-21');
INSERT INTO `ke_date` VALUES ('2017-05-22');
INSERT INTO `ke_date` VALUES ('2017-05-23');
INSERT INTO `ke_date` VALUES ('2017-05-24');
INSERT INTO `ke_date` VALUES ('2017-05-25');
INSERT INTO `ke_date` VALUES ('2017-05-26');
INSERT INTO `ke_date` VALUES ('2017-05-27');
INSERT INTO `ke_date` VALUES ('2017-05-28');
INSERT INTO `ke_date` VALUES ('2017-05-29');
INSERT INTO `ke_date` VALUES ('2017-05-30');
INSERT INTO `ke_date` VALUES ('2017-05-31');
INSERT INTO `ke_date` VALUES ('2017-06-01');
INSERT INTO `ke_date` VALUES ('2017-06-02');
INSERT INTO `ke_date` VALUES ('2017-06-03');
INSERT INTO `ke_date` VALUES ('2017-06-04');
INSERT INTO `ke_date` VALUES ('2017-06-05');
INSERT INTO `ke_date` VALUES ('2017-06-06');
INSERT INTO `ke_date` VALUES ('2017-06-07');
INSERT INTO `ke_date` VALUES ('2017-06-08');
INSERT INTO `ke_date` VALUES ('2017-06-09');
INSERT INTO `ke_date` VALUES ('2017-06-10');
INSERT INTO `ke_date` VALUES ('2017-06-11');
INSERT INTO `ke_date` VALUES ('2017-06-12');
INSERT INTO `ke_date` VALUES ('2017-06-13');
INSERT INTO `ke_date` VALUES ('2017-06-14');
INSERT INTO `ke_date` VALUES ('2017-06-15');
INSERT INTO `ke_date` VALUES ('2017-06-16');
INSERT INTO `ke_date` VALUES ('2017-06-17');
INSERT INTO `ke_date` VALUES ('2017-06-18');
INSERT INTO `ke_date` VALUES ('2017-06-19');
INSERT INTO `ke_date` VALUES ('2017-06-20');
INSERT INTO `ke_date` VALUES ('2017-06-21');
INSERT INTO `ke_date` VALUES ('2017-06-22');
INSERT INTO `ke_date` VALUES ('2017-06-23');
INSERT INTO `ke_date` VALUES ('2017-06-24');
INSERT INTO `ke_date` VALUES ('2017-06-25');
INSERT INTO `ke_date` VALUES ('2017-06-26');
INSERT INTO `ke_date` VALUES ('2017-06-27');
INSERT INTO `ke_date` VALUES ('2017-06-28');
INSERT INTO `ke_date` VALUES ('2017-06-29');
INSERT INTO `ke_date` VALUES ('2017-06-30');
INSERT INTO `ke_date` VALUES ('2017-07-01');
INSERT INTO `ke_date` VALUES ('2017-07-02');
INSERT INTO `ke_date` VALUES ('2017-07-03');
INSERT INTO `ke_date` VALUES ('2017-07-04');
INSERT INTO `ke_date` VALUES ('2017-07-05');
INSERT INTO `ke_date` VALUES ('2017-07-06');
INSERT INTO `ke_date` VALUES ('2017-07-07');
INSERT INTO `ke_date` VALUES ('2017-07-08');
INSERT INTO `ke_date` VALUES ('2017-07-09');
INSERT INTO `ke_date` VALUES ('2017-07-10');
INSERT INTO `ke_date` VALUES ('2017-07-11');
INSERT INTO `ke_date` VALUES ('2017-07-12');
INSERT INTO `ke_date` VALUES ('2017-07-13');
INSERT INTO `ke_date` VALUES ('2017-07-14');
INSERT INTO `ke_date` VALUES ('2017-07-15');
INSERT INTO `ke_date` VALUES ('2017-07-16');
INSERT INTO `ke_date` VALUES ('2017-07-17');
INSERT INTO `ke_date` VALUES ('2017-07-18');
INSERT INTO `ke_date` VALUES ('2017-07-19');
INSERT INTO `ke_date` VALUES ('2017-07-20');
INSERT INTO `ke_date` VALUES ('2017-07-21');
INSERT INTO `ke_date` VALUES ('2017-07-22');
INSERT INTO `ke_date` VALUES ('2017-07-23');
INSERT INTO `ke_date` VALUES ('2017-07-24');
INSERT INTO `ke_date` VALUES ('2017-07-25');
INSERT INTO `ke_date` VALUES ('2017-07-26');
INSERT INTO `ke_date` VALUES ('2017-07-27');
INSERT INTO `ke_date` VALUES ('2017-07-28');
INSERT INTO `ke_date` VALUES ('2017-07-29');
INSERT INTO `ke_date` VALUES ('2017-07-30');
INSERT INTO `ke_date` VALUES ('2017-07-31');
INSERT INTO `ke_date` VALUES ('2017-08-01');
INSERT INTO `ke_date` VALUES ('2017-08-02');
INSERT INTO `ke_date` VALUES ('2017-08-03');
INSERT INTO `ke_date` VALUES ('2017-08-04');
INSERT INTO `ke_date` VALUES ('2017-08-05');
INSERT INTO `ke_date` VALUES ('2017-08-06');
INSERT INTO `ke_date` VALUES ('2017-08-07');
INSERT INTO `ke_date` VALUES ('2017-08-08');
INSERT INTO `ke_date` VALUES ('2017-08-09');
INSERT INTO `ke_date` VALUES ('2017-08-10');
INSERT INTO `ke_date` VALUES ('2017-08-11');
INSERT INTO `ke_date` VALUES ('2017-08-12');
INSERT INTO `ke_date` VALUES ('2017-08-13');
INSERT INTO `ke_date` VALUES ('2017-08-14');
INSERT INTO `ke_date` VALUES ('2017-08-15');
INSERT INTO `ke_date` VALUES ('2017-08-16');
INSERT INTO `ke_date` VALUES ('2017-08-17');
INSERT INTO `ke_date` VALUES ('2017-08-18');
INSERT INTO `ke_date` VALUES ('2017-08-19');
INSERT INTO `ke_date` VALUES ('2017-08-20');
INSERT INTO `ke_date` VALUES ('2017-08-21');
INSERT INTO `ke_date` VALUES ('2017-08-22');
INSERT INTO `ke_date` VALUES ('2017-08-23');
INSERT INTO `ke_date` VALUES ('2017-08-24');
INSERT INTO `ke_date` VALUES ('2017-08-25');
INSERT INTO `ke_date` VALUES ('2017-08-26');
INSERT INTO `ke_date` VALUES ('2017-08-27');
INSERT INTO `ke_date` VALUES ('2017-08-28');
INSERT INTO `ke_date` VALUES ('2017-08-29');
INSERT INTO `ke_date` VALUES ('2017-08-30');
INSERT INTO `ke_date` VALUES ('2017-08-31');
INSERT INTO `ke_date` VALUES ('2017-09-01');
INSERT INTO `ke_date` VALUES ('2017-09-02');
INSERT INTO `ke_date` VALUES ('2017-09-03');
INSERT INTO `ke_date` VALUES ('2017-09-04');
INSERT INTO `ke_date` VALUES ('2017-09-05');
INSERT INTO `ke_date` VALUES ('2017-09-06');
INSERT INTO `ke_date` VALUES ('2017-09-07');
INSERT INTO `ke_date` VALUES ('2017-09-08');
INSERT INTO `ke_date` VALUES ('2017-09-09');
INSERT INTO `ke_date` VALUES ('2017-09-10');
INSERT INTO `ke_date` VALUES ('2017-09-11');
INSERT INTO `ke_date` VALUES ('2017-09-12');
INSERT INTO `ke_date` VALUES ('2017-09-13');
INSERT INTO `ke_date` VALUES ('2017-09-14');
INSERT INTO `ke_date` VALUES ('2017-09-15');
INSERT INTO `ke_date` VALUES ('2017-09-16');
INSERT INTO `ke_date` VALUES ('2017-09-17');
INSERT INTO `ke_date` VALUES ('2017-09-18');
INSERT INTO `ke_date` VALUES ('2017-09-19');
INSERT INTO `ke_date` VALUES ('2017-09-20');
INSERT INTO `ke_date` VALUES ('2017-09-21');
INSERT INTO `ke_date` VALUES ('2017-09-22');
INSERT INTO `ke_date` VALUES ('2017-09-23');
INSERT INTO `ke_date` VALUES ('2017-09-24');
INSERT INTO `ke_date` VALUES ('2017-09-25');
INSERT INTO `ke_date` VALUES ('2017-09-26');
INSERT INTO `ke_date` VALUES ('2017-09-27');
INSERT INTO `ke_date` VALUES ('2017-09-28');
INSERT INTO `ke_date` VALUES ('2017-09-29');
INSERT INTO `ke_date` VALUES ('2017-09-30');
INSERT INTO `ke_date` VALUES ('2017-10-01');
INSERT INTO `ke_date` VALUES ('2017-10-02');
INSERT INTO `ke_date` VALUES ('2017-10-03');
INSERT INTO `ke_date` VALUES ('2017-10-04');
INSERT INTO `ke_date` VALUES ('2017-10-05');
INSERT INTO `ke_date` VALUES ('2017-10-06');
INSERT INTO `ke_date` VALUES ('2017-10-07');
INSERT INTO `ke_date` VALUES ('2017-10-08');
INSERT INTO `ke_date` VALUES ('2017-10-09');
INSERT INTO `ke_date` VALUES ('2017-10-10');
INSERT INTO `ke_date` VALUES ('2017-10-11');
INSERT INTO `ke_date` VALUES ('2017-10-12');
INSERT INTO `ke_date` VALUES ('2017-10-13');
INSERT INTO `ke_date` VALUES ('2017-10-14');
INSERT INTO `ke_date` VALUES ('2017-10-15');
INSERT INTO `ke_date` VALUES ('2017-10-16');
INSERT INTO `ke_date` VALUES ('2017-10-17');
INSERT INTO `ke_date` VALUES ('2017-10-18');
INSERT INTO `ke_date` VALUES ('2017-10-19');
INSERT INTO `ke_date` VALUES ('2017-10-20');
INSERT INTO `ke_date` VALUES ('2017-10-21');
INSERT INTO `ke_date` VALUES ('2017-10-22');
INSERT INTO `ke_date` VALUES ('2017-10-23');
INSERT INTO `ke_date` VALUES ('2017-10-24');
INSERT INTO `ke_date` VALUES ('2017-10-25');
INSERT INTO `ke_date` VALUES ('2017-10-26');
INSERT INTO `ke_date` VALUES ('2017-10-27');
INSERT INTO `ke_date` VALUES ('2017-10-28');
INSERT INTO `ke_date` VALUES ('2017-10-29');
INSERT INTO `ke_date` VALUES ('2017-10-30');
INSERT INTO `ke_date` VALUES ('2017-10-31');
INSERT INTO `ke_date` VALUES ('2017-11-01');
INSERT INTO `ke_date` VALUES ('2017-11-02');
INSERT INTO `ke_date` VALUES ('2017-11-03');
INSERT INTO `ke_date` VALUES ('2017-11-04');
INSERT INTO `ke_date` VALUES ('2017-11-05');
INSERT INTO `ke_date` VALUES ('2017-11-06');
INSERT INTO `ke_date` VALUES ('2017-11-07');
INSERT INTO `ke_date` VALUES ('2017-11-08');
INSERT INTO `ke_date` VALUES ('2017-11-09');
INSERT INTO `ke_date` VALUES ('2017-11-10');
INSERT INTO `ke_date` VALUES ('2017-11-11');
INSERT INTO `ke_date` VALUES ('2017-11-12');
INSERT INTO `ke_date` VALUES ('2017-11-13');
INSERT INTO `ke_date` VALUES ('2017-11-14');
INSERT INTO `ke_date` VALUES ('2017-11-15');
INSERT INTO `ke_date` VALUES ('2017-11-16');
INSERT INTO `ke_date` VALUES ('2017-11-17');
INSERT INTO `ke_date` VALUES ('2017-11-18');
INSERT INTO `ke_date` VALUES ('2017-11-19');
INSERT INTO `ke_date` VALUES ('2017-11-20');
INSERT INTO `ke_date` VALUES ('2017-11-21');
INSERT INTO `ke_date` VALUES ('2017-11-22');
INSERT INTO `ke_date` VALUES ('2017-11-23');
INSERT INTO `ke_date` VALUES ('2017-11-24');
INSERT INTO `ke_date` VALUES ('2017-11-25');
INSERT INTO `ke_date` VALUES ('2017-11-26');
INSERT INTO `ke_date` VALUES ('2017-11-27');
INSERT INTO `ke_date` VALUES ('2017-11-28');
INSERT INTO `ke_date` VALUES ('2017-11-29');
INSERT INTO `ke_date` VALUES ('2017-11-30');
INSERT INTO `ke_date` VALUES ('2017-12-01');
INSERT INTO `ke_date` VALUES ('2017-12-02');
INSERT INTO `ke_date` VALUES ('2017-12-03');
INSERT INTO `ke_date` VALUES ('2017-12-04');
INSERT INTO `ke_date` VALUES ('2017-12-05');
INSERT INTO `ke_date` VALUES ('2017-12-06');
INSERT INTO `ke_date` VALUES ('2017-12-07');
INSERT INTO `ke_date` VALUES ('2017-12-08');
INSERT INTO `ke_date` VALUES ('2017-12-09');
INSERT INTO `ke_date` VALUES ('2017-12-10');
INSERT INTO `ke_date` VALUES ('2017-12-11');
INSERT INTO `ke_date` VALUES ('2017-12-12');
INSERT INTO `ke_date` VALUES ('2017-12-13');
INSERT INTO `ke_date` VALUES ('2017-12-14');
INSERT INTO `ke_date` VALUES ('2017-12-15');
INSERT INTO `ke_date` VALUES ('2017-12-16');
INSERT INTO `ke_date` VALUES ('2017-12-17');
INSERT INTO `ke_date` VALUES ('2017-12-18');
INSERT INTO `ke_date` VALUES ('2017-12-19');
INSERT INTO `ke_date` VALUES ('2017-12-20');
INSERT INTO `ke_date` VALUES ('2017-12-21');
INSERT INTO `ke_date` VALUES ('2017-12-22');
INSERT INTO `ke_date` VALUES ('2017-12-23');
INSERT INTO `ke_date` VALUES ('2017-12-24');
INSERT INTO `ke_date` VALUES ('2017-12-25');
INSERT INTO `ke_date` VALUES ('2017-12-26');
INSERT INTO `ke_date` VALUES ('2017-12-27');
INSERT INTO `ke_date` VALUES ('2017-12-28');
INSERT INTO `ke_date` VALUES ('2017-12-29');
INSERT INTO `ke_date` VALUES ('2017-12-30');
INSERT INTO `ke_date` VALUES ('2017-12-31');
INSERT INTO `ke_date` VALUES ('2018-01-01');
INSERT INTO `ke_date` VALUES ('2018-01-02');
INSERT INTO `ke_date` VALUES ('2018-01-03');
INSERT INTO `ke_date` VALUES ('2018-01-04');
INSERT INTO `ke_date` VALUES ('2018-01-05');
INSERT INTO `ke_date` VALUES ('2018-01-06');
INSERT INTO `ke_date` VALUES ('2018-01-07');
INSERT INTO `ke_date` VALUES ('2018-01-08');
INSERT INTO `ke_date` VALUES ('2018-01-09');
INSERT INTO `ke_date` VALUES ('2018-01-10');
INSERT INTO `ke_date` VALUES ('2018-01-11');
INSERT INTO `ke_date` VALUES ('2018-01-12');
INSERT INTO `ke_date` VALUES ('2018-01-13');
INSERT INTO `ke_date` VALUES ('2018-01-14');
INSERT INTO `ke_date` VALUES ('2018-01-15');
INSERT INTO `ke_date` VALUES ('2018-01-16');
INSERT INTO `ke_date` VALUES ('2018-01-17');
INSERT INTO `ke_date` VALUES ('2018-01-18');
INSERT INTO `ke_date` VALUES ('2018-01-19');
INSERT INTO `ke_date` VALUES ('2018-01-20');
INSERT INTO `ke_date` VALUES ('2018-01-21');
INSERT INTO `ke_date` VALUES ('2018-01-22');
INSERT INTO `ke_date` VALUES ('2018-01-23');
INSERT INTO `ke_date` VALUES ('2018-01-24');
INSERT INTO `ke_date` VALUES ('2018-01-25');
INSERT INTO `ke_date` VALUES ('2018-01-26');
INSERT INTO `ke_date` VALUES ('2018-01-27');
INSERT INTO `ke_date` VALUES ('2018-01-28');
INSERT INTO `ke_date` VALUES ('2018-01-29');
INSERT INTO `ke_date` VALUES ('2018-01-30');
INSERT INTO `ke_date` VALUES ('2018-01-31');
INSERT INTO `ke_date` VALUES ('2018-02-01');
INSERT INTO `ke_date` VALUES ('2018-02-02');
INSERT INTO `ke_date` VALUES ('2018-02-03');
INSERT INTO `ke_date` VALUES ('2018-02-04');
INSERT INTO `ke_date` VALUES ('2018-02-05');
INSERT INTO `ke_date` VALUES ('2018-02-06');
INSERT INTO `ke_date` VALUES ('2018-02-07');
INSERT INTO `ke_date` VALUES ('2018-02-08');
INSERT INTO `ke_date` VALUES ('2018-02-09');
INSERT INTO `ke_date` VALUES ('2018-02-10');
INSERT INTO `ke_date` VALUES ('2018-02-11');
INSERT INTO `ke_date` VALUES ('2018-02-12');
INSERT INTO `ke_date` VALUES ('2018-02-13');
INSERT INTO `ke_date` VALUES ('2018-02-14');
INSERT INTO `ke_date` VALUES ('2018-02-15');
INSERT INTO `ke_date` VALUES ('2018-02-16');
INSERT INTO `ke_date` VALUES ('2018-02-17');
INSERT INTO `ke_date` VALUES ('2018-02-18');
INSERT INTO `ke_date` VALUES ('2018-02-19');
INSERT INTO `ke_date` VALUES ('2018-02-20');
INSERT INTO `ke_date` VALUES ('2018-02-21');
INSERT INTO `ke_date` VALUES ('2018-02-22');
INSERT INTO `ke_date` VALUES ('2018-02-23');
INSERT INTO `ke_date` VALUES ('2018-02-24');
INSERT INTO `ke_date` VALUES ('2018-02-25');
INSERT INTO `ke_date` VALUES ('2018-02-26');
INSERT INTO `ke_date` VALUES ('2018-02-27');
INSERT INTO `ke_date` VALUES ('2018-02-28');
INSERT INTO `ke_date` VALUES ('2018-03-01');
INSERT INTO `ke_date` VALUES ('2018-03-02');
INSERT INTO `ke_date` VALUES ('2018-03-03');
INSERT INTO `ke_date` VALUES ('2018-03-04');
INSERT INTO `ke_date` VALUES ('2018-03-05');
INSERT INTO `ke_date` VALUES ('2018-03-06');
INSERT INTO `ke_date` VALUES ('2018-03-07');
INSERT INTO `ke_date` VALUES ('2018-03-08');
INSERT INTO `ke_date` VALUES ('2018-03-09');
INSERT INTO `ke_date` VALUES ('2018-03-10');
INSERT INTO `ke_date` VALUES ('2018-03-11');
INSERT INTO `ke_date` VALUES ('2018-03-12');
INSERT INTO `ke_date` VALUES ('2018-03-13');
INSERT INTO `ke_date` VALUES ('2018-03-14');
INSERT INTO `ke_date` VALUES ('2018-03-15');
INSERT INTO `ke_date` VALUES ('2018-03-16');
INSERT INTO `ke_date` VALUES ('2018-03-17');
INSERT INTO `ke_date` VALUES ('2018-03-18');
INSERT INTO `ke_date` VALUES ('2018-03-19');
INSERT INTO `ke_date` VALUES ('2018-03-20');
INSERT INTO `ke_date` VALUES ('2018-03-21');
INSERT INTO `ke_date` VALUES ('2018-03-22');
INSERT INTO `ke_date` VALUES ('2018-03-23');
INSERT INTO `ke_date` VALUES ('2018-03-24');
INSERT INTO `ke_date` VALUES ('2018-03-25');
INSERT INTO `ke_date` VALUES ('2018-03-26');
INSERT INTO `ke_date` VALUES ('2018-03-27');
INSERT INTO `ke_date` VALUES ('2018-03-28');
INSERT INTO `ke_date` VALUES ('2018-03-29');
INSERT INTO `ke_date` VALUES ('2018-03-30');
INSERT INTO `ke_date` VALUES ('2018-03-31');
INSERT INTO `ke_date` VALUES ('2018-04-01');
INSERT INTO `ke_date` VALUES ('2018-04-02');
INSERT INTO `ke_date` VALUES ('2018-04-03');
INSERT INTO `ke_date` VALUES ('2018-04-04');
INSERT INTO `ke_date` VALUES ('2018-04-05');
INSERT INTO `ke_date` VALUES ('2018-04-06');
INSERT INTO `ke_date` VALUES ('2018-04-07');
INSERT INTO `ke_date` VALUES ('2018-04-08');
INSERT INTO `ke_date` VALUES ('2018-04-09');
INSERT INTO `ke_date` VALUES ('2018-04-10');
INSERT INTO `ke_date` VALUES ('2018-04-11');
INSERT INTO `ke_date` VALUES ('2018-04-12');
INSERT INTO `ke_date` VALUES ('2018-04-13');
INSERT INTO `ke_date` VALUES ('2018-04-14');
INSERT INTO `ke_date` VALUES ('2018-04-15');
INSERT INTO `ke_date` VALUES ('2018-04-16');
INSERT INTO `ke_date` VALUES ('2018-04-17');
INSERT INTO `ke_date` VALUES ('2018-04-18');
INSERT INTO `ke_date` VALUES ('2018-04-19');
INSERT INTO `ke_date` VALUES ('2018-04-20');
INSERT INTO `ke_date` VALUES ('2018-04-21');
INSERT INTO `ke_date` VALUES ('2018-04-22');
INSERT INTO `ke_date` VALUES ('2018-04-23');
INSERT INTO `ke_date` VALUES ('2018-04-24');
INSERT INTO `ke_date` VALUES ('2018-04-25');
INSERT INTO `ke_date` VALUES ('2018-04-26');
INSERT INTO `ke_date` VALUES ('2018-04-27');

-- ----------------------------
-- Table structure for ke_device
-- ----------------------------
DROP TABLE IF EXISTS `ke_device`;
CREATE TABLE `ke_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户ID',
  `device_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备号',
  `system_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备类型(0iPhone、1Android)',
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型:0学生,1老师',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_device
-- ----------------------------
INSERT INTO `ke_device` VALUES ('28', '18324373866', 'nodeviceid', '0', '1', '2017-03-02 15:32:29');
INSERT INTO `ke_device` VALUES ('29', '18324373866', 'nodeviceid', '0', '0', '2016-12-08 09:43:46');
INSERT INTO `ke_device` VALUES ('30', '18702103770', '1517bfd3f7c6f75d625', '0', '0', '2016-11-21 13:26:57');
INSERT INTO `ke_device` VALUES ('31', '13120683381', '1104a89792a76a3936e', '1', '0', '2016-12-08 10:39:38');
INSERT INTO `ke_device` VALUES ('32', '13120683381', '1a0018970aa80f68019', '1', '1', '2017-03-03 12:56:13');
INSERT INTO `ke_device` VALUES ('33', '18333333333', '1a1018970aa713352de', '0', '1', '2016-11-21 10:19:37');
INSERT INTO `ke_device` VALUES ('34', '13567615730', '1114a89792a722bc850', '0', '1', '2016-11-18 12:07:38');
INSERT INTO `ke_device` VALUES ('35', '13567626866', '13065ffa4e06f18a919', '1', '0', '2016-11-16 16:17:26');
INSERT INTO `ke_device` VALUES ('36', '15157891809', '13165ffa4e06f8c48cb', '0', '0', '2016-11-18 09:00:39');
INSERT INTO `ke_device` VALUES ('37', '13567615730', '141fe1da9ea5fbe6480', '0', '0', '2016-11-18 12:05:14');
INSERT INTO `ke_device` VALUES ('38', '15157891809', '1a0018970aa80680bbd', '1', '1', '2016-11-16 14:14:37');
INSERT INTO `ke_device` VALUES ('39', '13567626866', '140fe1da9ea5f37d3ee', '1', '1', '2016-11-16 16:18:24');
INSERT INTO `ke_device` VALUES ('40', '15168022179', '1a0018970aa80680bbd', '1', '1', '2016-11-17 18:59:31');
INSERT INTO `ke_device` VALUES ('41', '18702103770', 'nodeviceid', '0', '1', '2017-03-02 15:50:13');
INSERT INTO `ke_device` VALUES ('42', '13120813381', 'nodeviceid', '0', '1', '2017-03-02 15:37:39');
INSERT INTO `ke_device` VALUES ('43', '17621675208', '17621675208', '0', '1', '2017-08-30 17:51:05');

-- ----------------------------
-- Table structure for ke_err_info
-- ----------------------------
DROP TABLE IF EXISTS `ke_err_info`;
CREATE TABLE `ke_err_info` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `subject_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目:语，数，外',
  `content_err` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '错误内容',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_err_info
-- ----------------------------

-- ----------------------------
-- Table structure for ke_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ke_feedback`;
CREATE TABLE `ke_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户ID',
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '反馈内容',
  `type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '反馈信息类型(学生反馈:0,老师反馈:1)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for ke_fid_info
-- ----------------------------
DROP TABLE IF EXISTS `ke_fid_info`;
CREATE TABLE `ke_fid_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `free_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '免费码',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `count_pay` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被使用次数',
  `create_time` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_fid_info
-- ----------------------------

-- ----------------------------
-- Table structure for ke_first_sub
-- ----------------------------
DROP TABLE IF EXISTS `ke_first_sub`;
CREATE TABLE `ke_first_sub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `subject_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目:语，数，外',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师评语',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_first_sub
-- ----------------------------

-- ----------------------------
-- Table structure for ke_html
-- ----------------------------
DROP TABLE IF EXISTS `ke_html`;
CREATE TABLE `ke_html` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_type` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `share_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_html
-- ----------------------------
INSERT INTO `ke_html` VALUES ('1', 'kk106320170302150504655', '18324373866', '02', '2017-03-02 00:00:00', '2017-03-02 15:05:04', '2017-03-02 15:05:04');
INSERT INTO `ke_html` VALUES ('2', 'kk820420170302150615531', '18324373866', '02', '2017-03-02 00:00:00', '2017-03-02 15:06:15', '2017-03-02 15:06:15');
INSERT INTO `ke_html` VALUES ('3', 'kk862120170302152442337', '18324373866', '02', '2017-03-02 00:00:00', '2017-03-02 15:24:42', '2017-03-02 15:24:42');
INSERT INTO `ke_html` VALUES ('4', 'kk263920170302181755531', '13120683381', '02', '2017-03-02 00:00:00', '2017-03-02 18:17:55', '2017-03-02 18:17:55');
INSERT INTO `ke_html` VALUES ('5', 'kk436120170302182034396', '13120683381', '02', '2017-03-02 00:00:00', '2017-03-02 18:20:34', '2017-03-02 18:20:34');
INSERT INTO `ke_html` VALUES ('6', 'kk341820170302182350498', '13120683381', '02', '2017-03-02 00:00:00', '2017-03-02 18:23:50', '2017-03-02 18:23:50');
INSERT INTO `ke_html` VALUES ('7', 'kk905620170302182609312', '13120683381', '02', '2017-03-02 00:00:00', '2017-03-02 18:26:09', '2017-03-02 18:26:09');
INSERT INTO `ke_html` VALUES ('8', 'kk578320170302210022518', '13120683381', '02', '2017-03-02 00:00:00', '2017-03-02 21:00:22', '2017-03-02 21:00:22');
INSERT INTO `ke_html` VALUES ('9', 'kk213820170303091927770', '18324373866', '03', '2017-03-03 00:00:00', '2017-03-03 09:19:27', '2017-03-03 09:19:27');
INSERT INTO `ke_html` VALUES ('10', 'kk564120170303091948121', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 09:19:48', '2017-03-03 09:19:48');
INSERT INTO `ke_html` VALUES ('11', 'kk264020170303091959616', '18324373866', '02', '2017-03-03 00:00:00', '2017-03-03 09:19:59', '2017-03-03 09:19:59');
INSERT INTO `ke_html` VALUES ('12', 'kk56820170303103354695', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 10:33:54', '2017-03-03 10:33:54');
INSERT INTO `ke_html` VALUES ('13', 'kk13720170303103432755', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 10:34:32', '2017-03-03 10:34:32');
INSERT INTO `ke_html` VALUES ('14', 'kk604120170303103751827', '18324373866', '03', '2017-03-03 00:00:00', '2017-03-03 10:37:51', '2017-03-03 10:37:51');
INSERT INTO `ke_html` VALUES ('15', 'kk631220170303103809781', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 10:38:09', '2017-03-03 10:38:09');
INSERT INTO `ke_html` VALUES ('16', 'kk953620170303103828640', '18324373866', '02', '2017-03-03 00:00:00', '2017-03-03 10:38:28', '2017-03-03 10:38:28');
INSERT INTO `ke_html` VALUES ('17', 'kk295620170303104530020', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 10:45:30', '2017-03-03 10:45:30');
INSERT INTO `ke_html` VALUES ('18', 'kk916020170303145156004', '13120683381', '01', '2017-03-03 00:00:00', '2017-03-03 14:51:56', '2017-03-03 14:51:56');
INSERT INTO `ke_html` VALUES ('19', 'kk127620170303145248567', '13120683381', '01', '2017-03-03 00:00:00', '2017-03-03 14:52:48', '2017-03-03 14:52:48');
INSERT INTO `ke_html` VALUES ('20', 'kk21720170303155810758', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 15:58:10', '2017-03-03 15:58:10');
INSERT INTO `ke_html` VALUES ('21', 'kk761020170303171143755', '18324373866', '01', '2017-03-03 00:00:00', '2017-03-03 17:11:43', '2017-03-03 17:11:43');

-- ----------------------------
-- Table structure for ke_mark
-- ----------------------------
DROP TABLE IF EXISTS `ke_mark`;
CREATE TABLE `ke_mark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `photo_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作业照片ID',
  `group_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传作业组ID',
  `position_x` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记X坐标',
  `position_y` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记Y坐标',
  `direction` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记显示方向（1左、0右）',
  `result` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对或错:0错误、1正确',
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '错误原因',
  `resolvedFlag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解决状态:0:已解决，1:未解决',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23796 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_mark
-- ----------------------------
INSERT INTO `ke_mark` VALUES ('22591', '18324373866', '2016110816051319751683', '2016110801', '1678.661377', '2076.239258', '0', '1', '正确', '0', '2016-11-08 16:09:24');
INSERT INTO `ke_mark` VALUES ('22592', '18324373866', '2016110816051319751683', '2016110801', '1445.737061', '2401.529785', '0', '1', '正确', '0', '2016-11-08 16:09:24');
INSERT INTO `ke_mark` VALUES ('22593', '18324373866', '2016110816051319711683', '2016110801', '1774.956522', '2970.434783', '0', '1', '正确', '0', '2016-11-08 16:09:59');
INSERT INTO `ke_mark` VALUES ('22594', '18324373866', '2016110816051319741683', '2016110801', '1782.260870', '2600.347826', '0', '1', '正确', '0', '2016-11-08 16:10:06');
INSERT INTO `ke_mark` VALUES ('22595', '18324373866', '2016110816051319781683', '2016110801', '1664.605578', '1983.872510', '0', '1', '正确', '0', '2016-11-08 16:12:48');
INSERT INTO `ke_mark` VALUES ('22596', '18324373866', '2016110816051319781683', '2016110801', '1263.011952', '2540.079681', '0', '1', '正确', '0', '2016-11-08 16:12:48');
INSERT INTO `ke_mark` VALUES ('22597', '18324373866', '2016110816051319731683', '2016110801', '1919.617530', '2704.733068', '0', '1', '正确', '0', '2016-11-08 16:12:58');
INSERT INTO `ke_mark` VALUES ('22598', '18324373866', '2016110816051319701683', '2016110801', '1967.808838', '1835.282837', '0', '1', '正确', '0', '2016-11-08 16:13:14');
INSERT INTO `ke_mark` VALUES ('22599', '18324373866', '2016110816051319721683', '2016110801', '2007.968140', '2606.342529', '0', '1', '正确', '0', '2016-11-08 16:13:48');
INSERT INTO `ke_mark` VALUES ('22600', '18324373866', '2016110816051319771683', '2016110801', '1963.792829', '2781.035857', '0', '1', '正确', '0', '2016-11-08 16:14:02');
INSERT INTO `ke_mark` VALUES ('22601', '18324373866', '2016110816051319761683', '2016110801', '2269.003984', '2809.147410', '0', '1', '正确', '0', '2016-11-08 16:14:22');
INSERT INTO `ke_mark` VALUES ('22602', '18324373866', '2016110816431959385732', '2016110803', '1663.200000', '2182.950000', '0', '1', '正确', '0', '2016-11-08 16:50:19');
INSERT INTO `ke_mark` VALUES ('22603', '18324373866', '2016110816431959335732', '2016110803', '1599.652174', '2734.260870', '0', '1', '正确', '0', '2016-11-08 16:50:33');
INSERT INTO `ke_mark` VALUES ('22604', '18324373866', '2016110816431959315732', '2016110803', '975.872559', '2317.195312', '0', '1', '正确', '0', '2016-11-08 16:50:49');
INSERT INTO `ke_mark` VALUES ('22605', '18324373866', '2016110816431959325732', '2016110803', '1787.091633', '2538.071713', '0', '1', '正确', '0', '2016-11-08 16:51:05');
INSERT INTO `ke_mark` VALUES ('22606', '18324373866', '2016110816431959375732', '2016110803', '1710.788845', '2080.254980', '0', '1', '正确', '0', '2016-11-08 16:51:50');
INSERT INTO `ke_mark` VALUES ('22607', '18324373866', '2016110816431959355732', '2016110803', '2311.171315', '2493.896414', '0', '1', '正确', '0', '2016-11-08 17:10:44');
INSERT INTO `ke_mark` VALUES ('22608', '18324373866', '2016110816431959345732', '2016110803', '1847.330677', '2975.808765', '0', '1', '正确', '0', '2016-11-08 17:10:51');
INSERT INTO `ke_mark` VALUES ('22609', '18324373866', '2016110816431959365732', '2016110803', '748.972112', '2530.039841', '0', '1', '正确', '0', '2016-11-08 17:10:57');
INSERT INTO `ke_mark` VALUES ('22610', '18324373866', '2016110816431959305732', '2016110803', '1865.402390', '2544.095618', '0', '0', '拼写错误', '1', '2016-11-08 17:11:06');
INSERT INTO `ke_mark` VALUES ('22611', '18702103770', '2016110817225429008365', '2016110802', '893.545817', '2311.171315', '0', '1', '正确', '0', '2016-11-08 17:23:49');
INSERT INTO `ke_mark` VALUES ('22612', '18702103770', '2016110817225429008365', '2016110802', '2128.446215', '2150.533865', '0', '0', '问问老师', '1', '2016-11-08 17:23:49');
INSERT INTO `ke_mark` VALUES ('22613', '18324373866', '2016110817231372006934', '2016110802', '1082.294821', '2419.601594', '0', '1', '正确', '0', '2016-11-08 17:24:11');
INSERT INTO `ke_mark` VALUES ('22614', '13120683381', '2016110817300072008497', '2016110803', '997.960159', '2676.621514', '0', '1', '正确', '0', '2016-11-08 17:30:57');
INSERT INTO `ke_mark` VALUES ('22615', '18702103770', '2016110817301758904562', '2016110803', '923.665339', '2447.713147', '0', '1', '正确', '0', '2016-11-08 17:31:08');
INSERT INTO `ke_mark` VALUES ('22616', '18702103770', '2016110909421803700892', '2016110902', '1350.144928', '2006.492754', '0', '1', '正确', '0', '2016-11-09 09:43:27');
INSERT INTO `ke_mark` VALUES ('22617', '18702103770', '2016110909421803700892', '2016110902', '1220.057971', '2515.014493', '0', '1', '正确', '0', '2016-11-09 09:43:27');
INSERT INTO `ke_mark` VALUES ('22618', '18702103770', '2016110909421803700892', '2016110902', '1332.405797', '1564.985507', '0', '1', '正确', '0', '2016-11-09 09:43:27');
INSERT INTO `ke_mark` VALUES ('22619', '18702103770', '2016110909421803700892', '2016110902', '1606.376812', '1101.797101', '0', '0', '问问老师', '1', '2016-11-09 09:43:27');
INSERT INTO `ke_mark` VALUES ('22620', '18702103770', '2016110909421803700892', '2016110902', '1291.014493', '2885.565217', '0', '0', '问问老师', '1', '2016-11-09 09:43:27');
INSERT INTO `ke_mark` VALUES ('22621', '18702103770', '2016110909450542601409', '2016110903', '824.127490', '1184.988048', '0', '1', '正确', '0', '2016-11-09 09:45:30');
INSERT INTO `ke_mark` VALUES ('22622', '18702103770', '2016110909450542601409', '2016110903', '1396.302789', '799.745020', '0', '1', '正确', '0', '2016-11-09 09:45:30');
INSERT INTO `ke_mark` VALUES ('22623', '18702103770', '2016110909450542601409', '2016110903', '1430.438247', '2135.904382', '0', '0', '问问老师', '1', '2016-11-09 09:45:30');
INSERT INTO `ke_mark` VALUES ('22624', '13120683381', '2016110915120788306501', '2016110902', '1422.310757', '274.709163', '0', '1', '正确', '0', '2016-11-09 15:14:52');
INSERT INTO `ke_mark` VALUES ('22625', '13120683381', '2016110915120788306501', '2016110902', '1898.581673', '685.960159', '0', '1', '正确', '0', '2016-11-09 15:14:52');
INSERT INTO `ke_mark` VALUES ('22626', '13120683381', '2016110915120788306501', '2016110902', '2005.864542', '1315.027888', '0', '0', '粗心大意', '1', '2016-11-09 15:14:52');
INSERT INTO `ke_mark` VALUES ('22627', '13120683381', '2016110915120788306501', '2016110902', '1939.219124', '2090.390438', '0', '0', '正确', '1', '2016-11-09 15:14:52');
INSERT INTO `ke_mark` VALUES ('22628', '13120683381', '2016110915120788306501', '2016110902', '1568.605578', '2820.239044', '0', '1', '正确', '0', '2016-11-09 15:14:52');
INSERT INTO `ke_mark` VALUES ('22631', '13120683381', '2016110915173570005827', '2016110903', '1022.438247', '1618.996016', '0', '1', '正确', '0', '2016-11-09 15:23:46');
INSERT INTO `ke_mark` VALUES ('22632', '13120683381', '2016110915173570005827', '2016110903', '1713.274900', '1942.470120', '0', '0', '问问老师', '1', '2016-11-09 15:23:46');
INSERT INTO `ke_mark` VALUES ('22633', '13120683381', '2016110915384251617562', '2016110901', '1625.498008', '1558.852590', '0', '1', '正确', '0', '2016-11-09 15:39:17');
INSERT INTO `ke_mark` VALUES ('22634', '13120683381', '2016110915384251627562', '2016110901', '1612.494024', '2013.992032', '0', '1', '正确', '0', '2016-11-09 15:39:35');
INSERT INTO `ke_mark` VALUES ('22635', '13120683381', '2016110915384251607562', '2016110901', '1648.254980', '2106.645418', '0', '1', '正确', '0', '2016-11-09 15:39:57');
INSERT INTO `ke_mark` VALUES ('22636', '18702103770', '2016111009332582600679', '2016111002', '0.7891', '0.5578', '1', '1', '正确', '0', '2016-11-10 12:20:17');
INSERT INTO `ke_mark` VALUES ('22637', '18702103770', '2016111009332582600679', '2016111002', '0.4000', '0.8145', '0', '1', '正确', '0', '2016-11-10 12:20:17');
INSERT INTO `ke_mark` VALUES ('22638', '18324373866', '2016111011214179905173', '2016111002', '0.3391', '0.5895', '0', '1', '正确', '0', '2016-11-10 12:21:36');
INSERT INTO `ke_mark` VALUES ('22639', '18324373866', '2016111011214179905173', '2016111002', '0.5156', '0.3984', '0', '1', '正确', '0', '2016-11-10 12:21:36');
INSERT INTO `ke_mark` VALUES ('22640', '18324373866', '2016111012062239507958', '2016111002', '0.7188', '0.8238', '0', '1', '正确', '0', '2016-11-10 12:26:38');
INSERT INTO `ke_mark` VALUES ('22641', '18324373866', '2016111012190311509432', '2016111002', '0.4138', '0.7458', '0', '1', '正确', '0', '2016-11-10 12:27:03');
INSERT INTO `ke_mark` VALUES ('22642', '18324373866', '2016111012063763800184', '2016111002', '0.5375', '0.6211', '0', '1', '正确', '0', '2016-11-10 12:41:50');
INSERT INTO `ke_mark` VALUES ('22643', '18324373866', '2016111012221973618140', '2016111002', '0.6219', '0.5953', '0', '1', '正确', '0', '2016-11-10 12:42:30');
INSERT INTO `ke_mark` VALUES ('22644', '18324373866', '2016111012221973608140', '2016111002', '0.7063', '0.5098', '0', '1', '正确', '0', '2016-11-10 12:42:38');
INSERT INTO `ke_mark` VALUES ('22645', '18324373866', '2016111012221973628140', '2016111002', '0.7922', '0.4488', '0', '0', '粗心大意', '1', '2016-11-10 12:42:43');
INSERT INTO `ke_mark` VALUES ('22647', '13120683381', '2016111012462256905021', '2016111002', '0.6805556', '0.60364586', '0', '1', '正确', '0', '2016-11-10 12:57:19');
INSERT INTO `ke_mark` VALUES ('22648', '13120683381', '2016111012462256925021', '2016111002', '0.62777776', '0.77685183', '0', '1', '正确', '0', '2016-11-10 12:57:59');
INSERT INTO `ke_mark` VALUES ('22649', '13120683381', '2016111012462256915021', '2016111002', '0.69861114', '0.63611114', '0', '1', '正确', '0', '2016-11-10 12:58:11');
INSERT INTO `ke_mark` VALUES ('22650', '18324373866', '2016111012514505410284', '2016111002', '0.6486111', '0.56822914', '0', '1', '正确', '0', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22651', '18324373866', '2016111012514505410284', '2016111002', '0.57222223', '0.36822918', '0', '0', '建议答疑', '1', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22652', '18324373866', '2016111012514505410284', '2016111002', '0.21527778', '0.5203125', '0', '0', '概念不清', '1', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22653', '18324373866', '2016111012514505410284', '2016111002', '0.56666666', '0.8151042', '0', '1', '正确', '0', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22654', '18324373866', '2016111012514505410284', '2016111002', '0.20694445', '0.21197917', '0', '1', '正确', '0', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22655', '18324373866', '2016111012514505410284', '2016111002', '0.5541667', '0.096354164', '0', '1', '正确', '0', '2016-11-10 12:58:36');
INSERT INTO `ke_mark` VALUES ('22656', '13120683381', '2016111013010632707085', '2016111002', '0.7013889', '0.5234375', '0', '1', '正确', '0', '2016-11-10 13:02:38');
INSERT INTO `ke_mark` VALUES ('22657', '13120683381', '2016111013010632707085', '2016111002', '0.3236111', '0.19949408', '0', '0', '粗心大意', '1', '2016-11-10 13:02:38');
INSERT INTO `ke_mark` VALUES ('22658', '13120683381', '2016111013010632707085', '2016111002', '0.24861111', '0.6078125', '0', '0', '建议答疑', '1', '2016-11-10 13:02:38');
INSERT INTO `ke_mark` VALUES ('22659', '13120683381', '2016111013010632707085', '2016111002', '0.6722222', '0.8265625', '0', '1', '正确', '0', '2016-11-10 13:02:38');
INSERT INTO `ke_mark` VALUES ('22660', '13120683381', '2016111013002658409617', '2016111002', '0.36666667', '0.22447917', '0', '1', '正确', '0', '2016-11-10 13:02:54');
INSERT INTO `ke_mark` VALUES ('22661', '13120683381', '2016111013002658409617', '2016111002', '0.25555557', '0.5494792', '0', '1', '正确', '0', '2016-11-10 13:02:54');
INSERT INTO `ke_mark` VALUES ('22662', '13120683381', '2016111013002658409617', '2016111002', '0.27638888', '0.7765625', '0', '1', '正确', '0', '2016-11-10 13:02:54');
INSERT INTO `ke_mark` VALUES ('22663', '13120683381', '2016111013002658409617', '2016111002', '0.8375', '0.18177083', '0', '0', '粗心大意', '1', '2016-11-10 13:02:54');
INSERT INTO `ke_mark` VALUES ('22664', '13120683381', '2016111013002658409617', '2016111002', '0.69555527', '0.76489556', '0', '0', '粗心大意', '1', '2016-11-10 13:02:54');
INSERT INTO `ke_mark` VALUES ('22665', '13120683381', '2016111013043517805413', '2016111002', '0.25972223', '0.1953125', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22666', '13120683381', '2016111013043517805413', '2016111002', '0.53194445', '0.18177083', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22667', '13120683381', '2016111013043517805413', '2016111002', '0.7986111', '0.1953125', '0', '0', '建议答疑', '1', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22668', '13120683381', '2016111013043517805413', '2016111002', '0.28055555', '0.44427082', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22669', '13120683381', '2016111013043517805413', '2016111002', '0.70416665', '0.4609375', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22670', '13120683381', '2016111013043517805413', '2016111002', '0.25694445', '0.7484375', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22671', '13120683381', '2016111013043517805413', '2016111002', '0.7916667', '0.74114585', '0', '1', '正确', '0', '2016-11-10 13:05:40');
INSERT INTO `ke_mark` VALUES ('22672', '18324373866', '2016111012514505400284', '2016111002', '0.61944443', '0.32135418', '0', '1', '正确', '0', '2016-11-10 13:13:02');
INSERT INTO `ke_mark` VALUES ('22673', '18324373866', '2016111012514505400284', '2016111002', '0.475', '0.5796875', '0', '1', '正确', '0', '2016-11-10 13:13:02');
INSERT INTO `ke_mark` VALUES ('22674', '18324373866', '2016111012514505400284', '2016111002', '0.3625', '0.5005208', '0', '1', '正确', '0', '2016-11-10 13:13:02');
INSERT INTO `ke_mark` VALUES ('22675', '18324373866', '2016111012514505400284', '2016111002', '0.22222222', '0.8463542', '0', '1', '正确', '0', '2016-11-10 13:13:02');
INSERT INTO `ke_mark` VALUES ('22679', '18324373866', '2016111012540913809083', '2016111002', '0.29305556', '0.28385416', '0', '1', '正确', '0', '2016-11-10 13:26:15');
INSERT INTO `ke_mark` VALUES ('22680', '18324373866', '2016111012540913809083', '2016111002', '0.6486111', '0.6255208', '0', '1', '正确', '0', '2016-11-10 13:26:15');
INSERT INTO `ke_mark` VALUES ('22681', '18324373866', '2016111012540913809083', '2016111002', '0.31527779', '0.4671875', '0', '1', '正确', '0', '2016-11-10 13:26:15');
INSERT INTO `ke_mark` VALUES ('22682', '18324373866', '2016111012540913809083', '2016111002', '0.2375', '0.43697917', '0', '1', '正确', '0', '2016-11-10 13:26:15');
INSERT INTO `ke_mark` VALUES ('22683', '13120683381', '2016111013195834109823', '2016111002', '0.5277778', '0.47135416', '0', '1', '正确', '0', '2016-11-10 13:26:41');
INSERT INTO `ke_mark` VALUES ('22684', '13120683381', '2016111013195834109823', '2016111002', '0.8958333', '0.93385416', '0', '1', '正确', '0', '2016-11-10 13:26:41');
INSERT INTO `ke_mark` VALUES ('22685', '13120683381', '2016111013325688900526', '2016111002', '0.725', '0.30260417', '0', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22686', '13120683381', '2016111013325688900526', '2016111002', '0.90416664', '0.38489583', '1', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22687', '13120683381', '2016111013325688900526', '2016111002', '0.82222223', '0.12135417', '0', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22688', '13120683381', '2016111013325688900526', '2016111002', '0.5972222', '0.7994792', '0', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22689', '13120683381', '2016111013325688900526', '2016111002', '0.6', '0.9046875', '0', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22690', '13120683381', '2016111013325688900526', '2016111002', '0.075', '0.2234375', '0', '1', '正确', '0', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22691', '13120683381', '2016111013325688900526', '2016111002', '0.48333332', '0.1640625', '0', '0', '粗心大意', '1', '2016-11-10 13:33:31');
INSERT INTO `ke_mark` VALUES ('22711', '13120683381', '2016111013433564307209', '2016111002', '0.13611111', '0.21302083', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22712', '13120683381', '2016111013433564307209', '2016111002', '0.25416666', '0.20885417', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22713', '13120683381', '2016111013433564307209', '2016111002', '0.36805555', '0.20364584', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22714', '13120683381', '2016111013433564307209', '2016111002', '0.4625', '0.20364584', '0', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22715', '13120683381', '2016111013433564307209', '2016111002', '0.18333334', '0.40052083', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22716', '13120683381', '2016111013433564307209', '2016111002', '0.34305555', '0.39947918', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22717', '13120683381', '2016111013433564307209', '2016111002', '0.5125', '0.3921875', '0', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22718', '13120683381', '2016111013433564307209', '2016111002', '0.7430556', '0.39010417', '0', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22719', '13120683381', '2016111013433564307209', '2016111002', '0.29166666', '0.5473958', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22720', '13120683381', '2016111013433564307209', '2016111002', '0.45694444', '0.53802085', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22721', '13120683381', '2016111013433564307209', '2016111002', '0.6527778', '0.5307292', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22722', '13120683381', '2016111013433564307209', '2016111002', '0.8486111', '0.5286458', '0', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22723', '13120683381', '2016111013433564307209', '2016111002', '0.31944445', '0.6692708', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22724', '13120683381', '2016111013433564307209', '2016111002', '0.5222222', '0.66302085', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22725', '13120683381', '2016111013433564307209', '2016111002', '0.7513889', '0.65052086', '0', '0', '粗心大意', '1', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22726', '13120683381', '2016111013433564307209', '2016111002', '0.30972221', '0.75572914', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22727', '13120683381', '2016111013433564307209', '2016111002', '0.36805555', '0.75677085', '1', '1', '正确', '0', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22728', '13120683381', '2016111013433564307209', '2016111002', '0.4625', '0.7484375', '1', '0', '粗心大意', '1', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22729', '13120683381', '2016111013433564307209', '2016111002', '0.61527777', '0.7390625', '0', '0', '粗心大意', '1', '2016-11-10 13:44:38');
INSERT INTO `ke_mark` VALUES ('22730', '13120683381', '2016111013475133601230', '2016111002', '0.2850365', '0.16287474', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22731', '13120683381', '2016111013475133601230', '2016111002', '0.29465148', '0.21489866', '0', '0', '概念不清', '1', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22732', '13120683381', '2016111013475133601230', '2016111002', '0.28709686', '0.23550218', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22733', '13120683381', '2016111013475133601230', '2016111002', '0.29739863', '0.27619416', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22734', '13120683381', '2016111013475133601230', '2016111002', '0.3118211', '0.30606928', '0', '0', '粗心大意', '1', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22735', '13120683381', '2016111013475133601230', '2016111002', '0.38393345', '0.38539287', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22736', '13120683381', '2016111013475133601230', '2016111002', '0.51579607', '0.38745323', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22737', '13120683381', '2016111013475133601230', '2016111002', '0.51510924', '0.40960202', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22738', '13120683381', '2016111013475133601230', '2016111002', '0.51310486', '0.43087202', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22739', '13120683381', '2016111013475133601230', '2016111002', '0.5125224', '0.45315024', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22740', '13120683381', '2016111013475133601230', '2016111002', '0.39079309', '0.45052928', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22741', '13120683381', '2016111013475133601230', '2016111002', '0.3878809', '0.43087202', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22742', '13120683381', '2016111013475133601230', '2016111002', '0.39021063', '0.40946746', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22743', '13120683381', '2016111013475133601230', '2016111002', '0.22078647', '0.3915575', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22744', '13120683381', '2016111013475133601230', '2016111002', '0.22864938', '0.408157', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22745', '13120683381', '2016111013475133601230', '2016111002', '0.22573718', '0.43087202', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22746', '13120683381', '2016111013475133601230', '2016111002', '0.23185277', '0.45162132', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22747', '13120683381', '2016111013475133601230', '2016111002', '0.28310722', '0.4684392', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22748', '13120683381', '2016111013475133601230', '2016111002', '0.28805795', '0.50229335', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22749', '13120683381', '2016111013475133601230', '2016111002', '0.41794136', '0.4697497', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22750', '13120683381', '2016111013475133601230', '2016111002', '0.41269943', '0.50688004', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22751', '13120683381', '2016111013475133601230', '2016111002', '0.57775736', '0.4691978', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22752', '13120683381', '2016111013475133601230', '2016111002', '0.57597816', '0.500556', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22753', '13120683381', '2016111013475133601230', '2016111002', '0.71416175', '0.46808583', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22754', '13120683381', '2016111013475133601230', '2016111002', '0.7129756', '0.50567114', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22755', '13120683381', '2016111013475133601230', '2016111002', '0.5884325', '0.5370293', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22756', '13120683381', '2016111013475133601230', '2016111002', '0.58042616', '0.5581572', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22757', '13120683381', '2016111013475133601230', '2016111002', '0.57775736', '0.5721683', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22758', '13120683381', '2016111013475133601230', '2016111002', '0.5753851', '0.5886258', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22759', '13120683381', '2016111013475133601230', '2016111002', '0.4325231', '0.53769654', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22760', '13120683381', '2016111013475133601230', '2016111002', '0.4334127', '0.5559332', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22761', '13120683381', '2016111013475133601230', '2016111002', '0.42807513', '0.57261306', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22762', '13120683381', '2016111013475133601230', '2016111002', '0.42985433', '0.591517', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22763', '13120683381', '2016111013475133601230', '2016111002', '0.26437816', '0.53680694', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22764', '13120683381', '2016111013475133601230', '2016111002', '0.2723845', '0.555266', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22765', '13120683381', '2016111013475133601230', '2016111002', '0.26882613', '0.5757267', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22766', '13120683381', '2016111013475133601230', '2016111002', '0.26764', '0.59285134', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22767', '13120683381', '2016111013475133601230', '2016111002', '0.25577876', '0.62309754', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22768', '13120683381', '2016111013475133601230', '2016111002', '0.32576013', '0.62198555', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22769', '13120683381', '2016111013475133601230', '2016111002', '0.25755796', '0.63777584', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22770', '13120683381', '2016111013475133601230', '2016111002', '0.32605666', '0.6411118', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22771', '13120683381', '2016111013475133601230', '2016111002', '0.26526776', '0.65423334', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22772', '13120683381', '2016111013475133601230', '2016111002', '0.32694626', '0.6549005', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22773', '13120683381', '2016111013475133601230', '2016111002', '0.27534983', '0.6722476', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22774', '13120683381', '2016111013475133601230', '2016111002', '0.33465606', '0.6695788', '0', '1', '正确', '0', '2016-11-10 13:50:04');
INSERT INTO `ke_mark` VALUES ('22775', '13120683381', '2016111014004634104302', '2016111002', '0.5741', '0.6087', '0', '1', '正确', '0', '2016-11-10 14:00:56');
INSERT INTO `ke_mark` VALUES ('22776', '13120683381', '2016111014023850509263', '2016111002', '0.54305553', '0.56614584', '0', '1', '正确', '0', '2016-11-10 14:03:01');
INSERT INTO `ke_mark` VALUES ('22777', '13120683381', '2016111014023850509263', '2016111002', '0.62222224', '0.5953125', '0', '1', '正确', '0', '2016-11-10 14:03:01');
INSERT INTO `ke_mark` VALUES ('22778', '13120683381', '2016111014023850509263', '2016111002', '0.55833334', '0.6359375', '0', '1', '正确', '0', '2016-11-10 14:03:01');
INSERT INTO `ke_mark` VALUES ('22779', '13120683381', '2016111014023850509263', '2016111002', '0.6805556', '0.6713542', '0', '1', '正确', '0', '2016-11-10 14:03:01');
INSERT INTO `ke_mark` VALUES ('22780', '13120683381', '2016111014023850509263', '2016111002', '0.5888889', '0.7004306', '0', '1', '正确', '0', '2016-11-10 14:03:01');
INSERT INTO `ke_mark` VALUES ('22781', '13120683381', '2016111015523186905169', '2016111002', '0.6175926', '0.17124566', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22782', '13120683381', '2016111015523186905169', '2016111002', '0.64074075', '0.2559679', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22783', '13120683381', '2016111015523186905169', '2016111002', '0.63796294', '0.329579', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22784', '13120683381', '2016111015523186905169', '2016111002', '0.25833333', '0.3406901', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22785', '13120683381', '2016111015523186905169', '2016111002', '0.3398148', '0.2531901', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22786', '13120683381', '2016111015523186905169', '2016111002', '0.2824074', '0.20666233', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22787', '13120683381', '2016111015523186905169', '2016111002', '0.51111114', '0.7031901', '0', '1', '正确', '0', '2016-11-10 16:06:22');
INSERT INTO `ke_mark` VALUES ('22788', '13120683381', '2016111015524173901302', '2016111002', '0.6425926', '0.70874566', '0', '1', '正确', '0', '2016-11-10 16:32:12');
INSERT INTO `ke_mark` VALUES ('22789', '13120683381', '2016111015524173901302', '2016111002', '0.46851853', '0.6372179', '0', '1', '正确', '0', '2016-11-10 16:32:12');
INSERT INTO `ke_mark` VALUES ('22794', '13120683381', '2016111016575186305140', '2016111002', '0.5407407', '0.5115234', '0', '1', '正确', '0', '2016-11-10 16:59:55');
INSERT INTO `ke_mark` VALUES ('22795', '13120683381', '2016111016575186305140', '2016111002', '0.56666666', '0.6997179', '0', '1', '正确', '0', '2016-11-10 16:59:55');
INSERT INTO `ke_mark` VALUES ('22796', '13120683381', '2016111016575186305140', '2016111002', '0.5537037', '0.86013454', '0', '1', '正确', '0', '2016-11-10 16:59:55');
INSERT INTO `ke_mark` VALUES ('22797', '13120683381', '2016111016575186305140', '2016111002', '0.50555557', '0.30388454', '0', '1', '正确', '0', '2016-11-10 16:59:55');
INSERT INTO `ke_mark` VALUES ('22798', '13120683381', '2016111017003380004621', '2016111002', '0.49537036', '0.41916233', '0', '1', '正确', '0', '2016-11-10 17:00:48');
INSERT INTO `ke_mark` VALUES ('22799', '13120683381', '2016111017022541000867', '2016111002', '0.6703704', '0.48444012', '0', '1', '正确', '0', '2016-11-10 17:02:35');
INSERT INTO `ke_mark` VALUES ('22800', '13120683381', '2016111017263124508769', '2016111002', '0.4710', '0.4390', '0', '1', '正确', '0', '2016-11-10 17:26:41');
INSERT INTO `ke_mark` VALUES ('22801', '13120683381', '2016111017263124508769', '2016111002', '0.4002', '0.5628', '0', '1', '正确', '0', '2016-11-10 17:26:41');
INSERT INTO `ke_mark` VALUES ('22802', '13120683381', '2016111017263124508769', '2016111002', '0.6329', '0.6661', '0', '0', '粗心大意', '1', '2016-11-10 17:26:41');
INSERT INTO `ke_mark` VALUES ('22803', '18702103770', '2016111017413948208903', '2016111002', '0.3873', '0.4034', '0', '1', '正确', '0', '2016-11-10 17:41:55');
INSERT INTO `ke_mark` VALUES ('22805', '13120683381', '2016111017491008304976', '2016111002', '0.7331', '0.6245', '0', '1', '正确', '0', '2016-11-10 17:49:27');
INSERT INTO `ke_mark` VALUES ('22807', '15157891809', '2016111021251988220621', '20161110020621', '0.6080', '0.2030', '0', '0', '粗心大意', '1', '2016-11-10 21:26:32');
INSERT INTO `ke_mark` VALUES ('22808', '15157891809', '2016111021251988220621', '20161110020621', '0.7547', '0.3790', '0', '1', '正确', '0', '2016-11-10 21:26:32');
INSERT INTO `ke_mark` VALUES ('22809', '15157891809', '2016111021251988220621', '20161110020621', '0.6787', '0.5650', '0', '1', '正确', '0', '2016-11-10 21:26:32');
INSERT INTO `ke_mark` VALUES ('22810', '15157891809', '2016111021251988220621', '20161110020621', '0.7787', '0.7850', '0', '1', '正确', '0', '2016-11-10 21:26:32');
INSERT INTO `ke_mark` VALUES ('22811', '15157891809', '2016111021251988220621', '20161110020621', '0.1000', '0.8490', '0', '1', '正确', '0', '2016-11-10 21:26:32');
INSERT INTO `ke_mark` VALUES ('22812', '15157891809', '2016111021251988210621', '20161110020621', '0.6267', '0.2510', '0', '1', '正确', '0', '2016-11-10 21:26:54');
INSERT INTO `ke_mark` VALUES ('22813', '15157891809', '2016111021251988210621', '20161110020621', '0.6067', '0.4200', '0', '1', '正确', '0', '2016-11-10 21:26:54');
INSERT INTO `ke_mark` VALUES ('22814', '15157891809', '2016111021251988210621', '20161110020621', '0.6693', '0.6210', '0', '1', '正确', '0', '2016-11-10 21:26:54');
INSERT INTO `ke_mark` VALUES ('22815', '15157891809', '2016111021251988210621', '20161110020621', '0.6373', '0.8260', '0', '1', '正确', '0', '2016-11-10 21:26:54');
INSERT INTO `ke_mark` VALUES ('22816', '15157891809', '2016111021251988230621', '20161110020621', '0.4667', '0.2490', '0', '0', '概念不清', '1', '2016-11-10 21:27:30');
INSERT INTO `ke_mark` VALUES ('22817', '15157891809', '2016111021251988230621', '20161110020621', '0.5187', '0.4920', '0', '0', '拼写错误', '1', '2016-11-10 21:27:30');
INSERT INTO `ke_mark` VALUES ('22818', '15157891809', '2016111021251988230621', '20161110020621', '0.5507', '0.7340', '0', '0', '拼写错误', '1', '2016-11-10 21:27:30');
INSERT INTO `ke_mark` VALUES ('22819', '15157891809', '2016111021251988230621', '20161110020621', '0.5707', '0.8620', '0', '0', '审题', '1', '2016-11-10 21:27:30');
INSERT INTO `ke_mark` VALUES ('22822', '15157891809', '2016111021251988200621', '20161110020621', '0.5867', '0.3300', '0', '1', '正确', '0', '2016-11-10 21:27:50');
INSERT INTO `ke_mark` VALUES ('22823', '15157891809', '2016111021251988200621', '20161110020621', '0.5400', '0.7280', '0', '1', '正确', '0', '2016-11-10 21:27:50');
INSERT INTO `ke_mark` VALUES ('22824', '15157891809', '2016111021254111308457', '20161110028457', '0.5147', '0.3340', '0', '1', '正确', '0', '2016-11-10 21:28:16');
INSERT INTO `ke_mark` VALUES ('22825', '15157891809', '2016111021254111308457', '20161110028457', '0.4773', '0.6040', '0', '0', '拼写错误', '1', '2016-11-10 21:28:16');
INSERT INTO `ke_mark` VALUES ('22826', '18702103770', '2016111018011344905908', '2016111002', '0.5972222', '0.61846787', '0', '1', '正确', '0', '2016-11-11 09:22:06');
INSERT INTO `ke_mark` VALUES ('22827', '18702103770', '2016111018011344905908', '2016111002', '0.825', '0.45110676', '0', '1', '正确', '0', '2016-11-11 09:22:06');
INSERT INTO `ke_mark` VALUES ('22828', '18702103770', '2016111018011344905908', '2016111002', '0.7537037', '0.64277345', '0', '1', '正确', '0', '2016-11-11 09:22:06');
INSERT INTO `ke_mark` VALUES ('22829', '18702103770', '2016111018011344905908', '2016111002', '0.6425926', '0.75249565', '0', '1', '正确', '0', '2016-11-11 09:22:06');
INSERT INTO `ke_mark` VALUES ('22830', '18702103770', '2016111018011344905908', '2016111002', '0.19074073', '0.729579', '0', '1', '正确', '0', '2016-11-11 09:22:06');
INSERT INTO `ke_mark` VALUES ('22831', '18324373866', '2016111109374743502907', '20161111022907', '0.5141', '0.6117', '0', '1', '正确', '0', '2016-11-11 09:48:10');
INSERT INTO `ke_mark` VALUES ('22833', '18324373866', '2016111109374743542907', '20161111022907', '0.2085', '0.6285', '0', '1', '正确', '0', '2016-11-11 09:48:17');
INSERT INTO `ke_mark` VALUES ('22834', '18324373866', '2016111109374743542907', '20161111022907', '0.2311', '0.7122', '0', '1', '正确', '0', '2016-11-11 09:48:17');
INSERT INTO `ke_mark` VALUES ('22835', '18324373866', '2016111109374743532907', '20161111022907', '0.4728', '0.6235', '0', '1', '正确', '0', '2016-11-11 09:48:35');
INSERT INTO `ke_mark` VALUES ('22836', '18324373866', '2016111109505623402653', '20161111022653', '0.5094', '0.5543', '0', '1', '正确', '0', '2016-11-11 09:51:16');
INSERT INTO `ke_mark` VALUES ('22837', '18324373866', '2016111109374743512907', '20161111022907', '0.2470', '0.5876', '0', '1', '正确', '0', '2016-11-11 09:51:17');
INSERT INTO `ke_mark` VALUES ('22838', '18324373866', '2016111109374743522907', '20161111022907', '0.6946', '0.7500', '0', '1', '正确', '0', '2016-11-11 09:52:03');
INSERT INTO `ke_mark` VALUES ('22839', '18324373866', '2016111109374743552907', '20161111022907', '0.3134', '0.5378', '0', '1', '正确', '0', '2016-11-11 09:52:10');
INSERT INTO `ke_mark` VALUES ('22842', '13120683381', '2016111110021899408692', '20161111028692', '0.1506', '0.4559', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22843', '13120683381', '2016111110021899408692', '20161111028692', '0.1417', '0.5550', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22844', '13120683381', '2016111110021899408692', '20161111028692', '0.2126', '0.7349', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22845', '13120683381', '2016111110021899408692', '20161111028692', '0.2021', '0.8496', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22846', '13120683381', '2016111110021899408692', '20161111028692', '0.2794', '0.5441', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22847', '13120683381', '2016111110021899408692', '20161111028692', '0.2802', '0.4758', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22848', '13120683381', '2016111110021899408692', '20161111028692', '0.0081', '0.5242', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22849', '13120683381', '2016111110021899408692', '20161111028692', '0.4694', '0.6902', '0', '0', '问问老师', '1', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22850', '13120683381', '2016111110021899408692', '20161111028692', '0.4348', '0.8973', '0', '1', '正确', '0', '2016-11-11 10:04:25');
INSERT INTO `ke_mark` VALUES ('22851', '13120683381', '2016111110051741804765', '20161111024765', '0.64305556', '0.37447917', '0', '1', '正确', '0', '2016-11-11 10:05:25');
INSERT INTO `ke_mark` VALUES ('22852', '13120683381', '2016111110051741804765', '20161111024765', '0.6248539', '0.5858279', '0', '1', '正确', '0', '2016-11-11 10:05:25');
INSERT INTO `ke_mark` VALUES ('22853', '18702103770', '2016111110083718803209', '20161111023209', '0.3859', '0.5660', '0', '1', '正确', '0', '2016-11-11 10:09:54');
INSERT INTO `ke_mark` VALUES ('22854', '18702103770', '2016111110083718803209', '20161111023209', '0.2672', '0.6279', '0', '1', '正确', '0', '2016-11-11 10:09:54');
INSERT INTO `ke_mark` VALUES ('22855', '18702103770', '2016111110083718813209', '20161111023209', '0.5938', '0.6535', '0', '1', '正确', '0', '2016-11-11 10:10:01');
INSERT INTO `ke_mark` VALUES ('22857', '18702103770', '2016111110100644807426', '20161111027426', '0.5837', '0.7698', '0', '1', '正确', '0', '2016-11-11 10:10:27');
INSERT INTO `ke_mark` VALUES ('22858', '18702103770', '2016111110100644807426', '20161111027426', '0.6087', '0.4895', '0', '1', '正确', '0', '2016-11-11 10:10:27');
INSERT INTO `ke_mark` VALUES ('22859', '18702103770', '2016111110100644807426', '20161111027426', '0.6200', '0.5996', '0', '1', '正确', '0', '2016-11-11 10:10:27');
INSERT INTO `ke_mark` VALUES ('22860', '18702103770', '2016111110100644807426', '20161111027426', '0.4283', '0.6910', '0', '0', '问问老师', '1', '2016-11-11 10:10:27');
INSERT INTO `ke_mark` VALUES ('22861', '13120683381', '2016111110365631104275', '20161111024275', '0.38194445', '0.5307292', '0', '1', '正确', '0', '2016-11-11 10:37:50');
INSERT INTO `ke_mark` VALUES ('22862', '13120683381', '2016111110365631104275', '20161111024275', '0.61527777', '0.30989584', '0', '1', '正确', '0', '2016-11-11 10:37:50');
INSERT INTO `ke_mark` VALUES ('22863', '18324373866', '2016111110411344906589', '20161111026589', '0.5594', '0.1863', '0', '1', '正确', '0', '2016-11-11 10:41:32');
INSERT INTO `ke_mark` VALUES ('22864', '18324373866', '2016111110411344906589', '20161111026589', '0.5203', '0.3996', '1', '1', '正确', '0', '2016-11-11 10:41:32');
INSERT INTO `ke_mark` VALUES ('22865', '18324373866', '2016111110411344906589', '20161111026589', '0.5312', '0.5473', '0', '0', '问问老师', '1', '2016-11-11 10:41:32');
INSERT INTO `ke_mark` VALUES ('22866', '18324373866', '2016111110411344906589', '20161111026589', '0.5516', '0.7441', '1', '0', '概念不清', '1', '2016-11-11 10:41:32');
INSERT INTO `ke_mark` VALUES ('22898', '18702103770', '2016111115011682410159', '20161111020159', '0.7344', '0.4512', '0', '1', '正确', '0', '2016-11-11 15:08:24');
INSERT INTO `ke_mark` VALUES ('22904', '18702103770', '2016111115011682400159', '20161111020159', '0.7219', '0.7172', '0', '1', '正确', '0', '2016-11-11 15:09:19');
INSERT INTO `ke_mark` VALUES ('22905', '18324373866', '2016111116512478901297', '20161111021297', '0.65555555', '0.34322917', '0', '1', '正确', '0', '2016-11-11 16:56:33');
INSERT INTO `ke_mark` VALUES ('22906', '18324373866', '2016111116512478901297', '20161111021297', '0.6333333', '0.51778954', '0', '1', '正确', '0', '2016-11-11 16:56:33');
INSERT INTO `ke_mark` VALUES ('22908', '18324373866', '2016111116523911000315', '20161111020315', '0.35694444', '0.5307292', '0', '1', '正确', '0', '2016-11-11 17:07:21');
INSERT INTO `ke_mark` VALUES ('22909', '13567626866', '2016111120044729408730', '20161111028730', '0.5344', '0.6047', '0', '1', '正确', '0', '2016-11-11 20:07:08');
INSERT INTO `ke_mark` VALUES ('22910', '13567626866', '2016111120044729418730', '20161111028730', '0.6000', '0.5109', '0', '1', '正确', '0', '2016-11-11 20:07:30');
INSERT INTO `ke_mark` VALUES ('22911', '13567615730', '2016111120044714017135', '20161111027135', '0.9227', '0.7070', '1', '1', '正确', '0', '2016-11-11 20:07:44');
INSERT INTO `ke_mark` VALUES ('22912', '13567615730', '2016111120044714017135', '20161111027135', '0.4840', '0.7630', '0', '1', '正确', '0', '2016-11-11 20:07:44');
INSERT INTO `ke_mark` VALUES ('22913', '13567626866', '2016111120044729438730', '20161111028730', '0.6187', '0.6668', '0', '1', '正确', '0', '2016-11-11 20:08:16');
INSERT INTO `ke_mark` VALUES ('22914', '13567626866', '2016111120044729428730', '20161111028730', '0.5766', '0.7172', '0', '1', '正确', '0', '2016-11-11 20:08:24');
INSERT INTO `ke_mark` VALUES ('22915', '13567615730', '2016111120044714027135', '20161111027135', '0.4867', '0.1890', '0', '1', '正确', '0', '2016-11-11 20:08:43');
INSERT INTO `ke_mark` VALUES ('22916', '13567626866', '2016111120044729448730', '20161111028730', '0.5719', '0.6891', '0', '0', '拼写错误', '1', '2016-11-11 20:08:44');
INSERT INTO `ke_mark` VALUES ('22917', '13567615730', '2016111120044714057135', '20161111027135', '0.6973', '0.5740', '0', '1', '正确', '0', '2016-11-11 20:09:51');
INSERT INTO `ke_mark` VALUES ('22918', '13567615730', '2016111120044714047135', '20161111027135', '0.4600', '0.2930', '0', '1', '正确', '0', '2016-11-11 20:10:03');
INSERT INTO `ke_mark` VALUES ('22919', '13567626866', '2016111120101054324361', '20161111024361', '0.4375', '0.6000', '0', '1', '正确', '0', '2016-11-11 20:10:36');
INSERT INTO `ke_mark` VALUES ('22920', '13567626866', '2016111120101054304361', '20161111024361', '0.5000', '0.5941', '0', '1', '正确', '0', '2016-11-11 20:10:43');
INSERT INTO `ke_mark` VALUES ('22921', '13567626866', '2016111120101054314361', '20161111024361', '0.8625', '0.6762', '1', '1', '正确', '0', '2016-11-11 20:10:54');
INSERT INTO `ke_mark` VALUES ('22922', '13567615730', '2016111120044714007135', '20161111027135', '0.4307', '0.7480', '0', '1', '正确', '0', '2016-11-11 20:11:25');
INSERT INTO `ke_mark` VALUES ('22923', '13567615730', '2016111120044714037135', '20161111027135', '0.6960', '0.3990', '0', '1', '正确', '0', '2016-11-11 20:11:46');
INSERT INTO `ke_mark` VALUES ('22924', '13567615730', '2016111120044714037135', '20161111027135', '0.3920', '0.5320', '0', '1', '正确', '0', '2016-11-11 20:11:46');
INSERT INTO `ke_mark` VALUES ('22925', '13567626866', '2016111120124364425932', '20161111025932', '0.7984', '0.6223', '0', '1', '正确', '0', '2016-11-11 20:13:12');
INSERT INTO `ke_mark` VALUES ('22926', '13567626866', '2016111120124364415932', '20161111025932', '0.7016', '0.7020', '0', '1', '正确', '0', '2016-11-11 20:13:24');
INSERT INTO `ke_mark` VALUES ('22927', '13567626866', '2016111120124364405932', '20161111025932', '0.7312', '0.5555', '0', '1', '正确', '0', '2016-11-11 20:13:49');
INSERT INTO `ke_mark` VALUES ('22928', '13567626866', '2016111120124364435932', '20161111025932', '0.6800', '0.1260', '0', '1', '正确', '0', '2016-11-11 20:14:17');
INSERT INTO `ke_mark` VALUES ('22929', '13567626866', '2016111120124364435932', '20161111025932', '0.3987', '0.8060', '0', '1', '正确', '0', '2016-11-11 20:14:17');
INSERT INTO `ke_mark` VALUES ('22930', '15157891809', '2016111123063921903925', '20161111023925', '0.3733', '0.3900', '0', '1', '正确', '0', '2016-11-11 23:08:40');
INSERT INTO `ke_mark` VALUES ('22931', '15157891809', '2016111123063921903925', '20161111023925', '0.4480', '0.7020', '0', '1', '正确', '0', '2016-11-11 23:08:40');
INSERT INTO `ke_mark` VALUES ('22932', '15157891809', '2016111123063921903925', '20161111023925', '0.3787', '0.2710', '0', '0', '问问老师', '1', '2016-11-11 23:08:40');
INSERT INTO `ke_mark` VALUES ('22933', '15157891809', '2016111123063921903925', '20161111023925', '0.4040', '0.4710', '0', '1', '正确', '0', '2016-11-11 23:08:40');
INSERT INTO `ke_mark` VALUES ('22934', '15157891809', '2016111123063921903925', '20161111023925', '0.3693', '0.5370', '0', '0', '拼写错误', '1', '2016-11-11 23:08:40');
INSERT INTO `ke_mark` VALUES ('22935', '18324373866', '2016111116525052304521', '20161111024521', '0.2627', '0.4090', '0', '1', '正确', '0', '2016-11-12 20:52:04');
INSERT INTO `ke_mark` VALUES ('22936', '18324373866', '2016111116525052324521', '20161111024521', '0.4840', '0.5630', '0', '1', '正确', '0', '2016-11-12 20:52:35');
INSERT INTO `ke_mark` VALUES ('22937', '18324373866', '2016111116525052324521', '20161111024521', '0.4067', '0.7240', '0', '1', '正确', '0', '2016-11-12 20:52:35');
INSERT INTO `ke_mark` VALUES ('22938', '18324373866', '2016111116525052324521', '20161111024521', '0.1813', '0.4010', '0', '1', '正确', '0', '2016-11-12 20:52:35');
INSERT INTO `ke_mark` VALUES ('22939', '18324373866', '2016111116525052324521', '20161111024521', '0.5600', '0.3770', '0', '1', '正确', '0', '2016-11-12 20:52:35');
INSERT INTO `ke_mark` VALUES ('22940', '18324373866', '2016111116525052324521', '20161111024521', '0.2840', '0.5430', '0', '1', '正确', '0', '2016-11-12 20:52:35');
INSERT INTO `ke_mark` VALUES ('22941', '18324373866', '2016111116525052314521', '20161111024521', '0.3773', '0.5830', '0', '1', '正确', '0', '2016-11-12 20:53:00');
INSERT INTO `ke_mark` VALUES ('22942', '18324373866', '2016111116525052314521', '20161111024521', '0.5760', '0.7020', '0', '1', '正确', '0', '2016-11-12 20:53:00');
INSERT INTO `ke_mark` VALUES ('22943', '18324373866', '2016111116525052314521', '20161111024521', '0.3187', '0.4030', '0', '0', '问问老师', '1', '2016-11-12 20:53:00');
INSERT INTO `ke_mark` VALUES ('22944', '13567615730', '2016111216140069315420', '20161112025420', '0.1733', '0.4370', '0', '1', '正确', '0', '2016-11-12 21:04:24');
INSERT INTO `ke_mark` VALUES ('22945', '13567615730', '2016111216140069325420', '20161112025420', '0.0387', '0.3500', '0', '1', '正确', '0', '2016-11-12 21:04:36');
INSERT INTO `ke_mark` VALUES ('22946', '13567615730', '2016111216140069355420', '20161112025420', '0.0000', '0.4240', '0', '1', '正确', '0', '2016-11-12 21:05:03');
INSERT INTO `ke_mark` VALUES ('22947', '13567615730', '2016111216140069345420', '20161112025420', '0.6280', '0.4110', '0', '1', '正确', '0', '2016-11-12 21:05:14');
INSERT INTO `ke_mark` VALUES ('22948', '13567615730', '2016111216140069345420', '20161112025420', '0.2827', '0.6730', '0', '1', '正确', '0', '2016-11-12 21:05:14');
INSERT INTO `ke_mark` VALUES ('22949', '13567615730', '2016111216140069305420', '20161112025420', '0.1560', '0.3760', '0', '1', '正确', '0', '2016-11-12 21:05:21');
INSERT INTO `ke_mark` VALUES ('22950', '13567615730', '2016111216140069335420', '20161112025420', '0.0427', '0.5380', '0', '1', '正确', '0', '2016-11-12 21:05:28');
INSERT INTO `ke_mark` VALUES ('22951', '13567615730', '2016111309354314001402', '20161113021402', '0.6333', '0.6400', '0', '1', '正确', '0', '2016-11-13 09:36:54');
INSERT INTO `ke_mark` VALUES ('22952', '13567615730', '2016111309354314001402', '20161113021402', '0.6773', '0.8130', '0', '1', '正确', '0', '2016-11-13 09:36:54');
INSERT INTO `ke_mark` VALUES ('22953', '18324373866', '2016111409375759405107', '20161114025107', '0.5719', '0.1605', '0', '1', '正确', '0', '2016-11-14 09:38:20');
INSERT INTO `ke_mark` VALUES ('22954', '18324373866', '2016111409375759405107', '20161114025107', '0.5594', '0.3211', '0', '1', '正确', '0', '2016-11-14 09:38:20');
INSERT INTO `ke_mark` VALUES ('22955', '18324373866', '2016111409375759405107', '20161114025107', '0.5656', '0.5191', '0', '0', '粗心大意', '1', '2016-11-14 09:38:20');
INSERT INTO `ke_mark` VALUES ('22956', '18324373866', '2016111409375759405107', '20161114025107', '0.7094', '0.6586', '0', '1', '正确', '0', '2016-11-14 09:38:20');
INSERT INTO `ke_mark` VALUES ('22957', '18324373866', '2016111409375759405107', '20161114025107', '0.6750', '0.8660', '0', '1', '正确', '0', '2016-11-14 09:38:20');
INSERT INTO `ke_mark` VALUES ('22958', '18324373866', '2016111409443702108192', '20161114028192', '0.5859', '0.1289', '0', '1', '正确', '0', '2016-11-14 09:44:57');
INSERT INTO `ke_mark` VALUES ('22959', '18324373866', '2016111409443702108192', '20161114028192', '0.5594', '0.3281', '0', '1', '正确', '0', '2016-11-14 09:44:57');
INSERT INTO `ke_mark` VALUES ('22960', '18324373866', '2016111409443702108192', '20161114028192', '0.6328', '0.5027', '0', '0', '问问老师', '1', '2016-11-14 09:44:57');
INSERT INTO `ke_mark` VALUES ('22961', '18324373866', '2016111409443702108192', '20161114028192', '0.6938', '0.6457', '0', '1', '正确', '0', '2016-11-14 09:44:57');
INSERT INTO `ke_mark` VALUES ('22962', '18324373866', '2016111409443702108192', '20161114028192', '0.7234', '0.8566', '0', '1', '正确', '0', '2016-11-14 09:44:57');
INSERT INTO `ke_mark` VALUES ('22963', '13120683381', '2016111411062317609850', '20161114029850', '0.46388888', '0.52888453', '0', '1', '正确', '0', '2016-11-14 11:12:51');
INSERT INTO `ke_mark` VALUES ('22964', '13120683381', '2016111411062317609850', '20161114029850', '0.60555553', '0.8004123', '0', '1', '正确', '0', '2016-11-14 11:12:51');
INSERT INTO `ke_mark` VALUES ('22965', '13120683381', '2016111411062317609850', '20161114029850', '0.71018517', '0.59763455', '0', '0', '粗心大意', '0', '2016-11-14 11:12:51');
INSERT INTO `ke_mark` VALUES ('22966', '18324373866', '2016111411301479706804', '20161114026804', '0.5843', '0.4253', '0', '1', '正确', '0', '2016-11-14 11:31:02');
INSERT INTO `ke_mark` VALUES ('22967', '18324373866', '2016111411301479706804', '20161114026804', '0.5432', '0.6145', '0', '1', '正确', '0', '2016-11-14 11:31:02');
INSERT INTO `ke_mark` VALUES ('22968', '18324373866', '2016111413413546302407', '20161114022407', '0.4656', '0.5273', '0', '1', '正确', '0', '2016-11-14 13:48:48');
INSERT INTO `ke_mark` VALUES ('22976', '18324373866', '2016111413491871707086', '20161114027086', '0.6308', '0.4781', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22977', '18324373866', '2016111413491871707086', '20161114027086', '0.4993', '0.3367', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22978', '18324373866', '2016111413491871707086', '20161114027086', '0.6959', '0.6175', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22979', '18324373866', '2016111413491871707086', '20161114027086', '0.6414', '0.5618', '0', '0', '粗心大意', '1', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22980', '18324373866', '2016111413491871707086', '20161114027086', '0.7835', '0.7012', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22981', '18324373866', '2016111413491871707086', '20161114027086', '0.7689', '0.8058', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22982', '18324373866', '2016111413491871707086', '20161114027086', '0.2497', '0.8775', '0', '1', '正确', '0', '2016-11-14 14:07:36');
INSERT INTO `ke_mark` VALUES ('22983', '18324373866', '2016111414095633105670', '20161114025670', '0.3081', '0.2610', '0', '1', '正确', '0', '2016-11-14 14:26:47');
INSERT INTO `ke_mark` VALUES ('22984', '18324373866', '2016111414095633105670', '20161114025670', '0.4648', '0.4064', '0', '1', '正确', '0', '2016-11-14 14:26:47');
INSERT INTO `ke_mark` VALUES ('22985', '18324373866', '2016111414095633105670', '20161114025670', '0.6388', '0.5707', '0', '1', '正确', '0', '2016-11-14 14:26:47');
INSERT INTO `ke_mark` VALUES ('22986', '18324373866', '2016111414095633105670', '20161114025670', '0.5445', '0.4711', '0', '1', '正确', '0', '2016-11-14 14:26:47');
INSERT INTO `ke_mark` VALUES ('22987', '18324373866', '2016111414095633105670', '20161114025670', '0.3878', '0.3277', '0', '1', '正确', '0', '2016-11-14 14:26:47');
INSERT INTO `ke_mark` VALUES ('22988', '18324373866', '2016111414280710202713', '20161114022713', '0.5724', '0.2749', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22989', '18324373866', '2016111414280710202713', '20161114022713', '0.3533', '0.5299', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22990', '18324373866', '2016111414280710202713', '20161114022713', '0.4236', '0.2689', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22991', '18324373866', '2016111414280710202713', '20161114022713', '0.2457', '0.2719', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22992', '18324373866', '2016111414280710202713', '20161114022713', '0.7410', '0.2669', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22993', '18324373866', '2016111414280710202713', '20161114022713', '0.7371', '0.5309', '0', '0', '问问老师', '1', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22994', '18324373866', '2016111414280710202713', '20161114022713', '0.4688', '0.5070', '0', '1', '正确', '0', '2016-11-14 14:39:44');
INSERT INTO `ke_mark` VALUES ('22996', '18324373866', '2016111415081718000513', '20161114020513', '0.4973', '0.3964', '0', '1', '正确', '0', '2016-11-14 15:13:21');
INSERT INTO `ke_mark` VALUES ('22997', '18324373866', '2016111415081718000513', '20161114020513', '0.5651', '0.6942', '0', '1', '正确', '0', '2016-11-14 15:13:21');
INSERT INTO `ke_mark` VALUES ('22998', '18324373866', '2016111415082792904893', '20161114024893', '0.6541', '0.4094', '0', '1', '正确', '0', '2016-11-14 15:13:35');
INSERT INTO `ke_mark` VALUES ('22999', '18324373866', '2016111415094902808409', '20161114028409', '0.4973', '0.5154', '0', '0', '概念不清', '1', '2016-11-14 15:13:44');
INSERT INTO `ke_mark` VALUES ('23000', '18324373866', '2016111415120384509678', '20161114029678', '0.5432', '0.7963', '0', '0', '粗心大意', '1', '2016-11-14 15:13:52');
INSERT INTO `ke_mark` VALUES ('23001', '13120683381', '2016111411131121303712', '20161114023712', '0.7295', '0.7150', '0', '1', '正确', '0', '2016-11-14 15:14:02');
INSERT INTO `ke_mark` VALUES ('23002', '13120683381', '2016111414525356304309', '20161114024309', '0.59074074', '0.6031901', '0', '1', '', '0', '2016-11-14 15:29:53');
INSERT INTO `ke_mark` VALUES ('23003', '18324373866', '2016111415294452504580', '20161114024580', '0.59444445', '0.60110676', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23004', '18324373866', '2016111415294452504580', '20161114024580', '0.69814813', '0.2872179', '0', '0', '概念不清', '1', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23005', '18324373866', '2016111415294452504580', '20161114024580', '0.33796296', '0.60805124', '0', '0', '建议答疑', '1', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23006', '18324373866', '2016111415294452504580', '20161114024580', '0.57314813', '0.7830512', '0', '0', '建议答疑', '1', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23007', '18324373866', '2016111415294452504580', '20161114024580', '0.2787037', '0.7893012', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23008', '18324373866', '2016111415294452504580', '20161114024580', '0.43425927', '0.37541232', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23009', '18324373866', '2016111415294452504580', '20161114024580', '0.537963', '0.3330512', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23010', '18324373866', '2016111415294452504580', '20161114024580', '0.6435185', '0.33027345', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23011', '18324373866', '2016111415294452504580', '20161114024580', '0.7453704', '0.34624565', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23012', '18324373866', '2016111415294452504580', '20161114024580', '0.88148147', '0.33374566', '0', '1', '', '0', '2016-11-14 15:30:19');
INSERT INTO `ke_mark` VALUES ('23013', '13120683381', '2016111415314294304856', '20161114024856', '0.3719', '0.2355', '0', '1', '正确', '0', '2016-11-14 15:31:55');
INSERT INTO `ke_mark` VALUES ('23014', '13120683381', '2016111415314294304856', '20161114024856', '0.7016', '0.2121', '0', '0', '问问老师', '0', '2016-11-14 15:31:55');
INSERT INTO `ke_mark` VALUES ('23015', '13120683381', '2016111415314294304856', '20161114024856', '0.4844', '0.5813', '0', '1', '正确', '0', '2016-11-14 15:31:55');
INSERT INTO `ke_mark` VALUES ('23016', '13120683381', '2016111415314294304856', '20161114024856', '0.6875', '0.3914', '0', '1', '正确', '0', '2016-11-14 15:31:55');
INSERT INTO `ke_mark` VALUES ('23017', '13120683381', '2016111415314294304856', '20161114024856', '0.2094', '0.4852', '0', '1', '正确', '0', '2016-11-14 15:31:55');
INSERT INTO `ke_mark` VALUES ('23018', '18324373866', '2016111415544724403054', '20161114023054', '0.42962962', '0.30666232', '0', '1', '', '0', '2016-11-14 15:56:46');
INSERT INTO `ke_mark` VALUES ('23019', '18324373866', '2016111415544724403054', '20161114023054', '0.59074074', '0.5344401', '0', '1', '', '0', '2016-11-14 15:56:46');
INSERT INTO `ke_mark` VALUES ('23020', '18324373866', '2016111415544724403054', '20161114023054', '0.43703705', '0.60666233', '0', '1', '', '0', '2016-11-14 15:56:46');
INSERT INTO `ke_mark` VALUES ('23021', '13120683381', '2016111416125296805386', '20161114025386', '0.2749', '0.6345', '0', '1', '正确', '0', '2016-11-14 16:13:05');
INSERT INTO `ke_mark` VALUES ('23022', '13120683381', '2016111416125296805386', '20161114025386', '0.2815', '0.7092', '1', '1', '正确', '0', '2016-11-14 16:13:05');
INSERT INTO `ke_mark` VALUES ('23023', '13120683381', '2016111416125296805386', '20161114025386', '0.6959', '0.7649', '0', '1', '正确', '0', '2016-11-14 16:13:05');
INSERT INTO `ke_mark` VALUES ('23024', '13120683381', '2016111416125296805386', '20161114025386', '0.6361', '0.8496', '0', '1', '正确', '0', '2016-11-14 16:13:05');
INSERT INTO `ke_mark` VALUES ('23025', '13120683381', '2016111416125296805386', '20161114025386', '0.3692', '0.7839', '0', '1', '正确', '0', '2016-11-14 16:13:05');
INSERT INTO `ke_mark` VALUES ('23026', '13567626866', '2016111419435568721678', '20161114021678', '0.7891', '0.2426', '0', '1', '正确', '0', '2016-11-14 19:45:00');
INSERT INTO `ke_mark` VALUES ('23027', '13567626866', '2016111419435568721678', '20161114021678', '0.8156', '0.6891', '0', '1', '正确', '0', '2016-11-14 19:45:00');
INSERT INTO `ke_mark` VALUES ('23028', '13567626866', '2016111419435568701678', '20161114021678', '0.4797', '0.5801', '0', '0', '粗心大意', '1', '2016-11-14 19:45:37');
INSERT INTO `ke_mark` VALUES ('23029', '13567626866', '2016111419435568701678', '20161114021678', '0.8141', '0.1629', '1', '1', '正确', '0', '2016-11-14 19:45:37');
INSERT INTO `ke_mark` VALUES ('23030', '13567626866', '2016111419435568701678', '20161114021678', '0.6750', '0.8250', '0', '1', '正确', '0', '2016-11-14 19:45:37');
INSERT INTO `ke_mark` VALUES ('23031', '13567626866', '2016111419435568711678', '20161114021678', '0.6172', '0.7863', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23032', '13567626866', '2016111419435568711678', '20161114021678', '0.2141', '0.4043', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23033', '13567626866', '2016111419435568711678', '20161114021678', '0.1969', '0.5930', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23034', '13567626866', '2016111419435568711678', '20161114021678', '0.5797', '0.4031', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23035', '13567626866', '2016111419435568711678', '20161114021678', '0.6422', '0.4734', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23036', '13567626866', '2016111419435568711678', '20161114021678', '0.9750', '0.4020', '1', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23037', '13567626866', '2016111419435568711678', '20161114021678', '1.0000', '0.5297', '1', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23038', '13567626866', '2016111419435568711678', '20161114021678', '0.2156', '0.8297', '0', '1', '正确', '0', '2016-11-14 19:46:29');
INSERT INTO `ke_mark` VALUES ('23041', '13567626866', '2016111419435568731678', '20161114021678', '0.8156', '0.3691', '0', '1', '正确', '0', '2016-11-14 19:46:44');
INSERT INTO `ke_mark` VALUES ('23042', '13567626866', '2016111419435568731678', '20161114021678', '0.8062', '0.7512', '0', '1', '正确', '0', '2016-11-14 19:46:44');
INSERT INTO `ke_mark` VALUES ('23043', '13567626866', '2016111419524682521369', '20161114021369', '0.6391', '0.3035', '0', '1', '正确', '0', '2016-11-14 19:54:23');
INSERT INTO `ke_mark` VALUES ('23044', '13567626866', '2016111419524682521369', '20161114021369', '0.5625', '0.4547', '0', '1', '正确', '0', '2016-11-14 19:54:23');
INSERT INTO `ke_mark` VALUES ('23045', '13567626866', '2016111419524682521369', '20161114021369', '0.6484', '0.8449', '1', '1', '正确', '0', '2016-11-14 19:54:23');
INSERT INTO `ke_mark` VALUES ('23046', '13567626866', '2016111419524682501369', '20161114021369', '0.5063', '0.4043', '0', '1', '正确', '0', '2016-11-14 19:54:35');
INSERT INTO `ke_mark` VALUES ('23047', '13567626866', '2016111419524682501369', '20161114021369', '0.7031', '0.7570', '0', '1', '正确', '0', '2016-11-14 19:54:35');
INSERT INTO `ke_mark` VALUES ('23048', '13567626866', '2016111419524682531369', '20161114021369', '0.6922', '0.2180', '0', '1', '正确', '0', '2016-11-14 19:54:42');
INSERT INTO `ke_mark` VALUES ('23049', '13567626866', '2016111419524682531369', '20161114021369', '0.7781', '0.5379', '1', '1', '正确', '0', '2016-11-14 19:54:42');
INSERT INTO `ke_mark` VALUES ('23050', '13567626866', '2016111419524682531369', '20161114021369', '0.7688', '0.8273', '0', '1', '正确', '0', '2016-11-14 19:54:42');
INSERT INTO `ke_mark` VALUES ('23051', '13567626866', '2016111419524682541369', '20161114021369', '0.3922', '0.1641', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23052', '13567626866', '2016111419524682541369', '20161114021369', '0.6578', '0.3598', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23053', '13567626866', '2016111419524682541369', '20161114021369', '0.5000', '0.4676', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23054', '13567626866', '2016111419524682541369', '20161114021369', '0.8766', '0.4828', '1', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23055', '13567626866', '2016111419524682541369', '20161114021369', '0.3938', '0.6996', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23056', '13567626866', '2016111419524682541369', '20161114021369', '0.2359', '0.5684', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23057', '13567626866', '2016111419524682541369', '20161114021369', '0.6469', '0.8191', '0', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23058', '13567626866', '2016111419524682541369', '20161114021369', '0.8906', '0.8156', '1', '1', '正确', '0', '2016-11-14 19:55:03');
INSERT INTO `ke_mark` VALUES ('23059', '13567626866', '2016111419524682511369', '20161114021369', '0.1219', '0.0984', '0', '1', '正确', '0', '2016-11-14 19:58:09');
INSERT INTO `ke_mark` VALUES ('23060', '13567626866', '2016111419524682511369', '20161114021369', '0.7250', '0.5906', '0', '1', '正确', '0', '2016-11-14 19:58:09');
INSERT INTO `ke_mark` VALUES ('23061', '13567615730', '2016111419573259115201', '20161114025201', '0.6520', '0.1710', '0', '1', '正确', '0', '2016-11-14 19:58:18');
INSERT INTO `ke_mark` VALUES ('23062', '13567615730', '2016111419573259115201', '20161114025201', '0.6853', '0.3640', '0', '1', '正确', '0', '2016-11-14 19:58:18');
INSERT INTO `ke_mark` VALUES ('23063', '13567615730', '2016111419573259115201', '20161114025201', '0.7400', '0.5880', '0', '1', '正确', '0', '2016-11-14 19:58:18');
INSERT INTO `ke_mark` VALUES ('23064', '13567615730', '2016111419573259115201', '20161114025201', '0.8040', '0.7930', '0', '1', '正确', '0', '2016-11-14 19:58:18');
INSERT INTO `ke_mark` VALUES ('23065', '13567615730', '2016111419573259105201', '20161114025201', '0.7960', '0.1450', '0', '1', '正确', '0', '2016-11-14 19:58:32');
INSERT INTO `ke_mark` VALUES ('23066', '13567615730', '2016111419573259105201', '20161114025201', '0.8067', '0.3290', '0', '1', '正确', '0', '2016-11-14 19:58:32');
INSERT INTO `ke_mark` VALUES ('23067', '13567615730', '2016111419573259105201', '20161114025201', '0.8053', '0.5850', '0', '1', '正确', '0', '2016-11-14 19:58:32');
INSERT INTO `ke_mark` VALUES ('23068', '13567615730', '2016111419573259105201', '20161114025201', '0.7813', '0.7810', '0', '1', '正确', '0', '2016-11-14 19:58:32');
INSERT INTO `ke_mark` VALUES ('23069', '13567615730', '2016111419573259125201', '20161114025201', '0.6547', '0.1040', '0', '1', '正确', '0', '2016-11-14 19:58:45');
INSERT INTO `ke_mark` VALUES ('23070', '13567615730', '2016111419573259125201', '20161114025201', '0.8640', '0.3140', '1', '1', '正确', '0', '2016-11-14 19:58:45');
INSERT INTO `ke_mark` VALUES ('23071', '13567615730', '2016111419573259125201', '20161114025201', '0.5693', '0.5940', '0', '1', '正确', '0', '2016-11-14 19:58:45');
INSERT INTO `ke_mark` VALUES ('23072', '13567615730', '2016111419573259125201', '20161114025201', '0.8373', '0.8620', '1', '1', '正确', '0', '2016-11-14 19:58:45');
INSERT INTO `ke_mark` VALUES ('23073', '13567615730', '2016111419573259135201', '20161114025201', '0.5347', '0.1580', '0', '1', '正确', '0', '2016-11-14 19:58:57');
INSERT INTO `ke_mark` VALUES ('23074', '13567615730', '2016111419573259135201', '20161114025201', '0.7587', '0.4120', '0', '1', '正确', '0', '2016-11-14 19:58:57');
INSERT INTO `ke_mark` VALUES ('23075', '13567615730', '2016111419573259135201', '20161114025201', '0.7200', '0.7050', '0', '1', '正确', '0', '2016-11-14 19:58:57');
INSERT INTO `ke_mark` VALUES ('23076', '13567626866', '2016111420012973627634', '20161114027634', '0.7141', '0.1406', '0', '1', '正确', '0', '2016-11-14 20:02:09');
INSERT INTO `ke_mark` VALUES ('23077', '13567626866', '2016111420012973627634', '20161114027634', '0.7937', '0.4313', '0', '1', '正确', '0', '2016-11-14 20:02:09');
INSERT INTO `ke_mark` VALUES ('23078', '13567626866', '2016111420012973627634', '20161114027634', '0.7219', '0.7688', '0', '1', '正确', '0', '2016-11-14 20:02:09');
INSERT INTO `ke_mark` VALUES ('23079', '13567626866', '2016111420012973617634', '20161114027634', '0.7484', '0.1500', '0', '1', '正确', '0', '2016-11-14 20:02:20');
INSERT INTO `ke_mark` VALUES ('23080', '13567626866', '2016111420012973617634', '20161114027634', '0.7906', '0.4477', '0', '1', '正确', '0', '2016-11-14 20:02:20');
INSERT INTO `ke_mark` VALUES ('23081', '13567626866', '2016111420012973617634', '20161114027634', '0.8172', '0.7207', '0', '1', '正确', '0', '2016-11-14 20:02:20');
INSERT INTO `ke_mark` VALUES ('23082', '13567626866', '2016111420012973607634', '20161114027634', '0.7203', '0.0797', '0', '1', '正确', '0', '2016-11-14 20:03:04');
INSERT INTO `ke_mark` VALUES ('23083', '13567626866', '2016111420012973607634', '20161114027634', '0.7594', '0.2848', '0', '1', '正确', '0', '2016-11-14 20:03:04');
INSERT INTO `ke_mark` VALUES ('23084', '13567626866', '2016111420012973607634', '20161114027634', '0.7547', '0.4617', '0', '1', '正确', '0', '2016-11-14 20:03:04');
INSERT INTO `ke_mark` VALUES ('23085', '13567626866', '2016111420012973607634', '20161114027634', '0.7437', '0.6879', '0', '0', '粗心大意', '1', '2016-11-14 20:03:04');
INSERT INTO `ke_mark` VALUES ('23086', '13567626866', '2016111420012973607634', '20161114027634', '0.6500', '0.8695', '0', '1', '正确', '0', '2016-11-14 20:03:04');
INSERT INTO `ke_mark` VALUES ('23087', '13567626866', '2016111420012973637634', '20161114027634', '0.6031', '0.3691', '0', '1', '正确', '0', '2016-11-14 20:03:14');
INSERT INTO `ke_mark` VALUES ('23088', '13567626866', '2016111420012973637634', '20161114027634', '0.8672', '0.3984', '1', '1', '正确', '0', '2016-11-14 20:03:14');
INSERT INTO `ke_mark` VALUES ('23089', '13567626866', '2016111420012973637634', '20161114027634', '0.7984', '0.5063', '0', '1', '正确', '0', '2016-11-14 20:03:14');
INSERT INTO `ke_mark` VALUES ('23090', '13567626866', '2016111420012973637634', '20161114027634', '0.1391', '0.6762', '0', '1', '正确', '0', '2016-11-14 20:03:14');
INSERT INTO `ke_mark` VALUES ('23091', '13567626866', '2016111420062438514970', '20161114024970', '0.7267', '0.5810', '0', '1', '正确', '0', '2016-11-14 20:06:49');
INSERT INTO `ke_mark` VALUES ('23092', '13567626866', '2016111420062438504970', '20161114024970', '0.7200', '0.8110', '0', '1', '正确', '0', '2016-11-14 20:06:54');
INSERT INTO `ke_mark` VALUES ('23093', '13120683381', '2016111509403455704916', '20161115024916', '0.66805553', '0.56927085', '0', '0', '审题错误', '1', '2016-11-15 09:46:25');
INSERT INTO `ke_mark` VALUES ('23094', '13120683381', '2016111509403455704916', '20161115024916', '0.5375', '0.37135416', '0', '1', '', '0', '2016-11-15 09:46:25');
INSERT INTO `ke_mark` VALUES ('23095', '13120683381', '2016111509403455704916', '20161115024916', '0.55138886', '0.4796875', '0', '0', '计算错误', '1', '2016-11-15 09:46:25');
INSERT INTO `ke_mark` VALUES ('23096', '13120683381', '2016111509403455704916', '20161115024916', '0.5708333', '0.68385416', '0', '0', '粗心大意', '1', '2016-11-15 09:46:25');
INSERT INTO `ke_mark` VALUES ('23097', '13120683381', '2016111509403455704916', '20161115024916', '0.23333333', '0.5473958', '0', '0', '建议答疑', '1', '2016-11-15 09:46:25');
INSERT INTO `ke_mark` VALUES ('23098', '13120683381', '2016111509474282100514', '20161115020514', '0.30972221', '0.5890625', '1', '0', '粗心大意', '1', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23099', '13120683381', '2016111509474282100514', '20161115020514', '0.4376736', '0.41354167', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23100', '13120683381', '2016111509474282100514', '20161115020514', '0.7652778', '0.32135418', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23101', '13120683381', '2016111509474282100514', '20161115020514', '0.56666666', '0.16614583', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23102', '13120683381', '2016111509474282100514', '20161115020514', '0.35694444', '0.8453125', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23103', '13120683381', '2016111509474282100514', '20161115020514', '0.21840277', '0.53982437', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23104', '13120683381', '2016111509474282100514', '20161115020514', '0.46979168', '0.51770836', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23105', '13120683381', '2016111509474282100514', '20161115020514', '0.48815447', '0.82395834', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23106', '13120683381', '2016111509474282100514', '20161115020514', '0.17266765', '0.85', '0', '1', ' ', '0', '2016-11-15 10:48:32');
INSERT INTO `ke_mark` VALUES ('23118', '18324373866', '2016111416391941103964', '20161114023964', '0.45277777', '0.5442708', '0', '1', ' ', '0', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23119', '18324373866', '2016111416391941103964', '20161114023964', '0.19722222', '0.34010416', '0', '0', '概念不清', '1', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23120', '18324373866', '2016111416391941103964', '20161114023964', '0.29600695', '0.58529186', '0', '1', ' ', '0', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23121', '18324373866', '2016111416391941103964', '20161114023964', '0.5390625', '0.5219764', '0', '1', ' ', '0', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23122', '18324373866', '2016111416391941103964', '20161114023964', '0.5543914', '0.646875', '0', '1', ' ', '0', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23123', '18324373866', '2016111416391941103964', '20161114023964', '0.44295895', '0.64270836', '0', '1', ' ', '0', '2016-11-15 10:53:44');
INSERT INTO `ke_mark` VALUES ('23124', '13120683381', '2016111510510875001395', '20161115021395', '-5.557657', '-11.325759', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23125', '13120683381', '2016111510510875001395', '20161115021395', '-5.45184', '-11.337968', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23126', '13120683381', '2016111510510875001395', '20161115021395', '-5.348058', '-11.309988', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23127', '13120683381', '2016111510510875001395', '20161115021395', '-5.628201', '-11.321689', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23128', '13120683381', '2016111510510875001395', '20161115021395', '0.38740015', '0.71378183', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23129', '13120683381', '2016111510510875001395', '20161115021395', '0.45659158', '0.7080669', '0', '1', ' ', '0', '2016-11-15 11:00:04');
INSERT INTO `ke_mark` VALUES ('23130', '13120683381', '2016111511004147804287', '20161115024287', '-5.858333', '-11.5494795', '0', '1', ' ', '0', '2016-11-15 11:01:09');
INSERT INTO `ke_mark` VALUES ('23131', '13120683381', '2016111511004147804287', '20161115024287', '0.37767795', '0.5385417', '0', '1', ' ', '0', '2016-11-15 11:01:09');
INSERT INTO `ke_mark` VALUES ('23132', '13120683381', '2016111511004147804287', '20161115024287', '0.51805556', '0.5259438', '0', '1', ' ', '0', '2016-11-15 11:01:09');
INSERT INTO `ke_mark` VALUES ('23133', '13120683381', '2016111511004147804287', '20161115024287', '0.21057983', '0.87916666', '0', '1', ' ', '0', '2016-11-15 11:01:09');
INSERT INTO `ke_mark` VALUES ('23134', '13120683381', '2016111511050834707296', '20161115027296', '0.37916666', '0.65232915', '0', '1', ' ', '0', '2016-11-15 11:06:48');
INSERT INTO `ke_mark` VALUES ('23135', '13120683381', '2016111511050834707296', '20161115027296', '0.20000865', '0.43020833', '0', '1', ' ', '0', '2016-11-15 11:06:48');
INSERT INTO `ke_mark` VALUES ('23136', '13120683381', '2016111511050834707296', '20161115027296', '0.7361111', '0.42395833', '0', '1', ' ', '0', '2016-11-15 11:06:48');
INSERT INTO `ke_mark` VALUES ('23137', '18702103770', '2016111511080993805891', '20161115025891', '0.5950', '0.4482', '0', '1', '正确', '0', '2016-11-15 11:08:47');
INSERT INTO `ke_mark` VALUES ('23138', '13120683381', '2016111511401369305710', '20161115025710', '-5.133333', '-15.4713545', '1', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23139', '13120683381', '2016111511401369305710', '20161115025710', '-5.084722', '-15.407812', '1', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23140', '13120683381', '2016111511401369305710', '20161115025710', '-5.1444445', '-15.334896', '1', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23141', '13120683381', '2016111511401369305710', '20161115025710', '-5.195833', '-15.248438', '1', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23142', '13120683381', '2016111511401369305710', '20161115025710', '-5.2152777', '-15.154688', '1', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23143', '13120683381', '2016111511401369305710', '20161115025710', '0.4236111', '0.8375', '0', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23144', '13120683381', '2016111511401369305710', '20161115025710', '0.59444445', '0.8462394', '0', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23145', '13120683381', '2016111511401369305710', '20161115025710', '0.40833333', '0.44596824', '0', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23146', '13120683381', '2016111511401369305710', '20161115025710', '0.55694443', '0.40457115', '0', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23147', '13120683381', '2016111511401369305710', '20161115025710', '0.20277777', '0.74388534', '0', '1', ' ', '0', '2016-11-15 12:47:03');
INSERT INTO `ke_mark` VALUES ('23148', '13120683381', '2016111512474536202645', '20161115022645', '0.31527779', '0.7638118', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23149', '13120683381', '2016111512474536202645', '20161115022645', '0.20869324', '0.78125', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23150', '13120683381', '2016111512474536202645', '20161115022645', '0.075', '0.78581893', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23151', '13120683381', '2016111512474536202645', '20161115022645', '0.43867224', '0.75745416', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23152', '13120683381', '2016111512474536202645', '20161115022645', '-5.227778', '-15.420313', '1', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23153', '13120683381', '2016111512474536202645', '20161115022645', '0.9146001', '0.8058206', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23154', '13120683381', '2016111512474536202645', '20161115022645', '0.7574842', '0.809375', '0', '1', ' ', '0', '2016-11-15 12:48:42');
INSERT INTO `ke_mark` VALUES ('23155', '13120683381', '2016111512510260008640', '20161115028640', '-5.327778', '-15.400282', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23156', '13120683381', '2016111512510260008640', '20161115028640', '-5.2916665', '-15.557226', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23157', '13120683381', '2016111512510260008640', '20161115028640', '-5.3101854', '-15.637782', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23158', '13120683381', '2016111512510260008640', '20161115028640', '-5.3083334', '-15.723199', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23159', '13120683381', '2016111512510260008640', '20161115028640', '-5.241667', '-15.837088', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23160', '13120683381', '2016111512510260008640', '20161115028640', '-5.677778', '-15.812088', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23161', '13120683381', '2016111512510260008640', '20161115028640', '-5.899074', '-15.822504', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23162', '13120683381', '2016111512510260008640', '20161115028640', '-5.4555554', '-15.825976', '1', '1', ' ', '0', '2016-11-15 12:51:23');
INSERT INTO `ke_mark` VALUES ('23163', '13120683381', '2016111512531084705460', '20161115025460', '-5.5185184', '-15.717643', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23164', '13120683381', '2016111512531084705460', '20161115025460', '-5.6017985', '-15.4044485', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23165', '13120683381', '2016111512531084705460', '20161115025460', '-5.272222', '-15.354448', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23166', '13120683381', '2016111512531084705460', '20161115025460', '-5.798148', '-15.210699', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23167', '13120683381', '2016111512531084705460', '20161115025460', '-5.4657407', '-15.2065325', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23168', '13120683381', '2016111512531084705460', '20161115025460', '-5.087963', '-15.202366', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23169', '13120683381', '2016111512531084705460', '20161115025460', '-5.1046295', '-15.635698', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23170', '13120683381', '2016111512531084705460', '20161115025460', '-5.446296', '-15.929449', '1', '1', ' ', '0', '2016-11-15 12:55:05');
INSERT INTO `ke_mark` VALUES ('23175', '13120683381', '2016111513024552203072', '20161115023072', '0.28877315', '0.4230469', '0', '1', ' ', '0', '2016-11-15 13:03:28');
INSERT INTO `ke_mark` VALUES ('23176', '13120683381', '2016111513024552203072', '20161115023072', '0.7582176', '0.52235246', '0', '1', ' ', '0', '2016-11-15 13:03:28');
INSERT INTO `ke_mark` VALUES ('23177', '13120683381', '2016111513024552203072', '20161115023072', '0.62118053', '0.4202691', '0', '1', ' ', '0', '2016-11-15 13:03:28');
INSERT INTO `ke_mark` VALUES ('23178', '13120683381', '2016111513024552203072', '20161115023072', '0.6767361', '0.8265191', '0', '1', ' ', '0', '2016-11-15 13:03:28');
INSERT INTO `ke_mark` VALUES ('23179', '13120683381', '2016111513024552203072', '20161115023072', '0.39814815', '0.66221786', '1', '1', ' ', '0', '2016-11-15 13:03:28');
INSERT INTO `ke_mark` VALUES ('23187', '13120683381', '2016111513040200208792', '20161115028792', '0.11334235', '0.31749132', '0', '1', ' ', '0', '2016-11-15 13:04:49');
INSERT INTO `ke_mark` VALUES ('23188', '13120683381', '2016111513040200208792', '20161115028792', '0.20914352', '0.5674913', '0', '1', ' ', '0', '2016-11-15 13:04:49');
INSERT INTO `ke_mark` VALUES ('23189', '13120683381', '2016111513040200208792', '20161115028792', '0.77766204', '0.7063802', '0', '1', ' ', '0', '2016-11-15 13:04:49');
INSERT INTO `ke_mark` VALUES ('23190', '13120683381', '2016111513040200208792', '20161115028792', '0.86377317', '0.2765191', '0', '1', ' ', '0', '2016-11-15 13:04:49');
INSERT INTO `ke_mark` VALUES ('23191', '13120683381', '2016111513052713309253', '20161115029253', '0.6472222', '0.5844401', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23192', '13120683381', '2016111513052713309253', '20161115029253', '0.47407407', '0.5955512', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23193', '13120683381', '2016111513052713309253', '20161115029253', '0.33796296', '0.5948568', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23194', '13120683381', '2016111513052713309253', '20161115029253', '0.79444444', '0.5531901', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23195', '13120683381', '2016111513052713309253', '20161115029253', '0.7138889', '0.43930122', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23196', '13120683381', '2016111513052713309253', '20161115029253', '0.5462963', '0.4469401', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23197', '13120683381', '2016111513052713309253', '20161115029253', '0.35185185', '0.44971788', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23198', '13120683381', '2016111513052713309253', '20161115029253', '0.19722222', '0.45527345', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23199', '13120683381', '2016111513052713309253', '20161115029253', '0.28333333', '0.354579', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23200', '13120683381', '2016111513052713309253', '20161115029253', '0.43333334', '0.33791232', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23201', '13120683381', '2016111513052713309253', '20161115029253', '0.57685184', '0.34138456', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23202', '13120683381', '2016111513052713309253', '20161115029253', '0.712037', '0.33930123', '1', '1', ' ', '0', '2016-11-15 13:05:47');
INSERT INTO `ke_mark` VALUES ('23203', '13120683381', '2016111513155646907508', '20161115027508', '0.58055556', '0.44416234', '1', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23204', '13120683381', '2016111513155646907508', '20161115027508', '0.73703706', '0.43930122', '1', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23205', '13120683381', '2016111513155646907508', '20161115027508', '0.91481483', '0.44138455', '1', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23206', '13120683381', '2016111513155646907508', '20161115027508', '0.37766203', '0.6417969', '0', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23207', '13120683381', '2016111513155646907508', '20161115027508', '0.51840276', '0.6351387', '0', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23208', '13120683381', '2016111513155646907508', '20161115027508', '0.665625', '0.6292969', '0', '1', ' ', '0', '2016-11-15 13:16:16');
INSERT INTO `ke_mark` VALUES ('23209', '13120683381', '2016111513202468303089', '20161115023089', '0.30833334', '0.7441623', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23210', '13120683381', '2016111513202468303089', '20161115023089', '0.4148148', '0.8594401', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23211', '13120683381', '2016111513202468303089', '20161115023089', '0.6888889', '0.5816623', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23212', '13120683381', '2016111513202468303089', '20161115023089', '0.41666666', '0.27471787', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23213', '13120683381', '2016111513202468303089', '20161115023089', '0.44351852', '0.37402344', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23214', '13120683381', '2016111513202468303089', '20161115023089', '0.7880787', '0.6831912', '1', '1', ' ', '0', '2016-11-15 13:21:00');
INSERT INTO `ke_mark` VALUES ('23224', '13120683381', '2016111513385311605742', '20161115025742', '0.58055556', '0.5497179', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23225', '13120683381', '2016111513385311605742', '20161115025742', '0.70092595', '0.5406901', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23226', '13120683381', '2016111513385311605742', '20161115025742', '0.8148148', '0.53721786', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23227', '13120683381', '2016111513385311605742', '20161115025742', '0.61944443', '0.5955512', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23228', '13120683381', '2016111513385311605742', '20161115025742', '0.7259259', '0.6059679', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23229', '13120683381', '2016111513385311605742', '20161115025742', '0.8518519', '0.5899957', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23230', '13120683381', '2016111513385311605742', '20161115025742', '0.50266206', '0.7598524', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23231', '13120683381', '2016111513385311605742', '20161115025742', '0.5795139', '0.76228297', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23232', '13120683381', '2016111513385311605742', '20161115025742', '0.6497026', '0.76818573', '0', '1', ' ', '0', '2016-11-15 13:39:22');
INSERT INTO `ke_mark` VALUES ('23233', '13567626866', '2016111514542847909568', '20161115029568', '0.6625', '0.1242', '0', '1', '正确', '0', '2016-11-15 14:55:17');
INSERT INTO `ke_mark` VALUES ('23234', '13567626866', '2016111514542847909568', '20161115029568', '0.6406', '0.6223', '0', '1', '正确', '0', '2016-11-15 14:55:17');
INSERT INTO `ke_mark` VALUES ('23235', '13567626866', '2016111514542847929568', '20161115029568', '0.6891', '0.1242', '0', '1', '正确', '0', '2016-11-15 14:55:40');
INSERT INTO `ke_mark` VALUES ('23236', '13567626866', '2016111514542847929568', '20161115029568', '0.7469', '0.3832', '0', '0', '计算错误', '1', '2016-11-15 14:55:40');
INSERT INTO `ke_mark` VALUES ('23237', '13567626866', '2016111514542847919568', '20161115029568', '0.8406', '0.1992', '0', '1', '正确', '0', '2016-11-15 14:56:15');
INSERT INTO `ke_mark` VALUES ('23238', '13567626866', '2016111514542847919568', '20161115029568', '0.9828', '0.5004', '1', '1', '正确', '0', '2016-11-15 14:56:15');
INSERT INTO `ke_mark` VALUES ('23239', '13567626866', '2016111514542847939568', '20161115029568', '0.6969', '0.2051', '0', '1', '正确', '0', '2016-11-15 14:57:31');
INSERT INTO `ke_mark` VALUES ('23240', '13567626866', '2016111514542847939568', '20161115029568', '0.6766', '0.5391', '0', '1', '正确', '0', '2016-11-15 14:57:31');
INSERT INTO `ke_mark` VALUES ('23241', '13567626866', '2016111514542847939568', '20161115029568', '0.6672', '0.8203', '0', '0', '问问老师', '1', '2016-11-15 14:57:31');
INSERT INTO `ke_mark` VALUES ('23242', '13567626866', '2016111515023037316792', '20161115026792', '0.8125', '0.3129', '0', '1', '正确', '0', '2016-11-15 15:03:13');
INSERT INTO `ke_mark` VALUES ('23243', '13567626866', '2016111515023037316792', '20161115026792', '0.8375', '0.6387', '1', '1', '正确', '0', '2016-11-15 15:03:13');
INSERT INTO `ke_mark` VALUES ('23244', '13567626866', '2016111515023037316792', '20161115026792', '0.8516', '0.1277', '1', '0', '计算错误', '1', '2016-11-15 15:03:13');
INSERT INTO `ke_mark` VALUES ('23245', '13567626866', '2016111515023037316792', '20161115026792', '0.8219', '0.4652', '1', '0', '审题错误', '1', '2016-11-15 15:03:13');
INSERT INTO `ke_mark` VALUES ('23246', '13567626866', '2016111515023037306792', '20161115026792', '0.6938', '0.2051', '0', '1', '正确', '0', '2016-11-15 15:03:35');
INSERT INTO `ke_mark` VALUES ('23247', '13567626866', '2016111515023037306792', '20161115026792', '0.7812', '0.4934', '0', '0', '概念不清', '1', '2016-11-15 15:03:35');
INSERT INTO `ke_mark` VALUES ('23248', '13567626866', '2016111515023037336792', '20161115026792', '0.5891', '0.1582', '0', '1', '正确', '0', '2016-11-15 15:04:01');
INSERT INTO `ke_mark` VALUES ('23249', '13567626866', '2016111515023037336792', '20161115026792', '0.6922', '0.3937', '0', '1', '正确', '0', '2016-11-15 15:04:01');
INSERT INTO `ke_mark` VALUES ('23250', '13567626866', '2016111515023037336792', '20161115026792', '0.6953', '0.5508', '0', '0', '计算错误', '1', '2016-11-15 15:04:01');
INSERT INTO `ke_mark` VALUES ('23251', '13567626866', '2016111515023037336792', '20161115026792', '0.7437', '0.6305', '0', '0', '审题错误', '1', '2016-11-15 15:04:01');
INSERT INTO `ke_mark` VALUES ('23252', '13567626866', '2016111515023037326792', '20161115026792', '0.6703', '0.6129', '0', '1', '正确', '0', '2016-11-15 15:04:31');
INSERT INTO `ke_mark` VALUES ('23253', '13567626866', '2016111515023037326792', '20161115026792', '0.7000', '0.3176', '0', '0', '审题错误', '1', '2016-11-15 15:04:31');
INSERT INTO `ke_mark` VALUES ('23254', '13567626866', '2016111515273550609081', '20161115029081', '0.7531', '0.1875', '0', '1', '正确', '0', '2016-11-15 15:30:13');
INSERT INTO `ke_mark` VALUES ('23255', '13567626866', '2016111515273550609081', '20161115029081', '0.7625', '0.5988', '0', '1', '正确', '0', '2016-11-15 15:30:13');
INSERT INTO `ke_mark` VALUES ('23256', '13567626866', '2016111515341508604367', '20161115024367', '0.5969', '0.3340', '0', '1', '正确', '0', '2016-11-15 15:35:35');
INSERT INTO `ke_mark` VALUES ('23257', '13567626866', '2016111515352057304356', '20161115024356', '0.6703', '0.4641', '0', '1', '正确', '0', '2016-11-15 15:35:41');
INSERT INTO `ke_mark` VALUES ('23258', '13567626866', '2016111515352057304356', '20161115024356', '0.7188', '0.6820', '0', '1', '正确', '0', '2016-11-15 15:35:41');
INSERT INTO `ke_mark` VALUES ('23259', '13567615730', '2016111516162888900962', '20161115020962', '0.4440', '0.5860', '0', '1', '正确', '0', '2016-11-15 16:16:55');
INSERT INTO `ke_mark` VALUES ('23260', '13567615730', '2016111516182343802651', '20161115022651', '0.4560', '0.6600', '0', '1', '正确', '0', '2016-11-15 16:18:35');
INSERT INTO `ke_mark` VALUES ('23261', '13567615730', '2016111516211869208136', '20161115028136', '0.8373', '0.2140', '0', '1', '正确', '0', '2016-11-15 16:22:32');
INSERT INTO `ke_mark` VALUES ('23262', '13567626866', '2016111516331304211075', '20161115021075', '0.7422', '0.4172', '0', '1', '正确', '0', '2016-11-15 16:34:14');
INSERT INTO `ke_mark` VALUES ('23263', '13567626866', '2016111516331304211075', '20161115021075', '0.7531', '0.7207', '0', '0', '审题错误', '1', '2016-11-15 16:34:14');
INSERT INTO `ke_mark` VALUES ('23264', '13567626866', '2016111516331304211075', '20161115021075', '0.3125', '0.6867', '0', '0', '粗心大意', '1', '2016-11-15 16:34:14');
INSERT INTO `ke_mark` VALUES ('23265', '13567626866', '2016111516331304201075', '20161115021075', '0.6641', '0.5156', '0', '1', '正确', '0', '2016-11-15 16:34:24');
INSERT INTO `ke_mark` VALUES ('23266', '13567626866', '2016111516331304201075', '20161115021075', '0.6469', '0.7570', '0', '1', '正确', '0', '2016-11-15 16:34:24');
INSERT INTO `ke_mark` VALUES ('23267', '13567626866', '2016111516331304201075', '20161115021075', '0.3375', '0.4594', '0', '1', '正确', '0', '2016-11-15 16:34:24');
INSERT INTO `ke_mark` VALUES ('23268', '13567626866', '2016111516331304201075', '20161115021075', '0.3484', '0.7617', '0', '1', '正确', '0', '2016-11-15 16:34:24');
INSERT INTO `ke_mark` VALUES ('23269', '13120683381', '2016111517273815501724', '20161115021724', '0.2583912', '0.47096354', '0', '1', ' ', '0', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23270', '13120683381', '2016111517273815501724', '20161115021724', '0.23153935', '0.4265191', '0', '1', ' ', '0', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23271', '13120683381', '2016111517273815501724', '20161115021724', '0.38524306', '0.34596354', '0', '1', ' ', '0', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23272', '13120683381', '2016111517273815501724', '20161115021724', '0.23061343', '0.371658', '0', '1', ' ', '0', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23273', '13120683381', '2016111517273815501724', '20161115021724', '0.66672456', '0.309158', '0', '1', ' ', '0', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23274', '13120683381', '2016111517273815501724', '20161115021724', '0.62690973', '0.53346354', '0', '0', '建议答疑', '1', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23275', '13120683381', '2016111517273815501724', '20161115021724', '0.6000579', '0.42721355', '0', '0', '概念不清', '1', '2016-11-15 17:28:24');
INSERT INTO `ke_mark` VALUES ('23276', '13567626866', '2016111518581871206704', '20161115026704', '0.7359', '0.4512', '0', '1', '正确', '0', '2016-11-15 18:59:25');
INSERT INTO `ke_mark` VALUES ('23277', '13567626866', '2016111518581871206704', '20161115026704', '0.7094', '0.7559', '0', '1', '正确', '0', '2016-11-15 18:59:25');
INSERT INTO `ke_mark` VALUES ('23278', '13567626866', '2016111518581871206704', '20161115026704', '0.4391', '0.7043', '0', '0', '计算错误', '1', '2016-11-15 18:59:25');
INSERT INTO `ke_mark` VALUES ('23279', '13567615730', '2016111518515688008760', '20161115028760', '0.6493', '0.6410', '0', '1', '正确', '0', '2016-11-15 19:00:57');
INSERT INTO `ke_mark` VALUES ('23280', '13567615730', '2016111518515688008760', '20161115028760', '0.7480', '0.3600', '0', '1', '正确', '0', '2016-11-15 19:00:57');
INSERT INTO `ke_mark` VALUES ('23281', '13567615730', '2016111518515688018760', '20161115028760', '0.6000', '0.5680', '0', '1', '正确', '0', '2016-11-15 19:01:04');
INSERT INTO `ke_mark` VALUES ('23282', '13567615730', '2016111518515688018760', '20161115028760', '0.6280', '0.1400', '0', '1', '正确', '0', '2016-11-15 19:01:04');
INSERT INTO `ke_mark` VALUES ('23283', '13567615730', '2016111518515688028760', '20161115028760', '0.6760', '0.1940', '0', '1', '正确', '0', '2016-11-15 19:01:11');
INSERT INTO `ke_mark` VALUES ('23284', '13567615730', '2016111518515688028760', '20161115028760', '0.6720', '0.4070', '0', '1', '正确', '0', '2016-11-15 19:01:11');
INSERT INTO `ke_mark` VALUES ('23285', '13567615730', '2016111518515688028760', '20161115028760', '0.5893', '0.7670', '0', '1', '正确', '0', '2016-11-15 19:01:11');
INSERT INTO `ke_mark` VALUES ('23286', '13567626866', '2016111519002792104950', '20161115024950', '0.6812', '0.5777', '0', '1', '正确', '0', '2016-11-15 19:02:01');
INSERT INTO `ke_mark` VALUES ('23287', '13567626866', '2016111519002792114950', '20161115024950', '0.7312', '0.3527', '0', '1', '正确', '0', '2016-11-15 19:02:06');
INSERT INTO `ke_mark` VALUES ('23288', '13567626866', '2016111519133484100914', '20161115020914', '0.7307', '0.3690', '0', '1', '正确', '0', '2016-11-15 19:16:24');
INSERT INTO `ke_mark` VALUES ('23289', '13567626866', '2016111519133484100914', '20161115020914', '0.7307', '0.7910', '0', '1', '正确', '0', '2016-11-15 19:16:24');
INSERT INTO `ke_mark` VALUES ('23290', '13567626866', '2016111519133484100914', '20161115020914', '0.2680', '0.3720', '0', '0', '计算错误', '1', '2016-11-15 19:16:24');
INSERT INTO `ke_mark` VALUES ('23291', '13567626866', '2016111519133484110914', '20161115020914', '0.4493', '0.4660', '0', '1', '正确', '0', '2016-11-15 19:16:30');
INSERT INTO `ke_mark` VALUES ('23292', '13567626866', '2016111519133484110914', '20161115020914', '0.4973', '0.8170', '0', '1', '正确', '0', '2016-11-15 19:16:30');
INSERT INTO `ke_mark` VALUES ('23293', '13567626866', '2016111519133484120914', '20161115020914', '0.3200', '0.1790', '0', '1', '正确', '0', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23294', '13567626866', '2016111519133484120914', '20161115020914', '0.3667', '0.3940', '0', '1', '正确', '0', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23295', '13567626866', '2016111519133484120914', '20161115020914', '0.7973', '0.1280', '0', '1', '正确', '0', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23296', '13567626866', '2016111519133484120914', '20161115020914', '0.8307', '0.3830', '0', '1', '正确', '0', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23297', '13567626866', '2016111519133484120914', '20161115020914', '0.8133', '0.6970', '0', '0', '审题错误', '1', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23298', '13567626866', '2016111519133484120914', '20161115020914', '0.3520', '0.6920', '0', '0', '计算错误', '1', '2016-11-15 19:16:46');
INSERT INTO `ke_mark` VALUES ('23299', '13567626866', '2016111519201360808624', '20161115028624', '0.7147', '0.2910', '0', '1', '正确', '0', '2016-11-15 19:26:51');
INSERT INTO `ke_mark` VALUES ('23300', '13567626866', '2016111519201360808624', '20161115028624', '0.7560', '0.5510', '0', '1', '正确', '0', '2016-11-15 19:26:51');
INSERT INTO `ke_mark` VALUES ('23301', '13567626866', '2016111519201360808624', '20161115028624', '0.7413', '0.8600', '0', '1', '正确', '0', '2016-11-15 19:26:51');
INSERT INTO `ke_mark` VALUES ('23302', '13567626866', '2016111519201360818624', '20161115028624', '0.3680', '0.5190', '0', '1', '正确', '0', '2016-11-15 19:26:58');
INSERT INTO `ke_mark` VALUES ('23303', '13567626866', '2016111519201360818624', '20161115028624', '0.8053', '0.5130', '0', '0', '粗心大意', '1', '2016-11-15 19:26:58');
INSERT INTO `ke_mark` VALUES ('23304', '13567626866', '2016111519374819316072', '20161115026072', '0.7453', '0.2040', '0', '1', '正确', '0', '2016-11-15 19:38:20');
INSERT INTO `ke_mark` VALUES ('23305', '13567626866', '2016111519374819316072', '20161115026072', '0.7640', '0.5060', '0', '1', '正确', '0', '2016-11-15 19:38:20');
INSERT INTO `ke_mark` VALUES ('23306', '13567626866', '2016111519374819306072', '20161115026072', '0.7560', '0.2350', '0', '0', '粗心大意', '1', '2016-11-15 19:38:33');
INSERT INTO `ke_mark` VALUES ('23307', '13567626866', '2016111519374819306072', '20161115026072', '0.8067', '0.4890', '0', '0', '计算错误', '1', '2016-11-15 19:38:33');
INSERT INTO `ke_mark` VALUES ('23308', '13567626866', '2016111519525396507236', '20161115027236', '0.7227', '0.1240', '0', '0', '问问老师', '1', '2016-11-15 19:54:23');
INSERT INTO `ke_mark` VALUES ('23309', '13567626866', '2016111519525396507236', '20161115027236', '0.7853', '0.6350', '0', '1', '正确', '0', '2016-11-15 19:54:23');
INSERT INTO `ke_mark` VALUES ('23310', '13567626866', '2016111519525396517236', '20161115027236', '0.7613', '0.2200', '0', '1', '正确', '0', '2016-11-15 19:54:28');
INSERT INTO `ke_mark` VALUES ('23311', '13567626866', '2016111519525396517236', '20161115027236', '0.7480', '0.5060', '0', '1', '正确', '0', '2016-11-15 19:54:28');
INSERT INTO `ke_mark` VALUES ('23312', '18702103770', '2016111609310621602654', '20161116022654', '0.6731', '0.7693', '0', '1', '正确', '0', '2016-11-16 09:36:39');
INSERT INTO `ke_mark` VALUES ('23313', '18702103770', '2016111609320880003657', '20161116023657', '0.5580', '0.5731', '0', '1', '正确', '0', '2016-11-16 09:36:45');
INSERT INTO `ke_mark` VALUES ('23314', '18324373866', '2016111609354200309740', '20161116029740', '0.3937', '0.6534', '0', '1', '正确', '0', '2016-11-16 09:37:56');
INSERT INTO `ke_mark` VALUES ('23315', '18324373866', '2016111609370157901368', '20161116021368', '0.6562', '0.6987', '0', '1', '正确', '0', '2016-11-16 09:38:00');
INSERT INTO `ke_mark` VALUES ('23316', '18324373866', '2016111609403173111630', '20161116021630', '0.6151', '0.7572', '0', '1', '正确', '0', '2016-11-16 09:42:13');
INSERT INTO `ke_mark` VALUES ('23317', '18324373866', '2016111609403173101630', '20161116021630', '0.5717', '0.6709', '0', '1', '正确', '0', '2016-11-16 09:42:20');
INSERT INTO `ke_mark` VALUES ('23318', '18324373866', '2016111609445573200847', '20161116020847', '0.4767', '0.6008', '0', '1', '正确', '0', '2016-11-16 09:45:28');
INSERT INTO `ke_mark` VALUES ('23319', '18324373866', '2016111609445573210847', '20161116020847', '0.5209', '0.6413', '0', '1', '正确', '0', '2016-11-16 09:45:39');
INSERT INTO `ke_mark` VALUES ('23320', '18324373866', '2016111609445573220847', '20161116020847', '0.5201', '0.6600', '0', '1', '正确', '0', '2016-11-16 09:45:57');
INSERT INTO `ke_mark` VALUES ('23321', '13120683381', '2016111611050032806184', '20161116026184', '0.49537036', '0.7511068', '0', '1', ' ', '0', '2016-11-16 11:05:37');
INSERT INTO `ke_mark` VALUES ('23322', '13120683381', '2016111611050032806184', '20161116026184', '0.52962965', '0.8455512', '0', '1', ' ', '0', '2016-11-16 11:05:37');
INSERT INTO `ke_mark` VALUES ('23323', '13120683381', '2016111611050032806184', '20161116026184', '0.19814815', '0.06707899', '0', '1', ' ', '0', '2016-11-16 11:05:37');
INSERT INTO `ke_mark` VALUES ('23324', '13120683381', '2016111611050032806184', '20161116026184', '0.15277778', '0.779579', '0', '1', ' ', '0', '2016-11-16 11:05:37');
INSERT INTO `ke_mark` VALUES ('23325', '18324373866', '2016111613260510905867', '20161116025867', '0.3849', '0.6588', '0', '1', '正确', '0', '2016-11-16 13:26:59');
INSERT INTO `ke_mark` VALUES ('23326', '18324373866', '2016111613263988108753', '20161116028753', '0.6200', '0.8502', '0', '1', '正确', '0', '2016-11-16 13:27:08');
INSERT INTO `ke_mark` VALUES ('23327', '18324373866', '2016111614474528909672', '20161116029672', '0.5620', '0.1051', '0', '1', '正确', '0', '2016-11-16 14:48:25');
INSERT INTO `ke_mark` VALUES ('23328', '18324373866', '2016111614474528909672', '20161116029672', '0.5725', '0.2711', '0', '1', '正确', '0', '2016-11-16 14:48:25');
INSERT INTO `ke_mark` VALUES ('23329', '18324373866', '2016111614474528909672', '20161116029672', '0.5821', '0.4475', '0', '1', '正确', '0', '2016-11-16 14:48:25');
INSERT INTO `ke_mark` VALUES ('23330', '18324373866', '2016111614474528909672', '20161116029672', '0.5966', '0.6522', '0', '1', '正确', '0', '2016-11-16 14:48:25');
INSERT INTO `ke_mark` VALUES ('23331', '18324373866', '2016111614474528909672', '20161116029672', '0.5918', '0.8865', '0', '1', '正确', '0', '2016-11-16 14:48:25');
INSERT INTO `ke_mark` VALUES ('23332', '18324373866', '2016111615192566408329', '20161116028329', '0.6506', '0.1280', '0', '1', '正确', '0', '2016-11-16 15:59:52');
INSERT INTO `ke_mark` VALUES ('23333', '18324373866', '2016111615192566408329', '20161116028329', '0.7238', '0.3134', '0', '1', '正确', '0', '2016-11-16 15:59:52');
INSERT INTO `ke_mark` VALUES ('23334', '18324373866', '2016111615192566408329', '20161116028329', '0.7327', '0.4789', '0', '1', '正确', '0', '2016-11-16 15:59:52');
INSERT INTO `ke_mark` VALUES ('23335', '18324373866', '2016111615192566408329', '20161116028329', '0.7150', '0.6256', '0', '1', '正确', '0', '2016-11-16 15:59:52');
INSERT INTO `ke_mark` VALUES ('23336', '18324373866', '2016111615192566408329', '20161116028329', '0.6916', '0.8659', '0', '1', '正确', '0', '2016-11-16 15:59:52');
INSERT INTO `ke_mark` VALUES ('23337', '18324373866', '2016111616052795810324', '20161116020324', '0.3655', '0.6999', '0', '1', '正确', '0', '2016-11-16 16:07:35');
INSERT INTO `ke_mark` VALUES ('23338', '18324373866', '2016111616052795800324', '20161116020324', '0.5700', '0.8188', '0', '1', '正确', '0', '2016-11-16 16:07:39');
INSERT INTO `ke_mark` VALUES ('23339', '18324373866', '2016111616052795830324', '20161116020324', '0.6248', '0.6854', '0', '1', '正确', '0', '2016-11-16 16:07:51');
INSERT INTO `ke_mark` VALUES ('23340', '18324373866', '2016111616052795850324', '20161116020324', '0.6240', '0.7210', '0', '1', '正确', '0', '2016-11-16 16:07:55');
INSERT INTO `ke_mark` VALUES ('23341', '18324373866', '2016111616052795840324', '20161116020324', '0.6409', '0.7415', '0', '1', '正确', '0', '2016-11-16 16:08:26');
INSERT INTO `ke_mark` VALUES ('23342', '18324373866', '2016111616052795820324', '20161116020324', '0.6312', '0.7778', '0', '1', '正确', '0', '2016-11-16 16:09:47');
INSERT INTO `ke_mark` VALUES ('23343', '18324373866', '2016111616052795820324', '20161116020324', '0.7021', '0.8853', '1', '1', '正确', '0', '2016-11-16 16:09:47');
INSERT INTO `ke_mark` VALUES ('23344', '18702103770', '2016111616063736416852', '20161116026852', '0.3100', '0.5350', '0', '1', '正确', '0', '2016-11-16 16:13:41');
INSERT INTO `ke_mark` VALUES ('23345', '18702103770', '2016111616063736456852', '20161116026852', '0.6763', '0.7271', '0', '1', '正确', '0', '2016-11-16 16:13:46');
INSERT INTO `ke_mark` VALUES ('23346', '18702103770', '2016111616063736436852', '20161116026852', '0.6723', '0.6679', '0', '1', '正确', '0', '2016-11-16 16:13:50');
INSERT INTO `ke_mark` VALUES ('23347', '18702103770', '2016111616063736426852', '20161116026852', '0.6795', '0.6957', '0', '1', '正确', '0', '2016-11-16 16:13:54');
INSERT INTO `ke_mark` VALUES ('23348', '18702103770', '2016111616063736446852', '20161116026852', '0.6804', '0.6546', '0', '1', '正确', '0', '2016-11-16 16:14:27');
INSERT INTO `ke_mark` VALUES ('23349', '18702103770', '2016111616063736446852', '20161116026852', '0.5733', '0.7434', '0', '1', '正确', '0', '2016-11-16 16:14:27');
INSERT INTO `ke_mark` VALUES ('23350', '18702103770', '2016111616063736406852', '20161116026852', '0.6208', '0.6546', '0', '1', '正确', '0', '2016-11-16 16:14:31');
INSERT INTO `ke_mark` VALUES ('23351', '13567626866', '2016111616200177303407', '20161116023407', '0.6990741', '0.22621527', '0', '1', ' ', '0', '2016-11-16 16:20:39');
INSERT INTO `ke_mark` VALUES ('23352', '13567626866', '2016111616200177303407', '20161116023407', '0.64166665', '0.4845486', '0', '1', ' ', '0', '2016-11-16 16:20:39');
INSERT INTO `ke_mark` VALUES ('23353', '13567626866', '2016111616200177303407', '20161116023407', '0.6787037', '0.74774307', '0', '0', '计算错误', '1', '2016-11-16 16:20:39');
INSERT INTO `ke_mark` VALUES ('23354', '13567626866', '2016111616200177313407', '20161116023407', '0.71481484', '0.40260416', '0', '1', ' ', '0', '2016-11-16 16:21:04');
INSERT INTO `ke_mark` VALUES ('23355', '13567626866', '2016111616200177313407', '20161116023407', '0.6324516', '0.70121527', '0', '0', '计算错误', '1', '2016-11-16 16:21:04');
INSERT INTO `ke_mark` VALUES ('23356', '13567626866', '2016111616200177323407', '20161116023407', '0.65833336', '0.7095486', '0', '0', '审题错误', '1', '2016-11-16 16:21:27');
INSERT INTO `ke_mark` VALUES ('23357', '13567626866', '2016111616200177323407', '20161116023407', '0.712037', '0.48385417', '0', '1', ' ', '0', '2016-11-16 16:21:27');
INSERT INTO `ke_mark` VALUES ('23358', '13567626866', '2016111616200177323407', '20161116023407', '0.6085069', '0.5378472', '0', '1', ' ', '0', '2016-11-16 16:21:27');
INSERT INTO `ke_mark` VALUES ('23359', '13567626866', '2016111616244388127654', '20161116027654', '0.7437', '0.3152', '0', '1', '正确', '0', '2016-11-16 16:25:02');
INSERT INTO `ke_mark` VALUES ('23360', '13567626866', '2016111616244388127654', '20161116027654', '0.6094', '0.6562', '0', '1', '正确', '0', '2016-11-16 16:25:02');
INSERT INTO `ke_mark` VALUES ('23361', '13567626866', '2016111616244388107654', '20161116027654', '0.7047', '0.2988', '0', '1', '正确', '0', '2016-11-16 16:25:10');
INSERT INTO `ke_mark` VALUES ('23362', '13567626866', '2016111616244388107654', '20161116027654', '0.6344', '0.6996', '0', '1', '正确', '0', '2016-11-16 16:25:10');
INSERT INTO `ke_mark` VALUES ('23363', '13567626866', '2016111616244388117654', '20161116027654', '0.6719', '0.2707', '0', '1', '正确', '0', '2016-11-16 16:25:17');
INSERT INTO `ke_mark` VALUES ('23364', '13567626866', '2016111616244388117654', '20161116027654', '0.5547', '0.6727', '0', '1', '正确', '0', '2016-11-16 16:25:17');
INSERT INTO `ke_mark` VALUES ('23369', '13567626866', '2016111616284748402145', '20161116022145', '0.7230461', '0.5317708', '0', '1', ' ', '0', '2016-11-16 16:39:04');
INSERT INTO `ke_mark` VALUES ('23370', '13120683381', '2016111616415360900431', '20161116020431', '0.5935185', '0.5761068', '0', '1', ' ', '0', '2016-11-16 16:42:20');
INSERT INTO `ke_mark` VALUES ('23371', '13120683381', '2016111616415360900431', '20161116020431', '0.49074075', '0.43513456', '0', '1', ' ', '0', '2016-11-16 16:42:20');
INSERT INTO `ke_mark` VALUES ('23372', '13120683381', '2016111616415360900431', '20161116020431', '0.4', '0.28235677', '0', '1', ' ', '0', '2016-11-16 16:42:20');
INSERT INTO `ke_mark` VALUES ('23373', '13567626866', '2016111717585831002503', '20161117022503', '0.6960', '0.3760', '0', '0', '概念不清', '1', '2016-11-17 17:59:27');
INSERT INTO `ke_mark` VALUES ('23374', '13567626866', '2016111718055913503850', '20161117023850', '0.73796296', '0.54010415', '0', '1', ' ', '0', '2016-11-17 18:06:24');
INSERT INTO `ke_mark` VALUES ('23375', '13567626866', '2016111718055913503850', '20161117023850', '0.71018517', '0.7685764', '0', '1', ' ', '0', '2016-11-17 18:06:24');
INSERT INTO `ke_mark` VALUES ('23376', '13567615730', '2016111718033071803709', '20161117023709', '0.6840', '0.3470', '0', '0', '粗心大意', '1', '2016-11-17 18:20:30');
INSERT INTO `ke_mark` VALUES ('23377', '13567615730', '2016111718033071803709', '20161117023709', '0.6160', '0.5350', '0', '0', '概念不清', '1', '2016-11-17 18:20:30');
INSERT INTO `ke_mark` VALUES ('23378', '13567626866', '2016111718202290623016', '20161117023016', '0.6734', '0.4746', '0', '1', '正确', '0', '2016-11-17 18:21:21');
INSERT INTO `ke_mark` VALUES ('23379', '13567626866', '2016111718202290623016', '20161117023016', '0.6359', '0.7266', '0', '1', '正确', '0', '2016-11-17 18:21:21');
INSERT INTO `ke_mark` VALUES ('23380', '13567626866', '2016111718202290623016', '20161117023016', '0.4469', '0.7512', '0', '0', '粗心大意', '1', '2016-11-17 18:21:21');
INSERT INTO `ke_mark` VALUES ('23381', '13567626866', '2016111718202290603016', '20161117023016', '0.7531', '0.5027', '0', '1', '正确', '0', '2016-11-17 18:21:34');
INSERT INTO `ke_mark` VALUES ('23382', '13567626866', '2016111718202290603016', '20161117023016', '0.5547', '0.7348', '0', '1', '正确', '0', '2016-11-17 18:21:34');
INSERT INTO `ke_mark` VALUES ('23383', '13567626866', '2016111718202290603016', '20161117023016', '0.5437', '0.8344', '0', '0', '审题错误', '1', '2016-11-17 18:21:34');
INSERT INTO `ke_mark` VALUES ('23384', '13567626866', '2016111718202290613016', '20161117023016', '0.7844', '0.3715', '0', '1', '正确', '0', '2016-11-17 18:21:44');
INSERT INTO `ke_mark` VALUES ('23385', '13567626866', '2016111718202290613016', '20161117023016', '0.5859', '0.6984', '0', '1', '正确', '0', '2016-11-17 18:21:44');
INSERT INTO `ke_mark` VALUES ('23386', '13567626866', '2016111718202290613016', '20161117023016', '0.3844', '0.7312', '0', '0', '概念不清', '1', '2016-11-17 18:21:44');
INSERT INTO `ke_mark` VALUES ('23387', '13567626866', '2016111718512874407064', '20161117027064', '0.7287037', '0.5185764', '0', '0', '计算错误', '1', '2016-11-17 18:51:44');
INSERT INTO `ke_mark` VALUES ('23388', '13567626866', '2016111718512874407064', '20161117027064', '0.29907408', '0.6727431', '0', '0', '概念不清', '1', '2016-11-17 18:51:44');
INSERT INTO `ke_mark` VALUES ('23389', '13567626866', '2016111718512874417064', '20161117027064', '0.5425926', '0.5151042', '0', '1', ' ', '0', '2016-11-17 18:52:02');
INSERT INTO `ke_mark` VALUES ('23390', '13567626866', '2016111718512874417064', '20161117027064', '0.5101852', '0.6421875', '0', '0', '计算错误', '1', '2016-11-17 18:52:02');
INSERT INTO `ke_mark` VALUES ('23391', '15157891809', '2016111722364487919431', '20161117029431', '0.6053', '0.0830', '0', '1', '正确', '0', '2016-11-17 22:37:55');
INSERT INTO `ke_mark` VALUES ('23392', '15157891809', '2016111722364487919431', '20161117029431', '0.7040', '0.2260', '0', '1', '正确', '0', '2016-11-17 22:37:55');
INSERT INTO `ke_mark` VALUES ('23393', '15157891809', '2016111722364487919431', '20161117029431', '0.6853', '0.4000', '0', '1', '正确', '0', '2016-11-17 22:37:55');
INSERT INTO `ke_mark` VALUES ('23394', '15157891809', '2016111722364487919431', '20161117029431', '0.6587', '0.6190', '0', '1', '正确', '0', '2016-11-17 22:37:55');
INSERT INTO `ke_mark` VALUES ('23395', '15157891809', '2016111722364487919431', '20161117029431', '0.5707', '0.8400', '0', '0', '补充设句', '1', '2016-11-17 22:37:55');
INSERT INTO `ke_mark` VALUES ('23396', '15157891809', '2016111722364487909431', '20161117029431', '0.7240', '0.1290', '0', '1', '正确', '0', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23397', '15157891809', '2016111722364487909431', '20161117029431', '0.7360', '0.2710', '0', '1', '正确', '0', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23398', '15157891809', '2016111722364487909431', '20161117029431', '0.7453', '0.4230', '0', '1', '正确', '0', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23399', '15157891809', '2016111722364487909431', '20161117029431', '0.6280', '0.6830', '0', '1', '正确', '0', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23400', '15157891809', '2016111722364487909431', '20161117029431', '0.2893', '0.9110', '1', '1', '正确', '0', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23401', '15157891809', '2016111722364487909431', '20161117029431', '0.3707', '0.7130', '0', '0', '补充设句', '1', '2016-11-17 22:39:40');
INSERT INTO `ke_mark` VALUES ('23402', '15157891809', '2016111809051728505862', '20161118025862', '0.5507', '0.0440', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23403', '15157891809', '2016111809051728505862', '20161118025862', '0.5933', '0.1340', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23404', '15157891809', '2016111809051728505862', '20161118025862', '0.4107', '0.2280', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23405', '15157891809', '2016111809051728505862', '20161118025862', '0.1040', '0.2750', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23406', '15157891809', '2016111809051728505862', '20161118025862', '0.4227', '0.3390', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23407', '15157891809', '2016111809051728505862', '20161118025862', '0.2347', '0.4320', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23408', '15157891809', '2016111809051728505862', '20161118025862', '0.4507', '0.7300', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23409', '15157891809', '2016111809051728505862', '20161118025862', '0.5213', '0.8980', '0', '1', '正确', '0', '2016-11-18 09:06:12');
INSERT INTO `ke_mark` VALUES ('23410', '15157891809', '2016111811051484406871', '20161118026871', '0.7640', '0.1330', '0', '1', '正确', '0', '2016-11-18 12:18:45');
INSERT INTO `ke_mark` VALUES ('23411', '15157891809', '2016111811051484406871', '20161118026871', '0.6520', '0.5600', '0', '0', '概念不清', '1', '2016-11-18 12:18:45');
INSERT INTO `ke_mark` VALUES ('23412', '15157891809', '2016111811051484406871', '20161118026871', '0.3227', '0.6930', '0', '0', '计算错误', '1', '2016-11-18 12:18:45');
INSERT INTO `ke_mark` VALUES ('23413', '15157891809', '2016111811051484416871', '20161118026871', '0.7360', '0.1590', '0', '0', '概念不清', '1', '2016-11-18 12:18:59');
INSERT INTO `ke_mark` VALUES ('23414', '15157891809', '2016111811051484416871', '20161118026871', '0.2640', '0.3710', '0', '1', '正确', '0', '2016-11-18 12:18:59');
INSERT INTO `ke_mark` VALUES ('23415', '15157891809', '2016111811051484416871', '20161118026871', '0.3160', '0.6830', '0', '1', '正确', '0', '2016-11-18 12:18:59');
INSERT INTO `ke_mark` VALUES ('23416', '15157891809', '2016111811051484416871', '20161118026871', '0.7707', '0.6850', '0', '0', '审题错误', '1', '2016-11-18 12:18:59');
INSERT INTO `ke_mark` VALUES ('23417', '15157891809', '2016111811051484426871', '20161118026871', '0.4987', '0.5480', '0', '0', '粗心大意', '1', '2016-11-18 12:19:24');
INSERT INTO `ke_mark` VALUES ('23418', '15157891809', '2016111811051484426871', '20161118026871', '0.3600', '0.7340', '0', '1', '正确', '0', '2016-11-18 12:19:24');
INSERT INTO `ke_mark` VALUES ('23419', '15157891809', '2016111811051484426871', '20161118026871', '0.6653', '0.1030', '0', '1', '正确', '0', '2016-11-18 12:19:24');
INSERT INTO `ke_mark` VALUES ('23420', '13120683381', '2016112110004376206814', '20161121026814', '0.50651044', '0.44346064', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23421', '13120683381', '2016112110004376206814', '20161121026814', '0.51175004', '0.29204506', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23422', '13120683381', '2016112110004376206814', '20161121026814', '0.34166667', '0.25827548', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23423', '13120683381', '2016112110004376206814', '20161121026814', '0.10494792', '0.08790509', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23424', '13120683381', '2016112110004376206814', '20161121026814', '0.29322916', '0.09346066', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23425', '13120683381', '2016112110004376206814', '20161121026814', '0.4455729', '0.05827546', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23426', '13120683381', '2016112110004376206814', '20161121026814', '0.607671', '0.09160881', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23427', '13120683381', '2016112110004376206814', '20161121026814', '0.75572914', '0.121238425', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23428', '13120683381', '2016112110004376206814', '20161121026814', '0.9010417', '0.11012732', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23429', '13120683381', '2016112110004376206814', '20161121026814', '0.13932292', '0.23049767', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23430', '13120683381', '2016112110004376206814', '20161121026814', '0.16041666', '0.3064236', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23431', '13120683381', '2016112110004376206814', '20161121026814', '0.36666667', '0.33975694', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23432', '13120683381', '2016112110004376206814', '20161121026814', '0.74635416', '0.31012732', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23433', '13120683381', '2016112110004376206814', '20161121026814', '0.59947914', '0.18234955', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23434', '13120683381', '2016112110004376206814', '20161121026814', '0.89635414', '0.18975693', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23435', '13120683381', '2016112110004376206814', '20161121026814', '0.6283854', '0.2453125', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23436', '13120683381', '2016112110004376206814', '20161121026814', '0.73307294', '0.40642363', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23437', '13120683381', '2016112110004376206814', '20161121026814', '0.8588542', '0.38234952', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23438', '13120683381', '2016112110004376206814', '20161121026814', '0.69947916', '0.58605325', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23439', '13120683381', '2016112110004376206814', '20161121026814', '0.5346354', '0.6379051', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23440', '13120683381', '2016112110004376206814', '20161121026814', '0.8096354', '0.6545718', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23441', '13120683381', '2016112110004376206814', '20161121026814', '0.88961786', '0.47343978', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23442', '13120683381', '2016112110004376206814', '20161121026814', '0.6690104', '0.4675347', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23443', '13120683381', '2016112110004376206814', '20161121026814', '0.63854164', '0.3453125', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23444', '13120683381', '2016112110004376206814', '20161121026814', '0.77760416', '0.23234956', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23445', '13120683381', '2016112110004376206814', '20161121026814', '0.5268229', '0.14346066', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23446', '13120683381', '2016112110004376206814', '20161121026814', '0.3835275', '0.15073338', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23447', '13120683381', '2016112110004376206814', '20161121026814', '0.3339234', '0.16018203', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23448', '13120683381', '2016112110004376206814', '20161121026814', '0.33932292', '0.45086804', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23449', '13120683381', '2016112110004376206814', '20161121026814', '0.104166664', '0.4453125', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23450', '13120683381', '2016112110004376206814', '20161121026814', '0.15026042', '0.55827546', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23451', '13120683381', '2016112110004376206814', '20161121026814', '0.36119792', '0.5619792', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23452', '13120683381', '2016112110004376206814', '20161121026814', '0.17447917', '0.60457176', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23453', '13120683381', '2016112110004376206814', '20161121026814', '0.34869793', '0.65086806', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23454', '13120683381', '2016112110004376206814', '20161121026814', '0.5190104', '0.6823495', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23455', '13120683381', '2016112110004376206814', '20161121026814', '0.71979165', '0.72123843', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23456', '13120683381', '2016112110004376206814', '20161121026814', '0.5596354', '0.79346067', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23457', '13120683381', '2016112110004376206814', '20161121026814', '0.37135416', '0.78975695', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23458', '13120683381', '2016112110004376206814', '20161121026814', '0.2601963', '0.7547617', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23459', '13120683381', '2016112110004376206814', '20161121026814', '0.14635417', '0.7082755', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23460', '13120683381', '2016112110004376206814', '20161121026814', '0.12051984', '0.77858293', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23461', '13120683381', '2016112110004376206814', '20161121026814', '0.33385417', '0.4953125', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23462', '13120683381', '2016112110004376206814', '20161121026814', '0.5823947', '0.50156677', '0', '1', ' ', '0', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23463', '13120683381', '2016112110004376206814', '20161121026814', '0.8158854', '0.82679397', '0', '0', '概念不清', '1', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23464', '13120683381', '2016112110004376206814', '20161121026814', '0.70042896', '0.87876004', '0', '0', '概念不清', '1', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23465', '13120683381', '2016112110004376206814', '20161121026814', '0.27916667', '0.8564236', '0', '0', '概念不清', '1', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23466', '13120683381', '2016112110004376206814', '20161121026814', '0.63094246', '0.88613755', '0', '0', '概念不清', '1', '2016-11-21 10:13:04');
INSERT INTO `ke_mark` VALUES ('23467', '13120683381', '2016112110035242003408', '20161121023408', '0.6143229', '0.4860533', '0', '1', ' ', '0', '2016-11-21 10:13:23');
INSERT INTO `ke_mark` VALUES ('23468', '13120683381', '2016112110035242003408', '20161121023408', '0.5964598', '0.24427801', '0', '1', ' ', '0', '2016-11-21 10:13:23');
INSERT INTO `ke_mark` VALUES ('23469', '13120683381', '2016112110035242003408', '20161121023408', '0.41822916', '0.24160881', '0', '1', ' ', '0', '2016-11-21 10:13:23');
INSERT INTO `ke_mark` VALUES ('23470', '13120683381', '2016112110052567707640', '20161121027640', '0.639694', '0.41844514', '0', '1', ' ', '0', '2016-11-21 10:13:27');
INSERT INTO `ke_mark` VALUES ('23471', '13120683381', '2016112110062186604378', '20161121024378', '0.5096354', '0.23049767', '0', '1', ' ', '0', '2016-11-21 10:13:30');
INSERT INTO `ke_mark` VALUES ('23472', '13120683381', '2016112110112621301835', '20161121021835', '0.54557294', '0.28975692', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23473', '13120683381', '2016112110112621301835', '20161121021835', '0.8002604', '0.19901623', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23474', '13120683381', '2016112110112621301835', '20161121021835', '0.46655262', '0.115682885', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23475', '13120683381', '2016112110112621301835', '20161121021835', '0.39510694', '0.11543382', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23476', '13120683381', '2016112110112621301835', '20161121021835', '0.35416666', '0.13420139', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23477', '13120683381', '2016112110112621301835', '20161121021835', '0.28531486', '0.16753474', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23478', '13120683381', '2016112110112621301835', '20161121021835', '0.25338542', '0.21938658', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23479', '13120683381', '2016112110112621301835', '20161121021835', '0.34869793', '0.53975695', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23480', '13120683381', '2016112110112621301835', '20161121021835', '0.6713542', '0.22494215', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23481', '13120683381', '2016112110112621301835', '20161121021835', '0.7104167', '0.1064236', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23482', '13120683381', '2016112110112621301835', '20161121021835', '0.8504621', '0.3252609', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23483', '13120683381', '2016112110112621301835', '20161121021835', '0.8861979', '0.09160881', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23484', '13120683381', '2016112110112621301835', '20161121021835', '0.42447916', '0.30086806', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23485', '13120683381', '2016112110112621301835', '20161121021835', '0.24112406', '0.096680835', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23486', '13120683381', '2016112110112621301835', '20161121021835', '0.14286754', '0.19756219', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23487', '13120683381', '2016112110112621301835', '20161121021835', '0.17604166', '0.08234955', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23488', '13120683381', '2016112110112621301835', '20161121021835', '0.12605049', '0.33234435', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23489', '13120683381', '2016112110112621301835', '20161121021835', '0.4611979', '0.2342014', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23490', '13120683381', '2016112110112621301835', '20161121021835', '0.6596354', '0.10086807', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23491', '13120683381', '2016112110112621301835', '20161121021835', '0.79557294', '0.313831', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23492', '13120683381', '2016112110112621301835', '20161121021835', '0.90964913', '0.1342501', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23493', '13120683381', '2016112110112621301835', '20161121021835', '0.49166667', '0.13975693', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23494', '13120683381', '2016112110112621301835', '20161121021835', '0.5627604', '0.700868', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23495', '13120683381', '2016112110112621301835', '20161121021835', '0.7033854', '0.34716433', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23496', '13120683381', '2016112110112621301835', '20161121021835', '0.3346354', '0.3453125', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23497', '13120683381', '2016112110112621301835', '20161121021835', '0.3896118', '0.22309026', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23498', '13120683381', '2016112110112621301835', '20161121021835', '0.19947916', '0.23790509', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23499', '13120683381', '2016112110112621301835', '20161121021835', '0.111979164', '0.17123842', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23500', '13120683381', '2016112110112621301835', '20161121021835', '0.13697916', '0.09716435', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23501', '13120683381', '2016112110112621301835', '20161121021835', '0.52213544', '0.1842014', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23502', '13120683381', '2016112110112621301835', '20161121021835', '0.6127604', '0.08733422', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23503', '13120683381', '2016112110112621301835', '20161121021835', '0.60572916', '0.15271991', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23504', '13120683381', '2016112110112621301835', '20161121021835', '0.8174479', '0.69346064', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23505', '13120683381', '2016112110112621301835', '20161121021835', '0.8955729', '0.4453125', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23506', '13120683381', '2016112110112621301835', '20161121021835', '0.45559213', '0.8225672', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23507', '13120683381', '2016112110112621301835', '20161121021835', '0.5371482', '0.4488826', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23508', '13120683381', '2016112110112621301835', '20161121021835', '0.22604166', '0.72494215', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23509', '13120683381', '2016112110112621301835', '20161121021835', '0.22291666', '0.7693866', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23510', '13120683381', '2016112110112621301835', '20161121021835', '0.14791666', '0.5045718', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23511', '13120683381', '2016112110112621301835', '20161121021835', '0.24010417', '0.6082755', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23512', '13120683381', '2016112110112621301835', '20161121021835', '0.090885416', '0.61568284', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23513', '13120683381', '2016112110112621301835', '20161121021835', '0.2859364', '0.83960205', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23514', '13120683381', '2016112110112621301835', '20161121021835', '0.30260417', '0.48975697', '0', '1', ' ', '0', '2016-11-21 10:14:09');
INSERT INTO `ke_mark` VALUES ('23515', '13120683381', '2016112110163088404186', '20161121024186', '0.3109', '0.5965', '0', '1', '正确', '0', '2016-11-21 10:18:04');
INSERT INTO `ke_mark` VALUES ('23516', '13120683381', '2016112110163088404186', '20161121024186', '0.5375', '0.1676', '0', '1', '正确', '0', '2016-11-21 10:18:04');
INSERT INTO `ke_mark` VALUES ('23517', '13120683381', '2016112110163088404186', '20161121024186', '0.6016', '0.8145', '0', '1', '正确', '0', '2016-11-21 10:18:04');
INSERT INTO `ke_mark` VALUES ('23518', '13120683381', '2016112110201072704053', '20161121024053', '0.6500', '0.6305', '0', '1', '正确', '0', '2016-11-21 10:20:34');
INSERT INTO `ke_mark` VALUES ('23519', '18702103770', '2016111616163901205804', '20161116025804', '0.4188', '0.5086', '0', '1', '正确', '0', '2016-11-21 10:27:18');
INSERT INTO `ke_mark` VALUES ('23520', '18702103770', '2016111616163901205804', '20161116025804', '0.4766', '0.7746', '0', '1', '正确', '0', '2016-11-21 10:27:18');
INSERT INTO `ke_mark` VALUES ('23521', '18702103770', '2016112109504733309607', '20161121029607', '0.6922', '0.5449', '0', '1', '正确', '0', '2016-11-21 10:27:22');
INSERT INTO `ke_mark` VALUES ('23522', '18702103770', '2016112110033061109341', '20161121029341', '0.4828', '0.7078', '0', '1', '正确', '0', '2016-11-21 10:27:26');
INSERT INTO `ke_mark` VALUES ('23523', '18324373866', '2016112110080503807618', '20161121027618', '0.5594', '0.5484', '0', '1', '正确', '0', '2016-11-21 10:27:30');
INSERT INTO `ke_mark` VALUES ('23524', '18702103770', '2016112110091719000723', '20161121020723', '0.4375', '0.7031', '0', '1', '正确', '0', '2016-11-21 10:27:34');
INSERT INTO `ke_mark` VALUES ('23525', '18702103770', '2016112110095730709640', '20161121029640', '0.6344', '0.5250', '0', '1', '正确', '0', '2016-11-21 10:28:36');
INSERT INTO `ke_mark` VALUES ('23526', '18702103770', '2016112110095730709640', '20161121029640', '0.5641', '0.8063', '0', '1', '正确', '0', '2016-11-21 10:28:36');
INSERT INTO `ke_mark` VALUES ('23527', '18702103770', '2016112110150861005371', '20161121025371', '0.2547', '0.5379', '0', '1', '正确', '0', '2016-11-21 10:28:44');
INSERT INTO `ke_mark` VALUES ('23528', '18324373866', '2016112110151168108250', '20161121028250', '0.2609', '0.5426', '0', '1', '正确', '0', '2016-11-21 10:28:49');
INSERT INTO `ke_mark` VALUES ('23529', '18324373866', '2016112110142179309231', '20161121029231', '0.31527779', '0.17864583', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23530', '18324373866', '2016112110142179309231', '20161121029231', '0.45416668', '0.26302084', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23531', '18324373866', '2016112110142179309231', '20161121029231', '0.7625', '0.20572917', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23532', '18324373866', '2016112110142179309231', '20161121029231', '0.775', '0.07239583', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23533', '18324373866', '2016112110142179309231', '20161121029231', '0.834576', '0.3015625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23534', '18324373866', '2016112110142179309231', '20161121029231', '0.4486111', '0.0671875', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23535', '18324373866', '2016112110142179309231', '20161121029231', '0.20555556', '0.111979164', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23536', '18324373866', '2016112110142179309231', '20161121029231', '0.119444445', '0.0640625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23537', '18324373866', '2016112110142179309231', '20161121029231', '0.5069444', '0.1328125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23538', '18324373866', '2016112110142179309231', '20161121029231', '0.659514', '0.2358594', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23539', '18324373866', '2016112110142179309231', '20161121029231', '0.875', '0.102604166', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23540', '18324373866', '2016112110142179309231', '20161121029231', '0.58194447', '0.047395833', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23541', '18324373866', '2016112110142179309231', '20161121029231', '0.88055557', '0.3453125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23542', '18324373866', '2016112110142179309231', '20161121029231', '0.45', '0.15989584', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23543', '18324373866', '2016112110142179309231', '20161121029231', '0.23055555', '0.2765625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23544', '18324373866', '2016112110142179309231', '20161121029231', '0.08888889', '0.15989584', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23545', '18324373866', '2016112110142179309231', '20161121029231', '0.09861111', '0.2734375', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23546', '18324373866', '2016112110142179309231', '20161121029231', '0.38333333', '0.1046875', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23547', '18324373866', '2016112110142179309231', '20161121029231', '0.61944443', '0.1359375', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23548', '18324373866', '2016112110142179309231', '20161121029231', '0.7416667', '0.12864584', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23549', '18324373866', '2016112110142179309231', '20161121029231', '0.6027778', '0.18489583', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23550', '18324373866', '2016112110142179309231', '20161121029231', '0.7430556', '0.2921875', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23551', '18324373866', '2016112110142179309231', '20161121029231', '0.6097222', '0.2765625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23552', '18324373866', '2016112110142179309231', '20161121029231', '0.5777778', '0.20260416', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23553', '18324373866', '2016112110142179309231', '20161121029231', '0.58055556', '0.6255208', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23554', '18324373866', '2016112110142179309231', '20161121029231', '0.8347222', '0.6244792', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23555', '18324373866', '2016112110142179309231', '20161121029231', '0.49166667', '0.7296875', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23556', '18324373866', '2016112110142179309231', '20161121029231', '0.35416666', '0.69947916', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23557', '18324373866', '2016112110142179309231', '20161121029231', '0.5986111', '0.40677083', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23558', '18324373866', '2016112110142179309231', '20161121029231', '0.75616676', '0.750375', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23559', '18324373866', '2016112110142179309231', '20161121029231', '0.8138889', '0.45677084', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23560', '18324373866', '2016112110142179309231', '20161121029231', '0.39305556', '0.4453125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23561', '18324373866', '2016112110142179309231', '20161121029231', '0.19444445', '0.6255208', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23562', '18324373866', '2016112110142179309231', '20161121029231', '0.18472221', '0.83177084', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23563', '18324373866', '2016112110142179309231', '20161121029231', '0.15138888', '0.47760418', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23564', '18324373866', '2016112110142179309231', '20161121029231', '0.07777778', '0.68177086', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23565', '18324373866', '2016112110142179309231', '20161121029231', '0.28611112', '0.3703125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23566', '18324373866', '2016112110142179309231', '20161121029231', '0.09166667', '0.35885417', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23567', '18324373866', '2016112110142179309231', '20161121029231', '0.62222224', '0.3140625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23568', '18324373866', '2016112110142179309231', '20161121029231', '0.4513889', '0.5765625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23569', '18324373866', '2016112110142179309231', '20161121029231', '0.62222224', '0.8640625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23570', '18324373866', '2016112110142179309231', '20161121029231', '0.3888889', '0.85364586', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23571', '18324373866', '2016112110142179309231', '20161121029231', '0.19166666', '0.8828125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23572', '18324373866', '2016112110142179309231', '20161121029231', '0.58055556', '0.8140625', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23573', '18324373866', '2016112110142179309231', '20161121029231', '0.80277777', '0.8671875', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23574', '18324373866', '2016112110142179309231', '20161121029231', '0.9013889', '0.74322915', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23575', '18324373866', '2016112110142179309231', '20161121029231', '0.70694447', '0.61302084', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23576', '18324373866', '2016112110142179309231', '20161121029231', '0.88472223', '0.5328125', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23577', '18324373866', '2016112110142179309231', '20161121029231', '0.62777776', '0.47760418', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23578', '18324373866', '2016112110142179309231', '20161121029231', '0.75972223', '0.40260416', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23579', '18324373866', '2016112110142179309231', '20161121029231', '0.29444444', '0.050520834', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23580', '18324373866', '2016112110142179309231', '20161121029231', '0.068055555', '0.37760416', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23581', '18324373866', '2016112110142179309231', '20161121029231', '0.079166666', '0.5182292', '0', '1', ' ', '0', '2016-11-21 10:29:04');
INSERT INTO `ke_mark` VALUES ('23582', '18324373866', '2016112110195356407091', '20161121027091', '0.6203', '0.4840', '0', '1', '正确', '0', '2016-11-21 10:29:15');
INSERT INTO `ke_mark` VALUES ('23583', '18324373866', '2016112110195356407091', '20161121027091', '0.6531', '0.7465', '0', '1', '正确', '0', '2016-11-21 10:29:15');
INSERT INTO `ke_mark` VALUES ('23584', '18702103770', '2016112110212718002875', '20161121022875', '0.6027778', '0.46822917', '0', '1', ' ', '0', '2016-11-21 10:29:16');
INSERT INTO `ke_mark` VALUES ('23585', '13120683381', '2016112110251223809431', '20161121029431', '0.2984', '0.6586', '0', '1', '正确', '0', '2016-11-21 10:29:21');
INSERT INTO `ke_mark` VALUES ('23586', '18324373866', '2016112110270221709180', '20161121029180', '0.6319444', '0.60572916', '0', '1', ' ', '0', '2016-11-21 10:29:21');
INSERT INTO `ke_mark` VALUES ('23587', '18702103770', '2016112110300930804371', '20161121024371', '0.57685184', '0.39971787', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23588', '18702103770', '2016112110300930804371', '20161121024371', '0.4888889', '0.24624565', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23589', '18702103770', '2016112110300930804371', '20161121024371', '0.80833334', '0.22263455', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23590', '18702103770', '2016112110300930804371', '20161121024371', '0.75277776', '0.25666234', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23591', '18702103770', '2016112110300930804371', '20161121024371', '0.6759259', '0.16291232', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23592', '18702103770', '2016112110300930804371', '20161121024371', '0.43796295', '0.09624566', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23593', '18702103770', '2016112110300930804371', '20161121024371', '0.3472222', '0.16430122', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23594', '18702103770', '2016112110300930804371', '20161121024371', '0.23796296', '0.2156901', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23595', '18702103770', '2016112110300930804371', '20161121024371', '0.25', '0.08999566', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23596', '18702103770', '2016112110300930804371', '20161121024371', '0.80654585', '0.31082898', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23597', '18702103770', '2016112110300930804371', '20161121024371', '0.9212963', '0.34207898', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23598', '18702103770', '2016112110300930804371', '20161121024371', '0.6148148', '0.2031901', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23599', '18702103770', '2016112110300930804371', '20161121024371', '0.53518516', '0.1406901', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23600', '18702103770', '2016112110300930804371', '20161121024371', '0.3787037', '0.27402344', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23601', '18702103770', '2016112110300930804371', '20161121024371', '0.3638889', '0.18235677', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23602', '18702103770', '2016112110300930804371', '20161121024371', '0.1675926', '0.1844401', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23603', '18702103770', '2016112110300930804371', '20161121024371', '0.17037037', '0.49138454', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23604', '18702103770', '2016112110300930804371', '20161121024371', '0.7888889', '0.698329', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23605', '18702103770', '2016112110300930804371', '20161121024371', '0.2898148', '0.46360677', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23606', '18702103770', '2016112110300930804371', '20161121024371', '0.6759259', '0.5518012', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23607', '18702103770', '2016112110300930804371', '20161121024371', '0.8055556', '0.4684679', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23608', '18702103770', '2016112110300930804371', '20161121024371', '0.6157407', '0.76709086', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23609', '18702103770', '2016112110300930804371', '20161121024371', '0.2324074', '0.8135321', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23610', '18702103770', '2016112110300930804371', '20161121024371', '0.76574075', '0.80797654', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23611', '18702103770', '2016112110300930804371', '20161121024371', '0.5240741', '0.87255985', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23612', '18702103770', '2016112110300930804371', '20161121024371', '0.23333333', '0.31978208', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23613', '18702103770', '2016112110300930804371', '20161121024371', '0.17407407', '0.6718654', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23614', '18702103770', '2016112110300930804371', '20161121024371', '0.38966396', '0.5808932', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23615', '18702103770', '2016112110300930804371', '20161121024371', '0.5233595', '0.4670043', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23616', '18702103770', '2016112110300930804371', '20161121024371', '0.37407407', '0.3385321', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23617', '18702103770', '2016112110300930804371', '20161121024371', '0.117592596', '0.80450433', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23618', '18702103770', '2016112110300930804371', '20161121024371', '0.4648148', '0.38305122', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23619', '18702103770', '2016112110300930804371', '20161121024371', '0.90462965', '0.6052734', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23620', '18702103770', '2016112110300930804371', '20161121024371', '0.45555556', '0.823329', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23621', '18702103770', '2016112110300930804371', '20161121024371', '0.31763992', '0.7441623', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23622', '18702103770', '2016112110300930804371', '20161121024371', '0.46666667', '0.6747179', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23623', '18702103770', '2016112110300930804371', '20161121024371', '0.58981484', '0.6267265', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23624', '18702103770', '2016112110300930804371', '20161121024371', '0.8564815', '0.5906901', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23625', '18702103770', '2016112110300930804371', '20161121024371', '0.7769437', '0.39212033', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23626', '18702103770', '2016112110300930804371', '20161121024371', '0.074074075', '0.56638455', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23627', '18702103770', '2016112110300930804371', '20161121024371', '0.15833333', '0.39485678', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23628', '18702103770', '2016112110300930804371', '20161121024371', '0.18148148', '0.8872179', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23629', '18702103770', '2016112110300930804371', '20161121024371', '0.76111114', '0.8830512', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23630', '18702103770', '2016112110300930804371', '20161121024371', '0.9138889', '0.81846786', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23631', '18702103770', '2016112110300930804371', '20161121024371', '0.7861111', '0.59138453', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23632', '18702103770', '2016112110300930804371', '20161121024371', '0.6898148', '0.33235678', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23633', '18702103770', '2016112110300930804371', '20161121024371', '0.7351852', '0.07402344', '0', '1', ' ', '0', '2016-11-21 10:33:31');
INSERT INTO `ke_mark` VALUES ('23634', '13120683381', '2016112110340328505186', '20161121025186', '0.5636', '0.4970', '0', '1', '正确', '0', '2016-11-21 10:34:13');
INSERT INTO `ke_mark` VALUES ('23635', '18702103770', '2016112110492355601035', '20161121021035', '0.5548', '0.6171', '0', '1', '正确', '0', '2016-11-21 10:49:33');
INSERT INTO `ke_mark` VALUES ('23636', '18702103770', '2016112110492355601035', '20161121021035', '0.4750', '0.4958', '0', '1', '正确', '0', '2016-11-21 10:49:33');
INSERT INTO `ke_mark` VALUES ('23637', '18702103770', '2016112110521217906092', '20161121026092', '0.55260414', '0.5230903', '0', '1', ' ', '0', '2016-11-21 10:52:26');
INSERT INTO `ke_mark` VALUES ('23638', '18702103770', '2016112110521217906092', '20161121026092', '0.67921585', '0.31232873', '0', '1', ' ', '0', '2016-11-21 10:52:26');
INSERT INTO `ke_mark` VALUES ('23639', '18702103770', '2016112110521217906092', '20161121026092', '0.3674479', '0.32494214', '0', '1', ' ', '0', '2016-11-21 10:52:26');
INSERT INTO `ke_mark` VALUES ('23640', '18702103770', '2016112110521217906092', '20161121026092', '0.42526042', '0.70642364', '0', '0', '建议答疑', '1', '2016-11-21 10:52:26');
INSERT INTO `ke_mark` VALUES ('23641', '18324373866', '2016112111140801908923', '20161121028923', '0.5158854', '0.63605326', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23642', '18324373866', '2016112111140801908923', '20161121028923', '0.54479164', '0.31012732', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23643', '18324373866', '2016112111140801908923', '20161121028923', '0.27447918', '0.513831', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23644', '18324373866', '2016112111140801908923', '20161121028923', '0.28541666', '0.70642364', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23645', '18324373866', '2016112111140801908923', '20161121028923', '0.47057292', '0.8249422', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23646', '18324373866', '2016112111140801908923', '20161121028923', '0.7013322', '0.75155675', '0', '1', ' ', '0', '2016-11-21 11:15:09');
INSERT INTO `ke_mark` VALUES ('23647', '13120683381', '2016112111231407308427', '20161121028427', '0.6127604', '0.56383103', '0', '1', ' ', '0', '2016-11-21 11:23:21');
INSERT INTO `ke_mark` VALUES ('23648', '13120683381', '2016112111231407308427', '20161121028427', '0.51197916', '0.66012734', '0', '1', ' ', '0', '2016-11-21 11:23:21');
INSERT INTO `ke_mark` VALUES ('23649', '18324373866', '2016112113103718607483', '20161121027483', '0.1625', '0.4324', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23650', '18324373866', '2016112113103718607483', '20161121027483', '0.5172', '0.4688', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23651', '18324373866', '2016112113103718607483', '20161121027483', '0.1906', '0.5590', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23652', '18324373866', '2016112113103718607483', '20161121027483', '0.7000', '0.5789', '0', '0', '问问老师', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23653', '18324373866', '2016112113103718607483', '20161121027483', '0.5500', '0.3480', '0', '0', '问问老师', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23654', '18324373866', '2016112113103718607483', '20161121027483', '0.0000', '0.1664', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23655', '18324373866', '2016112113103718607483', '20161121027483', '0.2937', '0.3141', '0', '0', '概念不清', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23656', '18324373866', '2016112113103718607483', '20161121027483', '0.7156', '0.3563', '0', '0', '问问老师', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23657', '18324373866', '2016112113103718607483', '20161121027483', '0.2453', '0.3879', '0', '0', '粗心大意', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23658', '18324373866', '2016112113103718607483', '20161121027483', '0.7469', '0.8191', '0', '0', '审题错误', '1', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23659', '18324373866', '2016112113103718607483', '20161121027483', '0.1672', '0.1898', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23660', '18324373866', '2016112113103718607483', '20161121027483', '0.3250', '0.6094', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23661', '18324373866', '2016112113103718607483', '20161121027483', '0.2656', '0.5859', '0', '1', '正确', '0', '2016-11-21 13:17:48');
INSERT INTO `ke_mark` VALUES ('23662', '18324373866', '2016112113262169705021', '20161121025021', '0.3406', '0.6516', '0', '1', '正确', '0', '2016-11-21 13:26:37');
INSERT INTO `ke_mark` VALUES ('23663', '18324373866', '2016112113262169705021', '20161121025021', '0.3281', '0.7500', '0', '1', '正确', '0', '2016-11-21 13:26:37');
INSERT INTO `ke_mark` VALUES ('23664', '18324373866', '2016112113262169705021', '20161121025021', '0.3609', '0.9223', '0', '1', '正确', '0', '2016-11-21 13:26:37');
INSERT INTO `ke_mark` VALUES ('23665', '18324373866', '2016112113262169705021', '20161121025021', '0.2703', '0.3668', '0', '1', '正确', '0', '2016-11-21 13:26:37');
INSERT INTO `ke_mark` VALUES ('23666', '18324373866', '2016112113262169705021', '20161121025021', '0.1719', '0.6047', '0', '1', '正确', '0', '2016-11-21 13:26:37');
INSERT INTO `ke_mark` VALUES ('23667', '18702103770', '2016112113270230302815', '20161121022815', '0.2625', '0.5602', '0', '1', '正确', '0', '2016-11-21 13:27:11');
INSERT INTO `ke_mark` VALUES ('23668', '18702103770', '2016112113270230302815', '20161121022815', '0.2922', '0.7406', '0', '1', '正确', '0', '2016-11-21 13:27:11');
INSERT INTO `ke_mark` VALUES ('23669', '18702103770', '2016112113270230302815', '20161121022815', '0.2922', '0.8602', '0', '1', '正确', '0', '2016-11-21 13:27:11');
INSERT INTO `ke_mark` VALUES ('23670', '18324373866', '2016120809435417203490', '20161208023490', '0.3937', '0.4076', '0', '1', '正确', '0', '2016-12-08 09:44:34');
INSERT INTO `ke_mark` VALUES ('23671', '18324373866', '2016120809435417203490', '20161208023490', '0.4525', '0.5900', '0', '1', '正确', '0', '2016-12-08 09:44:34');
INSERT INTO `ke_mark` VALUES ('23672', '18324373866', '2016120809435417203490', '20161208023490', '0.2955', '0.7808', '0', '1', '正确', '0', '2016-12-08 09:44:34');
INSERT INTO `ke_mark` VALUES ('23673', '13120683381', '2016120809453207304587', '20161208024587', '0.40147495', '0.4456769', '0', '1', ' ', '0', '2016-12-08 09:45:58');
INSERT INTO `ke_mark` VALUES ('23676', '18324373866', '2017030214585771206054', '20170302026054', '0.2568', '0.1878', '0', '1', '正确', '0', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23677', '18324373866', '2017030214585771206054', '20170302026054', '0.5878', '0.2023', '0', '1', '正确', '0', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23678', '18324373866', '2017030214585771206054', '20170302026054', '0.2456', '0.4807', '0', '1', '正确', '0', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23679', '18324373866', '2017030214585771206054', '20170302026054', '0.7005', '0.5948', '0', '1', '正确', '0', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23680', '18324373866', '2017030214585771206054', '20170302026054', '0.0902', '0.5495', '0', '0', '粗心大意', '1', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23681', '18324373866', '2017030214585771206054', '20170302026054', '0.5974', '0.8013', '0', '0', '审题错误', '1', '2017-03-02 14:59:34');
INSERT INTO `ke_mark` VALUES ('23714', '18324373866', '2017030215515380804031', '20170302034031', '0.4853', '0.6037', '0', '1', '正确', '0', '2017-03-02 16:56:29');
INSERT INTO `ke_mark` VALUES ('23715', '18324373866', '2017030215515380804031', '20170302034031', '0.3920', '0.6338', '0', '1', '正确', '0', '2017-03-02 16:56:29');
INSERT INTO `ke_mark` VALUES ('23716', '18324373866', '2017030215514417603591', '20170302013591', '0.4850', '0.4652', '0', '1', '正确', '0', '2017-03-02 16:56:41');
INSERT INTO `ke_mark` VALUES ('23717', '18324373866', '2017030215514417603591', '20170302013591', '0.4067', '0.5958', '0', '1', '正确', '0', '2017-03-02 16:56:41');
INSERT INTO `ke_mark` VALUES ('23719', '13120683381', '2017030215593963505713', '20170302025713', '0.4453', '0.4836', '0', '1', '正确', '0', '2017-03-02 16:56:58');
INSERT INTO `ke_mark` VALUES ('23720', '18324373866', '2017030309171505600521', '20170303020521', '0.1200', '0.3854', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23721', '18324373866', '2017030309171505600521', '20170303020521', '0.1733', '0.8922', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23722', '18324373866', '2017030309171505600521', '20170303020521', '0.5933', '0.2994', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23723', '18324373866', '2017030309171505600521', '20170303020521', '0.7333', '0.5774', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23724', '18324373866', '2017030309171505600521', '20170303020521', '0.3853', '0.5267', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23725', '18324373866', '2017030309171505600521', '20170303020521', '0.7120', '0.9321', '0', '0', '粗心大意', '1', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23726', '18324373866', '2017030309171505600521', '20170303020521', '0.2747', '0.2181', '0', '1', '正确', '0', '2017-03-03 09:18:53');
INSERT INTO `ke_mark` VALUES ('23727', '18324373866', '2017030309172499205769', '20170303035769', '0.4787', '0.2020', '0', '1', '正确', '0', '2017-03-03 09:19:09');
INSERT INTO `ke_mark` VALUES ('23728', '18324373866', '2017030309172499205769', '20170303035769', '0.2933', '0.5290', '0', '1', '正确', '0', '2017-03-03 09:19:09');
INSERT INTO `ke_mark` VALUES ('23729', '18324373866', '2017030309172499205769', '20170303035769', '0.2653', '0.7010', '0', '1', '正确', '0', '2017-03-03 09:19:09');
INSERT INTO `ke_mark` VALUES ('23730', '18324373866', '2017030309172499205769', '20170303035769', '0.2293', '0.3410', '0', '1', '正确', '0', '2017-03-03 09:19:09');
INSERT INTO `ke_mark` VALUES ('23731', '18324373866', '2017030309170561501397', '20170303011397', '0.6800', '0.2600', '0', '1', '正确', '0', '2017-03-03 09:19:42');
INSERT INTO `ke_mark` VALUES ('23732', '18324373866', '2017030309170561501397', '20170303011397', '0.4213', '0.5800', '0', '1', '正确', '0', '2017-03-03 09:19:42');
INSERT INTO `ke_mark` VALUES ('23733', '18324373866', '2017030309170561501397', '20170303011397', '0.4853', '0.7950', '0', '1', '正确', '0', '2017-03-03 09:19:42');
INSERT INTO `ke_mark` VALUES ('23734', '18324373866', '2017030309441920005401', '20170303025401', '0.5533', '0.5129', '0', '1', '正确', '0', '2017-03-03 09:44:30');
INSERT INTO `ke_mark` VALUES ('23735', '18324373866', '2017030309441920005401', '20170303025401', '0.3840', '0.7263', '0', '1', '正确', '0', '2017-03-03 09:44:30');
INSERT INTO `ke_mark` VALUES ('23736', '18324373866', '2017030309441920005401', '20170303025401', '0.3840', '0.1812', '0', '1', '正确', '0', '2017-03-03 09:44:30');
INSERT INTO `ke_mark` VALUES ('23737', '18324373866', '2017030309441920005401', '20170303025401', '0.2493', '0.4330', '0', '1', '正确', '0', '2017-03-03 09:44:30');
INSERT INTO `ke_mark` VALUES ('23738', '18324373866', '2017030309434168001630', '20170303011630', '0.3733', '0.7190', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23739', '18324373866', '2017030309434168001630', '20170303011630', '0.4320', '0.3480', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23740', '18324373866', '2017030309434168001630', '20170303011630', '0.4800', '0.4110', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23741', '18324373866', '2017030309434168001630', '20170303011630', '0.4387', '0.5110', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23742', '18324373866', '2017030309434168001630', '20170303011630', '0.3293', '0.5790', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23743', '18324373866', '2017030309434168001630', '20170303011630', '0.3347', '0.1920', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23744', '18324373866', '2017030309434168001630', '20170303011630', '0.2373', '0.2050', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23745', '18324373866', '2017030309434168001630', '20170303011630', '0.2200', '0.4280', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23746', '18324373866', '2017030309434168001630', '20170303011630', '0.1547', '0.5560', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23747', '18324373866', '2017030309434168001630', '20170303011630', '0.2280', '0.7770', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23748', '18324373866', '2017030309434168001630', '20170303011630', '0.6507', '0.8610', '0', '1', '正确', '0', '2017-03-03 09:48:13');
INSERT INTO `ke_mark` VALUES ('23754', '18324373866', '2017030310031505505498', '20170303035498', '0.4799', '0.6196', '0', '1', '正确', '0', '2017-03-03 10:07:21');
INSERT INTO `ke_mark` VALUES ('23755', '18324373866', '2017030310031505505498', '20170303035498', '0.3792', '0.5302', '0', '1', '正确', '0', '2017-03-03 10:07:21');
INSERT INTO `ke_mark` VALUES ('23756', '18324373866', '2017030310392726306294', '20170303036294', '0.4082', '0.5036', '0', '1', '正确', '0', '2017-03-03 10:40:31');
INSERT INTO `ke_mark` VALUES ('23757', '18324373866', '2017030310392726306294', '20170303036294', '0.3857', '0.7011', '0', '1', '正确', '0', '2017-03-03 10:40:31');
INSERT INTO `ke_mark` VALUES ('23758', '18324373866', '2017030310425804605720', '20170303015720', '0.4436', '0.6733', '0', '1', '正确', '0', '2017-03-03 10:49:21');
INSERT INTO `ke_mark` VALUES ('23759', '18324373866', '2017030310543991509764', '20170303029764', '0.5515', '0.3116', '0', '1', '正确', '0', '2017-03-03 11:02:36');
INSERT INTO `ke_mark` VALUES ('23760', '18324373866', '2017030310543991509764', '20170303029764', '0.3108', '0.4161', '0', '1', '正确', '0', '2017-03-03 11:02:36');
INSERT INTO `ke_mark` VALUES ('23761', '18324373866', '2017030310543991509764', '20170303029764', '0.3277', '0.3158', '0', '1', '正确', '0', '2017-03-03 11:02:36');
INSERT INTO `ke_mark` VALUES ('23762', '13120683381', '2017030313191013409248', '20170303029248', '0.3889', '0.5012', '0', '1', '正确', '0', '2017-03-03 13:19:50');
INSERT INTO `ke_mark` VALUES ('23763', '13120683381', '2017030313191013409248', '20170303029248', '0.3196', '0.6818', '0', '1', '正确', '0', '2017-03-03 13:19:50');
INSERT INTO `ke_mark` VALUES ('23764', '13120683381', '2017030313191013409248', '20170303029248', '0.6457', '0.6057', '0', '1', '正确', '0', '2017-03-03 13:19:50');
INSERT INTO `ke_mark` VALUES ('23765', '18324373866', '2017030315433818307351', '20170303017351', '0.4324', '0.4900', '0', '1', '正确', '0', '2017-03-03 15:46:25');
INSERT INTO `ke_mark` VALUES ('23766', '18324373866', '2017030315471961504239', '20170303014239', '0.7649', '0.7180', '0', '1', '正确', '0', '2017-03-03 15:48:00');
INSERT INTO `ke_mark` VALUES ('23767', '18324373866', '2017030315465807703086', '20170303023086', '0.8510', '0.8490', '1', '1', '正确', '0', '2017-03-03 15:48:34');
INSERT INTO `ke_mark` VALUES ('23768', '18324373866', '2017030315465807703086', '20170303023086', '0.5314', '0.2126', '0', '1', '正确', '0', '2017-03-03 15:48:34');
INSERT INTO `ke_mark` VALUES ('23771', '18324373866', '2017030315534360603019', '20170303013019', '0.7279', '0.5857', '0', '1', '正确', '0', '2017-03-03 15:55:26');
INSERT INTO `ke_mark` VALUES ('23772', '18324373866', '2017030315534360603019', '20170303013019', '0.4050', '0.1306', '0', '1', '正确', '0', '2017-03-03 15:55:26');
INSERT INTO `ke_mark` VALUES ('23773', '18324373866', '2017030315552081108049', '20170303018049', '0.7351', '0.4934', '0', '1', '正确', '0', '2017-03-03 15:56:47');
INSERT INTO `ke_mark` VALUES ('23774', '18324373866', '2017030315564820503608', '20170303013608', '0.8527', '0.4535', '0', '1', '正确', '0', '2017-03-03 15:57:24');
INSERT INTO `ke_mark` VALUES ('23775', '18324373866', '2017030315585101800354', '20170303010354', '0.2424', '0.4692', '0', '1', '正确', '0', '2017-03-03 16:00:47');
INSERT INTO `ke_mark` VALUES ('23776', '18324373866', '2017030315585101800354', '20170303010354', '0.2907', '0.7041', '0', '1', '正确', '0', '2017-03-03 16:00:47');
INSERT INTO `ke_mark` VALUES ('23777', '18324373866', '2017030315585101800354', '20170303010354', '0.5765', '0.6950', '0', '1', '正确', '0', '2017-03-03 16:00:47');
INSERT INTO `ke_mark` VALUES ('23778', '18324373866', '2017030315591983906954', '20170303016954', '0.6151', '0.5433', '0', '1', '正确', '0', '2017-03-03 16:01:00');
INSERT INTO `ke_mark` VALUES ('23779', '18324373866', '2017030315591983906954', '20170303016954', '0.4179', '0.6924', '0', '1', '正确', '0', '2017-03-03 16:01:00');
INSERT INTO `ke_mark` VALUES ('23780', '18324373866', '2017030316013194503628', '20170303013628', '0.6667', '0.7335', '0', '1', '正确', '0', '2017-03-03 17:13:45');
INSERT INTO `ke_mark` VALUES ('23781', '18324373866', '2017030317113334105482', '20170303015482', '0.3929', '0.5518', '0', '1', '正确', '0', '2017-03-03 17:14:07');
INSERT INTO `ke_mark` VALUES ('23782', '18324373866', '2017030317113334105482', '20170303015482', '0.3672', '0.6864', '0', '1', '正确', '0', '2017-03-03 17:14:07');
INSERT INTO `ke_mark` VALUES ('23786', '18324373866', '2017030317131005808504', '20170303018504', '0.6320', '0.6966', '0', '1', '正确', '0', '2017-03-03 17:14:31');
INSERT INTO `ke_mark` VALUES ('23787', '18324373866', '2017030317131005808504', '20170303018504', '0.4718', '0.3320', '0', '1', '正确', '0', '2017-03-03 17:14:31');
INSERT INTO `ke_mark` VALUES ('23788', '18324373866', '2017030317131005808504', '20170303018504', '0.4316', '0.7697', '0', '1', '正确', '0', '2017-03-03 17:14:31');
INSERT INTO `ke_mark` VALUES ('23789', '18324373866', '2017030317315840704938', '20170303014938', '0.4509', '0.5548', '0', '1', '正确', '0', '2017-03-03 17:34:34');
INSERT INTO `ke_mark` VALUES ('23790', '18324373866', '2017030317321346407034', '20170303027034', '0.5129', '0.6707', '0', '1', '正确', '0', '2017-03-03 17:34:43');
INSERT INTO `ke_mark` VALUES ('23791', '18324373866', '2017030317323197200829', '20170303030829', '0.3575', '0.6314', '0', '1', '正确', '0', '2017-03-03 17:35:41');
INSERT INTO `ke_mark` VALUES ('23792', '18324373866', '2017030317323197200829', '20170303030829', '0.5853', '0.7474', '0', '1', '正确', '0', '2017-03-03 17:35:41');
INSERT INTO `ke_mark` VALUES ('23793', '18324373866', '2017030317323197200829', '20170303030829', '0.4710', '0.3978', '0', '1', '正确', '0', '2017-03-03 17:35:41');
INSERT INTO `ke_mark` VALUES ('23794', '13120683381', '2017030317520596902389', '20170303022389', '0.4895', '0.3447', '0', '1', '正确', '0', '2017-03-03 17:53:33');
INSERT INTO `ke_mark` VALUES ('23795', '13120683381', '2017030317520596902389', '20170303022389', '0.3567', '0.5675', '0', '1', '正确', '0', '2017-03-03 17:53:33');

-- ----------------------------
-- Table structure for ke_mark_history
-- ----------------------------
DROP TABLE IF EXISTS `ke_mark_history`;
CREATE TABLE `ke_mark_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `photo_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作业照片ID',
  `group_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传作业组ID',
  `position_x` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记X坐标',
  `position_y` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记Y坐标',
  `direction` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记显示方向（1左、0右）',
  `result` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对或错:0错误、1正确',
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '错误原因',
  `resolvedFlag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解决状态:0:已解决，1:未解决',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `group_idx` (`photo_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_mark_history
-- ----------------------------

-- ----------------------------
-- Table structure for ke_org_info
-- ----------------------------
DROP TABLE IF EXISTS `ke_org_info`;
CREATE TABLE `ke_org_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `org_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构ID',
  `org_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构名',
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登陆密码',
  `province_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份编号',
  `city_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编号',
  `org_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构地址',
  `phone_num` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `licence_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照七牛key',
  `idCard_front` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证正面七牛key',
  `idCard_back` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证背面七牛key',
  `apprv_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态(NEW新申请、APPROVED通过审核、UNAPPROVED未通过审核、UNAPPLY未申请)',
  `del_flg` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标记',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_org_info
-- ----------------------------
INSERT INTO `ke_org_info` VALUES ('12', 'K20012', '袁和操晚托班', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', null, null, '上海杨浦', '18324373866', null, null, null, null, null, '2016-10-31 16:15:26', null);
INSERT INTO `ke_org_info` VALUES ('13', 'K20013', '明之算测试', 'e10adc3949ba59abbe56e057f20f883e', null, null, '丽水', '17621675208', null, null, null, null, null, '2016-11-10 21:09:31', null);

-- ----------------------------
-- Table structure for ke_pay
-- ----------------------------
DROP TABLE IF EXISTS `ke_pay`;
CREATE TABLE `ke_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `count_oil` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '剩余的油量',
  `create_time` datetime DEFAULT NULL COMMENT '首次支付时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_pay
-- ----------------------------

-- ----------------------------
-- Table structure for ke_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_pay_record`;
CREATE TABLE `ke_pay_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `pay_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '充值类型00:免费 01:299 :02:869 03:1299 04:后台添加',
  `oil_input` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '充值油量',
  `oil_remain` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '剩余油量',
  `pay_money` decimal(15,2) DEFAULT NULL COMMENT '充值金额',
  `order_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信支付订单号',
  `key_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被优惠码号',
  `discount_amount` decimal(15,2) DEFAULT NULL COMMENT '优惠金额',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for ke_point
-- ----------------------------
DROP TABLE IF EXISTS `ke_point`;
CREATE TABLE `ke_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `point_all` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所得学分',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '心愿内容',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_point
-- ----------------------------
INSERT INTO `ke_point` VALUES ('19', '18324373866', '134', null, '2016-10-31 17:03:43', '2017-03-04 12:00:00');
INSERT INTO `ke_point` VALUES ('20', '13120683381', '52', null, '2016-11-08 16:29:29', '2017-03-04 12:00:00');
INSERT INTO `ke_point` VALUES ('21', '18702103770', '56', null, '2016-11-08 16:29:52', '2016-11-22 12:00:13');
INSERT INTO `ke_point` VALUES ('22', '15157891809', '8', null, '2016-11-10 21:21:47', '2016-11-19 12:00:00');
INSERT INTO `ke_point` VALUES ('23', '13567626866', '20', null, '2016-11-10 21:22:36', '2016-11-17 11:59:59');
INSERT INTO `ke_point` VALUES ('24', '13567615730', '26', null, '2016-11-10 21:23:35', '2016-11-18 11:59:59');
INSERT INTO `ke_point` VALUES ('25', '13253619481', '0', null, '2017-03-02 16:39:51', null);

-- ----------------------------
-- Table structure for ke_promote_income
-- ----------------------------
DROP TABLE IF EXISTS `ke_promote_income`;
CREATE TABLE `ke_promote_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `total_income` decimal(15,2) DEFAULT NULL COMMENT '老师总收入',
  `input_income` decimal(15,2) DEFAULT NULL COMMENT '未提现金额',
  `output_income` decimal(15,2) DEFAULT NULL COMMENT '已提现金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_promote_income
-- ----------------------------
INSERT INTO `ke_promote_income` VALUES ('24', '18333333333', '0.00', '0.00', '0.00', '2016-11-10 17:20:12', null);
INSERT INTO `ke_promote_income` VALUES ('25', '15157891809', '0.00', '0.00', '0.00', '2016-11-10 21:13:08', null);
INSERT INTO `ke_promote_income` VALUES ('26', '15168022179', '0.00', '0.00', '0.00', '2016-11-10 21:15:16', null);
INSERT INTO `ke_promote_income` VALUES ('27', '13567626866', '0.00', '0.00', '0.00', '2016-11-10 21:18:48', null);
INSERT INTO `ke_promote_income` VALUES ('28', '13567615730', '0.00', '0.00', '0.00', '2016-11-10 21:21:07', null);
INSERT INTO `ke_promote_income` VALUES ('29', '18702103770', '0.00', '0.00', '0.00', '2016-11-21 11:11:40', null);
INSERT INTO `ke_promote_income` VALUES ('30', '13120813381', '0.00', '0.00', '0.00', '2017-03-02 15:31:31', null);
INSERT INTO `ke_promote_income` VALUES ('31', '13120683381', '0.00', '0.00', '0.00', '2017-03-02 16:11:30', null);
INSERT INTO `ke_promote_income` VALUES ('32', '18324373866', '0.00', '0.00', '0.00', '2017-03-02 16:11:48', null);
INSERT INTO `ke_promote_income` VALUES ('33', '17621675208', '0.00', '0.00', '0.00', '2017-08-30 17:51:05', null);

-- ----------------------------
-- Table structure for ke_promote_income_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_promote_income_record`;
CREATE TABLE `ke_promote_income_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师ID',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:收入,1:支出',
  `charge` decimal(15,2) DEFAULT NULL COMMENT '手续费',
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:用户申请中 1:商户申请中 2:支付宝处理完成（可能成功，可能失败）',
  `batch_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转账批次号',
  `result` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否转账成功 F:失败 S:成功',
  `serial_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '流水号',
  `toAccount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收款方账号',
  `toName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `alipay_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付宝内部流水号',
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成功或失败原因',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '补充说明',
  `create_time` datetime DEFAULT NULL COMMENT '申请提现时间或入账时间',
  `finish_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_promote_income_record
-- ----------------------------

-- ----------------------------
-- Table structure for ke_report
-- ----------------------------
DROP TABLE IF EXISTS `ke_report`;
CREATE TABLE `ke_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `photo_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作业照片ID',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `content_stu` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生投诉内容',
  `content_tea` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师申诉内容',
  `result` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '处理结果:0学生投诉有效、1学生投诉无效、2老师申诉有效、3老师申诉无效',
  `tousu_time` datetime DEFAULT NULL COMMENT '学生投诉时间',
  `shensu_time` datetime DEFAULT NULL COMMENT '老师申诉时间',
  `deal_time` datetime DEFAULT NULL COMMENT '管理员处理时间',
  `content_adm` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '管理员处理内容',
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:投诉等待处理、1:投诉处理中、2:投诉处理完成、3申诉等待处理、4申诉处理中、5申诉处理完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_report
-- ----------------------------

-- ----------------------------
-- Table structure for ke_sale_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_sale_record`;
CREATE TABLE `ke_sale_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推广老师的ID',
  `total_income` decimal(15,2) DEFAULT NULL COMMENT '老师总收入',
  `input_income` decimal(15,2) DEFAULT NULL COMMENT '未提现金额',
  `output_income` decimal(15,2) DEFAULT NULL COMMENT '已提现金额',
  `create_time` datetime DEFAULT NULL COMMENT '提现时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_sale_record
-- ----------------------------

-- ----------------------------
-- Table structure for ke_sid_info
-- ----------------------------
DROP TABLE IF EXISTS `ke_sid_info`;
CREATE TABLE `ke_sid_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `general_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '普通优惠码',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `count_pay` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '优惠被使用次数',
  `create_time` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_sid_info
-- ----------------------------
INSERT INTO `ke_sid_info` VALUES ('1', '987602', '17621675208', '0', '2017-08-30 17:51:05');

-- ----------------------------
-- Table structure for ke_smslog
-- ----------------------------
DROP TABLE IF EXISTS `ke_smslog`;
CREATE TABLE `ke_smslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `phone_number` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `verify_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '验证码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_smslog
-- ----------------------------
INSERT INTO `ke_smslog` VALUES ('94', '18702103770', '2907', '2016-10-31 16:12:50');
INSERT INTO `ke_smslog` VALUES ('95', '18702103770', '0421', '2016-10-31 16:13:58');
INSERT INTO `ke_smslog` VALUES ('96', '18702103770', '9036', '2016-11-08 16:18:09');
INSERT INTO `ke_smslog` VALUES ('97', '18702103770', '3490', '2016-11-08 16:20:59');
INSERT INTO `ke_smslog` VALUES ('98', '18702103770', '2064', '2016-11-09 19:15:17');
INSERT INTO `ke_smslog` VALUES ('99', '18702103770', '7912', '2016-11-10 21:08:22');
INSERT INTO `ke_smslog` VALUES ('100', '13120683381', '3657', '2016-11-21 10:00:05');
INSERT INTO `ke_smslog` VALUES ('101', '18324373866', '1063', '2016-11-21 12:17:54');
INSERT INTO `ke_smslog` VALUES ('102', '18324373866', '1857', '2016-11-21 13:07:42');
INSERT INTO `ke_smslog` VALUES ('103', '18324373866', '8654', '2016-11-21 13:08:57');
INSERT INTO `ke_smslog` VALUES ('104', '13120683381', '0514', '2016-11-21 13:36:55');
INSERT INTO `ke_smslog` VALUES ('105', '17621675208', '2968', '2017-08-30 17:49:22');
INSERT INTO `ke_smslog` VALUES ('106', '17621675208', '2837', '2017-08-30 17:50:27');
INSERT INTO `ke_smslog` VALUES ('107', '17621675208', '5706', '2017-08-30 17:55:40');
INSERT INTO `ke_smslog` VALUES ('108', '17621675208', '7350', '2017-08-30 18:04:45');
INSERT INTO `ke_smslog` VALUES ('109', '17621675208', '5934', '2017-08-31 09:14:04');
INSERT INTO `ke_smslog` VALUES ('110', '17621675208', '1927', '2017-08-31 09:18:31');
INSERT INTO `ke_smslog` VALUES ('111', '17621675208', '9405', '2017-08-31 11:18:03');
INSERT INTO `ke_smslog` VALUES ('112', '17621675208', '3651', '2017-08-31 11:19:14');

-- ----------------------------
-- Table structure for ke_stu_yunxin
-- ----------------------------
DROP TABLE IF EXISTS `ke_stu_yunxin`;
CREATE TABLE `ke_stu_yunxin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `yunxin_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '云信ID',
  `yunxin_token` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '云信授权token',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:离线 1:通话中',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_stu_yunxin
-- ----------------------------
INSERT INTO `ke_stu_yunxin` VALUES ('11', '18702103770', 'u20161109110912854', '658e1f74cebb316738a81621a904f450', '0', '2016-11-09 11:09:13', '2016-11-21 13:33:53');
INSERT INTO `ke_stu_yunxin` VALUES ('12', '13120683381', 'u20161110130357356', '02efed357d0dac26b7efb2d017423c37', '0', '2016-11-10 13:03:57', '2016-12-08 10:52:52');
INSERT INTO `ke_stu_yunxin` VALUES ('13', '18324373866', 'u20161110133015451', '4f79ae8086295977dd22a1622d6fc289', '0', '2016-11-10 13:30:15', '2016-12-08 10:53:50');
INSERT INTO `ke_stu_yunxin` VALUES ('14', '13567626866', 'u20161114194812899', '87af2f931ea3f23551f6aa836af0ba52', '0', '2016-11-14 19:48:13', '2016-11-17 19:04:27');
INSERT INTO `ke_stu_yunxin` VALUES ('15', '15157891809', 'u20161117224012504', '02f913849c7732fd4fed9e8ed958b375', '0', '2016-11-17 22:40:12', '2016-11-19 22:25:32');

-- ----------------------------
-- Table structure for ke_task
-- ----------------------------
DROP TABLE IF EXISTS `ke_task`;
CREATE TABLE `ke_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `photo_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每张作业照片ID',
  `group_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每份作业的组ID',
  `photo_sort` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传照片顺序',
  `photo_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每张作业照片URL(七牛云存储)',
  `width` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片的宽度',
  `height` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片的高度',
  `task_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作业状态:UNCORRECTED未批改(默认)、CORRECTING批改中、FINISH批改完成、CORRECTED已完成、INVALID无效',
  `point` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生给的星星',
  `subject_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目:语，数，外',
  `delete_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模糊图片删除标记(0:正确照片,1:模糊照片,2:已重传过旧的照片,3:被举报图片)',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师给的评语',
  `mark_flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否已评分（0否、1是）',
  `create_time` datetime DEFAULT NULL COMMENT '作业上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '作业批改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2865 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_task
-- ----------------------------
INSERT INTO `ke_task` VALUES ('2545', '18324373866', '18324373866', '2016110816051319741683', '2016110801', '05', '18324373866/2016110801/2016110816051319741683', null, null, 'CORRECTED', '5', '01', '0', '呵呵地对地的', null, '2016-11-08 16:05:20', '2016-11-08 16:10:09');
INSERT INTO `ke_task` VALUES ('2546', '18324373866', '18324373866', '2016110816051319711683', '2016110801', '02', '18324373866/2016110801/2016110816051319711683', null, null, 'CORRECTED', '5', '01', '0', '很多简单简单简单的家', null, '2016-11-08 16:05:20', '2016-11-08 16:10:02');
INSERT INTO `ke_task` VALUES ('2547', '18324373866', '18324373866', '2016110816051319751683', '2016110801', '06', '18324373866/2016110801/2016110816051319751683', null, null, 'CORRECTED', '5', '01', '0', '很多绝对绝对加', null, '2016-11-08 16:05:20', '2016-11-08 16:09:37');
INSERT INTO `ke_task` VALUES ('2548', '18324373866', '18324373866', '2016110816051319721683', '2016110801', '03', '18324373866/2016110801/2016110816051319721683', null, null, 'CORRECTED', '5', '01', '0', '很多绝对绝对加分季节', null, '2016-11-08 16:05:22', '2016-11-08 16:13:52');
INSERT INTO `ke_task` VALUES ('2549', '18324373866', '18324373866', '2016110816051319701683', '2016110801', '01', '18324373866/2016110801/2016110816051319701683', null, null, 'CORRECTED', '5', '01', '0', ' 日 i 日日日减肥减肥就减肥', null, '2016-11-08 16:05:22', '2016-11-08 16:13:19');
INSERT INTO `ke_task` VALUES ('2550', '18324373866', '18324373866', '2016110816051319761683', '2016110801', '07', '18324373866/2016110801/2016110816051319761683', null, null, 'CORRECTED', '5', '01', '0', '我', null, '2016-11-08 16:05:22', '2016-11-08 16:14:25');
INSERT INTO `ke_task` VALUES ('2551', '18324373866', '18324373866', '2016110816051319731683', '2016110801', '04', '18324373866/2016110801/2016110816051319731683', null, null, 'CORRECTED', '5', '01', '0', '呵呵记得记得好多话', null, '2016-11-08 16:05:22', '2016-11-08 16:13:00');
INSERT INTO `ke_task` VALUES ('2552', '18324373866', '18324373866', '2016110816051319781683', '2016110801', '09', '18324373866/2016110801/2016110816051319781683', null, null, 'CORRECTED', '5', '01', '0', '记得记得记得记得亟待解决的家门', null, '2016-11-08 16:05:22', '2016-11-08 16:12:53');
INSERT INTO `ke_task` VALUES ('2553', '18324373866', '18324373866', '2016110816051319771683', '2016110801', '08', '18324373866/2016110801/2016110816051319771683', null, null, 'CORRECTED', '5', '01', '0', '加入发酵粉福福福福福', null, '2016-11-08 16:05:23', '2016-11-08 16:14:05');
INSERT INTO `ke_task` VALUES ('2554', '18324373866', '18324373866', '2016110816431959385732', '2016110803', '09', '18324373866/2016110803/2016110816431959385732', null, null, 'CORRECTED', '5', '03', '0', '喜不自禁中亟待解决的家', null, '2016-11-08 16:43:28', '2016-11-08 16:50:21');
INSERT INTO `ke_task` VALUES ('2555', '18324373866', '18324373866', '2016110816431959375732', '2016110803', '08', '18324373866/2016110803/2016110816431959375732', null, null, 'CORRECTED', '5', '03', '0', 'Wqeqwe', null, '2016-11-08 16:43:29', '2016-11-08 16:51:54');
INSERT INTO `ke_task` VALUES ('2556', '18324373866', '18324373866', '2016110816431959355732', '2016110803', '06', '18324373866/2016110803/2016110816431959355732', null, null, 'CORRECTED', '5', '03', '0', '喝酒都督府', null, '2016-11-08 16:43:30', '2016-11-08 17:10:47');
INSERT INTO `ke_task` VALUES ('2557', '18324373866', '18324373866', '2016110816431959325732', '2016110803', '03', '18324373866/2016110803/2016110816431959325732', null, null, 'CORRECTED', '5', '03', '0', 'i 赴日日日日日进入金融', null, '2016-11-08 16:43:30', '2016-11-08 16:51:09');
INSERT INTO `ke_task` VALUES ('2558', '18324373866', '18324373866', '2016110816431959315732', '2016110803', '02', '18324373866/2016110803/2016110816431959315732', null, null, 'CORRECTED', '5', '03', '0', ' 今日减肥减肥减肥减肥放假放假放假日', null, '2016-11-08 16:43:30', '2016-11-08 16:50:53');
INSERT INTO `ke_task` VALUES ('2559', '18324373866', '18324373866', '2016110816431959305732', '2016110803', '01', '18324373866/2016110803/2016110816431959305732', null, null, 'CORRECTED', '5', '03', '0', '进入金融集团今天居然叫', null, '2016-11-08 16:43:30', '2016-11-08 17:11:08');
INSERT INTO `ke_task` VALUES ('2560', '18324373866', '18324373866', '2016110816431959335732', '2016110803', '04', '18324373866/2016110803/2016110816431959335732', null, null, 'CORRECTED', '5', '03', '0', '厚度东西好多好多好多', null, '2016-11-08 16:43:30', '2016-11-08 16:50:36');
INSERT INTO `ke_task` VALUES ('2561', '18324373866', '18324373866', '2016110816431959365732', '2016110803', '07', '18324373866/2016110803/2016110816431959365732', null, null, 'CORRECTED', '5', '03', '0', '进入金融日进入', null, '2016-11-08 16:43:31', '2016-11-08 17:11:00');
INSERT INTO `ke_task` VALUES ('2562', '18324373866', '18324373866', '2016110816431959345732', '2016110803', '05', '18324373866/2016110803/2016110816431959345732', null, null, 'CORRECTED', '5', '03', '0', '放假放假放假', null, '2016-11-08 16:43:31', '2016-11-08 17:10:54');
INSERT INTO `ke_task` VALUES ('2563', '18702103770', '18324373866', '2016110817225429008365', '2016110802', '01', '18702103770/2016110802/2016110817225429008365', null, null, 'CORRECTED', '5', '02', '0', '记得记得记得记得记得', null, '2016-11-08 17:22:55', '2016-11-08 17:23:53');
INSERT INTO `ke_task` VALUES ('2564', '18324373866', '18324373866', '2016110817231372006934', '2016110802', '01', '18324373866/2016110802/2016110817231372006934', null, null, 'CORRECTED', '5', '02', '0', '放假放假放假', null, '2016-11-08 17:23:14', '2016-11-08 17:24:16');
INSERT INTO `ke_task` VALUES ('2565', '13120683381', '18324373866', '2016110817300072008497', '2016110803', '01', '13120683381/2016110803/2016110817300072008497', null, null, 'CORRECTED', '5', '03', '0', '顶焦度计顶焦度计', null, '2016-11-08 17:30:02', '2016-11-08 17:31:01');
INSERT INTO `ke_task` VALUES ('2566', '18702103770', '18324373866', '2016110817301758904562', '2016110803', '01', '18702103770/2016110803/2016110817301758904562', null, null, 'CORRECTED', '5', '03', '0', '独家发货发货', null, '2016-11-08 17:30:18', '2016-11-08 17:31:13');
INSERT INTO `ke_task` VALUES ('2567', '18702103770', '18324373866', '2016110909421803700892', '2016110902', '01', '18702103770/2016110902/2016110909421803700892', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '哈哈哈宝宝 vvv', null, '2016-11-09 09:42:20', '2016-11-09 09:43:32');
INSERT INTO `ke_task` VALUES ('2568', '18702103770', '18324373866', '2016110909450542601409', '2016110903', '01', '18702103770/2016110903/2016110909450542601409', '2448.000000', '3264.000000', 'CORRECTED', '5', '03', '0', '不要钱吗。我是你自己去买一个人都', null, '2016-11-09 09:45:07', '2016-11-09 09:45:35');
INSERT INTO `ke_task` VALUES ('2569', '13120683381', '18324373866', '2016110915120788306501', '2016110902', '01', '13120683381/2016110902/2016110915120788306501', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-09 15:12:09', '2016-11-09 15:14:56');
INSERT INTO `ke_task` VALUES ('2570', '13120683381', '18324373866', '2016110915173570005827', '2016110903', '01', '13120683381/2016110903/2016110915173570005827', '2448.000000', '3264.000000', 'CORRECTED', '5', '03', '0', '小朋友这道题你要注意什么什么 ', null, '2016-11-09 15:17:37', '2016-11-09 15:23:48');
INSERT INTO `ke_task` VALUES ('2571', '13120683381', '18324373866', '2016110915384251617562', '2016110901', '02', '13120683381/2016110901/2016110915384251617562', '2448.000000', '3264.000000', 'CORRECTED', '5', '01', '0', '76', null, '2016-11-09 15:38:44', '2016-11-09 15:39:27');
INSERT INTO `ke_task` VALUES ('2572', '13120683381', '18324373866', '2016110915384251627562', '2016110901', '03', '13120683381/2016110901/2016110915384251627562', '2448.000000', '3264.000000', 'CORRECTED', '5', '01', '0', '65', null, '2016-11-09 15:38:44', '2016-11-09 15:39:50');
INSERT INTO `ke_task` VALUES ('2573', '13120683381', '18324373866', '2016110915384251607562', '2016110901', '01', '13120683381/2016110901/2016110915384251607562', '2448.000000', '3264.000000', 'CORRECTED', '5', '01', '0', '65', null, '2016-11-09 15:38:45', '2016-11-09 15:40:04');
INSERT INTO `ke_task` VALUES ('2574', '18702103770', '18324373866', '2016111009332582600679', '2016111002', '01', '18702103770/2016111002/2016111009332582600679', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '让对方风风光光方法', null, '2016-11-10 09:33:26', '2016-11-10 12:20:20');
INSERT INTO `ke_task` VALUES ('2575', '18324373866', '18324373866', '2016111011214179905173', '2016111002', '01', '18324373866/2016111002/2016111011214179905173', '480', '640', 'CORRECTED', '5', '02', '0', '此 vv 看 v 看 v 看', null, '2016-11-10 11:21:42', '2016-11-10 12:21:39');
INSERT INTO `ke_task` VALUES ('2576', '18324373866', '18324373866', '2016111012062239507958', '2016111002', '01', '18324373866/2016111002/2016111012062239507958', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 12:06:23', '2016-11-10 12:26:40');
INSERT INTO `ke_task` VALUES ('2577', '18324373866', '18324373866', '2016111012063763800184', '2016111002', '01', '18324373866/2016111002/2016111012063763800184', '480', '640', 'CORRECTED', '5', '02', '0', 'q', null, '2016-11-10 12:09:45', '2016-11-10 12:41:52');
INSERT INTO `ke_task` VALUES ('2578', '18324373866', '18324373866', '2016111012190311509432', '2016111002', '01', '18324373866/2016111002/2016111012190311509432', '480', '640', 'CORRECTED', '5', '02', '0', '更是誓师大会上', null, '2016-11-10 12:19:59', '2016-11-10 12:27:05');
INSERT INTO `ke_task` VALUES ('2579', '18324373866', '18324373866', '2016111012221973618140', '2016111002', '02', '18324373866/2016111002/2016111012221973618140', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 12:24:00', '2016-11-10 12:42:31');
INSERT INTO `ke_task` VALUES ('2580', '18324373866', '18324373866', '2016111012221973608140', '2016111002', '01', '18324373866/2016111002/2016111012221973608140', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 12:24:04', '2016-11-10 12:42:39');
INSERT INTO `ke_task` VALUES ('2581', '18324373866', '18324373866', '2016111012221973628140', '2016111002', '03', '18324373866/2016111002/2016111012221973628140', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 12:24:04', '2016-11-10 12:42:44');
INSERT INTO `ke_task` VALUES ('2582', '13120683381', '18324373866', '2016111012462256925021', '2016111002', '03', '13120683381/2016111002/2016111012462256925021', '4032.000000', '3024.000000', 'CORRECTED', '5', '02', '0', '哦lz我恩我第一', null, '2016-11-10 12:46:25', '2016-11-10 12:58:07');
INSERT INTO `ke_task` VALUES ('2583', '13120683381', '18324373866', '2016111012462256905021', '2016111002', '01', '13120683381/2016111002/2016111012462256905021', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '女V5出来了啊路', null, '2016-11-10 12:46:25', '2016-11-10 12:57:27');
INSERT INTO `ke_task` VALUES ('2584', '13120683381', '18324373866', '2016111012462256915021', '2016111002', '02', '13120683381/2016111002/2016111012462256915021', '4032.000000', '3024.000000', 'CORRECTED', '5', '02', '0', '女朋友让我给你', null, '2016-11-10 12:46:25', '2016-11-10 12:58:14');
INSERT INTO `ke_task` VALUES ('2585', '18324373866', '18324373866', '2016111012514505410284', '2016111002', '02', '18324373866/2016111002/2016111012514505410284', '480', '640', 'CORRECTED', '5', '02', '0', 'lz婆婆早睡早起', null, '2016-11-10 12:51:45', '2016-11-10 12:58:40');
INSERT INTO `ke_task` VALUES ('2586', '18324373866', '13120683381', '2016111012514505400284', '2016111002', '01', '18324373866/2016111002/2016111012514505400284', '480', '640', 'CORRECTED', '5', '02', '0', '目前为止婆婆二女朋友', null, '2016-11-10 12:51:45', '2016-11-10 13:13:08');
INSERT INTO `ke_task` VALUES ('2587', '18324373866', '18324373866', '2016111012540913809083', '2016111002', '01', '18324373866/2016111002/2016111012540913809083', '480', '640', 'CORRECTED', '5', '02', '0', '来了没有休息休息', null, '2016-11-10 12:54:09', '2016-11-10 13:26:19');
INSERT INTO `ke_task` VALUES ('2588', '13120683381', '13120683381', '2016111013002658409617', '2016111002', '01', '13120683381/2016111002/2016111013002658409617', '480', '640', 'CORRECTED', '5', '02', '0', '女朋友重色轻友', null, '2016-11-10 13:00:27', '2016-11-10 13:02:57');
INSERT INTO `ke_task` VALUES ('2589', '13120683381', '13120683381', '2016111013010632707085', '2016111002', '01', '13120683381/2016111002/2016111013010632707085', '480', '640', 'CORRECTED', '5', '02', '0', '地下室我朋友儿女千真万确', null, '2016-11-10 13:01:06', '2016-11-10 13:02:44');
INSERT INTO `ke_task` VALUES ('2590', '13120683381', '13120683381', '2016111013043517805413', '2016111002', '01', '13120683381/2016111002/2016111013043517805413', '480', '640', 'CORRECTED', '5', '02', '0', '你想让我朋友CPU晚上', null, '2016-11-10 13:04:35', '2016-11-10 13:05:45');
INSERT INTO `ke_task` VALUES ('2591', '13120683381', '18324373866', '2016111013195834109823', '2016111002', '01', '13120683381/2016111002/2016111013195834109823', '960', '1280', 'CORRECTED', '5', '02', '0', '枯木YY爱死lz', null, '2016-11-10 13:20:01', '2016-11-10 13:26:46');
INSERT INTO `ke_task` VALUES ('2592', '13120683381', '18324373866', '2016111013325688900526', '2016111002', '01', '13120683381/2016111002/2016111013325688900526', '960', '1280', 'CORRECTED', '5', '02', '0', '而已婆媳田朴珺', null, '2016-11-10 13:32:57', '2016-11-10 13:33:34');
INSERT INTO `ke_task` VALUES ('2593', '13120683381', '18324373866', '2016111013433564307209', '2016111002', '01', '13120683381/2016111002/2016111013433564307209', '960', '1280', 'CORRECTED', '5', '02', '0', '来咯没有我想问一下', null, '2016-11-10 13:43:36', '2016-11-10 13:44:43');
INSERT INTO `ke_task` VALUES ('2594', '13120683381', '18324373866', '2016111013475133601230', '2016111002', '01', '13120683381/2016111002/2016111013475133601230', '960', '1280', 'CORRECTED', '5', '02', '0', '饿iOS我去趟', null, '2016-11-10 13:47:52', '2016-11-10 13:50:07');
INSERT INTO `ke_task` VALUES ('2595', '13120683381', '18324373866', '2016111014004634104302', '2016111002', '01', '13120683381/2016111002/2016111014004634104302', '960', '1280', 'CORRECTED', '5', '02', '0', '大喊大叫都觉得活着', null, '2016-11-10 14:00:47', '2016-11-10 14:00:58');
INSERT INTO `ke_task` VALUES ('2596', '13120683381', '13120683381', '2016111014023850509263', '2016111002', '01', '13120683381/2016111002/2016111014023850509263', '960', '1280', 'CORRECTED', '5', '02', '0', '吐了特土遁秃头哦', null, '2016-11-10 14:02:39', '2016-11-10 14:03:05');
INSERT INTO `ke_task` VALUES ('2597', '13120683381', '18324373866', '2016111015523186905169', '2016111002', '01', '13120683381/2016111002/2016111015523186905169', '480', '640', 'CORRECTED', '5', '02', '0', '肯定不行就寻找', null, '2016-11-10 15:52:33', '2016-11-10 16:06:27');
INSERT INTO `ke_task` VALUES ('2598', '13120683381', '18324373866', '2016111015524173901302', '2016111002', '01', '13120683381/2016111002/2016111015524173901302', '480', '640', 'CORRECTED', '5', '02', '0', '根据国家巴巴爸爸', null, '2016-11-10 15:52:42', '2016-11-10 16:33:16');
INSERT INTO `ke_task` VALUES ('2599', '18324373866', '18324373866', '2016111016270053504512', '2016111002', '01', '18324373866/2016111002/2016111016270053504512', '1936.000000', '2592.000000', 'INVALID', null, '02', '1', '请竖屏拍照', null, '2016-11-10 16:27:06', '2016-11-10 17:25:02');
INSERT INTO `ke_task` VALUES ('2600', '13120683381', '18324373866', '2016111016575186305140', '2016111002', '01', '13120683381/2016111002/2016111016575186305140', '480', '640', 'CORRECTED', '5', '02', '0', '手机智能手机版', null, '2016-11-10 16:57:52', '2016-11-10 16:59:58');
INSERT INTO `ke_task` VALUES ('2601', '13120683381', '18324373866', '2016111017003380004621', '2016111002', '01', '13120683381/2016111002/2016111017003380004621', '480', '640', 'CORRECTED', '5', '02', '0', '撒水水水水水水水', null, '2016-11-10 17:00:44', '2016-11-10 17:00:53');
INSERT INTO `ke_task` VALUES ('2602', '13120683381', '18324373866', '2016111017022541000867', '2016111002', '01', '13120683381/2016111002/2016111017022541000867', '480', '640', 'CORRECTED', '5', '02', '0', '是', null, '2016-11-10 17:02:25', '2016-11-10 17:04:34');
INSERT INTO `ke_task` VALUES ('2603', '13120683381', '18324373866', '2016111017263124508769', '2016111002', '01', '13120683381/2016111002/2016111017263124508769', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', 'SaSAS', null, '2016-11-10 17:26:32', '2016-11-10 17:26:45');
INSERT INTO `ke_task` VALUES ('2604', '18702103770', '18324373866', '2016111017413948208903', '2016111002', '01', '18702103770/2016111002/2016111017413948208903', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 17:41:49', '2016-11-10 17:41:56');
INSERT INTO `ke_task` VALUES ('2605', '13120683381', '18324373866', '2016111017491008304976', '2016111002', '01', '13120683381/2016111002/2016111017491008304976', '480', '640', 'CORRECTED', '5', '02', '0', '  减肥放假放假放假放假大家', null, '2016-11-10 17:49:12', '2016-11-10 17:49:35');
INSERT INTO `ke_task` VALUES ('2606', '13120683381', '18324373866', '2016111017552179501346', '2016111002', '01', '13120683381/2016111002/2016111017552179501346', '480', '640', 'INVALID', null, '02', '1', '作业模糊啦', null, '2016-11-10 17:55:35', '2016-11-10 18:03:24');
INSERT INTO `ke_task` VALUES ('2607', '18702103770', '18324373866', '2016111018011344905908', '2016111002', '01', '18702103770/2016111002/2016111018011344905908', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '他', null, '2016-11-10 18:01:15', '2016-11-11 09:22:09');
INSERT INTO `ke_task` VALUES ('2608', '18702103770', '18324373866', '2016111018095789001376', '2016111002', '01', '18702103770/2016111002/2016111018095789001376', '2448.000000', '3264.000000', 'INVALID', null, '02', '1', '非作业照片', null, '2016-11-10 18:09:58', '2016-11-10 18:43:07');
INSERT INTO `ke_task` VALUES ('2609', '15157891809', '15157891809', '2016111021251988200621', '20161110020621', '01', '15157891809/20161110020621/2016111021251988200621', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '认真', null, '2016-11-10 21:25:24', '2016-11-10 21:28:20');
INSERT INTO `ke_task` VALUES ('2610', '15157891809', '15157891809', '2016111021251988220621', '20161110020621', '03', '15157891809/20161110020621/2016111021251988220621', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 21:25:24', '2016-11-10 21:26:37');
INSERT INTO `ke_task` VALUES ('2611', '15157891809', '15157891809', '2016111021251988210621', '20161110020621', '02', '15157891809/20161110020621/2016111021251988210621', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 21:25:24', '2016-11-10 21:26:56');
INSERT INTO `ke_task` VALUES ('2612', '15157891809', '15157891809', '2016111021251988230621', '20161110020621', '04', '15157891809/20161110020621/2016111021251988230621', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-10 21:25:24', '2016-11-10 21:27:32');
INSERT INTO `ke_task` VALUES ('2613', '15157891809', '13567615730', '2016111021254111308457', '20161110028457', '01', '15157891809/20161110028457/2016111021254111308457', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '作业非常优秀', null, '2016-11-10 21:25:42', '2016-11-10 21:28:55');
INSERT INTO `ke_task` VALUES ('2614', '18324373866', '13120683381', '2016111109374743502907', '20161111022907', '01', '18324373866/20161111022907/2016111109374743502907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', 'fj du xu xu x', null, '2016-11-11 09:37:51', '2016-11-11 09:48:26');
INSERT INTO `ke_task` VALUES ('2615', '18324373866', '18324373866', '2016111109374743542907', '20161111022907', '05', '18324373866/20161111022907/2016111109374743542907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', 'br c r v r v r v', null, '2016-11-11 09:37:51', '2016-11-11 09:48:21');
INSERT INTO `ke_task` VALUES ('2616', '18324373866', '18324373866', '2016111109374743532907', '20161111022907', '04', '18324373866/20161111022907/2016111109374743532907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', ' 不', null, '2016-11-11 09:37:52', '2016-11-11 09:48:47');
INSERT INTO `ke_task` VALUES ('2617', '18324373866', '18324373866', '2016111109374743512907', '20161111022907', '02', '18324373866/20161111022907/2016111109374743512907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', ' v 人 v 人 v 人 v 人 v 人', null, '2016-11-11 09:37:53', '2016-11-11 09:51:26');
INSERT INTO `ke_task` VALUES ('2618', '18324373866', '18324373866', '2016111109374743552907', '20161111022907', '06', '18324373866/20161111022907/2016111109374743552907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '今天就听见他就听见', null, '2016-11-11 09:37:53', '2016-11-11 09:52:15');
INSERT INTO `ke_task` VALUES ('2619', '18324373866', '18324373866', '2016111109374743522907', '20161111022907', '03', '18324373866/20161111022907/2016111109374743522907', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '居然今天减肥减肥就听见他', null, '2016-11-11 09:37:55', '2016-11-11 09:52:06');
INSERT INTO `ke_task` VALUES ('2620', '18324373866', '13120683381', '2016111109505623402653', '20161111022653', '01', '18324373866/20161111022653/2016111109505623402653', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', 'y g g f f f f w', null, '2016-11-11 09:51:03', '2016-11-11 09:51:29');
INSERT INTO `ke_task` VALUES ('2621', '13120683381', '18324373866', '2016111110021899408692', '20161111028692', '01', '13120683381/20161111028692/2016111110021899408692', '960', '1280', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 10:02:20', '2016-11-11 10:04:26');
INSERT INTO `ke_task` VALUES ('2622', '13120683381', '13120683381', '2016111110051741804765', '20161111024765', '01', '13120683381/20161111024765/2016111110051741804765', '960', '1280', 'CORRECTED', '5', '02', '0', '你', null, '2016-11-11 10:05:18', '2016-11-11 10:05:28');
INSERT INTO `ke_task` VALUES ('2623', '18702103770', '13120683381', '2016111110083718803209', '20161111023209', '01', '18702103770/20161111023209/2016111110083718803209', '1936.000000', '2592.000000', 'CORRECTED', '5', '02', '0', '火车一次发 i 次', null, '2016-11-11 10:08:38', '2016-11-11 10:09:57');
INSERT INTO `ke_task` VALUES ('2624', '18702103770', '13120683381', '2016111110083718813209', '20161111023209', '02', '18702103770/20161111023209/2016111110083718813209', '1936.000000', '2592.000000', 'CORRECTED', '5', '02', '0', '粗大和 v 哦 if', null, '2016-11-11 10:08:46', '2016-11-11 10:10:11');
INSERT INTO `ke_task` VALUES ('2625', '18702103770', '18333333333', '2016111110100644807426', '20161111027426', '01', '18702103770/20161111027426/2016111110100644807426', '1936.000000', '2592.000000', 'CORRECTED', '5', '02', '0', '比比比比看', null, '2016-11-11 10:10:07', '2016-11-11 10:10:30');
INSERT INTO `ke_task` VALUES ('2626', '13120683381', '13120683381', '2016111110365631104275', '20161111024275', '01', '13120683381/20161111024275/2016111110365631104275', '960', '1280', 'CORRECTED', '5', '02', '0', '可', null, '2016-11-11 10:37:08', '2016-11-11 10:37:52');
INSERT INTO `ke_task` VALUES ('2627', '18324373866', '18324373866', '2016111110411344906589', '20161111026589', '01', '18324373866/20161111026589/2016111110411344906589', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '方法肥肠粉', null, '2016-11-11 10:41:15', '2016-11-11 10:41:35');
INSERT INTO `ke_task` VALUES ('2628', '18702103770', '18324373866', '2016111115011682400159', '20161111020159', '01', '18702103770/20161111020159/2016111115011682400159', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', 'sjsjjsj今生今世看  但是还是vff金额金额', null, '2016-11-11 15:01:22', '2016-11-11 15:09:23');
INSERT INTO `ke_task` VALUES ('2629', '18702103770', '18324373866', '2016111115011682410159', '20161111020159', '02', '18702103770/20161111020159/2016111115011682410159', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '将斤斤计较', null, '2016-11-11 15:01:26', '2016-11-11 15:08:28');
INSERT INTO `ke_task` VALUES ('2630', '18324373866', '13120683381', '2016111116512478901297', '20161111021297', '01', '18324373866/20161111021297/2016111116512478901297', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '还没有', null, '2016-11-11 16:51:30', '2016-11-11 16:56:36');
INSERT INTO `ke_task` VALUES ('2631', '18324373866', '13120683381', '2016111116523911000315', '20161111020315', '01', '18324373866/20161111020315/2016111116523911000315', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '可', null, '2016-11-11 16:52:41', '2016-11-11 17:07:13');
INSERT INTO `ke_task` VALUES ('2632', '18324373866', '18324373866', '2016111116525052304521', '20161111024521', '01', '18324373866/20161111024521/2016111116525052304521', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '我的人都有自己的武功天下无敌手，我的', null, '2016-11-11 16:52:53', '2016-11-12 20:52:11');
INSERT INTO `ke_task` VALUES ('2634', '18324373866', '18324373866', '2016111116525052324521', '20161111024521', '03', '18324373866/20161111024521/2016111116525052324521', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '这么样了？我在想我会努力去实现自己的人是', null, '2016-11-11 16:52:55', '2016-11-12 20:52:41');
INSERT INTO `ke_task` VALUES ('2635', '18324373866', '18324373866', '2016111116525052314521', '20161111024521', '02', '18324373866/20161111024521/2016111116525052314521', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '这么一来可以让您全方位', null, '2016-11-11 16:52:56', '2016-11-12 20:53:03');
INSERT INTO `ke_task` VALUES ('2636', '13567626866', '13567626866', '2016111120044729448730', '20161111028730', '05', '13567626866/20161111028730/2016111120044729448730', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:04:50', '2016-11-11 20:08:46');
INSERT INTO `ke_task` VALUES ('2637', '13567626866', '13567626866', '2016111120044729438730', '20161111028730', '04', '13567626866/20161111028730/2016111120044729438730', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:04:50', '2016-11-11 20:08:19');
INSERT INTO `ke_task` VALUES ('2638', '13567626866', '13567626866', '2016111120044729428730', '20161111028730', '03', '13567626866/20161111028730/2016111120044729428730', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:04:50', '2016-11-11 20:08:25');
INSERT INTO `ke_task` VALUES ('2639', '13567626866', '13567626866', '2016111120044729408730', '20161111028730', '01', '13567626866/20161111028730/2016111120044729408730', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:04:50', '2016-11-11 20:07:13');
INSERT INTO `ke_task` VALUES ('2640', '13567626866', '13567626866', '2016111120044729418730', '20161111028730', '02', '13567626866/20161111028730/2016111120044729418730', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:04:50', '2016-11-11 20:07:32');
INSERT INTO `ke_task` VALUES ('2641', '13567615730', '13567615730', '2016111120044714017135', '20161111027135', '02', '13567615730/20161111027135/2016111120044714017135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '认真', null, '2016-11-11 20:04:58', '2016-11-11 20:07:56');
INSERT INTO `ke_task` VALUES ('2642', '13567615730', '13567615730', '2016111120044714027135', '20161111027135', '03', '13567615730/20161111027135/2016111120044714027135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:05:01', '2016-11-11 20:08:50');
INSERT INTO `ke_task` VALUES ('2643', '13567615730', '13567615730', '2016111120044714047135', '20161111027135', '05', '13567615730/20161111027135/2016111120044714047135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:05:02', '2016-11-11 20:10:06');
INSERT INTO `ke_task` VALUES ('2644', '13567615730', '13567615730', '2016111120044714057135', '20161111027135', '06', '13567615730/20161111027135/2016111120044714057135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:05:02', '2016-11-11 20:09:57');
INSERT INTO `ke_task` VALUES ('2645', '13567615730', '13567615730', '2016111120044714007135', '20161111027135', '01', '13567615730/20161111027135/2016111120044714007135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:05:09', '2016-11-11 20:11:32');
INSERT INTO `ke_task` VALUES ('2646', '13567615730', '13567615730', '2016111120044714037135', '20161111027135', '04', '13567615730/20161111027135/2016111120044714037135', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:05:17', '2016-11-11 20:11:52');
INSERT INTO `ke_task` VALUES ('2647', '13567626866', '13567626866', '2016111120101054314361', '20161111024361', '02', '13567626866/20161111024361/2016111120101054314361', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:10:13', '2016-11-11 20:10:56');
INSERT INTO `ke_task` VALUES ('2648', '13567626866', '13567626866', '2016111120101054324361', '20161111024361', '03', '13567626866/20161111024361/2016111120101054324361', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:10:13', '2016-11-11 20:10:39');
INSERT INTO `ke_task` VALUES ('2649', '13567626866', '13567626866', '2016111120101054304361', '20161111024361', '01', '13567626866/20161111024361/2016111120101054304361', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:10:13', '2016-11-11 20:10:45');
INSERT INTO `ke_task` VALUES ('2650', '13567626866', '13567626866', '2016111120124364425932', '20161111025932', '03', '13567626866/20161111025932/2016111120124364425932', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:12:46', '2016-11-11 20:13:13');
INSERT INTO `ke_task` VALUES ('2651', '13567626866', '13567626866', '2016111120124364405932', '20161111025932', '01', '13567626866/20161111025932/2016111120124364405932', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:12:47', '2016-11-11 20:13:50');
INSERT INTO `ke_task` VALUES ('2652', '13567626866', '13567626866', '2016111120124364415932', '20161111025932', '02', '13567626866/20161111025932/2016111120124364415932', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 20:12:47', '2016-11-11 20:13:26');
INSERT INTO `ke_task` VALUES ('2653', '13567626866', '13567615730', '2016111120124364435932', '20161111025932', '04', '13567626866/20161111025932/2016111120124364435932', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '优', null, '2016-11-11 20:12:47', '2016-11-11 20:14:22');
INSERT INTO `ke_task` VALUES ('2654', '15157891809', '15157891809', '2016111123063921903925', '20161111023925', '01', '15157891809/20161111023925/2016111123063921903925', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-11 23:06:40', '2016-11-11 23:08:45');
INSERT INTO `ke_task` VALUES ('2655', '13567615730', '13567615730', '2016111216140069315420', '20161112025420', '02', '13567615730/20161112025420/2016111216140069315420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:06', '2016-11-12 21:04:26');
INSERT INTO `ke_task` VALUES ('2656', '13567615730', '13567615730', '2016111216140069335420', '20161112025420', '04', '13567615730/20161112025420/2016111216140069335420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:09', '2016-11-12 21:05:29');
INSERT INTO `ke_task` VALUES ('2657', '13567615730', '13567615730', '2016111216140069325420', '20161112025420', '03', '13567615730/20161112025420/2016111216140069325420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:09', '2016-11-12 21:04:37');
INSERT INTO `ke_task` VALUES ('2658', '13567615730', '13567615730', '2016111216140069355420', '20161112025420', '06', '13567615730/20161112025420/2016111216140069355420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:10', '2016-11-12 21:05:05');
INSERT INTO `ke_task` VALUES ('2659', '13567615730', '13567615730', '2016111216140069345420', '20161112025420', '05', '13567615730/20161112025420/2016111216140069345420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:11', '2016-11-12 21:05:15');
INSERT INTO `ke_task` VALUES ('2660', '13567615730', '13567615730', '2016111216140069305420', '20161112025420', '01', '13567615730/20161112025420/2016111216140069305420', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-12 16:14:12', '2016-11-12 21:05:22');
INSERT INTO `ke_task` VALUES ('2661', '13567615730', '13567615730', '2016111309354314001402', '20161113021402', '01', '13567615730/20161113021402/2016111309354314001402', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-13 09:35:44', '2016-11-13 09:36:56');
INSERT INTO `ke_task` VALUES ('2662', '18324373866', '18324373866', '2016111409375759405107', '20161114025107', '01', '18324373866/20161114025107/2016111409375759405107', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 09:37:58', '2016-11-14 09:38:21');
INSERT INTO `ke_task` VALUES ('2663', '18324373866', '18324373866', '2016111409443702108192', '20161114028192', '01', '18324373866/20161114028192/2016111409443702108192', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '小朋友做得不错，对相关知识点掌握得叫牢固，第三题有难点，可以进行答疑，老师为你讲解。', null, '2016-11-14 09:44:37', '2016-11-14 09:47:15');
INSERT INTO `ke_task` VALUES ('2664', '13120683381', '13120683381', '2016111411062317609850', '20161114029850', '01', '13120683381/20161114029850/2016111411062317609850', '960', '1280', 'CORRECTED', '5', '02', '0', '中年女性你拿着', null, '2016-11-14 11:06:23', '2016-11-14 11:12:57');
INSERT INTO `ke_task` VALUES ('2665', '13120683381', '18333333333', '2016111411131121303712', '20161114023712', '01', '13120683381/20161114023712/2016111411131121303712', '960', '1280', 'CORRECTED', '5', '02', '0', '小激动激动激动激动', null, '2016-11-14 11:13:13', '2016-11-14 15:14:05');
INSERT INTO `ke_task` VALUES ('2666', '18324373866', '18324373866', '2016111411301479706804', '20161114026804', '01', '18324373866/20161114026804/2016111411301479706804', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '奔波 u 哦过不比 uv 以 v 一', null, '2016-11-14 11:30:46', '2016-11-14 11:31:07');
INSERT INTO `ke_task` VALUES ('2667', '18324373866', '18324373866', '2016111413413546302407', '20161114022407', '01', '18324373866/20161114022407/2016111413413546302407', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', 'if i 低俗速度', null, '2016-11-14 13:41:39', '2016-11-14 13:48:51');
INSERT INTO `ke_task` VALUES ('2668', '18324373866', '18324373866', '2016111413491871707086', '20161114027086', '01', '18324373866/20161114027086/2016111413491871707086', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', ' 你看你看你可能看不看', null, '2016-11-14 13:49:22', '2016-11-14 14:07:41');
INSERT INTO `ke_task` VALUES ('2669', '18324373866', '18324373866', '2016111414095633105670', '20161114025670', '01', '18324373866/20161114025670/2016111414095633105670', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '胡不不不不不', null, '2016-11-14 14:09:57', '2016-11-14 14:26:51');
INSERT INTO `ke_task` VALUES ('2670', '18324373866', '18324373866', '2016111414280710202713', '20161114022713', '01', '18324373866/20161114022713/2016111414280710202713', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', ' i 负担绝对绝对绝对绝对绝对加', null, '2016-11-14 14:28:07', '2016-11-14 14:39:49');
INSERT INTO `ke_task` VALUES ('2671', '13120683381', '13120683381', '2016111414525356304309', '20161114024309', '01', '13120683381/20161114024309/2016111414525356304309', '960', '1280', 'CORRECTED', '5', '02', '0', 'k', null, '2016-11-14 14:52:55', '2016-11-14 15:29:59');
INSERT INTO `ke_task` VALUES ('2672', '18324373866', '18333333333', '2016111415081718000513', '20161114020513', '01', '18324373866/20161114020513/2016111415081718000513', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '5565', null, '2016-11-14 15:08:17', '2016-11-14 15:13:26');
INSERT INTO `ke_task` VALUES ('2673', '18324373866', '18333333333', '2016111415082792904893', '20161114024893', '01', '18324373866/20161114024893/2016111415082792904893', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 15:08:29', '2016-11-14 15:13:37');
INSERT INTO `ke_task` VALUES ('2674', '18324373866', '18333333333', '2016111415094902808409', '20161114028409', '01', '18324373866/20161114028409/2016111415094902808409', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 15:09:56', '2016-11-14 15:13:46');
INSERT INTO `ke_task` VALUES ('2675', '18324373866', '18333333333', '2016111415120384509678', '20161114029678', '01', '18324373866/20161114029678/2016111415120384509678', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 15:12:05', '2016-11-14 15:13:53');
INSERT INTO `ke_task` VALUES ('2676', '18324373866', '13120683381', '2016111415294452504580', '20161114024580', '01', '18324373866/20161114024580/2016111415294452504580', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '宝宝', null, '2016-11-14 15:29:45', '2016-11-14 15:30:22');
INSERT INTO `ke_task` VALUES ('2677', '13120683381', '18324373866', '2016111415314294304856', '20161114024856', '01', '13120683381/20161114024856/2016111415314294304856', '960', '1280', 'CORRECTED', '5', '02', '0', 'u 好', null, '2016-11-14 15:31:44', '2016-11-14 15:31:58');
INSERT INTO `ke_task` VALUES ('2678', '18324373866', '18333333333', '2016111415544724403054', '20161114023054', '01', '18324373866/20161114023054/2016111415544724403054', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '经济', null, '2016-11-14 15:54:48', '2016-11-14 15:56:49');
INSERT INTO `ke_task` VALUES ('2679', '13120683381', '18333333333', '2016111416125296805386', '20161114025386', '01', '13120683381/20161114025386/2016111416125296805386', '480', '640', 'CORRECTED', '5', '02', '0', ' f j r j j', null, '2016-11-14 16:12:54', '2016-11-14 16:13:10');
INSERT INTO `ke_task` VALUES ('2680', '18324373866', '13120683381', '2016111416391941103964', '20161114023964', '01', '18324373866/20161114023964/2016111416391941103964', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '同学', null, '2016-11-14 16:39:20', '2016-11-15 10:53:46');
INSERT INTO `ke_task` VALUES ('2681', '13567626866', '13567626866', '2016111419435568721678', '20161114021678', '03', '13567626866/20161114021678/2016111419435568721678', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:44:14', '2016-11-14 19:45:04');
INSERT INTO `ke_task` VALUES ('2682', '13567626866', '13567626866', '2016111419435568701678', '20161114021678', '01', '13567626866/20161114021678/2016111419435568701678', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:44:19', '2016-11-14 19:45:38');
INSERT INTO `ke_task` VALUES ('2683', '13567626866', '13567626866', '2016111419435568711678', '20161114021678', '02', '13567626866/20161114021678/2016111419435568711678', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:44:25', '2016-11-14 19:46:30');
INSERT INTO `ke_task` VALUES ('2684', '13567626866', '13567626866', '2016111419435568731678', '20161114021678', '04', '13567626866/20161114021678/2016111419435568731678', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:44:25', '2016-11-14 19:46:47');
INSERT INTO `ke_task` VALUES ('2685', '13567626866', '13567626866', '2016111419524682521369', '20161114021369', '03', '13567626866/20161114021369/2016111419524682521369', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:52:50', '2016-11-14 19:54:27');
INSERT INTO `ke_task` VALUES ('2686', '13567626866', '13567626866', '2016111419524682501369', '20161114021369', '01', '13567626866/20161114021369/2016111419524682501369', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:52:50', '2016-11-14 19:54:36');
INSERT INTO `ke_task` VALUES ('2687', '13567626866', '13567626866', '2016111419524682531369', '20161114021369', '04', '13567626866/20161114021369/2016111419524682531369', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:52:50', '2016-11-14 19:54:44');
INSERT INTO `ke_task` VALUES ('2688', '13567626866', '13567626866', '2016111419524682541369', '20161114021369', '05', '13567626866/20161114021369/2016111419524682541369', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:52:51', '2016-11-14 19:55:05');
INSERT INTO `ke_task` VALUES ('2689', '13567626866', '13567626866', '2016111419524682511369', '20161114021369', '02', '13567626866/20161114021369/2016111419524682511369', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '，', null, '2016-11-14 19:52:51', '2016-11-14 19:58:12');
INSERT INTO `ke_task` VALUES ('2690', '13567615730', '13567615730', '2016111419573259115201', '20161114025201', '02', '13567615730/20161114025201/2016111419573259115201', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:57:37', '2016-11-14 19:58:21');
INSERT INTO `ke_task` VALUES ('2691', '13567615730', '13567615730', '2016111419573259105201', '20161114025201', '01', '13567615730/20161114025201/2016111419573259105201', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:57:37', '2016-11-14 19:58:34');
INSERT INTO `ke_task` VALUES ('2692', '13567615730', '13567615730', '2016111419573259125201', '20161114025201', '03', '13567615730/20161114025201/2016111419573259125201', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:57:37', '2016-11-14 19:58:46');
INSERT INTO `ke_task` VALUES ('2693', '13567615730', '13567615730', '2016111419573259135201', '20161114025201', '04', '13567615730/20161114025201/2016111419573259135201', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 19:57:39', '2016-11-14 19:58:59');
INSERT INTO `ke_task` VALUES ('2694', '13567626866', '13567626866', '2016111420012973627634', '20161114027634', '03', '13567626866/20161114027634/2016111420012973627634', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:01:32', '2016-11-14 20:02:12');
INSERT INTO `ke_task` VALUES ('2695', '13567626866', '13567626866', '2016111420012973617634', '20161114027634', '02', '13567626866/20161114027634/2016111420012973617634', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:01:32', '2016-11-14 20:02:21');
INSERT INTO `ke_task` VALUES ('2696', '13567626866', '13567626866', '2016111420012973607634', '20161114027634', '01', '13567626866/20161114027634/2016111420012973607634', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:01:32', '2016-11-14 20:03:05');
INSERT INTO `ke_task` VALUES ('2697', '13567626866', '13567626866', '2016111420012973637634', '20161114027634', '04', '13567626866/20161114027634/2016111420012973637634', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:01:33', '2016-11-14 20:03:15');
INSERT INTO `ke_task` VALUES ('2698', '13567626866', '13567615730', '2016111420062438514970', '20161114024970', '02', '13567626866/20161114024970/2016111420062438514970', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:06:28', '2016-11-14 20:06:50');
INSERT INTO `ke_task` VALUES ('2699', '13567626866', '13567615730', '2016111420062438504970', '20161114024970', '01', '13567626866/20161114024970/2016111420062438504970', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-14 20:06:28', '2016-11-14 20:06:55');
INSERT INTO `ke_task` VALUES ('2700', '13120683381', '13120683381', '2016111509403455704916', '20161115024916', '01', '13120683381/20161115024916/2016111509403455704916', '480', '640', 'CORRECTED', '5', '02', '0', '莫', null, '2016-11-15 09:40:35', '2016-11-15 09:46:29');
INSERT INTO `ke_task` VALUES ('2701', '13120683381', '13120683381', '2016111509474282100514', '20161115020514', '01', '13120683381/20161115020514/2016111509474282100514', '480', '640', 'CORRECTED', '5', '02', '0', '你现在', null, '2016-11-15 09:47:43', '2016-11-15 10:48:35');
INSERT INTO `ke_task` VALUES ('2702', '13120683381', '13120683381', '2016111510510875001395', '20161115021395', '01', '13120683381/20161115021395/2016111510510875001395', '960', '1280', 'CORRECTED', '5', '02', '0', 'KTV呀', null, '2016-11-15 10:51:09', '2016-11-15 11:00:07');
INSERT INTO `ke_task` VALUES ('2703', '13120683381', '13120683381', '2016111511004147804287', '20161115024287', '01', '13120683381/20161115024287/2016111511004147804287', '960', '1280', 'CORRECTED', '5', '02', '0', '没有', null, '2016-11-15 11:00:42', '2016-11-15 11:01:12');
INSERT INTO `ke_task` VALUES ('2704', '13120683381', '13120683381', '2016111511050834707296', '20161115027296', '01', '13120683381/20161115027296/2016111511050834707296', '960', '1280', 'CORRECTED', '5', '02', '0', '没有', null, '2016-11-15 11:05:08', '2016-11-15 11:06:50');
INSERT INTO `ke_task` VALUES ('2705', '18702103770', '18333333333', '2016111511080993805891', '20161115025891', '01', '18702103770/20161115025891/2016111511080993805891', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', 'uuuuuuu', null, '2016-11-15 11:08:11', '2016-11-15 11:08:50');
INSERT INTO `ke_task` VALUES ('2706', '13120683381', '13120683381', '2016111511401369305710', '20161115025710', '01', '13120683381/20161115025710/2016111511401369305710', '480', '640', 'CORRECTED', '5', '02', '0', 'YY破', null, '2016-11-15 11:40:14', '2016-11-15 12:47:06');
INSERT INTO `ke_task` VALUES ('2707', '13120683381', '13120683381', '2016111512474536202645', '20161115022645', '01', '13120683381/20161115022645/2016111512474536202645', '480', '640', 'CORRECTED', '5', '02', '0', '绣十字绣', null, '2016-11-15 12:47:45', '2016-11-15 12:48:45');
INSERT INTO `ke_task` VALUES ('2708', '13120683381', '13120683381', '2016111512510260008640', '20161115028640', '01', '13120683381/20161115028640/2016111512510260008640', '960', '1280', 'CORRECTED', '5', '02', '0', '男快打开', null, '2016-11-15 12:51:04', '2016-11-15 12:51:31');
INSERT INTO `ke_task` VALUES ('2709', '13120683381', '13120683381', '2016111512531084705460', '20161115025460', '01', '13120683381/20161115025460/2016111512531084705460', '960', '1280', 'CORRECTED', '5', '02', '0', '你别叫', null, '2016-11-15 12:53:11', '2016-11-15 12:55:27');
INSERT INTO `ke_task` VALUES ('2710', '13120683381', '13120683381', '2016111513024552203072', '20161115023072', '01', '13120683381/20161115023072/2016111513024552203072', '960', '1280', 'CORRECTED', '5', '02', '0', '还', null, '2016-11-15 13:02:46', '2016-11-15 13:03:31');
INSERT INTO `ke_task` VALUES ('2711', '13120683381', '13120683381', '2016111513040200208792', '20161115028792', '01', '13120683381/20161115028792/2016111513040200208792', '960', '1280', 'CORRECTED', '5', '02', '0', '你。没', null, '2016-11-15 13:04:03', '2016-11-15 13:04:51');
INSERT INTO `ke_task` VALUES ('2712', '13120683381', '13120683381', '2016111513052713309253', '20161115029253', '01', '13120683381/20161115029253/2016111513052713309253', '960', '1280', 'CORRECTED', '5', '02', '0', '看看', null, '2016-11-15 13:05:28', '2016-11-15 13:05:50');
INSERT INTO `ke_task` VALUES ('2713', '13120683381', '13120683381', '2016111513155646907508', '20161115027508', '01', '13120683381/20161115027508/2016111513155646907508', '960', '1280', 'CORRECTED', '5', '02', '0', '男女', null, '2016-11-15 13:15:57', '2016-11-15 13:16:19');
INSERT INTO `ke_task` VALUES ('2714', '13120683381', '13120683381', '2016111513202468303089', '20161115023089', '01', '13120683381/20161115023089/2016111513202468303089', '480', '640', 'CORRECTED', '5', '02', '0', '经济', null, '2016-11-15 13:20:24', '2016-11-15 13:21:05');
INSERT INTO `ke_task` VALUES ('2715', '13120683381', '13120683381', '2016111513385311605742', '20161115025742', '01', '13120683381/20161115025742/2016111513385311605742', '960', '1280', 'CORRECTED', '5', '02', '0', '还好吧', null, '2016-11-15 13:38:53', '2016-11-15 13:39:25');
INSERT INTO `ke_task` VALUES ('2716', '13567626866', '13567626866', '2016111514542847909568', '20161115029568', '01', '13567626866/20161115029568/2016111514542847909568', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 14:54:31', '2016-11-15 14:55:21');
INSERT INTO `ke_task` VALUES ('2717', '13567626866', '13567626866', '2016111514542847929568', '20161115029568', '03', '13567626866/20161115029568/2016111514542847929568', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 14:54:31', '2016-11-15 14:55:42');
INSERT INTO `ke_task` VALUES ('2718', '13567626866', '13567626866', '2016111514542847919568', '20161115029568', '02', '13567626866/20161115029568/2016111514542847919568', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 14:54:31', '2016-11-15 14:56:16');
INSERT INTO `ke_task` VALUES ('2719', '13567626866', '13567626866', '2016111514542847939568', '20161115029568', '04', '13567626866/20161115029568/2016111514542847939568', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 14:54:31', '2016-11-15 14:57:35');
INSERT INTO `ke_task` VALUES ('2720', '13567626866', '13567626866', '2016111515023037316792', '20161115026792', '02', '13567626866/20161115026792/2016111515023037316792', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:02:34', '2016-11-15 15:03:16');
INSERT INTO `ke_task` VALUES ('2721', '13567626866', '13567626866', '2016111515023037306792', '20161115026792', '01', '13567626866/20161115026792/2016111515023037306792', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:02:34', '2016-11-15 15:03:36');
INSERT INTO `ke_task` VALUES ('2722', '13567626866', '13567626866', '2016111515023037336792', '20161115026792', '04', '13567626866/20161115026792/2016111515023037336792', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:02:34', '2016-11-15 15:04:02');
INSERT INTO `ke_task` VALUES ('2723', '13567626866', '13567626866', '2016111515023037326792', '20161115026792', '03', '13567626866/20161115026792/2016111515023037326792', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:02:34', '2016-11-15 15:04:32');
INSERT INTO `ke_task` VALUES ('2724', '13567626866', '13567626866', '2016111515273550609081', '20161115029081', '01', '13567626866/20161115029081/2016111515273550609081', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:27:37', '2016-11-15 15:30:15');
INSERT INTO `ke_task` VALUES ('2725', '13567626866', '13567626866', '2016111515341508604367', '20161115024367', '01', '13567626866/20161115024367/2016111515341508604367', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:34:16', '2016-11-15 15:35:36');
INSERT INTO `ke_task` VALUES ('2726', '13567626866', '13567626866', '2016111515352057304356', '20161115024356', '01', '13567626866/20161115024356/2016111515352057304356', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 15:35:22', '2016-11-15 15:35:45');
INSERT INTO `ke_task` VALUES ('2727', '13567615730', '13567615730', '2016111516162888900962', '20161115020962', '01', '13567615730/20161115020962/2016111516162888900962', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 16:16:32', '2016-11-15 16:16:57');
INSERT INTO `ke_task` VALUES ('2728', '13567615730', '13567615730', '2016111516182343802651', '20161115022651', '01', '13567615730/20161115022651/2016111516182343802651', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 16:18:26', '2016-11-15 16:18:36');
INSERT INTO `ke_task` VALUES ('2729', '13567615730', '13567615730', '2016111516211869208136', '20161115028136', '01', '13567615730/20161115028136/2016111516211869208136', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 16:21:41', '2016-11-15 16:22:33');
INSERT INTO `ke_task` VALUES ('2730', '13567626866', '13567626866', '2016111516331304211075', '20161115021075', '02', '13567626866/20161115021075/2016111516331304211075', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 16:33:14', '2016-11-15 16:34:16');
INSERT INTO `ke_task` VALUES ('2731', '13567626866', '13567626866', '2016111516331304201075', '20161115021075', '01', '13567626866/20161115021075/2016111516331304201075', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 16:33:14', '2016-11-15 16:34:27');
INSERT INTO `ke_task` VALUES ('2732', '13120683381', '13120683381', '2016111517273815501724', '20161115021724', '01', '13120683381/20161115021724/2016111517273815501724', '960', '1280', 'CORRECTED', '5', '02', '0', '就不那么', null, '2016-11-15 17:27:38', '2016-11-15 17:28:29');
INSERT INTO `ke_task` VALUES ('2733', '13567615730', '13567615730', '2016111518515688008760', '20161115028760', '01', '13567615730/20161115028760/2016111518515688008760', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 18:52:00', '2016-11-15 19:00:58');
INSERT INTO `ke_task` VALUES ('2734', '13567615730', '13567615730', '2016111518515688018760', '20161115028760', '02', '13567615730/20161115028760/2016111518515688018760', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 18:52:01', '2016-11-15 19:01:05');
INSERT INTO `ke_task` VALUES ('2735', '13567615730', '13567615730', '2016111518515688028760', '20161115028760', '03', '13567615730/20161115028760/2016111518515688028760', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 18:52:07', '2016-11-15 19:01:12');
INSERT INTO `ke_task` VALUES ('2736', '13567626866', '13567626866', '2016111518581871206704', '20161115026704', '01', '13567626866/20161115026704/2016111518581871206704', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 18:58:23', '2016-11-15 18:59:27');
INSERT INTO `ke_task` VALUES ('2737', '13567626866', '13567626866', '2016111519002792104950', '20161115024950', '01', '13567626866/20161115024950/2016111519002792104950', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:00:30', '2016-11-15 19:02:03');
INSERT INTO `ke_task` VALUES ('2738', '13567626866', '13567626866', '2016111519002792114950', '20161115024950', '02', '13567626866/20161115024950/2016111519002792114950', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:00:32', '2016-11-15 19:02:07');
INSERT INTO `ke_task` VALUES ('2739', '13567626866', '13567615730', '2016111519133484100914', '20161115020914', '01', '13567626866/20161115020914/2016111519133484100914', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:13:37', '2016-11-15 19:16:25');
INSERT INTO `ke_task` VALUES ('2740', '13567626866', '13567615730', '2016111519133484110914', '20161115020914', '02', '13567626866/20161115020914/2016111519133484110914', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:13:37', '2016-11-15 19:16:31');
INSERT INTO `ke_task` VALUES ('2741', '13567626866', '13567615730', '2016111519133484120914', '20161115020914', '03', '13567626866/20161115020914/2016111519133484120914', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:13:40', '2016-11-15 19:16:47');
INSERT INTO `ke_task` VALUES ('2742', '13567626866', '13567615730', '2016111519201360808624', '20161115028624', '01', '13567626866/20161115028624/2016111519201360808624', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:20:16', '2016-11-15 19:26:52');
INSERT INTO `ke_task` VALUES ('2743', '13567626866', '13567615730', '2016111519201360818624', '20161115028624', '02', '13567626866/20161115028624/2016111519201360818624', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:20:20', '2016-11-15 19:27:00');
INSERT INTO `ke_task` VALUES ('2744', '13567626866', '13567615730', '2016111519374819316072', '20161115026072', '02', '13567626866/20161115026072/2016111519374819316072', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:37:52', '2016-11-15 19:38:21');
INSERT INTO `ke_task` VALUES ('2745', '13567626866', '13567615730', '2016111519374819306072', '20161115026072', '01', '13567626866/20161115026072/2016111519374819306072', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:37:52', '2016-11-15 19:38:36');
INSERT INTO `ke_task` VALUES ('2746', '13567626866', '13567615730', '2016111519525396507236', '20161115027236', '01', '13567626866/20161115027236/2016111519525396507236', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:52:57', '2016-11-15 19:54:24');
INSERT INTO `ke_task` VALUES ('2747', '13567626866', '13567615730', '2016111519525396517236', '20161115027236', '02', '13567626866/20161115027236/2016111519525396517236', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-15 19:52:58', '2016-11-15 19:54:29');
INSERT INTO `ke_task` VALUES ('2748', '18702103770', '18333333333', '2016111609310621602654', '20161116022654', '01', '18702103770/20161116022654/2016111609310621602654', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '还我河山山山水水', null, '2016-11-16 09:31:07', '2016-11-16 09:36:42');
INSERT INTO `ke_task` VALUES ('2749', '18702103770', '18333333333', '2016111609320880003657', '20161116023657', '01', '18702103770/20161116023657/2016111609320880003657', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '呵呵呵呵绘声绘色', null, '2016-11-16 09:32:09', '2016-11-16 09:36:48');
INSERT INTO `ke_task` VALUES ('2750', '18324373866', '18333333333', '2016111609354200309740', '20161116029740', '01', '18324373866/20161116029740/2016111609354200309740', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '呵呵呵呵呵呵呵', null, '2016-11-16 09:35:42', '2016-11-16 09:37:58');
INSERT INTO `ke_task` VALUES ('2751', '18324373866', '18333333333', '2016111609370157901368', '20161116021368', '01', '18324373866/20161116021368/2016111609370157901368', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '呵呵呵呵呵呵', null, '2016-11-16 09:37:02', '2016-11-16 09:38:02');
INSERT INTO `ke_task` VALUES ('2752', '18324373866', '18333333333', '2016111609403173101630', '20161116021630', '01', '18324373866/20161116021630/2016111609403173101630', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '哈哈我和社会', null, '2016-11-16 09:40:33', '2016-11-16 09:42:23');
INSERT INTO `ke_task` VALUES ('2753', '18324373866', '18333333333', '2016111609403173121630', '20161116021630', '03', '18324373866/20161116021630/2016111609403173121630', '2448.000000', '3264.000000', 'INVALID', null, '02', '1', '请竖屏拍照', null, '2016-11-16 09:40:33', '2016-11-16 09:41:27');
INSERT INTO `ke_task` VALUES ('2754', '18324373866', '18333333333', '2016111609403173111630', '20161116021630', '02', '18324373866/20161116021630/2016111609403173111630', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '不是说睡觉睡觉睡觉', null, '2016-11-16 09:40:36', '2016-11-16 09:42:16');
INSERT INTO `ke_task` VALUES ('2755', '18324373866', '18333333333', '2016111609445573200847', '20161116020847', '01', '18324373866/20161116020847/2016111609445573200847', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '那A今生今世说', null, '2016-11-16 09:44:58', '2016-11-16 09:45:32');
INSERT INTO `ke_task` VALUES ('2756', '18324373866', '18333333333', '2016111609445573210847', '20161116020847', '02', '18324373866/20161116020847/2016111609445573210847', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '有意无意啊哈', null, '2016-11-16 09:44:58', '2016-11-16 09:45:41');
INSERT INTO `ke_task` VALUES ('2757', '18324373866', '18333333333', '2016111609445573220847', '20161116020847', '03', '18324373866/20161116020847/2016111609445573220847', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '是啊啊啊啊啊啊啊', null, '2016-11-16 09:44:58', '2016-11-16 09:46:00');
INSERT INTO `ke_task` VALUES ('2758', '13120683381', '13120683381', '2016111611050032806184', '20161116026184', '01', '13120683381/20161116026184/2016111611050032806184', '739', '985', 'CORRECTED', '5', '02', '0', '可', null, '2016-11-16 11:05:00', '2016-11-16 11:05:41');
INSERT INTO `ke_task` VALUES ('2759', '18324373866', '18333333333', '2016111613260510905867', '20161116025867', '01', '18324373866/20161116025867/2016111613260510905867', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '不咸不淡巴登巴登不是爸爸说的话', null, '2016-11-16 13:26:06', '2016-11-16 13:27:02');
INSERT INTO `ke_task` VALUES ('2760', '18324373866', '18333333333', '2016111613263988108753', '20161116028753', '01', '18324373866/20161116028753/2016111613263988108753', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '俄好多好多好多好多好多好多', null, '2016-11-16 13:26:41', '2016-11-16 13:27:11');
INSERT INTO `ke_task` VALUES ('2761', '18324373866', '18333333333', '2016111614474528909672', '20161116029672', '01', '18324373866/20161116029672/2016111614474528909672', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '小朋友完成的很好，继续加油喔！', null, '2016-11-16 14:47:55', '2016-11-16 14:48:55');
INSERT INTO `ke_task` VALUES ('2762', '18324373866', '18333333333', '2016111615192566408329', '20161116028329', '01', '18324373866/20161116028329/2016111615192566408329', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '宿舍和解和呵呵', null, '2016-11-16 15:19:27', '2016-11-16 15:59:55');
INSERT INTO `ke_task` VALUES ('2763', '18324373866', '18333333333', '2016111616052795810324', '20161116020324', '02', '18324373866/20161116020324/2016111616052795810324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', 'vd hd hd hd', null, '2016-11-16 16:05:32', '2016-11-16 16:07:37');
INSERT INTO `ke_task` VALUES ('2764', '18324373866', '18333333333', '2016111616052795800324', '20161116020324', '01', '18324373866/20161116020324/2016111616052795800324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '我好多好多好多好多好多', null, '2016-11-16 16:05:32', '2016-11-16 16:07:41');
INSERT INTO `ke_task` VALUES ('2765', '18324373866', '18333333333', '2016111616052795850324', '20161116020324', '06', '18324373866/20161116020324/2016111616052795850324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '也好多好多好多话', null, '2016-11-16 16:05:32', '2016-11-16 16:07:56');
INSERT INTO `ke_task` VALUES ('2766', '18324373866', '13120683381', '2016111616052795820324', '20161116020324', '03', '18324373866/20161116020324/2016111616052795820324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '就好多好多好多好多好多', null, '2016-11-16 16:05:32', '2016-11-16 16:09:50');
INSERT INTO `ke_task` VALUES ('2767', '18324373866', '18333333333', '2016111616052795830324', '20161116020324', '04', '18324373866/20161116020324/2016111616052795830324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '很多巴登巴登激动激动', null, '2016-11-16 16:05:32', '2016-11-16 16:07:53');
INSERT INTO `ke_task` VALUES ('2768', '18324373866', '18333333333', '2016111616052795840324', '20161116020324', '05', '18324373866/20161116020324/2016111616052795840324', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '觉得好多好多好多话简单', null, '2016-11-16 16:05:34', '2016-11-16 16:08:27');
INSERT INTO `ke_task` VALUES ('2769', '18702103770', '18333333333', '2016111616063736456852', '20161116026852', '06', '18702103770/20161116026852/2016111616063736456852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '呵呵呵呵呵呵', null, '2016-11-16 16:06:39', '2016-11-16 16:13:48');
INSERT INTO `ke_task` VALUES ('2770', '18702103770', '18333333333', '2016111616063736436852', '20161116026852', '04', '18702103770/20161116026852/2016111616063736436852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:06:39', '2016-11-16 16:13:51');
INSERT INTO `ke_task` VALUES ('2771', '18702103770', '18333333333', '2016111616063736416852', '20161116026852', '02', '18702103770/20161116026852/2016111616063736416852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '和呵呵融入', null, '2016-11-16 16:06:39', '2016-11-16 16:13:44');
INSERT INTO `ke_task` VALUES ('2772', '18702103770', '18333333333', '2016111616063736426852', '20161116026852', '03', '18702103770/20161116026852/2016111616063736426852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:06:46', '2016-11-16 16:13:56');
INSERT INTO `ke_task` VALUES ('2773', '18702103770', '18333333333', '2016111616063736446852', '20161116026852', '05', '18702103770/20161116026852/2016111616063736446852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '遇到好多好多好多野', null, '2016-11-16 16:06:47', '2016-11-16 16:14:29');
INSERT INTO `ke_task` VALUES ('2774', '18702103770', '18333333333', '2016111616063736406852', '20161116026852', '01', '18702103770/20161116026852/2016111616063736406852', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:06:47', '2016-11-16 16:14:31');
INSERT INTO `ke_task` VALUES ('2775', '18702103770', '18333333333', '2016111616163901205804', '20161116025804', '01', '18702103770/20161116025804/2016111616163901205804', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '奖学金媳妇 i 份 i 看到', null, '2016-11-16 16:16:42', '2016-11-21 10:27:20');
INSERT INTO `ke_task` VALUES ('2776', '13567626866', '13567626866', '2016111616200177303407', '20161116023407', '01', '13567626866/20161116023407/2016111616200177303407', '720', '960', 'CORRECTED', '5', '02', '0', 'ggg', null, '2016-11-16 16:20:03', '2016-11-16 16:20:54');
INSERT INTO `ke_task` VALUES ('2777', '13567626866', '13567626866', '2016111616200177313407', '20161116023407', '02', '13567626866/20161116023407/2016111616200177313407', '720', '960', 'CORRECTED', '5', '02', '0', 'ggggg', null, '2016-11-16 16:20:04', '2016-11-16 16:21:14');
INSERT INTO `ke_task` VALUES ('2778', '13567626866', '13567626866', '2016111616200177323407', '20161116023407', '03', '13567626866/20161116023407/2016111616200177323407', '720', '960', 'CORRECTED', '5', '02', '0', '饿得', null, '2016-11-16 16:20:04', '2016-11-16 16:21:40');
INSERT INTO `ke_task` VALUES ('2779', '13567626866', '13567626866', '2016111616244388127654', '20161116027654', '03', '13567626866/20161116027654/2016111616244388127654', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:24:47', '2016-11-16 16:25:04');
INSERT INTO `ke_task` VALUES ('2780', '13567626866', '13567626866', '2016111616244388107654', '20161116027654', '01', '13567626866/20161116027654/2016111616244388107654', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:24:47', '2016-11-16 16:25:12');
INSERT INTO `ke_task` VALUES ('2781', '13567626866', '13567626866', '2016111616244388117654', '20161116027654', '02', '13567626866/20161116027654/2016111616244388117654', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:24:48', '2016-11-16 16:25:18');
INSERT INTO `ke_task` VALUES ('2782', '13567626866', '13567626866', '2016111616284748402145', '20161116022145', '01', '13567626866/20161116022145/2016111616284748402145', '720', '960', 'CORRECTED', '5', '02', '0', '爸爸去哪儿', null, '2016-11-16 16:28:48', '2016-11-16 16:39:24');
INSERT INTO `ke_task` VALUES ('2783', '13120683381', '13120683381', '2016111616415360900431', '20161116020431', '01', '13120683381/20161116020431/2016111616415360900431', '960', '1280', 'CORRECTED', '5', '02', '0', '', null, '2016-11-16 16:42:01', '2016-11-16 16:42:21');
INSERT INTO `ke_task` VALUES ('2784', '13567626866', '13567615730', '2016111717585831002503', '20161117022503', '01', '13567626866/20161117022503/2016111717585831002503', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 17:58:59', '2016-11-17 17:59:29');
INSERT INTO `ke_task` VALUES ('2785', '13567615730', '13567615730', '2016111718033071803709', '20161117023709', '01', '13567615730/20161117023709/2016111718033071803709', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 18:03:32', '2016-11-17 18:20:31');
INSERT INTO `ke_task` VALUES ('2786', '13567626866', '13567626866', '2016111718055913503850', '20161117023850', '01', '13567626866/20161117023850/2016111718055913503850', '720', '960', 'CORRECTED', '5', '02', '0', '收拾收拾', null, '2016-11-17 18:06:00', '2016-11-17 18:06:33');
INSERT INTO `ke_task` VALUES ('2787', '13567626866', '13567626866', '2016111718202290613016', '20161117023016', '02', '13567626866/20161117023016/2016111718202290613016', '720', '960', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 18:20:23', '2016-11-17 18:21:49');
INSERT INTO `ke_task` VALUES ('2788', '13567626866', '13567626866', '2016111718202290623016', '20161117023016', '03', '13567626866/20161117023016/2016111718202290623016', '720', '960', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 18:20:23', '2016-11-17 18:21:22');
INSERT INTO `ke_task` VALUES ('2789', '13567626866', '13567626866', '2016111718202290603016', '20161117023016', '01', '13567626866/20161117023016/2016111718202290603016', '720', '960', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 18:20:23', '2016-11-17 18:21:35');
INSERT INTO `ke_task` VALUES ('2790', '13567626866', '15157891809', '2016111718512874407064', '20161117027064', '01', '13567626866/20161117027064/2016111718512874407064', '720', '960', 'CORRECTED', '5', '02', '0', '10', null, '2016-11-17 18:51:29', '2016-11-17 18:51:54');
INSERT INTO `ke_task` VALUES ('2791', '13567626866', '15157891809', '2016111718512874417064', '20161117027064', '02', '13567626866/20161117027064/2016111718512874417064', '720', '960', 'CORRECTED', '5', '02', '0', '好', null, '2016-11-17 18:51:29', '2016-11-17 18:52:10');
INSERT INTO `ke_task` VALUES ('2792', '15157891809', '15157891809', '2016111722364487919431', '20161117029431', '02', '15157891809/20161117029431/2016111722364487919431', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '几乎完美', null, '2016-11-17 22:36:49', '2016-11-17 22:38:08');
INSERT INTO `ke_task` VALUES ('2793', '15157891809', '15157891809', '2016111722364487909431', '20161117029431', '01', '15157891809/20161117029431/2016111722364487909431', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-17 22:36:53', '2016-11-17 22:39:45');
INSERT INTO `ke_task` VALUES ('2794', '15157891809', '15157891809', '2016111809051728505862', '20161118025862', '01', '15157891809/20161118025862/2016111809051728505862', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-18 09:05:18', '2016-11-18 09:06:14');
INSERT INTO `ke_task` VALUES ('2795', '15157891809', '13567615730', '2016111811051484416871', '20161118026871', '02', '15157891809/20161118026871/2016111811051484416871', '960', '1280', 'CORRECTED', '5', '02', '0', '', null, '2016-11-18 11:05:15', '2016-11-18 12:19:00');
INSERT INTO `ke_task` VALUES ('2796', '15157891809', '13567615730', '2016111811051484426871', '20161118026871', '03', '15157891809/20161118026871/2016111811051484426871', '960', '1280', 'CORRECTED', '5', '02', '0', '', null, '2016-11-18 11:05:15', '2016-11-18 12:19:25');
INSERT INTO `ke_task` VALUES ('2797', '15157891809', '13567615730', '2016111811051484406871', '20161118026871', '01', '15157891809/20161118026871/2016111811051484406871', '960', '1280', 'CORRECTED', '5', '02', '0', '', null, '2016-11-18 11:05:15', '2016-11-18 12:18:47');
INSERT INTO `ke_task` VALUES ('2798', '18702103770', '18333333333', '2016112109504733309607', '20161121029607', '01', '18702103770/20161121029607/2016112109504733309607', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '参考参考的', null, '2016-11-21 09:50:48', '2016-11-21 10:27:24');
INSERT INTO `ke_task` VALUES ('2799', '13120683381', '13120683381', '2016112110004376206814', '20161121026814', '01', '13120683381/20161121026814/2016112110004376206814', '480', '640', 'CORRECTED', '5', '02', '0', 'Ujj ', null, '2016-11-21 10:00:43', '2016-11-21 10:13:08');
INSERT INTO `ke_task` VALUES ('2800', '18702103770', '18333333333', '2016112110033061109341', '20161121029341', '01', '18702103770/20161121029341/2016112110033061109341', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '地方快放开存款', null, '2016-11-21 10:03:31', '2016-11-21 10:27:27');
INSERT INTO `ke_task` VALUES ('2801', '13120683381', '13120683381', '2016112110035242003408', '20161121023408', '01', '13120683381/20161121023408/2016112110035242003408', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:03:52', '2016-11-21 10:13:24');
INSERT INTO `ke_task` VALUES ('2802', '13120683381', '13120683381', '2016112110052567707640', '20161121027640', '01', '13120683381/20161121027640/2016112110052567707640', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:05:25', '2016-11-21 10:13:28');
INSERT INTO `ke_task` VALUES ('2803', '13120683381', '13120683381', '2016112110062186604378', '20161121024378', '01', '13120683381/20161121024378/2016112110062186604378', '739', '985', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:06:22', '2016-11-21 10:13:31');
INSERT INTO `ke_task` VALUES ('2804', '18324373866', '18333333333', '2016112110080503807618', '20161121027618', '01', '18324373866/20161121027618/2016112110080503807618', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '此次从窗口的', null, '2016-11-21 10:08:07', '2016-11-21 10:27:32');
INSERT INTO `ke_task` VALUES ('2805', '18702103770', '18333333333', '2016112110091719000723', '20161121020723', '01', '18702103770/20161121020723/2016112110091719000723', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '发 i 疯狂发快递到家', null, '2016-11-21 10:09:19', '2016-11-21 10:27:36');
INSERT INTO `ke_task` VALUES ('2806', '18702103770', '18333333333', '2016112110095730709640', '20161121029640', '01', '18702103770/20161121029640/2016112110095730709640', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '对你说你笨绝对绝对快点快点', null, '2016-11-21 10:10:00', '2016-11-21 10:28:38');
INSERT INTO `ke_task` VALUES ('2807', '13120683381', '13120683381', '2016112110112621301835', '20161121021835', '01', '13120683381/20161121021835/2016112110112621301835', '480', '640', 'CORRECTED', '5', '02', '0', 'Njjsnn ', null, '2016-11-21 10:11:26', '2016-11-21 10:14:12');
INSERT INTO `ke_task` VALUES ('2808', '18324373866', '13120683381', '2016112110142179309231', '20161121029231', '01', '18324373866/20161121029231/2016112110142179309231', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:14:33', '2016-11-21 10:29:05');
INSERT INTO `ke_task` VALUES ('2809', '18702103770', '18333333333', '2016112110150861005371', '20161121025371', '01', '18702103770/20161121025371/2016112110150861005371', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '不是你少男少女', null, '2016-11-21 10:15:10', '2016-11-21 10:28:46');
INSERT INTO `ke_task` VALUES ('2810', '18324373866', '18333333333', '2016112110151168108250', '20161121028250', '01', '18324373866/20161121028250/2016112110151168108250', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '难受难受难受呢', null, '2016-11-21 10:15:13', '2016-11-21 10:28:51');
INSERT INTO `ke_task` VALUES ('2811', '13120683381', '18333333333', '2016112110163088404186', '20161121024186', '01', '13120683381/20161121024186/2016112110163088404186', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:16:31', '2016-11-21 10:18:06');
INSERT INTO `ke_task` VALUES ('2812', '18324373866', '18333333333', '2016112110195356407091', '20161121027091', '01', '18324373866/20161121027091/2016112110195356407091', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '计算机系看到的', null, '2016-11-21 10:19:55', '2016-11-21 10:29:17');
INSERT INTO `ke_task` VALUES ('2813', '13120683381', '18333333333', '2016112110201072704053', '20161121024053', '01', '13120683381/20161121024053/2016112110201072704053', '480', '640', 'CORRECTED', '5', '02', '0', 'v 旅客从开学开学开学就洗洗', null, '2016-11-21 10:20:11', '2016-11-21 10:20:39');
INSERT INTO `ke_task` VALUES ('2814', '18702103770', '13120683381', '2016112110212718002875', '20161121022875', '01', '18702103770/20161121022875/2016112110212718002875', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:21:28', '2016-11-21 10:29:17');
INSERT INTO `ke_task` VALUES ('2815', '13120683381', '18333333333', '2016112110251223809431', '20161121029431', '01', '13120683381/20161121029431/2016112110251223809431', '480', '640', 'CORRECTED', '5', '02', '0', '是简简单单暖暖的', null, '2016-11-21 10:25:12', '2016-11-21 10:29:23');
INSERT INTO `ke_task` VALUES ('2816', '18324373866', '13120683381', '2016112110270221709180', '20161121029180', '01', '18324373866/20161121029180/2016112110270221709180', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:27:04', '2016-11-21 10:29:22');
INSERT INTO `ke_task` VALUES ('2817', '18702103770', '13120683381', '2016112110300930804371', '20161121024371', '01', '18702103770/20161121024371/2016112110300930804371', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:30:10', '2016-11-21 10:33:32');
INSERT INTO `ke_task` VALUES ('2818', '13120683381', '18324373866', '2016112110340328505186', '20161121025186', '01', '13120683381/20161121025186/2016112110340328505186', '480', '640', 'CORRECTED', '5', '02', '0', '简单简单简单简单减肥就减肥', null, '2016-11-21 10:34:03', '2016-11-21 10:34:15');
INSERT INTO `ke_task` VALUES ('2819', '18702103770', '18324373866', '2016112110492355601035', '20161121021035', '01', '18702103770/20161121021035/2016112110492355601035', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '也呵呵呵呵是谁', null, '2016-11-21 10:49:24', '2016-11-21 10:49:35');
INSERT INTO `ke_task` VALUES ('2820', '18702103770', '13120683381', '2016112110521217906092', '20161121026092', '01', '18702103770/20161121026092/2016112110521217906092', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 10:52:17', '2016-11-21 10:52:27');
INSERT INTO `ke_task` VALUES ('2821', '18324373866', '13120683381', '2016112111140801908923', '20161121028923', '01', '18324373866/20161121028923/2016112111140801908923', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 11:14:10', '2016-11-21 11:15:10');
INSERT INTO `ke_task` VALUES ('2822', '13120683381', '13120683381', '2016112111231407308427', '20161121028427', '01', '13120683381/20161121028427/2016112111231407308427', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-11-21 11:23:14', '2016-11-21 11:23:22');
INSERT INTO `ke_task` VALUES ('2823', '18324373866', '18333333333', '2016112113103718607483', '20161121027483', '01', '18324373866/20161121027483/2016112113103718607483', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', ' 许许多多的实施', null, '2016-11-21 13:10:38', '2016-11-21 13:17:56');
INSERT INTO `ke_task` VALUES ('2824', '18324373866', '18333333333', '2016112113262169705021', '20161121025021', '01', '18324373866/20161121025021/2016112113262169705021', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '多吃吃吃吃吃吃饭', null, '2016-11-21 13:26:22', '2016-11-21 13:26:39');
INSERT INTO `ke_task` VALUES ('2825', '18702103770', '18333333333', '2016112113270230302815', '20161121022815', '01', '18702103770/20161121022815/2016112113270230302815', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', 'v 长长的粗茶淡饭', null, '2016-11-21 13:27:03', '2016-11-21 13:27:13');
INSERT INTO `ke_task` VALUES ('2826', '18324373866', '18324373866', '2016112909290389609318', '20161129029318', '01', '18324373866/20161129029318/2016112909290389609318', '1936.000000', '2592.000000', 'INVALID', null, '02', '1', '作业模糊啦', null, '2016-11-29 09:29:05', '2016-12-08 09:44:27');
INSERT INTO `ke_task` VALUES ('2827', '18324373866', '18324373866', '2016120809435417203490', '20161208023490', '01', '18324373866/20161208023490/2016120809435417203490', '2448.000000', '3264.000000', 'CORRECTED', '5', '02', '0', '', null, '2016-12-08 09:43:55', '2016-12-08 09:44:38');
INSERT INTO `ke_task` VALUES ('2828', '13120683381', '13120683381', '2016120809453207304587', '20161208024587', '01', '13120683381/20161208024587/2016120809453207304587', '480', '640', 'CORRECTED', '5', '02', '0', '', null, '2016-12-08 09:45:34', '2016-12-08 09:46:00');
INSERT INTO `ke_task` VALUES ('2829', '18324373866', '18324373866', '2017030214585771206054', '20170302026054', '01', '18324373866/20170302026054/2017030214585771206054', '720', '960', 'CORRECTED', '5', '02', '0', '', null, '2017-03-02 14:58:58', '2017-03-02 14:59:38');
INSERT INTO `ke_task` VALUES ('2830', '18324373866', '18324373866', '2017030215113863408471', '20170302018471', '01', '18324373866/20170302018471/2017030215113863408471', '1080', '1920', 'INVALID', null, '01', '0', null, null, '2017-03-02 15:11:38', null);
INSERT INTO `ke_task` VALUES ('2831', '18324373866', '18324373866', '2017030215235014003814', '20170302033814', '01', '18324373866/20170302033814/2017030215235014003814', '1440', '1920', 'INVALID', null, '03', '0', null, null, '2017-03-02 15:23:50', null);
INSERT INTO `ke_task` VALUES ('2832', '18324373866', '18324373866', '2017030215245531605216', '20170302025216', '01', '18324373866/20170302025216/2017030215245531605216', '720', '960', 'INVALID', null, '02', '0', null, null, '2017-03-02 15:24:55', null);
INSERT INTO `ke_task` VALUES ('2833', '18324373866', '18702103770', '2017030215514417603591', '20170302013591', '01', '18324373866/20170302013591/2017030215514417603591', '1080', '1920', 'CORRECTED', '5', '01', '0', '123345', null, '2017-03-02 15:51:44', '2017-03-02 16:56:43');
INSERT INTO `ke_task` VALUES ('2834', '18324373866', '18702103770', '2017030215515380804031', '20170302034031', '01', '18324373866/20170302034031/2017030215515380804031', '1486', '1080', 'CORRECTED', '5', '03', '0', '123', null, '2017-03-02 15:51:54', '2017-03-02 16:56:32');
INSERT INTO `ke_task` VALUES ('2835', '13120683381', '18702103770', '2017030215593963505713', '20170302025713', '01', '13120683381/20170302025713/2017030215593963505713', '256', '216', 'CORRECTED', '5', '02', '0', '', null, '2017-03-02 15:59:39', '2017-03-02 16:57:00');
INSERT INTO `ke_task` VALUES ('2836', '18324373866', '18702103770', '2017030309170561501397', '20170303011397', '01', '18324373866/20170303011397/2017030309170561501397', '4032', '3024', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 09:17:05', '2017-03-03 09:19:44');
INSERT INTO `ke_task` VALUES ('2837', '18324373866', '18702103770', '2017030309171505600521', '20170303020521', '01', '18324373866/20170303020521/2017030309171505600521', '410', '356', 'CORRECTED', '5', '02', '0', '', null, '2017-03-03 09:17:15', '2017-03-03 09:18:55');
INSERT INTO `ke_task` VALUES ('2838', '18324373866', '18702103770', '2017030309172499205769', '20170303035769', '01', '18324373866/20170303035769/2017030309172499205769', '1440', '1920', 'CORRECTED', '5', '03', '0', '', null, '2017-03-03 09:17:25', '2017-03-03 09:19:11');
INSERT INTO `ke_task` VALUES ('2839', '18324373866', '18702103770', '2017030309434168001630', '20170303011630', '01', '18324373866/20170303011630/2017030309434168001630', '4032', '3024', 'CORRECTED', '5', '01', '0', 'Wqewqeqweqwew', null, '2017-03-03 09:43:41', '2017-03-03 09:48:16');
INSERT INTO `ke_task` VALUES ('2840', '18324373866', '18702103770', '2017030309441920005401', '20170303025401', '01', '18324373866/20170303025401/2017030309441920005401', '410', '356', 'CORRECTED', '5', '02', '0', 'Wqeqweqweqweqwe', null, '2017-03-03 09:44:19', '2017-03-03 09:44:32');
INSERT INTO `ke_task` VALUES ('2841', '18324373866', '18324373866', '2017030310031505505498', '20170303035498', '01', '18324373866/20170303035498/2017030310031505505498', '4032', '3024', 'CORRECTED', '5', '03', '0', 'Wqqweqweqweqweqw', null, '2017-03-03 10:03:17', '2017-03-03 10:07:26');
INSERT INTO `ke_task` VALUES ('2842', '18324373866', '18324373866', '2017030310071149909216', '20170303019216', '01', '18324373866/20170303019216/2017030310071149909216', '3264', '2448', 'INVALID', null, '01', '1', '非作业照片', null, '2017-03-03 10:07:11', '2017-03-03 10:08:13');
INSERT INTO `ke_task` VALUES ('2843', '13120683381', '18324373866', '2017030310280274005013', '20170303015013', '01', '13120683381/20170303015013/2017030310280274005013', '4032', '3024', 'INVALID', null, '01', '0', null, null, '2017-03-03 10:28:02', '2017-03-03 10:44:14');
INSERT INTO `ke_task` VALUES ('2844', '13120683381', '18324373866', '2017030310303354603250', '20170303023250', '01', '13120683381/20170303023250/2017030310303354603250', '4032', '3024', 'INVALID', null, '02', '0', null, null, '2017-03-03 10:30:34', '2017-03-03 10:41:16');
INSERT INTO `ke_task` VALUES ('2845', '18324373866', '18324373866', '2017030310392726306294', '20170303036294', '01', '18324373866/20170303036294/2017030310392726306294', '4032', '3024', 'CORRECTED', '5', '03', '0', 'Wqeqweweqweqweqe', null, '2017-03-03 10:39:27', '2017-03-03 10:40:34');
INSERT INTO `ke_task` VALUES ('2846', '18324373866', '18324373866', '2017030310425804605720', '20170303015720', '01', '18324373866/20170303015720/2017030310425804605720', '3264', '2448', 'CORRECTED', '5', '01', '0', '2131231231232', null, '2017-03-03 10:42:58', '2017-03-03 10:49:23');
INSERT INTO `ke_task` VALUES ('2847', '18324373866', '18324373866', '2017030310543991509764', '20170303029764', '01', '18324373866/20170303029764/2017030310543991509764', '4032', '3024', 'CORRECTED', '5', '02', '0', 'Big Image', null, '2017-03-03 10:54:40', '2017-03-03 11:02:42');
INSERT INTO `ke_task` VALUES ('2848', '18324373866', '18324373866', '2017030313150149306803', '20170303016803', '01', '18324373866/20170303016803/2017030313150149306803', '3264', '2448', 'INVALID', null, '01', '1', '非作业照片', null, '2017-03-03 13:15:01', '2017-03-03 13:17:00');
INSERT INTO `ke_task` VALUES ('2849', '13120683381', '18324373866', '2017030313191013409248', '20170303029248', '01', '13120683381/20170303029248/2017030313191013409248', '3024.000000', '4032.000000', 'CORRECTED', '5', '02', '0', '12346798', null, '2017-03-03 13:19:11', '2017-03-03 13:19:54');
INSERT INTO `ke_task` VALUES ('2850', '18324373866', '18324373866', '2017030315433818307351', '20170303017351', '01', '18324373866/20170303017351/2017030315433818307351', '600', '900', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 15:43:38', '2017-03-03 15:46:28');
INSERT INTO `ke_task` VALUES ('2851', '18324373866', '18324373866', '2017030315465807703086', '20170303023086', '01', '18324373866/20170303023086/2017030315465807703086', '4032', '3024', 'CORRECTED', '5', '02', '0', '', null, '2017-03-03 15:46:58', '2017-03-03 15:48:36');
INSERT INTO `ke_task` VALUES ('2852', '18324373866', '18324373866', '2017030315471961504239', '20170303014239', '01', '18324373866/20170303014239/2017030315471961504239', '4032', '3024', 'CORRECTED', '5', '01', '0', '123123123123', null, '2017-03-03 15:47:19', '2017-03-03 15:48:03');
INSERT INTO `ke_task` VALUES ('2853', '18324373866', '18324373866', '2017030315534360603019', '20170303013019', '01', '18324373866/20170303013019/2017030315534360603019', '600', '900', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 15:53:43', '2017-03-03 15:55:28');
INSERT INTO `ke_task` VALUES ('2854', '18324373866', '18324373866', '2017030315552081108049', '20170303018049', '01', '18324373866/20170303018049/2017030315552081108049', '4032', '3024', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 15:55:21', '2017-03-03 15:56:50');
INSERT INTO `ke_task` VALUES ('2855', '18324373866', '18324373866', '2017030315564820503608', '20170303013608', '01', '18324373866/20170303013608/2017030315564820503608', '4032', '3024', 'CORRECTED', '5', '01', '0', '132132133', null, '2017-03-03 15:56:48', '2017-03-03 15:57:27');
INSERT INTO `ke_task` VALUES ('2856', '18324373866', '18324373866', '2017030315585101800354', '20170303010354', '01', '18324373866/20170303010354/2017030315585101800354', '4032', '3024', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 15:58:51', '2017-03-03 16:00:48');
INSERT INTO `ke_task` VALUES ('2857', '18324373866', '18324373866', '2017030315591983906954', '20170303016954', '01', '18324373866/20170303016954/2017030315591983906954', '600', '900', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 15:59:20', '2017-03-03 16:01:02');
INSERT INTO `ke_task` VALUES ('2858', '18324373866', '18324373866', '2017030316013194503628', '20170303013628', '01', '18324373866/20170303013628/2017030316013194503628', '600', '900', 'CORRECTED', '5', '01', '0', 'Wqeqweqweqweqweqw', null, '2017-03-03 16:01:32', '2017-03-03 17:13:47');
INSERT INTO `ke_task` VALUES ('2859', '18324373866', '18324373866', '2017030317113334105482', '20170303015482', '01', '18324373866/20170303015482/2017030317113334105482', '600', '900', 'CORRECTED', '5', '01', '0', 'Qweqweqweqwe', null, '2017-03-03 17:11:36', '2017-03-03 17:14:09');
INSERT INTO `ke_task` VALUES ('2860', '18324373866', '18324373866', '2017030317131005808504', '20170303018504', '01', '18324373866/20170303018504/2017030317131005808504', '600', '900', 'CORRECTED', '5', '01', '0', 'Qweqwewqeqweqw', null, '2017-03-03 17:13:10', '2017-03-03 17:14:33');
INSERT INTO `ke_task` VALUES ('2861', '18324373866', '18324373866', '2017030317315840704938', '20170303014938', '01', '18324373866/20170303014938/2017030317315840704938', '600', '900', 'CORRECTED', '5', '01', '0', '', null, '2017-03-03 17:31:58', '2017-03-03 17:34:35');
INSERT INTO `ke_task` VALUES ('2862', '18324373866', '18324373866', '2017030317321346407034', '20170303027034', '01', '18324373866/20170303027034/2017030317321346407034', '600', '900', 'CORRECTED', '5', '02', '0', '', null, '2017-03-03 17:32:13', '2017-03-03 17:34:45');
INSERT INTO `ke_task` VALUES ('2863', '18324373866', '18324373866', '2017030317323197200829', '20170303030829', '01', '18324373866/20170303030829/2017030317323197200829', '600', '900', 'CORRECTED', '5', '03', '0', '', null, '2017-03-03 17:32:32', '2017-03-03 17:35:43');
INSERT INTO `ke_task` VALUES ('2864', '13120683381', '18324373866', '2017030317520596902389', '20170303022389', '01', '13120683381/20170303022389/2017030317520596902389', '600', '900', 'CORRECTED', '5', '02', '0', '', null, '2017-03-03 17:52:06', '2017-03-03 17:53:35');

-- ----------------------------
-- Table structure for ke_task_history
-- ----------------------------
DROP TABLE IF EXISTS `ke_task_history`;
CREATE TABLE `ke_task_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `photo_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每张作业照片ID',
  `group_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每份作业的组ID',
  `photo_sort` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传照片顺序',
  `photo_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每张作业照片URL(七牛云存储)',
  `width` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片的宽度',
  `height` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片的高度',
  `task_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作业状态:UNCORRECTED未批改(默认)、CORRECTING批改中、FINISH批改完成、CORRECTED已完成、INVALID无效',
  `point` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生给的星星',
  `subject_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目:语，数，外',
  `delete_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模糊图片删除标记【已经改为10,11,12,13】(0:正确照片,1:模糊照片,2:已重传过旧的照片,3:被举报图片)',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师给的评语',
  `mark_flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否已评分（0否、1是）',
  `wantuo_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属晚托班ID',
  `sea_flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否已看过日报(0没看、1看过)',
  `create_time` datetime DEFAULT NULL COMMENT '作业上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '作业批改时间',
  PRIMARY KEY (`id`),
  KEY `photo_id_idx` (`photo_id`),
  KEY `photo_id_user_idx` (`photo_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_task_history
-- ----------------------------

-- ----------------------------
-- Table structure for ke_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ke_teacher`;
CREATE TABLE `ke_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师姓名',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `grade` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年级1～6',
  `subject_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目:语，数，外',
  `head_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址(七牛云存储)',
  `city_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编号',
  `province_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份编号',
  `certificate_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资格证书照片URL(空:无)',
  `apprv_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态(NEW新申请、APPROVED通过审核、UNAPPROVED未通过审核、UNAPPLY未申请)',
  `active_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '在线状态(离线OFFLINE、在线ONLINE)',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册老师类型(0:内部,1:外部,2:营销,9:禁用)',
  `org_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属机构ID',
  `pass_time` datetime DEFAULT NULL COMMENT '资格证通过时间',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_teacher
-- ----------------------------
INSERT INTO `ke_teacher` VALUES ('65', '15861591576', '张老师', '1', '15861591576', 'e10adc3949ba59abbe56e057f20f883e', '02', '01', 'kerkr999', '910100', '910000', 'default', 'UNAPPROVED', 'OFFLINE', '1', '', null, '2016-10-31 17:05:04', null);
INSERT INTO `ke_teacher` VALUES ('67', '18333333333', '夕哥', '1', '18333333333', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '06', '02', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'OFFLINE', '1', 'K20012', null, '2016-11-10 17:20:12', '2017-03-06 11:45:15');
INSERT INTO `ke_teacher` VALUES ('68', '15157891809', '蔡', '1', '15157891809', '8ddcff3a80f4189ca1c9d4d902c3c909', '04', '02', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'OFFLINE', '1', 'K20013', null, '2016-11-10 21:13:08', '2016-11-18 09:10:04');
INSERT INTO `ke_teacher` VALUES ('69', '15168022179', '吴', '1', '15168022179', '8ddcff3a80f4189ca1c9d4d902c3c909', '05', '02', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'OFFLINE', '1', 'K20013', null, '2016-11-10 21:15:16', '2016-12-02 13:41:38');
INSERT INTO `ke_teacher` VALUES ('70', '13567626866', '徐', '1', '13567626866', '8ddcff3a80f4189ca1c9d4d902c3c909', '05', '02', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'OFFLINE', '1', 'K20013', null, '2016-11-10 21:18:48', '2016-11-18 20:48:27');
INSERT INTO `ke_teacher` VALUES ('71', '13567615730', '雷老师', '1', '13567615730', '8ddcff3a80f4189ca1c9d4d902c3c909', '04', '02', 'kerkr999', '331100', '330000', 'default', 'APPROVED', 'OFFLINE', '1', 'K20013', null, '2016-11-10 21:21:07', '2016-11-29 10:02:27');
INSERT INTO `ke_teacher` VALUES ('72', '18702103770', '吴老师', '1', '18702103770', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '04', '03', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'ONLINE', '1', 'K20012', null, '2016-11-21 11:11:40', '2017-03-06 16:50:33');
INSERT INTO `ke_teacher` VALUES ('73', '13120813381', 'AAA', '1', '13120813381', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '01', '01', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'OFFLINE', '1', '', null, '2017-03-02 15:31:31', '2017-03-02 16:57:49');
INSERT INTO `ke_teacher` VALUES ('74', '13120683381', 'huang', '1', '13120683381', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '04', '01', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'ONLINE', '1', 'K20012', null, '2017-03-02 16:11:30', '2017-03-03 18:09:15');
INSERT INTO `ke_teacher` VALUES ('75', '18324373866', '袁老师', '1', '18324373866', 'e10adc3949ba59abbe56e057f20f883e', '04', '02', 'kerkr999', '910100', '910000', 'default', 'APPROVED', 'ONLINE', '1', 'K20012', null, '2017-03-02 16:11:48', '2017-03-03 17:53:36');
INSERT INTO `ke_teacher` VALUES ('76', '17621675208', '南老师', '1', '17621675208', 'e10adc3949ba59abbe56e057f20f883e', '01', '01', 'keke999', '910100', '910000', null, 'APPROVED', 'OFFLINE', '1', 'K20012', null, '2017-08-30 17:51:05', null);

-- ----------------------------
-- Table structure for ke_tea_income
-- ----------------------------
DROP TABLE IF EXISTS `ke_tea_income`;
CREATE TABLE `ke_tea_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `total_income` decimal(15,2) DEFAULT NULL COMMENT '老师总收入',
  `input_income` decimal(15,2) DEFAULT NULL COMMENT '未提现金额',
  `output_income` decimal(15,2) DEFAULT NULL COMMENT '已提现金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_tea_income
-- ----------------------------
INSERT INTO `ke_tea_income` VALUES ('30', '18333333333', '0.00', '0.00', '0.00', '2016-11-10 17:20:12', null);
INSERT INTO `ke_tea_income` VALUES ('31', '15157891809', '0.00', '0.00', '0.00', '2016-11-10 21:13:08', null);
INSERT INTO `ke_tea_income` VALUES ('32', '15168022179', '0.00', '0.00', '0.00', '2016-11-10 21:15:16', null);
INSERT INTO `ke_tea_income` VALUES ('33', '13567626866', '0.00', '0.00', '0.00', '2016-11-10 21:18:48', null);
INSERT INTO `ke_tea_income` VALUES ('34', '13567615730', '0.00', '0.00', '0.00', '2016-11-10 21:21:07', null);
INSERT INTO `ke_tea_income` VALUES ('35', '18702103770', '0.00', '0.00', '0.00', '2016-11-21 11:11:40', null);
INSERT INTO `ke_tea_income` VALUES ('36', '13120813381', '0.00', '0.00', '0.00', '2017-03-02 15:31:31', null);
INSERT INTO `ke_tea_income` VALUES ('37', '13120683381', '0.00', '0.00', '0.00', '2017-03-02 16:11:30', null);
INSERT INTO `ke_tea_income` VALUES ('38', '18324373866', '0.00', '0.00', '0.00', '2017-03-02 16:11:48', null);
INSERT INTO `ke_tea_income` VALUES ('39', '17621675208', '0.00', '0.00', '0.00', '2017-08-30 17:51:05', null);

-- ----------------------------
-- Table structure for ke_tea_income_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_tea_income_record`;
CREATE TABLE `ke_tea_income_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师ID',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:收入,1:支出',
  `charge` decimal(15,2) DEFAULT NULL COMMENT '手续费',
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:用户申请中 1:商户申请中 2:支付宝处理完成（可能成功，可能失败）',
  `batch_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转账批次号',
  `result` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否转账成功 F:失败 S:成功',
  `serial_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '流水号',
  `toAccount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收款方账号',
  `toName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `alipay_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付宝内部流水号',
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成功或失败原因',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '补充说明',
  `create_time` datetime DEFAULT NULL COMMENT '申请提现时间或入账时间',
  `finish_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_tea_income_record
-- ----------------------------

-- ----------------------------
-- Table structure for ke_tea_yunxin
-- ----------------------------
DROP TABLE IF EXISTS `ke_tea_yunxin`;
CREATE TABLE `ke_tea_yunxin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `yunxin_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '云信ID',
  `yunxin_token` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '云信授权token',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:离线 1:通话中',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_tea_yunxin
-- ----------------------------
INSERT INTO `ke_tea_yunxin` VALUES ('6', '15197089960', 't20160725181217397', 'fef00922f987bc4e5f88186fb40c7da6', '0', '2016-07-25 18:12:17', '2016-07-27 15:13:02');
INSERT INTO `ke_tea_yunxin` VALUES ('9', '18324373866', 't20161109111409762', 'dfa07479163d024e7351cd2e85f9a4ac', '0', '2016-11-09 11:14:09', '2016-12-08 10:53:50');
INSERT INTO `ke_tea_yunxin` VALUES ('10', '13120683381', 't20161110130744057', '5d454b0816c887d9f45028cd91533cfd', '0', '2016-11-10 13:07:44', '2016-12-08 10:52:52');
INSERT INTO `ke_tea_yunxin` VALUES ('11', '18333333333', 't20161110172052775', 'f56454cdbb8ac5f43773a5d9ff071186', '0', '2016-11-10 17:20:52', '2016-12-08 09:35:41');
INSERT INTO `ke_tea_yunxin` VALUES ('12', '13567615730', 't20161110212235928', 'd79b9b1f2ec18bcfcaf2cc7957521f17', '0', '2016-11-10 21:22:36', '2016-11-19 22:25:32');
INSERT INTO `ke_tea_yunxin` VALUES ('13', '15157891809', 't20161110212608526', '8323668a23754f2f9f93baf33011ea4c', '1', '2016-11-10 21:26:08', '2016-11-18 20:46:22');
INSERT INTO `ke_tea_yunxin` VALUES ('14', '13567626866', 't20161111082030701', 'c2a0204fe111535c94d5840a87157755', '0', '2016-11-11 08:20:30', '2016-11-18 12:59:30');
INSERT INTO `ke_tea_yunxin` VALUES ('15', '15168022179', 't20161117185930669', 'b083bf5811edb20102e9a5eb43c2cbe7', '0', '2016-11-17 18:59:31', null);
INSERT INTO `ke_tea_yunxin` VALUES ('16', '18702103770', 't20161121111341309', 'be14364eb14e628fb57c5c97e26d42f9', '0', '2016-11-21 11:13:42', null);
INSERT INTO `ke_tea_yunxin` VALUES ('17', '13120813381', 't20170302153141626', '6685248978f30986d8749107b722472c', '0', '2017-03-02 15:31:42', null);

-- ----------------------------
-- Table structure for ke_user
-- ----------------------------
DROP TABLE IF EXISTS `ke_user`;
CREATE TABLE `ke_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `user_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `grade` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年级1～6',
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `head_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址(七牛云存储）',
  `city_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编号',
  `province_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份编号',
  `user_level` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '优秀学生标记(0:普通,1:优秀)',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型(0:试用,1:充值)',
  `org_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属机构ID',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_user
-- ----------------------------
INSERT INTO `ke_user` VALUES ('40', '18324373866', '袁超', '04', '18324373866', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '18324373866/1611141511193729', '513200', '510000', '0', '0', 'K20012', '2016-10-31 17:03:43', '2016-11-28 18:24:37');
INSERT INTO `ke_user` VALUES ('41', '13120683381', '请求', '04', '13120683381', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '13120683381/1611101523531930', '910100', '910000', '0', '0', 'K20012', '2016-11-08 16:29:29', '2016-11-28 18:24:37');
INSERT INTO `ke_user` VALUES ('42', '18702103770', 'wu', '04', '18702103770', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '18702103770/161111173900521', '910100', '910000', '0', '0', 'K20012', '2016-11-08 16:29:52', '2016-11-28 18:24:37');
INSERT INTO `ke_user` VALUES ('43', '15157891809', '蔡近子', '04', '15157891809', '8ddcff3a80f4189ca1c9d4d902c3c909', 'kerkr999', '910100', '910000', '0', '0', 'K20013', '2016-11-10 21:21:47', '2016-11-28 09:52:08');
INSERT INTO `ke_user` VALUES ('44', '13567626866', '徐', '04', '13567626866', '8ddcff3a80f4189ca1c9d4d902c3c909', 'kerkr999', '910100', '910000', '0', '0', 'K20013', '2016-11-10 21:22:36', null);
INSERT INTO `ke_user` VALUES ('45', '13567615730', '雷', '01', '13567615730', '8ddcff3a80f4189ca1c9d4d902c3c909', 'kerkr999', '910100', '910000', '0', '0', 'K20013', '2016-11-10 21:23:35', null);
INSERT INTO `ke_user` VALUES ('46', '13253619481', 'xu', '04', '13253619481', 'e10adc3949ba59abbe56e057f20f883e', 'kerkr999', '910100', '910000', '0', '0', 'K20013', '2017-03-02 16:39:51', null);

-- ----------------------------
-- Table structure for ke_version
-- ----------------------------
DROP TABLE IF EXISTS `ke_version`;
CREATE TABLE `ke_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `versionNo` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最新版本号',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新内容',
  `forces` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否要强制更新：1要、0不要',
  `notice` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否要提醒用户更新：1要、0不要',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型:0家长、1老师',
  `download_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'android下载地址',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `system_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备类型(0iPhone、1Android)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_version
-- ----------------------------
INSERT INTO `ke_version` VALUES ('1', '1.0.2', '有新版本更新', '0', '0', '0', null, '2016-07-22 19:32:00', '0', '2016-07-22 19:32:03');
INSERT INTO `ke_version` VALUES ('2', '1.0.2', '有新版本更新', '0', '1', '1', null, '2016-07-22 19:32:00', '0', '2016-07-22 19:32:03');

-- ----------------------------
-- Table structure for ke_videos
-- ----------------------------
DROP TABLE IF EXISTS `ke_videos`;
CREATE TABLE `ke_videos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `org_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传机构',
  `topic_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '缩略图url',
  `length` int(30) DEFAULT '0' COMMENT '时长',
  `video_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频七牛key',
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '更改时间',
  `status` bit(1) DEFAULT NULL COMMENT '状态，1正常，0失效',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_videos
-- ----------------------------
INSERT INTO `ke_videos` VALUES ('1', 'K20012', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/videodevice-2017-05-11-163323.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('2', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/videodevice-2017-05-11-163323.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('3', 'K20012', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/videodevice-2017-05-11-163323.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('4', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/videodevice-2017-05-11-163323.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('5', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('6', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('7', 'K20012', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('8', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('9', 'K20013', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('10', 'K20012', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');
INSERT INTO `ke_videos` VALUES ('11', 'K20012', 'http://vimg2.ws.126.net/image/snapshot/2017/6/O/O/VCM4FTDOO.jpg', '61', 'http://ovhr8lih9.bkt.clouddn.com/12.mp4', '2017-09-01 09:42:59', null, '', '课课', '相关描述');

-- ----------------------------
-- Table structure for ke_yunxincall_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_yunxincall_record`;
CREATE TABLE `ke_yunxincall_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `start_time` datetime DEFAULT NULL COMMENT '通话开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '通话结束时间',
  `time_cost` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通话时长(分)',
  `oil_cost` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消耗油量(L)',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对老师答疑评价内容',
  `record_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '记录号',
  `create_time` datetime DEFAULT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_yunxincall_record
-- ----------------------------
INSERT INTO `ke_yunxincall_record` VALUES ('1', '18949176618', '15197089960', '2016-07-25 18:17:12', '2016-07-25 20:28:51', '1', '1', null, 'kk965420160725181657091', '2016-07-25 18:17:12', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('2', '15800000000', '15197089960', '2016-07-25 18:18:49', '2016-07-25 18:22:29', '1', '1', '不满意', 'kk857120160725181836257', '2016-07-25 18:18:49', '2016-07-25 18:22:29');
INSERT INTO `ke_yunxincall_record` VALUES ('3', '15800000000', '15197089960', '2016-07-25 18:22:24', '2016-07-25 18:22:29', '1', '1', '不满意', 'kk267520160725182221968', '2016-07-25 18:22:24', '2016-07-25 18:22:29');
INSERT INTO `ke_yunxincall_record` VALUES ('4', '18949176618', '15197089960', '2016-07-25 18:22:51', '2016-07-25 20:28:51', '1', '1', null, 'kk601920160725182249457', '2016-07-25 18:22:51', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('5', '18949176618', '15197089960', '2016-07-25 18:23:04', '2016-07-25 20:28:51', '1', '1', null, 'kk870920160725182302290', '2016-07-25 18:23:04', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('6', '18949176618', '15197089960', '2016-07-25 18:23:04', '2016-07-25 20:28:51', '1', '1', null, 'kk601920160725182249457', '2016-07-25 18:23:04', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('7', '18949176618', '15197089960', '2016-07-25 18:24:05', '2016-07-25 20:28:51', '1', '1', null, 'kk870920160725182302290', '2016-07-25 18:24:05', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('8', '18949176618', '15197089960', '2016-07-25 18:24:05', '2016-07-25 20:28:51', '1', '1', null, 'kk937520160725182400723', '2016-07-25 18:24:05', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('9', '18949176618', '15197089960', '2016-07-25 18:24:05', '2016-07-25 20:28:51', '1', '1', null, 'kk601920160725182249457', '2016-07-25 18:24:05', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('10', '18949176618', '15197089960', '2016-07-25 18:53:07', '2016-07-25 20:28:51', '1', '1', null, 'kk387120160725185254015', '2016-07-25 18:53:07', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('11', '18949176618', '15197089960', '2016-07-25 19:00:37', '2016-07-25 20:28:51', '1', '1', null, 'kk597120160725190025024', '2016-07-25 19:00:37', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('12', '18949176618', '15197089960', '2016-07-25 19:03:23', '2016-07-25 20:28:51', '1', '1', null, 'kk597120160725190025024', '2016-07-25 19:03:23', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('13', '18949176618', '15197089960', '2016-07-25 19:03:23', '2016-07-25 20:28:51', '1', '1', null, 'kk912620160725190314295', '2016-07-25 19:03:23', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('14', '18949176618', '15197089960', '2016-07-25 19:03:53', '2016-07-25 20:28:51', '1', '1', null, 'kk597120160725190025024', '2016-07-25 19:03:53', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('15', '18949176618', '15197089960', '2016-07-25 19:03:53', '2016-07-25 20:28:51', '1', '1', null, 'kk754620160725190351171', '2016-07-25 19:03:53', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('16', '18949176618', '15197089960', '2016-07-25 19:03:53', '2016-07-25 20:28:51', '1', '1', null, 'kk912620160725190314295', '2016-07-25 19:03:53', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('17', '18949176618', '15197089960', '2016-07-25 19:08:26', '2016-07-25 20:28:51', '1', '1', null, 'kk754620160725190351171', '2016-07-25 19:08:26', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('18', '18949176618', '15197089960', '2016-07-25 19:08:26', '2016-07-25 20:28:51', '1', '1', null, 'kk597120160725190025024', '2016-07-25 19:08:26', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('19', '18949176618', '15197089960', '2016-07-25 19:08:26', '2016-07-25 20:28:51', '1', '1', null, 'kk654220160725190819799', '2016-07-25 19:08:26', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('20', '18949176618', '15197089960', '2016-07-25 19:08:26', '2016-07-25 20:28:51', '1', '1', null, 'kk912620160725190314295', '2016-07-25 19:08:26', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('21', '18949176618', '15197089960', '2016-07-25 19:09:34', '2016-07-25 20:28:51', '1', '1', null, 'kk754620160725190351171', '2016-07-25 19:09:34', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('22', '18949176618', '15197089960', '2016-07-25 19:09:34', '2016-07-25 20:28:51', '1', '1', null, 'kk654220160725190819799', '2016-07-25 19:09:34', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('23', '18949176618', '15197089960', '2016-07-25 19:09:34', '2016-07-25 20:28:51', '1', '1', null, 'kk16720160725190933468', '2016-07-25 19:09:34', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('24', '18949176618', '15197089960', '2016-07-25 19:09:34', '2016-07-25 20:28:51', '1', '1', null, 'kk912620160725190314295', '2016-07-25 19:09:34', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('25', '18949176618', '15197089960', '2016-07-25 19:09:34', '2016-07-25 20:28:51', '1', '1', null, 'kk597120160725190025024', '2016-07-25 19:09:34', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('26', '18949176618', '15197089960', '2016-07-25 20:28:47', '2016-07-25 20:28:51', '1', '1', null, 'kk752920160725202834170', '2016-07-25 20:28:47', '2016-07-25 20:28:51');
INSERT INTO `ke_yunxincall_record` VALUES ('27', '18702103770', '18324373866', '2016-11-09 11:14:25', '2016-11-21 10:50:07', '1', '1', null, 'kk416020161109111421971', '2016-11-09 11:14:25', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('28', '13120683381', '13120683381', '2016-11-10 13:08:08', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk92320161110130803372', '2016-11-10 13:08:08', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('29', '13120683381', '13120683381', '2016-11-10 13:10:10', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk86120161110131006738', '2016-11-10 13:10:10', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('30', '13120683381', '18324373866', '2016-11-10 13:39:20', '2016-11-14 15:51:57', '1', '1', '不满意', 'kk697020161110133839575', '2016-11-10 13:39:20', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('31', '13120683381', '18324373866', '2016-11-10 13:41:22', '2016-11-14 15:51:57', '1', '1', '不满意', 'kk753120161110134118766', '2016-11-10 13:41:22', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('32', '13120683381', '18324373866', '2016-11-10 13:57:41', '2016-11-14 15:51:57', '1', '1', '满意', 'kk138520161110135737135', '2016-11-10 13:57:41', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('33', '13120683381', '18324373866', '2016-11-10 13:58:09', '2016-11-14 15:51:57', '1', '1', '满意', 'kk312720161110135807879', '2016-11-10 13:58:09', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('34', '18702103770', '18324373866', '2016-11-10 17:42:33', '2016-11-21 10:50:07', '1', '1', null, 'kk296420161110174220621', '2016-11-10 17:42:33', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('35', '18702103770', '18324373866', '2016-11-10 17:43:59', '2016-11-21 10:50:07', '1', '1', null, 'kk921520161110174355343', '2016-11-10 17:43:59', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('36', '18702103770', '18324373866', '2016-11-10 17:44:17', '2016-11-21 10:50:07', '1', '1', null, 'kk613420161110174414536', '2016-11-10 17:44:17', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('37', '18702103770', '18324373866', '2016-11-10 17:50:10', '2016-11-21 10:50:07', '1', '1', null, 'kk103420161110175004747', '2016-11-10 17:50:10', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('38', '13120683381', '18324373866', '2016-11-11 09:49:42', '2016-11-14 15:51:57', '1', '1', null, 'kk615220161111094930062', '2016-11-11 09:49:42', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('39', '13120683381', '18324373866', '2016-11-11 09:54:22', '2016-11-14 15:51:57', '1', '1', null, 'kk963820161111095413276', '2016-11-11 09:54:22', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('40', '13120683381', '18324373866', '2016-11-11 10:03:55', '2016-11-14 15:51:57', '1', '1', null, 'kk238420161111100347447', '2016-11-11 10:03:55', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('41', '13120683381', '13120683381', '2016-11-11 10:05:43', '2016-12-08 09:56:05', '1', '1', null, 'kk695020161111100539352', '2016-11-11 10:05:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('42', '13120683381', '13120683381', '2016-11-11 10:07:03', '2016-12-08 09:56:05', '1', '1', null, 'kk580120161111100637612', '2016-11-11 10:07:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('43', '13120683381', '13120683381', '2016-11-11 10:16:47', '2016-12-08 09:56:05', '1', '1', null, 'kk527920161111101642748', '2016-11-11 10:16:47', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('44', '13120683381', '13120683381', '2016-11-11 10:16:59', '2016-12-08 09:56:05', '1', '1', '不满意', 'kk823720161111101657528', '2016-11-11 10:16:59', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('45', '13120683381', '13120683381', '2016-11-11 10:26:01', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk256320161111102545418', '2016-11-11 10:26:01', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('46', '13120683381', '13120683381', '2016-11-11 10:27:39', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk425720161111102737133', '2016-11-11 10:27:39', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('47', '13120683381', '13120683381', '2016-11-11 10:28:20', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk518720161111102817273', '2016-11-11 10:28:20', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('48', '13120683381', '13120683381', '2016-11-11 10:29:46', '2016-12-08 09:56:05', '1', '1', null, 'kk926420161111102941428', '2016-11-11 10:29:46', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('49', '13120683381', '13120683381', '2016-11-11 10:30:19', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk806720161111103016641', '2016-11-11 10:30:19', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('50', '13120683381', '13120683381', '2016-11-11 10:38:53', '2016-12-08 09:56:05', '1', '1', null, 'kk645820161111103851197', '2016-11-11 10:38:53', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('51', '13120683381', '13120683381', '2016-11-11 10:40:03', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk419320161111103957180', '2016-11-11 10:40:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('52', '13120683381', '13120683381', '2016-11-11 10:47:41', '2016-12-08 09:56:05', '1', '1', null, 'kk612320161111104730655', '2016-11-11 10:47:41', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('53', '13120683381', '13120683381', '2016-11-11 10:49:47', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk759320161111104945138', '2016-11-11 10:49:47', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('54', '13120683381', '13120683381', '2016-11-11 10:55:59', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk412620161111105556382', '2016-11-11 10:55:59', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('55', '13120683381', '13120683381', '2016-11-11 10:57:32', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk170320161111105730575', '2016-11-11 10:57:32', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('56', '13120683381', '13120683381', '2016-11-11 10:58:35', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk649520161111105834006', '2016-11-11 10:58:35', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('57', '13120683381', '13120683381', '2016-11-11 12:50:28', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk974120161111125020971', '2016-11-11 12:50:28', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('58', '13120683381', '13120683381', '2016-11-11 12:53:23', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk842320161111125320526', '2016-11-11 12:53:23', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('59', '13120683381', '13120683381', '2016-11-11 12:53:43', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk582020161111125340712', '2016-11-11 12:53:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('60', '13120683381', '13120683381', '2016-11-11 12:55:42', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk23420161111125539659', '2016-11-11 12:55:42', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('61', '13120683381', '13120683381', '2016-11-11 12:56:05', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk153020161111125602229', '2016-11-11 12:56:05', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('62', '13120683381', '13120683381', '2016-11-11 12:57:45', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk135620161111125739653', '2016-11-11 12:57:45', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('63', '13120683381', '13120683381', '2016-11-11 12:59:10', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk51720161111125904820', '2016-11-11 12:59:10', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('64', '13120683381', '13120683381', '2016-11-11 13:25:19', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk596120161111132453451', '2016-11-11 13:25:19', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('65', '13120683381', '13120683381', '2016-11-11 16:13:30', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk19520161111161327211', '2016-11-11 16:13:30', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('66', '13120683381', '13120683381', '2016-11-11 16:23:44', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk832120161111162341223', '2016-11-11 16:23:44', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('67', '13120683381', '13120683381', '2016-11-11 16:27:43', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk219620161111162739851', '2016-11-11 16:27:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('68', '13120683381', '13120683381', '2016-11-11 16:32:13', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk328720161111163208848', '2016-11-11 16:32:13', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('69', '13120683381', '13120683381', '2016-11-11 16:32:54', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk403120161111163247188', '2016-11-11 16:32:54', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('70', '13120683381', '13120683381', '2016-11-11 16:49:03', '2016-12-08 09:56:05', '1', '1', null, 'kk943720161111164834163', '2016-11-11 16:49:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('71', '13120683381', '13120683381', '2016-11-11 16:50:13', '2016-12-08 09:56:05', '1', '1', null, 'kk769020161111164848849', '2016-11-11 16:50:13', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('72', '13120683381', '13120683381', '2016-11-11 16:56:19', '2016-12-08 09:56:05', '1', '1', '不满意', 'kk271020161111165613209', '2016-11-11 16:56:19', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('73', '13120683381', '13120683381', '2016-11-11 16:58:03', '2016-12-08 09:56:05', '1', '1', null, 'kk732520161111165739096', '2016-11-11 16:58:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('74', '13120683381', '13120683381', '2016-11-11 17:10:28', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk472620161111171025140', '2016-11-11 17:10:28', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('75', '18324373866', '18324373866', '2016-11-14 14:52:30', '2016-11-14 14:53:21', '1', '1', null, 'kk98120161114145226671', '2016-11-14 14:52:30', '2016-11-14 14:53:21');
INSERT INTO `ke_yunxincall_record` VALUES ('76', '18324373866', '18324373866', '2016-11-14 14:52:52', '2016-11-14 14:53:21', '1', '1', '满意', 'kk36920161114145249601', '2016-11-14 14:52:52', '2016-11-14 14:53:21');
INSERT INTO `ke_yunxincall_record` VALUES ('77', '13120683381', '18324373866', '2016-11-14 15:32:12', '2016-11-14 15:51:57', '1', '1', '棒棒哒', 'kk67320161114153208952', '2016-11-14 15:32:12', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('78', '13120683381', '18324373866', '2016-11-14 15:50:59', '2016-11-14 15:51:57', '1', '1', '棒棒哒', 'kk906720161114155056747', '2016-11-14 15:50:59', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('79', '13120683381', '18324373866', '2016-11-14 15:51:17', '2016-11-14 15:51:57', '1', '1', '不满意', 'kk320120161114155115718', '2016-11-14 15:51:17', '2016-11-14 15:51:57');
INSERT INTO `ke_yunxincall_record` VALUES ('80', '18324373866', '18333333333', '2016-11-14 15:57:00', '2016-11-16 09:43:35', '1', '1', null, 'kk806220161114155658771', '2016-11-14 15:57:00', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('81', '18324373866', '18333333333', '2016-11-14 15:58:11', '2016-11-16 09:43:35', '1', '1', null, 'kk457020161114155809136', '2016-11-14 15:58:11', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('82', '18324373866', '18333333333', '2016-11-14 16:00:29', '2016-11-16 09:43:35', '1', '1', null, 'kk68720161114160026641', '2016-11-14 16:00:29', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('83', '18324373866', '18333333333', '2016-11-14 16:01:34', '2016-11-16 09:43:35', '1', '1', null, 'kk528720161114160131650', '2016-11-14 16:01:34', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('84', '18324373866', '18333333333', '2016-11-14 16:06:22', '2016-11-16 09:43:35', '1', '1', null, 'kk937520161114160620641', '2016-11-14 16:06:22', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('85', '18324373866', '18333333333', '2016-11-14 16:11:04', '2016-11-16 09:43:35', '1', '1', null, 'kk981620161114161101525', '2016-11-14 16:11:04', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('86', '13120683381', '18333333333', '2016-11-14 16:14:11', '2016-11-14 16:14:11', '0', '0', '棒棒哒', 'kk238420161114161408362', '2016-11-14 16:14:11', null);
INSERT INTO `ke_yunxincall_record` VALUES ('87', '13120683381', '13120683381', '2016-11-15 15:48:14', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk716520161115154809423', '2016-11-15 15:48:14', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('88', '13120683381', '13120683381', '2016-11-15 17:35:29', '2016-12-08 09:56:05', '1', '1', null, 'kk987120161115173526765', '2016-11-15 17:35:29', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('89', '13120683381', '13120683381', '2016-11-15 17:36:21', '2016-12-08 09:56:05', '1', '1', null, 'kk724320161115173617029', '2016-11-15 17:36:21', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('90', '13120683381', '13120683381', '2016-11-15 17:42:06', '2016-12-08 09:56:05', '1', '1', null, 'kk726420161115174204125', '2016-11-15 17:42:06', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('91', '13120683381', '13120683381', '2016-11-15 17:43:03', '2016-12-08 09:56:05', '1', '1', null, 'kk92120161115174300773', '2016-11-15 17:43:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('92', '13120683381', '13120683381', '2016-11-15 17:56:34', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk324720161115175632148', '2016-11-15 17:56:34', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('93', '13120683381', '13120683381', '2016-11-15 17:59:26', '2016-12-08 09:56:05', '1', '1', '不满意', 'kk496520161115175921548', '2016-11-15 17:59:26', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('94', '13120683381', '13120683381', '2016-11-15 18:04:43', '2016-12-08 09:56:05', '1', '1', '不满意', 'kk398520161115180440924', '2016-11-15 18:04:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('95', '13120683381', '13120683381', '2016-11-15 18:05:17', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk852920161115180516048', '2016-11-15 18:05:17', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('96', '13120683381', '13120683381', '2016-11-15 18:15:38', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk324620161115181532092', '2016-11-15 18:15:38', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('97', '13120683381', '13120683381', '2016-11-15 18:22:44', '2016-12-08 09:56:05', '1', '1', null, 'kk519820161115182242386', '2016-11-15 18:22:44', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('98', '13120683381', '13120683381', '2016-11-15 18:24:15', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk124620161115182413398', '2016-11-15 18:24:15', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('99', '13120683381', '13120683381', '2016-11-15 18:30:47', '2016-12-08 09:56:05', '1', '1', null, 'kk980320161115183045984', '2016-11-15 18:30:47', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('100', '13120683381', '13120683381', '2016-11-15 18:31:43', '2016-12-08 09:56:05', '1', '1', null, 'kk628520161115183141929', '2016-11-15 18:31:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('101', '13120683381', '13120683381', '2016-11-15 18:33:11', '2016-12-08 09:56:05', '1', '1', null, 'kk618720161115183309589', '2016-11-15 18:33:11', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('102', '13120683381', '13120683381', '2016-11-15 18:34:32', '2016-12-08 09:56:05', '1', '1', null, 'kk710620161115183430810', '2016-11-15 18:34:32', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('103', '13120683381', '13120683381', '2016-11-15 18:37:11', '2016-12-08 09:56:05', '1', '1', null, 'kk635920161115183705293', '2016-11-15 18:37:11', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('104', '13120683381', '13120683381', '2016-11-15 18:55:44', '2016-12-08 09:56:05', '1', '1', null, 'kk841320161115185540926', '2016-11-15 18:55:44', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('105', '13567626866', '13567615730', '2016-11-15 19:17:35', '2016-11-17 18:02:48', '2', '2', '满意', 'kk628720161115191718306', '2016-11-15 19:17:35', '2016-11-17 18:02:48');
INSERT INTO `ke_yunxincall_record` VALUES ('106', '13567626866', '13567615730', '2016-11-15 19:39:37', '2016-11-17 18:02:48', '2', '2', '不满意', 'kk318520161115193906086', '2016-11-15 19:39:37', '2016-11-17 18:02:48');
INSERT INTO `ke_yunxincall_record` VALUES ('107', '13567626866', '13567615730', '2016-11-15 19:55:14', '2016-11-17 18:02:48', '2', '2', '不满意', 'kk93120161115195458528', '2016-11-15 19:55:14', '2016-11-17 18:02:48');
INSERT INTO `ke_yunxincall_record` VALUES ('108', '18324373866', '18333333333', '2016-11-16 09:43:14', '2016-11-16 09:43:35', '1', '1', null, 'kk928020161116094306067', '2016-11-16 09:43:14', '2016-11-16 09:43:35');
INSERT INTO `ke_yunxincall_record` VALUES ('109', '18324373866', '18333333333', '2016-11-16 09:43:52', '2016-11-16 09:43:52', '0', '0', null, 'kk483520161116094350901', '2016-11-16 09:43:52', null);
INSERT INTO `ke_yunxincall_record` VALUES ('110', '13120683381', '13120683381', '2016-11-16 10:06:49', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk207920161116100647709', '2016-11-16 10:06:49', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('111', '13120683381', '13120683381', '2016-11-16 10:33:57', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk836720161116103355413', '2016-11-16 10:33:57', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('112', '13120683381', '13120683381', '2016-11-16 10:48:28', '2016-12-08 09:56:05', '1', '1', '不满意', 'kk702120161116104826134', '2016-11-16 10:48:28', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('113', '13120683381', '13120683381', '2016-11-16 11:06:00', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk345220161116110558295', '2016-11-16 11:06:00', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('114', '13567626866', '13567615730', '2016-11-17 17:59:58', '2016-11-17 18:02:48', '2', '2', '满意', 'kk45220161117175945796', '2016-11-17 17:59:58', '2016-11-17 18:02:48');
INSERT INTO `ke_yunxincall_record` VALUES ('115', '13567626866', '13567615730', '2016-11-17 18:01:20', '2016-11-17 18:02:48', '2', '2', null, 'kk491820161117180115956', '2016-11-17 18:01:20', '2016-11-17 18:02:48');
INSERT INTO `ke_yunxincall_record` VALUES ('116', '13567626866', '13567626866', '2016-11-17 18:23:54', '2016-11-17 18:24:06', '1', '1', '不满意', 'kk536120161117182330983', '2016-11-17 18:23:54', '2016-11-17 18:24:06');
INSERT INTO `ke_yunxincall_record` VALUES ('117', '13567626866', '15157891809', '2016-11-17 18:52:32', '2016-11-17 18:54:30', '1', '1', '棒棒哒', 'kk498720161117185227520', '2016-11-17 18:52:32', '2016-11-17 18:54:30');
INSERT INTO `ke_yunxincall_record` VALUES ('118', '13567626866', '15157891809', '2016-11-17 18:54:20', '2016-11-17 18:54:30', '1', '1', null, 'kk987220161117185416930', '2016-11-17 18:54:20', '2016-11-17 18:54:30');
INSERT INTO `ke_yunxincall_record` VALUES ('119', '15157891809', '15157891809', '2016-11-17 22:53:13', '2016-11-17 22:54:07', '1', '1', null, 'kk596720161117225244634', '2016-11-17 22:53:13', '2016-11-17 22:54:07');
INSERT INTO `ke_yunxincall_record` VALUES ('120', '18702103770', '18324373866', '2016-11-21 10:49:42', '2016-11-21 10:50:07', '1', '1', null, 'kk987020161121104940929', '2016-11-21 10:49:42', '2016-11-21 10:50:07');
INSERT INTO `ke_yunxincall_record` VALUES ('121', '18702103770', '13120683381', '2016-11-21 10:52:39', '2016-11-21 10:53:46', '2', '2', null, 'kk465720161121105236435', '2016-11-21 10:52:39', '2016-11-21 10:53:46');
INSERT INTO `ke_yunxincall_record` VALUES ('122', '13120683381', '13120683381', '2016-11-21 11:23:49', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk826920161121112346612', '2016-11-21 11:23:49', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('123', '13120683381', '13120683381', '2016-11-21 11:43:57', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk238120161121114347906', '2016-11-21 11:43:57', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('124', '13120683381', '13120683381', '2016-11-21 11:44:40', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk143520161121114434369', '2016-11-21 11:44:40', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('125', '13120683381', '13120683381', '2016-11-21 11:45:28', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk450220161121114517206', '2016-11-21 11:45:28', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('126', '13120683381', '13120683381', '2016-11-21 11:46:17', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk739020161121114607586', '2016-11-21 11:46:17', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('127', '13120683381', '13120683381', '2016-11-21 11:47:14', '2016-12-08 09:56:05', '1', '1', null, 'kk189220161121114709145', '2016-11-21 11:47:14', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('128', '13120683381', '13120683381', '2016-11-21 12:02:24', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk640220161121120221242', '2016-11-21 12:02:24', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('129', '13120683381', '13120683381', '2016-11-21 12:18:48', '2016-12-08 09:56:05', '1', '1', null, 'kk681420161121121846409', '2016-11-21 12:18:48', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('130', '13120683381', '13120683381', '2016-11-21 12:26:14', '2016-12-08 09:56:05', '1', '1', null, 'kk371820161121122608998', '2016-11-21 12:26:14', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('131', '13120683381', '13120683381', '2016-11-21 12:32:27', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk619820161121123159522', '2016-11-21 12:32:27', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('132', '13120683381', '13120683381', '2016-11-21 12:48:48', '2016-12-08 09:56:05', '1', '1', null, 'kk538420161121124842229', '2016-11-21 12:48:48', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('133', '13120683381', '13120683381', '2016-11-21 12:58:51', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk316220161121125833881', '2016-11-21 12:58:51', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('134', '13120683381', '13120683381', '2016-11-21 13:16:36', '2016-12-08 09:56:05', '1', '1', null, 'kk314520161121131520684', '2016-11-21 13:16:36', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('135', '13120683381', '13120683381', '2016-11-21 13:17:14', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk852620161121131709907', '2016-11-21 13:17:14', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('136', '13120683381', '13120683381', '2016-11-21 13:17:35', '2016-12-08 09:56:05', '1', '1', null, 'kk364820161121131730752', '2016-11-21 13:17:35', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('137', '13120683381', '13120683381', '2016-11-21 13:18:12', '2016-12-08 09:56:05', '1', '1', null, 'kk295420161121131808847', '2016-11-21 13:18:12', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('138', '13120683381', '13120683381', '2016-11-21 13:20:59', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk709820161121132056416', '2016-11-21 13:20:59', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('139', '13120683381', '13120683381', '2016-11-21 13:25:37', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk317420161121132534950', '2016-11-21 13:25:37', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('140', '13120683381', '13120683381', '2016-11-21 13:25:54', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk382420161121132552093', '2016-11-21 13:25:54', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('141', '13120683381', '13120683381', '2016-11-21 13:26:47', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk427320161121132634327', '2016-11-21 13:26:47', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('142', '18702103770', '18333333333', '2016-11-21 13:27:26', '2016-11-21 13:33:53', '1', '1', null, 'kk705320161121132720894', '2016-11-21 13:27:26', '2016-11-21 13:33:53');
INSERT INTO `ke_yunxincall_record` VALUES ('143', '18702103770', '18333333333', '2016-11-21 13:28:16', '2016-11-21 13:33:53', '1', '1', null, 'kk65420161121132811020', '2016-11-21 13:28:16', '2016-11-21 13:33:53');
INSERT INTO `ke_yunxincall_record` VALUES ('144', '13120683381', '13120683381', '2016-11-21 13:29:03', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk789320161121132859874', '2016-11-21 13:29:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('145', '13120683381', '13120683381', '2016-11-21 13:29:43', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk645120161121132940717', '2016-11-21 13:29:43', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('146', '13120683381', '13120683381', '2016-11-21 13:32:03', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk170920161121133158986', '2016-11-21 13:32:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('147', '18702103770', '18333333333', '2016-11-21 13:33:26', '2016-11-21 13:33:53', '1', '1', null, 'kk947220161121133320345', '2016-11-21 13:33:26', '2016-11-21 13:33:53');
INSERT INTO `ke_yunxincall_record` VALUES ('148', '13120683381', '13120683381', '2016-11-21 13:35:03', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk78320161121133500671', '2016-11-21 13:35:03', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('149', '13120683381', '13120683381', '2016-11-21 13:41:12', '2016-12-08 09:56:05', '1', '1', null, 'kk408620161121134110154', '2016-11-21 13:41:12', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('150', '13120683381', '13120683381', '2016-11-21 13:43:42', '2016-12-08 09:56:05', '1', '1', null, 'kk135820161121134340043', '2016-11-21 13:43:42', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('151', '13120683381', '13120683381', '2016-11-21 14:04:51', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk802620161121140445438', '2016-11-21 14:04:51', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('152', '13120683381', '13120683381', '2016-12-08 09:49:09', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk162320161208094847478', '2016-12-08 09:49:09', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('153', '13120683381', '13120683381', '2016-12-08 09:55:54', '2016-12-08 09:56:05', '1', '1', '棒棒哒', 'kk62520161208095520337', '2016-12-08 09:55:54', '2016-12-08 09:56:05');
INSERT INTO `ke_yunxincall_record` VALUES ('154', '18324373866', '18324373866', '2016-12-08 10:40:46', '2016-12-08 10:40:46', '0', '0', null, 'kk895420161208104040873', '2016-12-08 10:40:46', null);

-- ----------------------------
-- Table structure for ke_yunxinmsg_record
-- ----------------------------
DROP TABLE IF EXISTS `ke_yunxinmsg_record`;
CREATE TABLE `ke_yunxinmsg_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表序列号',
  `record_id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '记录号',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生ID',
  `teacher_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师ID',
  `toStu_time` datetime DEFAULT NULL COMMENT '给学生推送时间',
  `toTea_time` datetime DEFAULT NULL COMMENT '给老师推送时间',
  `sendFlag_stu` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生推送标记(0:未推送 1：已推送)',
  `sendFlag_tea` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '老师推送标记(0:未推送 1：已推送)',
  `hang_up` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:超时挂断 1：学生挂断 2：老师挂断',
  `create_time` datetime DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ke_yunxinmsg_record
-- ----------------------------
INSERT INTO `ke_yunxinmsg_record` VALUES ('16', 'kk432620160725181827502', '15800000000', '15197089960', null, '2016-07-25 18:18:31', '0', '0', '2', '2016-07-25 18:18:31');
INSERT INTO `ke_yunxinmsg_record` VALUES ('17', 'kk783020160725182041685', '18949176618', '15197089960', null, '2016-07-25 18:20:43', '0', '0', '2', '2016-07-25 18:20:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('18', 'kk783020160725182041685', '18949176618', '15197089960', '2016-07-25 18:22:12', '2016-07-25 18:21:22', '1', '1', '0', '2016-07-25 18:21:22');
INSERT INTO `ke_yunxinmsg_record` VALUES ('19', 'kk324720160725185418827', '18949176618', '15197089960', '2016-07-25 19:00:34', '2016-07-25 18:54:59', '1', '1', '0', '2016-07-25 18:54:59');
INSERT INTO `ke_yunxinmsg_record` VALUES ('20', 'kk507120160725201048875', '18949176618', '15197089960', null, '2016-07-25 20:11:13', '0', '0', '2', '2016-07-25 20:11:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('21', 'kk507120160725201048875', '18949176618', '15197089960', '2016-07-25 20:27:35', '2016-07-25 20:11:29', '1', '1', '0', '2016-07-25 20:11:29');
INSERT INTO `ke_yunxinmsg_record` VALUES ('22', 'kk17620160725202430005', '18949176618', '15197089960', null, '2016-07-25 20:24:42', '0', '0', '2', '2016-07-25 20:24:42');
INSERT INTO `ke_yunxinmsg_record` VALUES ('23', 'kk17620160725202430005', '18949176618', '15197089960', '2016-07-25 20:27:35', '2016-07-25 20:25:10', '1', '1', '0', '2016-07-25 20:25:10');
INSERT INTO `ke_yunxinmsg_record` VALUES ('24', 'kk659120160725203118633', '18949176618', '15197089960', null, '2016-07-25 20:31:24', '0', '0', '2', '2016-07-25 20:31:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('25', 'kk659120160725203118633', '18949176618', '15197089960', '2016-07-25 20:32:59', '2016-07-25 20:31:58', '1', '1', '0', '2016-07-25 20:31:58');
INSERT INTO `ke_yunxinmsg_record` VALUES ('26', 'kk986720160725203417141', '18949176618', '15197089960', null, '2016-07-25 20:34:24', '0', '0', '2', '2016-07-25 20:34:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('27', 'kk986720160725203417141', '18949176618', '15197089960', '2016-07-26 16:29:25', '2016-07-25 20:34:57', '1', '1', '0', '2016-07-25 20:34:57');
INSERT INTO `ke_yunxinmsg_record` VALUES ('28', 'kk843920160727115919876', '18949176618', '15197089960', null, '2016-07-27 11:59:21', '0', '0', '2', '2016-07-27 11:59:21');
INSERT INTO `ke_yunxinmsg_record` VALUES ('29', 'kk294720160727115926453', '18949176618', '15197089960', null, '2016-07-27 11:59:38', '0', '0', '2', '2016-07-27 11:59:38');
INSERT INTO `ke_yunxinmsg_record` VALUES ('30', 'kk294720160727115926453', '18949176618', '15197089960', '2016-07-27 12:01:40', '2016-07-27 12:00:07', '1', '1', '0', '2016-07-27 12:00:07');
INSERT INTO `ke_yunxinmsg_record` VALUES ('31', 'kk486720160727120023822', '18949176618', '15197089960', '2016-07-27 12:01:40', '2016-07-27 12:01:04', '1', '1', '0', '2016-07-27 12:01:04');
INSERT INTO `ke_yunxinmsg_record` VALUES ('32', 'kk348720160727120228266', '18949176618', '15197089960', null, '2016-07-27 12:03:05', '0', '0', '2', '2016-07-27 12:03:05');
INSERT INTO `ke_yunxinmsg_record` VALUES ('33', 'kk348720160727120228266', '18949176618', '15197089960', '2016-07-27 15:03:36', '2016-07-27 12:03:08', '1', '1', '0', '2016-07-27 12:03:08');
INSERT INTO `ke_yunxinmsg_record` VALUES ('34', 'kk356820160727150817944', '18949176618', '15197089960', '2016-07-27 15:12:11', '2016-07-27 15:08:58', '1', '1', '0', '2016-07-27 15:08:58');
INSERT INTO `ke_yunxinmsg_record` VALUES ('35', 'kk607520160727151221698', '18949176618', '15197089960', '2016-07-27 18:34:23', '2016-07-27 15:13:02', '1', '1', '0', '2016-07-27 15:13:02');
INSERT INTO `ke_yunxinmsg_record` VALUES ('36', 'kk710920161108184020617', '18702103770', '18324373866', '2016-11-08 18:42:55', '2016-11-08 18:41:03', '1', '1', '0', '2016-11-08 18:41:03');
INSERT INTO `ke_yunxinmsg_record` VALUES ('37', 'kk495220161108184407438', '18702103770', '18324373866', '2016-11-08 18:47:05', '2016-11-08 18:44:56', '1', '1', '0', '2016-11-08 18:44:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('38', 'kk407520161109101534116', '18702103770', '18324373866', null, '2016-11-09 10:15:46', '0', '0', '2', '2016-11-09 10:15:46');
INSERT INTO `ke_yunxinmsg_record` VALUES ('39', 'kk268120161109101554256', '18702103770', '18324373866', null, '2016-11-09 10:15:57', '0', '0', '2', '2016-11-09 10:15:57');
INSERT INTO `ke_yunxinmsg_record` VALUES ('40', 'kk538020161109101559575', '18702103770', '18324373866', null, '2016-11-09 10:16:12', '0', '0', '2', '2016-11-09 10:16:12');
INSERT INTO `ke_yunxinmsg_record` VALUES ('41', 'kk538020161109101559575', '18702103770', '18324373866', '2016-11-09 10:31:34', '2016-11-09 10:16:39', '1', '1', '0', '2016-11-09 10:16:39');
INSERT INTO `ke_yunxinmsg_record` VALUES ('42', 'kk49220161109101629133', '18702103770', '18324373866', null, '2016-11-09 10:16:46', '0', '0', '2', '2016-11-09 10:16:46');
INSERT INTO `ke_yunxinmsg_record` VALUES ('43', 'kk49220161109101629133', '18702103770', '18324373866', '2016-11-09 10:31:34', '2016-11-09 10:17:09', '1', '1', '0', '2016-11-09 10:17:09');
INSERT INTO `ke_yunxinmsg_record` VALUES ('44', 'kk453220161109101755904', '18702103770', '18324373866', '2016-11-09 10:31:34', '2016-11-09 10:18:36', '1', '1', '0', '2016-11-09 10:18:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('45', 'kk521020161109102110582', '18702103770', '18324373866', '2016-11-09 10:31:34', '2016-11-09 10:21:51', '1', '1', '0', '2016-11-09 10:21:51');
INSERT INTO `ke_yunxinmsg_record` VALUES ('46', 'kk862420161109110918871', '18702103770', '18324373866', '2016-11-09 11:14:10', '2016-11-09 11:10:16', '1', '1', '0', '2016-11-09 11:10:16');
INSERT INTO `ke_yunxinmsg_record` VALUES ('47', 'kk742620161109122759490', '18702103770', '18324373866', '2016-11-09 12:34:13', '2016-11-09 12:28:40', '1', '1', '0', '2016-11-09 12:28:40');
INSERT INTO `ke_yunxinmsg_record` VALUES ('48', 'kk71620161110131437088', '13120683381', '18324373866', '2016-11-10 13:39:10', '2016-11-10 13:15:17', '1', '1', '0', '2016-11-10 13:15:17');
INSERT INTO `ke_yunxinmsg_record` VALUES ('49', 'kk634120161110131214369', '13120683381', '13120683381', null, '2016-11-10 13:16:33', '0', '0', '2', '2016-11-10 13:16:33');
INSERT INTO `ke_yunxinmsg_record` VALUES ('50', 'kk758320161110131156808', '13120683381', '13120683381', null, '2016-11-10 13:16:34', '0', '0', '2', '2016-11-10 13:16:34');
INSERT INTO `ke_yunxinmsg_record` VALUES ('51', 'kk375220161110133015661', '18324373866', '13120683381', '2016-11-10 13:36:28', '2016-11-10 13:30:56', '1', '1', '0', '2016-11-10 13:30:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('52', 'kk207520161110135410323', '13120683381', '18324373866', '2016-11-10 13:56:59', '2016-11-10 13:54:50', '1', '1', '0', '2016-11-10 13:54:50');
INSERT INTO `ke_yunxinmsg_record` VALUES ('53', 'kk896120161110135507194', '13120683381', '18324373866', '2016-11-10 13:56:59', '2016-11-10 13:55:47', '1', '1', '0', '2016-11-10 13:55:47');
INSERT INTO `ke_yunxinmsg_record` VALUES ('54', 'kk234820161110172651547', '13120683381', '18324373866', null, '2016-11-10 17:27:01', '0', '0', '2', '2016-11-10 17:27:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('55', 'kk673120161110172709164', '13120683381', '18324373866', null, '2016-11-10 17:27:13', '0', '0', '2', '2016-11-10 17:27:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('56', 'kk956120161110172717763', '13120683381', '18324373866', null, '2016-11-10 17:27:20', '0', '0', '2', '2016-11-10 17:27:20');
INSERT INTO `ke_yunxinmsg_record` VALUES ('57', 'kk208420161110172725315', '13120683381', '18324373866', null, '2016-11-10 17:27:34', '0', '0', '2', '2016-11-10 17:27:34');
INSERT INTO `ke_yunxinmsg_record` VALUES ('58', 'kk971820161110172844012', '13120683381', '18324373866', null, '2016-11-10 17:28:46', '0', '0', '2', '2016-11-10 17:28:46');
INSERT INTO `ke_yunxinmsg_record` VALUES ('59', 'kk876120161110172848845', '13120683381', '18324373866', null, '2016-11-10 17:28:55', '0', '0', '2', '2016-11-10 17:28:55');
INSERT INTO `ke_yunxinmsg_record` VALUES ('60', 'kk635420161110172856301', '13120683381', '18324373866', null, '2016-11-10 17:28:57', '0', '0', '2', '2016-11-10 17:28:57');
INSERT INTO `ke_yunxinmsg_record` VALUES ('61', 'kk719320161110172920323', '13120683381', '18324373866', '2016-11-10 17:32:26', '2016-11-10 17:30:00', '1', '1', '0', '2016-11-10 17:30:00');
INSERT INTO `ke_yunxinmsg_record` VALUES ('62', 'kk901520161110173155954', '13120683381', '18324373866', null, '2016-11-10 17:32:05', '0', '0', '2', '2016-11-10 17:32:05');
INSERT INTO `ke_yunxinmsg_record` VALUES ('63', 'kk901520161110173155954', '13120683381', '18324373866', '2016-11-10 17:33:05', '2016-11-10 17:32:36', '1', '1', '0', '2016-11-10 17:32:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('64', 'kk659820161110173307907', '13120683381', '18324373866', null, '2016-11-10 17:33:22', '0', '0', '2', '2016-11-10 17:33:22');
INSERT INTO `ke_yunxinmsg_record` VALUES ('65', 'kk580320161110173327150', '13120683381', '18324373866', null, '2016-11-10 17:33:43', '0', '0', '2', '2016-11-10 17:33:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('66', 'kk580320161110173327150', '13120683381', '18324373866', '2016-11-10 17:35:57', '2016-11-10 17:34:07', '1', '1', '0', '2016-11-10 17:34:07');
INSERT INTO `ke_yunxinmsg_record` VALUES ('67', 'kk182420161110173617409', '13120683381', '18324373866', null, '2016-11-10 17:36:34', '0', '0', '2', '2016-11-10 17:36:34');
INSERT INTO `ke_yunxinmsg_record` VALUES ('68', 'kk182420161110173617409', '13120683381', '18324373866', '2016-11-10 17:37:43', '2016-11-10 17:36:59', '1', '1', '0', '2016-11-10 17:36:59');
INSERT INTO `ke_yunxinmsg_record` VALUES ('69', 'kk891420161110174004061', '13120683381', '18324373866', null, '2016-11-10 17:40:36', '0', '0', '2', '2016-11-10 17:40:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('70', 'kk891420161110174004061', '13120683381', '18324373866', '2016-11-10 17:45:05', '2016-11-10 17:40:44', '1', '1', '0', '2016-11-10 17:40:44');
INSERT INTO `ke_yunxinmsg_record` VALUES ('71', 'kk730820161111094313654', '13120683381', '18324373866', '2016-11-11 09:56:28', '2016-11-11 09:48:45', '1', '1', '0', '2016-11-11 09:48:45');
INSERT INTO `ke_yunxinmsg_record` VALUES ('72', 'kk647520161111095056910', '13120683381', '18324373866', null, '2016-11-11 09:51:01', '0', '0', '2', '2016-11-11 09:51:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('73', 'kk570620161111095630375', '13120683381', '18324373866', null, '2016-11-11 09:56:36', '0', '0', '2', '2016-11-11 09:56:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('74', 'kk547020161111100404364', '13120683381', '18324373866', null, '2016-11-11 10:04:14', '0', '0', '2', '2016-11-11 10:04:14');
INSERT INTO `ke_yunxinmsg_record` VALUES ('75', 'kk695020161111100539352', '13120683381', '13120683381', null, '2016-11-11 10:05:56', '0', '0', '2', '2016-11-11 10:05:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('76', 'kk695020161111100539352', '13120683381', '13120683381', '2016-11-11 10:06:59', '2016-11-11 10:06:20', '1', '1', '0', '2016-11-11 10:06:20');
INSERT INTO `ke_yunxinmsg_record` VALUES ('77', 'kk691520161111101837419', '13120683381', '13120683381', null, '2016-11-11 10:18:39', '0', '0', '2', '2016-11-11 10:18:39');
INSERT INTO `ke_yunxinmsg_record` VALUES ('78', 'kk869120161111101844278', '13120683381', '13120683381', null, '2016-11-11 10:18:46', '0', '0', '2', '2016-11-11 10:18:46');
INSERT INTO `ke_yunxinmsg_record` VALUES ('79', 'kk569720161111101900320', '13120683381', 'nil', null, '2016-11-11 10:19:03', '0', '0', '2', '2016-11-11 10:19:03');
INSERT INTO `ke_yunxinmsg_record` VALUES ('80', 'kk289520161111102414242', '13120683381', '13120683381', null, '2016-11-11 10:24:24', '0', '0', '2', '2016-11-11 10:24:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('81', 'kk58620161111102453506', '13120683381', '13120683381', null, '2016-11-11 10:25:03', '0', '0', '2', '2016-11-11 10:25:03');
INSERT INTO `ke_yunxinmsg_record` VALUES ('82', 'kk795820161111102700009', '13120683381', '13120683381', null, '2016-11-11 10:27:02', '0', '0', '2', '2016-11-11 10:27:02');
INSERT INTO `ke_yunxinmsg_record` VALUES ('83', 'kk930420161111102714899', '13120683381', '13120683381', null, '2016-11-11 10:27:23', '0', '0', '2', '2016-11-11 10:27:23');
INSERT INTO `ke_yunxinmsg_record` VALUES ('84', 'kk926820161111102729437', '13120683381', '13120683381', null, '2016-11-11 10:27:32', '0', '0', '2', '2016-11-11 10:27:32');
INSERT INTO `ke_yunxinmsg_record` VALUES ('85', 'kk761020161111103201590', '13120683381', '13120683381', null, '2016-11-11 10:32:05', '0', '0', '2', '2016-11-11 10:32:05');
INSERT INTO `ke_yunxinmsg_record` VALUES ('86', 'kk834020161111103245996', '13120683381', '13120683381', null, '2016-11-11 10:32:49', '0', '0', '2', '2016-11-11 10:32:49');
INSERT INTO `ke_yunxinmsg_record` VALUES ('87', 'kk290120161111103802279', '13120683381', '13120683381', null, '2016-11-11 10:38:06', '0', '0', '2', '2016-11-11 10:38:06');
INSERT INTO `ke_yunxinmsg_record` VALUES ('88', 'kk603220161111103814929', '13120683381', '13120683381', null, '2016-11-11 10:38:18', '0', '0', '2', '2016-11-11 10:38:18');
INSERT INTO `ke_yunxinmsg_record` VALUES ('89', 'kk981320161111103841002', '13120683381', '13120683381', null, '2016-11-11 10:38:42', '0', '0', '2', '2016-11-11 10:38:42');
INSERT INTO `ke_yunxinmsg_record` VALUES ('90', 'kk742820161111105715171', '13120683381', '13120683381', null, '2016-11-11 10:57:24', '0', '0', '2', '2016-11-11 10:57:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('91', 'kk934120161111105823241', '13120683381', '13120683381', null, '2016-11-11 10:58:26', '0', '0', '2', '2016-11-11 10:58:26');
INSERT INTO `ke_yunxinmsg_record` VALUES ('92', 'kk236420161111125847433', '13120683381', '13120683381', null, '2016-11-11 12:58:51', '0', '0', '2', '2016-11-11 12:58:51');
INSERT INTO `ke_yunxinmsg_record` VALUES ('93', 'kk961720161111132239160', '13120683381', '13120683381', null, '2016-11-11 13:22:43', '0', '0', '2', '2016-11-11 13:22:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('94', 'kk716820161111132338996', '13120683381', '13120683381', null, '2016-11-11 13:24:38', '0', '0', '2', '2016-11-11 13:24:38');
INSERT INTO `ke_yunxinmsg_record` VALUES ('95', 'kk831720161111132411684', '13120683381', '13120683381', null, '2016-11-11 13:24:41', '0', '0', '2', '2016-11-11 13:24:41');
INSERT INTO `ke_yunxinmsg_record` VALUES ('96', 'kk953120161111132433678', '13120683381', '13120683381', null, '2016-11-11 13:24:45', '0', '0', '2', '2016-11-11 13:24:45');
INSERT INTO `ke_yunxinmsg_record` VALUES ('97', 'kk596120161111132453451', '13120683381', '13120683381', null, '2016-11-11 13:25:19', '0', '0', '2', '2016-11-11 13:25:19');
INSERT INTO `ke_yunxinmsg_record` VALUES ('98', 'kk513620161111132526653', '13120683381', '13120683381', null, '2016-11-11 13:25:37', '0', '0', '2', '2016-11-11 13:25:37');
INSERT INTO `ke_yunxinmsg_record` VALUES ('99', 'kk194620161111161419135', '13120683381', '13120683381', null, '2016-11-11 16:14:21', '0', '0', '2', '2016-11-11 16:14:21');
INSERT INTO `ke_yunxinmsg_record` VALUES ('100', 'kk782020161111161429713', '13120683381', '13120683381', null, '2016-11-11 16:14:33', '0', '0', '2', '2016-11-11 16:14:33');
INSERT INTO `ke_yunxinmsg_record` VALUES ('101', 'kk816020161111162326619', '13120683381', '13120683381', null, '2016-11-11 16:23:31', '0', '0', '2', '2016-11-11 16:23:31');
INSERT INTO `ke_yunxinmsg_record` VALUES ('102', 'kk351220161111163348085', '13120683381', '13120683381', null, '2016-11-11 16:33:50', '0', '0', '2', '2016-11-11 16:33:50');
INSERT INTO `ke_yunxinmsg_record` VALUES ('103', 'kk943720161111164834163', '13120683381', '13120683381', null, '2016-11-11 16:48:58', '0', '0', '2', '2016-11-11 16:48:58');
INSERT INTO `ke_yunxinmsg_record` VALUES ('104', 'kk769020161111164848849', '13120683381', '13120683381', null, '2016-11-11 16:49:14', '0', '0', '2', '2016-11-11 16:49:14');
INSERT INTO `ke_yunxinmsg_record` VALUES ('105', 'kk635820161111165652278', '13120683381', '13120683381', null, '2016-11-11 16:56:54', '0', '0', '2', '2016-11-11 16:56:54');
INSERT INTO `ke_yunxinmsg_record` VALUES ('106', 'kk732520161111165739096', '13120683381', '13120683381', null, '2016-11-11 16:58:01', '0', '0', '2', '2016-11-11 16:58:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('107', 'kk345720161111165822100', '13120683381', '13120683381', null, '2016-11-11 16:59:04', '0', '0', '2', '2016-11-11 16:59:04');
INSERT INTO `ke_yunxinmsg_record` VALUES ('108', 'kk873020161111170039727', '13120683381', '13120683381', null, '2016-11-11 17:00:43', '0', '0', '2', '2016-11-11 17:00:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('109', 'kk519820161111171011454', '13120683381', '13120683381', null, '2016-11-11 17:10:14', '0', '0', '2', '2016-11-11 17:10:14');
INSERT INTO `ke_yunxinmsg_record` VALUES ('110', 'kk203820161114113129553', '18324373866', '18324373866', null, '2016-11-14 11:31:35', '0', '0', '2', '2016-11-14 11:31:35');
INSERT INTO `ke_yunxinmsg_record` VALUES ('111', 'kk413520161114113240252', '18324373866', '18324373866', null, '2016-11-14 11:32:43', '0', '0', '2', '2016-11-14 11:32:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('112', 'kk853920161114113253938', '18324373866', '18324373866', '2016-11-14 11:35:23', '2016-11-14 11:33:34', '1', '1', '0', '2016-11-14 11:33:34');
INSERT INTO `ke_yunxinmsg_record` VALUES ('113', 'kk428020161114145127788', '18324373866', '18324373866', '2016-11-14 15:24:00', '2016-11-14 14:52:08', '1', '1', '0', '2016-11-14 14:52:08');
INSERT INTO `ke_yunxinmsg_record` VALUES ('114', 'kk639520161114161137743', '13120683381', '18324373866', '2016-11-14 16:23:03', '2016-11-14 16:12:18', '1', '1', '0', '2016-11-14 16:12:18');
INSERT INTO `ke_yunxinmsg_record` VALUES ('115', 'kk813020161114161321139', '13120683381', '18333333333', null, '2016-11-14 16:13:29', '0', '0', '2', '2016-11-14 16:13:29');
INSERT INTO `ke_yunxinmsg_record` VALUES ('116', 'kk385220161114194813554', '13567626866', '13567626866', '2016-11-14 19:49:12', '2016-11-14 19:48:54', '1', '1', '0', '2016-11-14 19:48:54');
INSERT INTO `ke_yunxinmsg_record` VALUES ('117', 'kk318920161114204117660', '13567626866', '13567626866', '2016-11-15 14:58:37', '2016-11-14 20:41:58', '1', '1', '0', '2016-11-14 20:41:58');
INSERT INTO `ke_yunxinmsg_record` VALUES ('118', 'kk839620161114204207755', '13567626866', '13567626866', '2016-11-15 14:58:37', '2016-11-14 20:42:48', '1', '1', '0', '2016-11-14 20:42:48');
INSERT INTO `ke_yunxinmsg_record` VALUES ('119', 'kk417520161114204303777', '13567626866', '13567626866', '2016-11-15 14:58:37', '2016-11-14 20:43:44', '1', '1', '0', '2016-11-14 20:43:44');
INSERT INTO `ke_yunxinmsg_record` VALUES ('120', 'kk98620161115110751364', '18702103770', '13120683381', '2016-11-15 13:57:57', '2016-11-15 11:08:31', '1', '1', '0', '2016-11-15 11:08:31');
INSERT INTO `ke_yunxinmsg_record` VALUES ('121', 'kk516820161115110858049', '18702103770', '18333333333', null, '2016-11-15 11:09:00', '0', '0', '2', '2016-11-15 11:09:00');
INSERT INTO `ke_yunxinmsg_record` VALUES ('122', 'kk348020161115110904843', '18702103770', '18333333333', null, '2016-11-15 11:09:12', '0', '0', '2', '2016-11-15 11:09:12');
INSERT INTO `ke_yunxinmsg_record` VALUES ('123', 'kk348020161115110904843', '18702103770', '18333333333', '2016-11-15 13:57:57', '2016-11-15 11:09:45', '1', '1', '0', '2016-11-15 11:09:45');
INSERT INTO `ke_yunxinmsg_record` VALUES ('124', 'kk604820161115145808514', '13567626866', '13567626866', '2016-11-15 15:00:09', '2016-11-15 14:58:49', '1', '1', '0', '2016-11-15 14:58:49');
INSERT INTO `ke_yunxinmsg_record` VALUES ('125', 'kk680220161115173557900', '13120683381', '13120683381', null, '2016-11-15 17:36:00', '0', '0', '2', '2016-11-15 17:36:00');
INSERT INTO `ke_yunxinmsg_record` VALUES ('126', 'kk143620161115174135863', '13120683381', '13120683381', null, '2016-11-15 17:41:38', '0', '0', '2', '2016-11-15 17:41:38');
INSERT INTO `ke_yunxinmsg_record` VALUES ('127', 'kk194720161115181119135', '13120683381', '13120683381', null, '2016-11-15 18:12:39', '0', '0', '2', '2016-11-15 18:12:39');
INSERT INTO `ke_yunxinmsg_record` VALUES ('128', 'kk342920161115190233460', '13567626866', '13567626866', '2016-11-15 19:52:13', '2016-11-15 19:03:13', '1', '1', '0', '2016-11-15 19:03:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('129', 'kk395720161115192621420', '13567626866', '13567626866', '2016-11-15 19:52:13', '2016-11-15 19:27:01', '1', '1', '0', '2016-11-15 19:27:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('130', 'kk52720161115192811918', '13567626866', '13567615730', null, '2016-11-15 19:30:19', '0', '0', '2', '2016-11-15 19:30:19');
INSERT INTO `ke_yunxinmsg_record` VALUES ('131', 'kk902320161115192756213', '13567626866', '13567615730', null, '2016-11-15 19:30:21', '0', '0', '2', '2016-11-15 19:30:21');
INSERT INTO `ke_yunxinmsg_record` VALUES ('132', 'kk650220161116093035031', '18702103770', '18333333333', '2016-11-16 09:31:17', '2016-11-16 09:31:15', '1', '1', '0', '2016-11-16 09:31:15');
INSERT INTO `ke_yunxinmsg_record` VALUES ('133', 'kk543920161116093826639', '18324373866', '18333333333', null, '2016-11-16 09:38:28', '0', '0', '2', '2016-11-16 09:38:28');
INSERT INTO `ke_yunxinmsg_record` VALUES ('134', 'kk751820161116093845156', '18324373866', '18333333333', '2016-11-16 09:40:38', '2016-11-16 09:39:25', '1', '1', '0', '2016-11-16 09:39:25');
INSERT INTO `ke_yunxinmsg_record` VALUES ('135', 'kk235920161116094013593', '18324373866', '18333333333', null, '2016-11-16 09:40:39', '0', '0', '2', '2016-11-16 09:40:39');
INSERT INTO `ke_yunxinmsg_record` VALUES ('136', 'kk235920161116094013593', '18324373866', '18333333333', '2016-11-16 09:41:34', '2016-11-16 09:40:53', '1', '1', '0', '2016-11-16 09:40:53');
INSERT INTO `ke_yunxinmsg_record` VALUES ('137', 'kk12620161116094259353', '18324373866', '18333333333', null, '2016-11-16 09:43:01', '0', '0', '2', '2016-11-16 09:43:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('138', 'kk582720161116103309696', '13120683381', '13120683381', null, '2016-11-16 10:33:13', '0', '0', '2', '2016-11-16 10:33:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('139', 'kk590820161116132716361', '18324373866', '18333333333', null, '2016-11-16 13:27:19', '0', '0', '2', '2016-11-16 13:27:19');
INSERT INTO `ke_yunxinmsg_record` VALUES ('140', 'kk329520161116132722518', '18324373866', '18333333333', '2016-11-16 13:28:07', '2016-11-16 13:28:03', '1', '1', '0', '2016-11-16 13:28:03');
INSERT INTO `ke_yunxinmsg_record` VALUES ('141', 'kk457820161116132815549', '18324373866', '18333333333', null, '2016-11-16 13:28:17', '0', '0', '2', '2016-11-16 13:28:17');
INSERT INTO `ke_yunxinmsg_record` VALUES ('142', 'kk938420161116132820832', '18324373866', '18333333333', '2016-11-16 13:29:09', '2016-11-16 13:29:01', '1', '1', '0', '2016-11-16 13:29:01');
INSERT INTO `ke_yunxinmsg_record` VALUES ('143', 'kk250920161116132904623', '18324373866', '18333333333', null, '2016-11-16 13:29:10', '0', '0', '2', '2016-11-16 13:29:10');
INSERT INTO `ke_yunxinmsg_record` VALUES ('144', 'kk250920161116132904623', '18324373866', '18333333333', '2016-11-16 13:37:55', '2016-11-16 13:29:46', '1', '1', '0', '2016-11-16 13:29:46');
INSERT INTO `ke_yunxinmsg_record` VALUES ('145', 'kk568220161116133423215', '18324373866', '18333333333', '2016-11-16 13:37:55', '2016-11-16 13:35:05', '1', '1', '0', '2016-11-16 13:35:05');
INSERT INTO `ke_yunxinmsg_record` VALUES ('146', 'kk957420161116133738748', '18324373866', '18333333333', null, '2016-11-16 13:37:56', '0', '0', '2', '2016-11-16 13:37:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('147', 'kk269420161116133807963', '18324373866', '18333333333', null, '2016-11-16 13:38:27', '0', '0', '2', '2016-11-16 13:38:27');
INSERT INTO `ke_yunxinmsg_record` VALUES ('148', 'kk269420161116133807963', '18324373866', '18333333333', '2016-11-16 13:39:14', '2016-11-16 13:38:48', '1', '1', '0', '2016-11-16 13:38:48');
INSERT INTO `ke_yunxinmsg_record` VALUES ('149', 'kk378420161116133902526', '18324373866', '18333333333', null, '2016-11-16 13:39:16', '0', '0', '2', '2016-11-16 13:39:16');
INSERT INTO `ke_yunxinmsg_record` VALUES ('150', 'kk378420161116133902526', '18324373866', '18333333333', '2016-11-16 13:55:40', '2016-11-16 13:39:43', '1', '1', '0', '2016-11-16 13:39:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('151', 'kk984320161116135606211', '18324373866', '18333333333', null, '2016-11-16 13:56:20', '0', '0', '2', '2016-11-16 13:56:20');
INSERT INTO `ke_yunxinmsg_record` VALUES ('152', 'kk927320161116135551552', '18324373866', '18333333333', null, '2016-11-16 13:56:21', '0', '0', '2', '2016-11-16 13:56:21');
INSERT INTO `ke_yunxinmsg_record` VALUES ('153', 'kk356120161116135643266', '18324373866', '18333333333', null, '2016-11-16 13:56:54', '0', '0', '2', '2016-11-16 13:56:54');
INSERT INTO `ke_yunxinmsg_record` VALUES ('154', 'kk356120161116135643266', '18324373866', '18333333333', '2016-11-16 13:57:47', '2016-11-16 13:57:23', '1', '1', '0', '2016-11-16 13:57:23');
INSERT INTO `ke_yunxinmsg_record` VALUES ('155', 'kk743920161116135738439', '18324373866', '18333333333', null, '2016-11-16 13:57:47', '0', '0', '2', '2016-11-16 13:57:47');
INSERT INTO `ke_yunxinmsg_record` VALUES ('156', 'kk743920161116135738439', '18324373866', '18333333333', '2016-11-16 15:29:24', '2016-11-16 13:58:19', '1', '1', '0', '2016-11-16 13:58:19');
INSERT INTO `ke_yunxinmsg_record` VALUES ('157', 'kk34920161116144154954', '18324373866', '18333333333', '2016-11-16 15:29:24', '2016-11-16 14:42:36', '1', '1', '0', '2016-11-16 14:42:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('158', 'kk527020161116145253490', '18324373866', '18333333333', '2016-11-16 15:29:24', '2016-11-16 14:53:35', '1', '1', '0', '2016-11-16 14:53:35');
INSERT INTO `ke_yunxinmsg_record` VALUES ('159', 'kk25820161116145645881', '18324373866', '18333333333', '2016-11-16 15:29:24', '2016-11-16 14:57:26', '1', '1', '0', '2016-11-16 14:57:26');
INSERT INTO `ke_yunxinmsg_record` VALUES ('160', 'kk738420161117175419011', '13567626866', '13567626866', '2016-11-17 17:57:36', '2016-11-17 17:54:59', '1', '1', '0', '2016-11-17 17:54:59');
INSERT INTO `ke_yunxinmsg_record` VALUES ('161', 'kk87920161117175504990', '13567626866', '13567626866', '2016-11-17 17:57:36', '2016-11-17 17:55:45', '1', '1', '0', '2016-11-17 17:55:45');
INSERT INTO `ke_yunxinmsg_record` VALUES ('162', 'kk726820161117175637410', '13567626866', '13567626866', '2016-11-17 17:57:36', '2016-11-17 17:57:17', '1', '1', '0', '2016-11-17 17:57:17');
INSERT INTO `ke_yunxinmsg_record` VALUES ('163', 'kk798520161117175826435', '13567626866', '13567615730', '2016-11-17 17:59:20', '2016-11-17 17:59:06', '1', '1', '0', '2016-11-17 17:59:06');
INSERT INTO `ke_yunxinmsg_record` VALUES ('164', 'kk538920161117180659240', '13567626866', '13567615730', '2016-11-17 18:17:11', '2016-11-17 18:07:40', '1', '1', '0', '2016-11-17 18:07:40');
INSERT INTO `ke_yunxinmsg_record` VALUES ('165', 'kk273120161117190332494', '13567626866', '13567615730', null, '2016-11-17 19:03:42', '0', '0', '2', '2016-11-17 19:03:42');
INSERT INTO `ke_yunxinmsg_record` VALUES ('166', 'kk932820161117190354385', '13567626866', '13567615730', null, '2016-11-17 19:04:27', '0', '0', '2', '2016-11-17 19:04:27');
INSERT INTO `ke_yunxinmsg_record` VALUES ('167', 'kk418220161117224012809', '15157891809', '15157891809', '2016-11-17 22:43:26', '2016-11-17 22:40:53', '1', '1', '0', '2016-11-17 22:40:53');
INSERT INTO `ke_yunxinmsg_record` VALUES ('168', 'kk501420161118090639842', '15157891809', '15157891809', null, '2016-11-18 09:07:12', '0', '0', '2', '2016-11-18 09:07:12');
INSERT INTO `ke_yunxinmsg_record` VALUES ('169', 'kk501420161118090639842', '15157891809', '15157891809', null, '2016-11-18 09:07:20', '0', '1', '0', '2016-11-18 09:07:20');
INSERT INTO `ke_yunxinmsg_record` VALUES ('170', 'kk102520161121123310683', '13120683381', '13120683381', null, '2016-11-21 12:33:17', '0', '0', '2', '2016-11-21 12:33:17');
INSERT INTO `ke_yunxinmsg_record` VALUES ('171', 'kk538420161121124842229', '13120683381', '13120683381', '2016-11-21 12:51:08', '2016-11-21 12:49:23', '1', '1', '0', '2016-11-21 12:49:23');
INSERT INTO `ke_yunxinmsg_record` VALUES ('172', 'kk36220161121131404486', '13120683381', '13120683381', null, '2016-11-21 13:16:26', '0', '0', '2', '2016-11-21 13:16:26');
INSERT INTO `ke_yunxinmsg_record` VALUES ('173', 'kk412820161121131633118', '13120683381', '13120683381', null, '2016-11-21 13:16:44', '0', '0', '2', '2016-11-21 13:16:44');
INSERT INTO `ke_yunxinmsg_record` VALUES ('174', 'kk874620161121131701498', '13120683381', '13120683381', null, '2016-11-21 13:17:06', '0', '0', '2', '2016-11-21 13:17:06');
INSERT INTO `ke_yunxinmsg_record` VALUES ('175', 'kk648920161121132437497', '13120683381', '13120683381', null, '2016-11-21 13:24:42', '0', '0', '2', '2016-11-21 13:24:42');
INSERT INTO `ke_yunxinmsg_record` VALUES ('176', 'kk648320161121140617050', '13120683381', '13120683381', null, '2016-11-21 14:06:19', '0', '0', '2', '2016-11-21 14:06:19');
INSERT INTO `ke_yunxinmsg_record` VALUES ('177', 'kk413720161125164043915', '18324373866', '18333333333', '2016-12-08 09:53:37', '2016-11-25 16:41:24', '1', '1', '0', '2016-11-25 16:41:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('178', 'kk492020161208093232491', '18324373866', '18333333333', '2016-12-08 09:53:37', '2016-12-08 09:33:13', '1', '1', '0', '2016-12-08 09:33:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('179', 'kk879320161208093457255', '18324373866', '18333333333', '2016-12-08 09:53:37', '2016-12-08 09:35:40', '1', '1', '0', '2016-12-08 09:35:40');
INSERT INTO `ke_yunxinmsg_record` VALUES ('180', 'kk608120161208094515291', '18324373866', '18324373866', '2016-12-08 09:53:37', '2016-12-08 09:45:56', '1', '1', '0', '2016-12-08 09:45:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('181', 'kk450320161208094956586', '18324373866', '18324373866', null, '2016-12-08 09:50:33', '0', '0', '2', '2016-12-08 09:50:33');
INSERT INTO `ke_yunxinmsg_record` VALUES ('182', 'kk450320161208094956586', '18324373866', '18324373866', '2016-12-08 09:53:37', '2016-12-08 09:50:36', '1', '1', '0', '2016-12-08 09:50:36');
INSERT INTO `ke_yunxinmsg_record` VALUES ('183', 'kk421820161208095038789', '18324373866', '18324373866', null, '2016-12-08 09:50:42', '0', '0', '2', '2016-12-08 09:50:42');
INSERT INTO `ke_yunxinmsg_record` VALUES ('184', 'kk731820161208095044531', '18324373866', '18324373866', '2016-12-08 09:53:37', '2016-12-08 09:51:24', '1', '1', '0', '2016-12-08 09:51:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('185', 'kk851220161208095145278', '18324373866', '18324373866', null, '2016-12-08 09:51:49', '0', '0', '2', '2016-12-08 09:51:49');
INSERT INTO `ke_yunxinmsg_record` VALUES ('186', 'kk851220161208095145278', '18324373866', '18324373866', '2016-12-08 09:53:37', '2016-12-08 09:52:26', '1', '1', '0', '2016-12-08 09:52:26');
INSERT INTO `ke_yunxinmsg_record` VALUES ('187', 'kk276820161208095348420', '18324373866', '18324373866', null, '2016-12-08 09:53:52', '0', '0', '2', '2016-12-08 09:53:52');
INSERT INTO `ke_yunxinmsg_record` VALUES ('188', 'kk209120161208095354524', '18324373866', '18324373866', null, '2016-12-08 09:53:56', '0', '0', '2', '2016-12-08 09:53:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('189', 'kk912820161208095415068', '18324373866', '18324373866', null, '2016-12-08 09:54:17', '0', '0', '2', '2016-12-08 09:54:17');
INSERT INTO `ke_yunxinmsg_record` VALUES ('190', 'kk752420161208095439703', '18324373866', '18324373866', null, '2016-12-08 09:55:15', '0', '0', '2', '2016-12-08 09:55:15');
INSERT INTO `ke_yunxinmsg_record` VALUES ('191', 'kk978420161208095557103', '18324373866', '18324373866', null, '2016-12-08 09:56:06', '0', '0', '2', '2016-12-08 09:56:06');
INSERT INTO `ke_yunxinmsg_record` VALUES ('192', 'kk734220161208095608750', '18324373866', '18324373866', null, '2016-12-08 09:56:10', '0', '0', '2', '2016-12-08 09:56:10');
INSERT INTO `ke_yunxinmsg_record` VALUES ('193', 'kk503820161208095615201', '18324373866', '18324373866', null, '2016-12-08 09:56:24', '0', '0', '2', '2016-12-08 09:56:24');
INSERT INTO `ke_yunxinmsg_record` VALUES ('194', 'kk503820161208095615201', '18324373866', '18324373866', '2016-12-08 10:37:41', '2016-12-08 09:56:55', '1', '1', '0', '2016-12-08 09:56:55');
INSERT INTO `ke_yunxinmsg_record` VALUES ('195', 'kk94120161208103729340', '18324373866', '18324373866', null, '2016-12-08 10:37:32', '0', '0', '2', '2016-12-08 10:37:32');
INSERT INTO `ke_yunxinmsg_record` VALUES ('196', 'kk137620161208103735794', '18324373866', '18324373866', null, '2016-12-08 10:37:38', '0', '0', '2', '2016-12-08 10:37:38');
INSERT INTO `ke_yunxinmsg_record` VALUES ('197', 'kk128520161208103746211', '18324373866', '18324373866', null, '2016-12-08 10:37:56', '0', '0', '2', '2016-12-08 10:37:56');
INSERT INTO `ke_yunxinmsg_record` VALUES ('198', 'kk468720161208103802451', '18324373866', '18324373866', '2016-12-08 10:53:05', '2016-12-08 10:38:43', '1', '1', '0', '2016-12-08 10:38:43');
INSERT INTO `ke_yunxinmsg_record` VALUES ('199', 'kk63920161208103932859', '18324373866', '18324373866', '2016-12-08 10:53:05', '2016-12-08 10:40:13', '1', '1', '0', '2016-12-08 10:40:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('200', 'kk518220161208104100682', '18324373866', '18324373866', null, '2016-12-08 10:41:04', '0', '0', '2', '2016-12-08 10:41:04');
INSERT INTO `ke_yunxinmsg_record` VALUES ('201', 'kk654820161208104107342', '18324373866', '18324373866', null, '2016-12-08 10:41:10', '0', '0', '2', '2016-12-08 10:41:10');
INSERT INTO `ke_yunxinmsg_record` VALUES ('202', 'kk697520161208104133146', '18324373866', '18324373866', null, '2016-12-08 10:41:54', '0', '0', '2', '2016-12-08 10:41:54');
INSERT INTO `ke_yunxinmsg_record` VALUES ('203', 'kk758220161208104238402', '18324373866', '18324373866', null, '2016-12-08 10:42:44', '0', '0', '2', '2016-12-08 10:42:44');
INSERT INTO `ke_yunxinmsg_record` VALUES ('204', 'kk640520161208104233286', '13120683381', '13120683381', '2016-12-08 10:45:54', '2016-12-08 10:43:13', '1', '1', '0', '2016-12-08 10:43:13');
INSERT INTO `ke_yunxinmsg_record` VALUES ('205', 'kk143820161208104247838', '18324373866', '18324373866', '2016-12-08 10:53:05', '2016-12-08 10:43:28', '1', '1', '0', '2016-12-08 10:43:28');
INSERT INTO `ke_yunxinmsg_record` VALUES ('206', 'kk451920161208104440929', '18324373866', '18324373866', null, '2016-12-08 10:45:16', '0', '0', '2', '2016-12-08 10:45:16');
INSERT INTO `ke_yunxinmsg_record` VALUES ('207', 'kk451920161208104440929', '18324373866', '18324373866', '2016-12-08 10:53:05', '2016-12-08 10:45:21', '1', '1', '0', '2016-12-08 10:45:21');
INSERT INTO `ke_yunxinmsg_record` VALUES ('208', 'kk264720161208104523667', '13120683381', '13120683381', null, '2016-12-08 10:45:40', '0', '0', '2', '2016-12-08 10:45:40');
INSERT INTO `ke_yunxinmsg_record` VALUES ('209', 'kk670120161208104632228', '13120683381', '13120683381', null, '2016-12-08 10:46:59', '0', '0', '2', '2016-12-08 10:46:59');
INSERT INTO `ke_yunxinmsg_record` VALUES ('210', 'kk41520161208105246829', '13120683381', '13120683381', null, '2016-12-08 10:52:52', '0', '0', '2', '2016-12-08 10:52:52');
INSERT INTO `ke_yunxinmsg_record` VALUES ('211', 'kk580920161208105309554', '18324373866', '18324373866', '2017-03-02 14:49:44', '2016-12-08 10:53:50', '1', '1', '0', '2016-12-08 10:53:50');
