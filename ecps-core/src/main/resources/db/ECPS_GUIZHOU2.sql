----------------------------------------------------
-- Export file for user ECPS_GUIZHOU              --
-- Created by Administrator on 2013-7-5, 16:00:23 --
----------------------------------------------------

spool ECPS_GUIZHOU2.log

prompt
prompt Creating table CRM_ITF_LOG
prompt ==========================
prompt
create table CRM_ITF_LOG
(
  LOG_ID          NUMBER(11) not null,
  INTERFACE_NAME  VARCHAR2(50),
  PARAM_INPUT     VARCHAR2(2000),
  PARAM_OUTPUT    VARCHAR2(2000),
  START_TIME      TIMESTAMP(6),
  END_TIME        TIMESTAMP(6),
  START_TIME_LONG NUMBER(20),
  END_TIME_LONG   NUMBER(20),
  COST_TIME       NUMBER(20),
  NOTE_INFO       VARCHAR2(2000),
  PROCESS_INFO    VARCHAR2(2000)
)
;
comment on column CRM_ITF_LOG.LOG_ID
  is '日志主见';
comment on column CRM_ITF_LOG.INTERFACE_NAME
  is '接口名称';
comment on column CRM_ITF_LOG.PARAM_INPUT
  is '输入参数';
comment on column CRM_ITF_LOG.PARAM_OUTPUT
  is '输出参数';
comment on column CRM_ITF_LOG.START_TIME
  is '接口开始执行时长';
comment on column CRM_ITF_LOG.END_TIME
  is '接口结束执行时间';
comment on column CRM_ITF_LOG.START_TIME_LONG
  is '接口开始执行时间ms格式';
comment on column CRM_ITF_LOG.END_TIME_LONG
  is '接口结束执行时间ms格式';
comment on column CRM_ITF_LOG.COST_TIME
  is '接口执行花费时间ms格式';
comment on column CRM_ITF_LOG.NOTE_INFO
  is '日志信息包括错误日志';
comment on column CRM_ITF_LOG.PROCESS_INFO
  is '接口处理步骤';
alter table CRM_ITF_LOG
  add constraint LOG_ID primary key (LOG_ID);

prompt
prompt Creating table EB_ADVERTISEMENT
prompt ===============================
prompt
create table EB_ADVERTISEMENT
(
  AD_ID           NUMBER(11) not null,
  AD_NAME         VARCHAR2(80),
  AD_DESCRIPTION  VARCHAR2(1000),
  AD_TYPE         NUMBER(1),
  AD_WORDS        VARCHAR2(1000),
  AD_IMG          VARCHAR2(500),
  AD_PICTURES     VARCHAR2(2000),
  AD_FLASH        VARCHAR2(2000),
  AD_CAROUSELTIME NUMBER(5),
  AD_STATUS       NUMBER(1),
  AD_LINK         VARCHAR2(200),
  CREATOR         NUMBER(11),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6)
)
;
alter table EB_ADVERTISEMENT
  add constraint PK_EB_ADVERTISEMENT primary key (AD_ID);

prompt
prompt Creating table EB_AD_LOCATION
prompt =============================
prompt
create table EB_AD_LOCATION
(
  LOCATION_ID           NUMBER(11) not null,
  LOCATION_NAME         VARCHAR2(80),
  LOCATION_DESCRIPTIONS VARCHAR2(1000),
  LOCATION_WIDTH        NUMBER(5),
  LOCATION_HIGH         NUMBER(5),
  LOCATION_CODE         VARCHAR2(3000),
  CREATOR               NUMBER(11),
  CREATE_TIME           TIMESTAMP(6),
  UPDATE_TIME           TIMESTAMP(6)
)
;
alter table EB_AD_LOCATION
  add constraint PK_EB_AD_LOCATION primary key (LOCATION_ID);

prompt
prompt Creating table EB_AD_LOCATION_LINK
prompt ==================================
prompt
create table EB_AD_LOCATION_LINK
(
  AD_ID       NUMBER(11) not null,
  LOCATION_ID NUMBER(11) not null,
  STATUS      NUMBER(1)
)
;
alter table EB_AD_LOCATION_LINK
  add constraint PK_EB_AD_LOCATION_LINK primary key (AD_ID, LOCATION_ID);

prompt
prompt Creating table EB_ATT_CONFIG
prompt ============================
prompt
create table EB_ATT_CONFIG
(
  ATT_ID                  NUMBER(1) not null,
  ATT_SIZE                NUMBER(10),
  ATT_TYPE                VARCHAR2(200),
  ATT_MARK_PIC_MODE       NUMBER(1),
  ATT_MARK_CHAR_MODE      NUMBER(1),
  ATT_MARK_PIC_PATH       VARCHAR2(100),
  ATT_MARK_PIC_QUALITY    NUMBER(10),
  ATT_MARK_PIC_ALPHA      NUMBER(10),
  ATT_MARK_PIC_SIZE_WIDTH NUMBER(10),
  ATT_MARK_PIC_SIZE_HEIGH NUMBER(10),
  ATT_MARK_CHAR_CONTENT   VARCHAR2(20),
  ATT_MARK_CHAR_SIZE      NUMBER(10),
  ATT_MARK_CHAR_COLOR     VARCHAR2(10),
  ATT_MARK_POSITION       NUMBER(2),
  ATT_CUT_PIC_MIN_WIDTH   NUMBER(10),
  ATT_CUT_PIC_MIN_HEIGH   NUMBER(10)
)
;
comment on table EB_ATT_CONFIG
  is '附件配置表，源自PMS v4';
comment on column EB_ATT_CONFIG.ATT_ID
  is '序号';
comment on column EB_ATT_CONFIG.ATT_SIZE
  is '允许后台上传附件大小';
comment on column EB_ATT_CONFIG.ATT_TYPE
  is '允许后台上传附件类型';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_MODE
  is '是否开启图片水印';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_MODE
  is '是否开启文字水印';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_PATH
  is '图片路径';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_QUALITY
  is '图片质量';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_ALPHA
  is '水印透明度';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_SIZE_WIDTH
  is '图片尺寸控制：宽';
comment on column EB_ATT_CONFIG.ATT_MARK_PIC_SIZE_HEIGH
  is '图片尺寸控制：高';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_CONTENT
  is '文字内容';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_SIZE
  is '文字大小';
comment on column EB_ATT_CONFIG.ATT_MARK_CHAR_COLOR
  is '文字颜色';
comment on column EB_ATT_CONFIG.ATT_MARK_POSITION
  is '水印位置';
comment on column EB_ATT_CONFIG.ATT_CUT_PIC_MIN_WIDTH
  is '图片最小裁剪大小：宽';
comment on column EB_ATT_CONFIG.ATT_CUT_PIC_MIN_HEIGH
  is '图片最小裁剪大小：高';
alter table EB_ATT_CONFIG
  add constraint PK_EB_ATTACHMENT_CONFIG primary key (ATT_ID);

prompt
prompt Creating table EB_BACKLANDLOG
prompt =============================
prompt
create table EB_BACKLANDLOG
(
  LANDLOG_ID         NUMBER(11) not null,
  LANDLOG_USER_NAME  VARCHAR2(40),
  LANDLOG_TIME       TIMESTAMP(6),
  LANDLOG_IP_ADDRESS VARCHAR2(50)
)
;
comment on table EB_BACKLANDLOG
  is '登录日志表';
comment on column EB_BACKLANDLOG.LANDLOG_ID
  is '序号';
comment on column EB_BACKLANDLOG.LANDLOG_USER_NAME
  is '用户名';
comment on column EB_BACKLANDLOG.LANDLOG_TIME
  is '登录时间';
comment on column EB_BACKLANDLOG.LANDLOG_IP_ADDRESS
  is 'IP地址';
alter table EB_BACKLANDLOG
  add constraint PK_EB_BACKLANDLOG primary key (LANDLOG_ID);

prompt
prompt Creating table EB_BRAND
prompt =======================
prompt
create table EB_BRAND
(
  BRAND_ID   NUMBER(11) not null,
  BRAND_NAME VARCHAR2(80) not null,
  BRAND_DESC VARCHAR2(1200),
  IMGS       VARCHAR2(100),
  WEBSITE    VARCHAR2(240),
  BRAND_SORT NUMBER(5)
)
;
comment on table EB_BRAND
  is '品牌';
comment on column EB_BRAND.BRAND_ID
  is '品牌主键';
comment on column EB_BRAND.BRAND_NAME
  is '品牌名称：一般为该字段在前台显示的中文名称，也可含有英文或数字';
comment on column EB_BRAND.BRAND_DESC
  is '品牌描述';
comment on column EB_BRAND.IMGS
  is '品牌图标：存储图标地址';
comment on column EB_BRAND.WEBSITE
  is '品牌网址';
comment on column EB_BRAND.BRAND_SORT
  is '前台显示排序';
alter table EB_BRAND
  add constraint PK_EB_BRAND primary key (BRAND_ID);

prompt
prompt Creating table EB_BUSINESS_SCOPE
prompt ================================
prompt
create table EB_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID   NUMBER(3) not null,
  BUSINESS_SCOPE_NAME VARCHAR2(32) not null,
  IS_ENABLED          NUMBER(1) default 0
)
;
comment on table EB_BUSINESS_SCOPE
  is '运营范围表';
comment on column EB_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '运营范围主键';
comment on column EB_BUSINESS_SCOPE.BUSINESS_SCOPE_NAME
  is '运营范围名称';
comment on column EB_BUSINESS_SCOPE.IS_ENABLED
  is '0-未启用，1-启用';
alter table EB_BUSINESS_SCOPE
  add constraint PK_EB_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID);

prompt
prompt Creating table EB_CART_SKU
prompt ==========================
prompt
create table EB_CART_SKU
(
  CART_SKU_ID      NUMBER(11) not null,
  PTL_USER_ID      NUMBER(11),
  ITEM_ID          NUMBER(11),
  ITEM_NAME        VARCHAR2(400),
  SKU_ID           NUMBER(11),
  SKU              VARCHAR2(80),
  SKU_NAME         VARCHAR2(500),
  SKU_SPEC         VARCHAR2(1000),
  MARKET_PRICE     NUMBER(20,2),
  OFFER_GROUP_ID   NUMBER(11),
  OFFER_GROUP_NAME VARCHAR2(200),
  OFFER_TYPE       NUMBER(2),
  SHORT_NAME       VARCHAR2(80),
  OFFER_NAME       VARCHAR2(800),
  SHORT_NAME2      VARCHAR2(50),
  PRICE            NUMBER(20,2),
  QUANTITY         NUMBER(5),
  ITEM_NO          VARCHAR2(120)
)
;
comment on table EB_CART_SKU
  is '购物车内SKU';
comment on column EB_CART_SKU.CART_SKU_ID
  is '购物车内SKU主键';
comment on column EB_CART_SKU.PTL_USER_ID
  is '前台用户主键';
comment on column EB_CART_SKU.ITEM_ID
  is '商品主键';
comment on column EB_CART_SKU.ITEM_NAME
  is '商品名称';
comment on column EB_CART_SKU.SKU
  is '货号';
comment on column EB_CART_SKU.SKU_NAME
  is 'SKU名称';
comment on column EB_CART_SKU.SKU_SPEC
  is '规格1：规格2：规格3。。。规格N，格式参见订单需求文档';
comment on column EB_CART_SKU.MARKET_PRICE
  is '(以分币为单位)市场价：所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_CART_SKU.OFFER_GROUP_NAME
  is '活动名称';
comment on column EB_CART_SKU.OFFER_TYPE
  is '活动类型：1：购物送礼；2：优惠购机；3：购机返话费';
comment on column EB_CART_SKU.SHORT_NAME
  is '活动简称。用字母代表，如A1中的A';
comment on column EB_CART_SKU.OFFER_NAME
  is '活动档次简介';
comment on column EB_CART_SKU.SHORT_NAME2
  is '活动档次数字编号，如A1中的1';
comment on column EB_CART_SKU.PRICE
  is '(以分币为单位)购买时价格、预存话费。';
alter table EB_CART_SKU
  add constraint PK_EB_CART_SKU primary key (CART_SKU_ID);

prompt
prompt Creating table EB_CAT
prompt =====================
prompt
create table EB_CAT
(
  CAT_ID    NUMBER(11) not null,
  CAT_NAME  VARCHAR2(80) not null,
  CAT_DESC  VARCHAR2(80),
  PARENT_ID NUMBER(11) default 0,
  CAT_SORT  NUMBER(5),
  KEYWORDS  VARCHAR2(80),
  PATH      VARCHAR2(200),
  MARK      VARCHAR2(80),
  ISDISPLAY NUMBER(5),
  FULL_PATH VARCHAR2(200),
  CAT_TYPE  NUMBER(5)
)
;
comment on table EB_CAT
  is '商品类目。
1. 电商一期只支持两种商品，即手机和号卡。促销活动作为一种规则配置到上述两种商品上。二期会增加虚拟商品，如话费包、资费包
';
comment on column EB_CAT.CAT_ID
  is '类目主键。商品本身并不记录自己所属的商品种类（即：是属于手机还是号卡），而是通过其所属的类目来确定。就是说，系统的类目会初始化两种顶级类目：一种是手机（CAT_ID号是1），另一种是号卡（CAT_ID号是2）。系统需要根据商品所属的类目的ID号，来判断该商品是手机还是号卡。注意，商品类目表的CAT_ID号3至99是预留给系统将来的顶级类目的，顶级类目下面的二级类目CAT_ID从100开始编号（需要修改ORACLE的SEQUENCE）。编辑商品时，在手机类目中的所添加的商品，不可以更改到号卡类目中，反之亦然。';
comment on column EB_CAT.CAT_NAME
  is '类目名称';
comment on column EB_CAT.CAT_DESC
  is '类目描述';
comment on column EB_CAT.PARENT_ID
  is '父类目CAT_ID。0表示顶级类目，没有父类目。';
comment on column EB_CAT.CAT_SORT
  is '前台显示排序';
comment on column EB_CAT.KEYWORDS
  is '关键词';
comment on column EB_CAT.PATH
  is '静态化访问路径';
comment on column EB_CAT.MARK
  is '分类标识：该分类的唯一标识，用于分类路径和模板标识，如用于生成前台静态页面，例如手机分类的标识为"SHOUJI",则置成HTTP://127.0.0.1/SHOUJI';
comment on column EB_CAT.ISDISPLAY
  is '是否前台显示';
comment on column EB_CAT.FULL_PATH
  is '静态化面包屑导航全路径。如手机顶级分类的FULL_PATH是"/1/"';
comment on column EB_CAT.CAT_TYPE
  is '0、不分类；1、实体；2、号卡；3、虚拟商品';
alter table EB_CAT
  add constraint PK_EB_CAT primary key (CAT_ID);

prompt
prompt Creating table EB_CATBRAND
prompt ==========================
prompt
create table EB_CATBRAND
(
  CAT_ID   NUMBER(11) not null,
  BRAND_ID NUMBER(11) not null
)
;
alter table EB_CATBRAND
  add constraint PK_EB_CATBRAND primary key (CAT_ID, BRAND_ID);

prompt
prompt Creating table EB_CITY_AREA
prompt ===========================
prompt
create table EB_CITY_AREA
(
  AREA_ID   NUMBER(11) not null,
  AREA_NAME VARCHAR2(50),
  AREA_CODE VARCHAR2(50)
)
;
comment on column EB_CITY_AREA.AREA_NAME
  is '市区名称';
comment on column EB_CITY_AREA.AREA_CODE
  is '市区代码';
alter table EB_CITY_AREA
  add constraint PK_EB_CITY_AREA primary key (AREA_ID);

prompt
prompt Creating table EB_CITY_GROUPON
prompt ==============================
prompt
create table EB_CITY_GROUPON
(
  SERIAL_NO  NUMBER(11) not null,
  AREA_ID    NUMBER(11),
  GROUPON_ID NUMBER(11)
)
;
alter table EB_CITY_GROUPON
  add constraint PK_EB_CITY_GROUPON primary key (SERIAL_NO);

prompt
prompt Creating table EB_CONFIG_FTP
prompt ============================
prompt
create table EB_CONFIG_FTP
(
  SERIAL_NO    NUMBER(11) not null,
  PURPOSE      NUMBER(3),
  FTP_HOST     VARCHAR2(100),
  FTP_PORT     NUMBER(7),
  FTP_USERNAME VARCHAR2(100),
  FTP_PASSWORD VARCHAR2(100),
  BASE_DIR     VARCHAR2(100),
  AUTO_START   NUMBER(1)
)
;
comment on table EB_CONFIG_FTP
  is '1.发布之后文件同步的ftp；';
comment on column EB_CONFIG_FTP.SERIAL_NO
  is '序列号，主键';
comment on column EB_CONFIG_FTP.PURPOSE
  is '用途：1-静态化之后同步文件的目标ftp；';
comment on column EB_CONFIG_FTP.FTP_HOST
  is 'ftp服务地址';
comment on column EB_CONFIG_FTP.FTP_PORT
  is 'ftp服务端口';
comment on column EB_CONFIG_FTP.FTP_USERNAME
  is 'ftp用户名';
comment on column EB_CONFIG_FTP.FTP_PASSWORD
  is 'ftp密码';
comment on column EB_CONFIG_FTP.BASE_DIR
  is 'FTP根目录';
comment on column EB_CONFIG_FTP.AUTO_START
  is '是否自动开始：0-不自动开始；1-自动开始';
alter table EB_CONFIG_FTP
  add constraint PK_EB_CONFIG_FTP primary key (SERIAL_NO);

prompt
prompt Creating table EB_CONSOLE_LOG
prompt =============================
prompt
create table EB_CONSOLE_LOG
(
  CONSOLE_LOG_ID NUMBER(11) not null,
  ENTITY_NAME    VARCHAR2(50),
  ENTITY_ID      NUMBER(11),
  USER_ID        NUMBER(11),
  OP_TYPE        VARCHAR2(50),
  OP_TIME        TIMESTAMP(6),
  NOTES          VARCHAR2(200),
  TABLE_NAME     VARCHAR2(100)
)
;
comment on table EB_CONSOLE_LOG
  is '后台操作日志';
comment on column EB_CONSOLE_LOG.CONSOLE_LOG_ID
  is '后台操作日志主键';
comment on column EB_CONSOLE_LOG.ENTITY_NAME
  is '操作实体的名称（数据库表的中文名字）';
comment on column EB_CONSOLE_LOG.ENTITY_ID
  is '操作实体的数据库记录主键';
comment on column EB_CONSOLE_LOG.USER_ID
  is '操作者ID';
comment on column EB_CONSOLE_LOG.OP_TYPE
  is '操作类型';
comment on column EB_CONSOLE_LOG.OP_TIME
  is '操作时间';
comment on column EB_CONSOLE_LOG.NOTES
  is '备注';
comment on column EB_CONSOLE_LOG.TABLE_NAME
  is '操作的数据库表名';
alter table EB_CONSOLE_LOG
  add constraint PK_EB_CONSOLE_LOG primary key (CONSOLE_LOG_ID);

prompt
prompt Creating table EB_CONSTR
prompt ========================
prompt
create table EB_CONSTR
(
  CONSTR_ID      NUMBER(11) not null,
  OFFER_GROUP_ID NUMBER(11),
  CONSTR_NAME    VARCHAR2(50)
)
;
comment on table EB_CONSTR
  is '约束条件(购买要求)，用于限制什么样的客户才能参加促销活动。
适用品牌：三个多选条件，默认全选。1：全球通；2：动感地带；3：神州行';
comment on column EB_CONSTR.CONSTR_ID
  is '约束条件主键';
comment on column EB_CONSTR.CONSTR_NAME
  is '约束条件名称，1、全球通；2、神州行；3、动感地带（数字可能有变化）';
alter table EB_CONSTR
  add constraint PK_EB_CONSTR primary key (CONSTR_ID);

prompt
prompt Creating table EB_CUSTOMER_SERVICES
prompt ===================================
prompt
create table EB_CUSTOMER_SERVICES
(
  CS_ID      NUMBER(11) not null,
  AREA_ID    NUMBER(11),
  REGION_ID  NUMBER(11),
  CS_CODE    VARCHAR2(200),
  CS_NAME    VARCHAR2(200),
  CS_ADDRESS VARCHAR2(1000)
)
;
alter table EB_CUSTOMER_SERVICES
  add constraint PK_EB_CUSTOMER_SERVICES primary key (CS_ID);

prompt
prompt Creating table EB_DISTRI
prompt ========================
prompt
create table EB_DISTRI
(
  DISTRI_ID      NUMBER(11) not null,
  USER_ID        NUMBER(11),
  DISTRI_NAME    VARCHAR2(80),
  FKA            VARCHAR2(80),
  LEGAL_REP      VARCHAR2(80),
  REG_CAP        VARCHAR2(40),
  CORP_TYPE      NUMBER(2),
  BIZ_SCOPE      VARCHAR2(400),
  LICENSE_NO     VARCHAR2(120),
  ESTABLISH_DATE TIMESTAMP(6),
  CONTACT        VARCHAR2(80),
  MOBILE         VARCHAR2(50),
  FIXED_PHONE    VARCHAR2(80),
  FAX            VARCHAR2(80),
  EMAIL          VARCHAR2(120),
  WEBSITE        VARCHAR2(120),
  ADDRESS        VARCHAR2(80),
  ZIP            VARCHAR2(40),
  BANK_NAME      VARCHAR2(40),
  BANK_NO        VARCHAR2(60),
  BANK_ACCOUNT   VARCHAR2(80),
  TAX_NO         VARCHAR2(80),
  DISTRI_AREA    VARCHAR2(400),
  NOT_DELIVERY   VARCHAR2(800),
  BRANCH_NUM     NUMBER(10),
  EMPLOYEE_NUM   NUMBER(10),
  CHARGE_STD     VARCHAR2(400),
  ATTACHMENT     VARCHAR2(200),
  IS_RECYCLED    NUMBER(1) default 0,
  IS_ACTIVE      NUMBER(1),
  FEATURED_SVR   VARCHAR2(500),
  CREATED_TIME   TIMESTAMP(6)
)
;
comment on table EB_DISTRI
  is '配送商';
comment on column EB_DISTRI.USER_ID
  is '后台用户主键';
comment on column EB_DISTRI.DISTRI_NAME
  is '配送商名称';
comment on column EB_DISTRI.FKA
  is '配送商曾用名，Formerly Known As';
comment on column EB_DISTRI.LEGAL_REP
  is '法人代表';
comment on column EB_DISTRI.REG_CAP
  is '注册资本，中文表示10个字符以内';
comment on column EB_DISTRI.CORP_TYPE
  is '企业类型，1国有企业, 2集体企业, 3私营企业, 4联营企业, 5有限责任公司, 6股份有限公司, 7股份合作企业, 8其他企业, 9港、澳、台商投资企业, 10 外商投资企业责任; 6.股份有限; 7.股份合作; 8.其他（事业单位、社会团体、民办非企业）';
comment on column EB_DISTRI.BIZ_SCOPE
  is '经营范围';
comment on column EB_DISTRI.LICENSE_NO
  is '营业执照号';
comment on column EB_DISTRI.ESTABLISH_DATE
  is '创立日期';
comment on column EB_DISTRI.CONTACT
  is '联系人';
comment on column EB_DISTRI.MOBILE
  is '移动电话，11位数字';
comment on column EB_DISTRI.FIXED_PHONE
  is '固定电话号码';
comment on column EB_DISTRI.FAX
  is '传真号码';
comment on column EB_DISTRI.EMAIL
  is '电子邮件';
comment on column EB_DISTRI.WEBSITE
  is '网址';
comment on column EB_DISTRI.ADDRESS
  is '地址';
comment on column EB_DISTRI.ZIP
  is '邮编';
comment on column EB_DISTRI.BANK_NAME
  is '开户银行';
comment on column EB_DISTRI.BANK_NO
  is '开户银行编号';
comment on column EB_DISTRI.BANK_ACCOUNT
  is '银行账号';
comment on column EB_DISTRI.TAX_NO
  is '纳税号';
comment on column EB_DISTRI.DISTRI_AREA
  is '配送区域';
comment on column EB_DISTRI.NOT_DELIVERY
  is '不配送货品';
comment on column EB_DISTRI.BRANCH_NUM
  is '配送站点数';
comment on column EB_DISTRI.EMPLOYEE_NUM
  is '配送人员数';
comment on column EB_DISTRI.CHARGE_STD
  is '资费标准';
comment on column EB_DISTRI.ATTACHMENT
  is '上传文件存储位置，格式：Word、pdf、zip、rar、压缩包';
comment on column EB_DISTRI.IS_RECYCLED
  is '是否进入回收站。0：否；1：是';
comment on column EB_DISTRI.IS_ACTIVE
  is '是否启用。0：否；1：是';
comment on column EB_DISTRI.FEATURED_SVR
  is '特色服务';
comment on column EB_DISTRI.CREATED_TIME
  is '记录创建时间';
alter table EB_DISTRI
  add constraint PK_EB_DISTRI primary key (DISTRI_ID);

prompt
prompt Creating table EB_FEATURE
prompt =========================
prompt
create table EB_FEATURE
(
  FEATURE_ID    NUMBER(11) not null,
  CAT_ID        NUMBER(11),
  FEATURE_NAME  VARCHAR2(80) not null,
  IS_SPEC       NUMBER(1),
  IS_SELECT     NUMBER(1),
  IS_SHOW       NUMBER(1),
  SELECT_VALUES VARCHAR2(800),
  INPUT_TYPE    NUMBER(2),
  FEATURE_SORT  NUMBER(5)
)
;
comment on table EB_FEATURE
  is '商品属性
预置的手机参数（请将预置可选值补充完整）
1.      型号                   字符串
2.      外观                   下拉列表；预置可选值：直板、翻盖、滑盖、旋盖
3.      操作系统                   下拉列表；预置可选值：Symbian、WindowsMobile、Android, iOS、其他智能系统、非智能系统
4.      操作方式                   下拉列表；预置可选值：电容触屏、电阻触屏、全键盘、标准键盘
5.      内存                   字符串
6.      储存卡              字符串
7.      屏幕分辨率              字符串
8.      摄像头              字符串
9.      连接方式                   复选框；预置可选值： WIFI、蓝牙、红外，默认都不勾选
10.   机身尺寸                   字符串
11.   重量                   字符串     默认以KG为单位
12.   特性                   字符串

预置的手机规格（请将预置可选值补充完整）
1.      颜色                   下拉列表；预置可选值：白色、黑色
2.      存储量              下拉列表；预置可选值：16G、32G
预置的号卡参数
1. 号段
2. 号码规律，可选值：AAAA、ABCDE、AAA、ABCD、ABCABC、ABABAB、AABB
3. 其他条件，可选值：含一个8、含两个8、不含4、含1314、含520、含00
';
comment on column EB_FEATURE.FEATURE_ID
  is '商品属性主键';
comment on column EB_FEATURE.FEATURE_NAME
  is '属性名称';
comment on column EB_FEATURE.IS_SPEC
  is '是否为规格：0.为否 1.为是';
comment on column EB_FEATURE.IS_SELECT
  is '是否为筛选：0为否 1为是';
comment on column EB_FEATURE.IS_SHOW
  is '是否前台显示：0.为否 1.为是';
comment on column EB_FEATURE.SELECT_VALUES
  is '属性可选值：用英文逗号分割的可选值，可选值里不许有逗号';
comment on column EB_FEATURE.INPUT_TYPE
  is '录入方式：1.树状菜单，2.单选，3.复选，4.文本框';
comment on column EB_FEATURE.FEATURE_SORT
  is '前台显示排序';
alter table EB_FEATURE
  add constraint PK_EB_FEATURE primary key (FEATURE_ID);

prompt
prompt Creating table EB_GROUPON
prompt =========================
prompt
create table EB_GROUPON
(
  GROUPON_ID    NUMBER(11) not null,
  ACTIVITY_TYPE NUMBER(3),
  GROUPON_TITLE VARCHAR2(3000),
  GROUPON_IMG   VARCHAR2(600),
  GIFT_INFO     VARCHAR2(3000),
  GROUPON_ORDER NUMBER(10),
  NOTICE_ORDER  NUMBER(10),
  SALES         NUMBER(10),
  VIRTUAL_SALES NUMBER(10),
  START_TIME    TIMESTAMP(6),
  END_TIME      TIMESTAMP(6),
  IS_RECOMMEND  NUMBER(1),
  IS_DELETE     NUMBER(1)
)
;
comment on column EB_GROUPON.ACTIVITY_TYPE
  is '0-手机团购';
comment on column EB_GROUPON.IS_RECOMMEND
  is '0-不推荐；1-首页推荐；';
alter table EB_GROUPON
  add constraint PK_EB_GROUPON primary key (GROUPON_ID);

prompt
prompt Creating table EB_GROUPON_INFO
prompt ==============================
prompt
create table EB_GROUPON_INFO
(
  GROUPON_ID NUMBER(11) not null,
  INFO       CLOB
)
;
alter table EB_GROUPON_INFO
  add constraint PK_EB_GROUPON_INFO primary key (GROUPON_ID);

prompt
prompt Creating table EB_GROUPON_SKU
prompt =============================
prompt
create table EB_GROUPON_SKU
(
  GROUPON_ID      NUMBER(11),
  SKU_ID          NUMBER(11),
  GROUPON_PRICE   NUMBER(20,2),
  ORDER_NO        NUMBER(10),
  SKU_UPPER_LIMIT NUMBER(11)
)
;
comment on column EB_GROUPON_SKU.SKU_ID
  is '最小销售单元主键';
comment on column EB_GROUPON_SKU.SKU_UPPER_LIMIT
  is '团购SKU购买上限';

prompt
prompt Creating table EB_ITEM
prompt ======================
prompt
create table EB_ITEM
(
  ITEM_ID                NUMBER(11) not null,
  ITEM_NAME              VARCHAR2(400) not null,
  ITEM_NO                VARCHAR2(120) not null,
  BRAND_ID               NUMBER(11),
  CAT_ID                 NUMBER(11) not null,
  TAG_IMG_ID             NUMBER(11),
  TAG_IMG                NUMBER(1),
  IS_NEW                 NUMBER(1),
  IS_GOOD                NUMBER(1),
  IS_HOT                 NUMBER(1),
  PROMOTION              VARCHAR2(200),
  AUDIT_STATUS           NUMBER(2),
  SHOW_STATUS            NUMBER(2),
  IMGS                   VARCHAR2(3000),
  KEYWORDS               VARCHAR2(120),
  PAGE_DESC              VARCHAR2(640),
  ITEM_RECYCLE           NUMBER(2) default 0,
  ON_SALE_TIME           TIMESTAMP(6),
  CHECK_TIME             TIMESTAMP(6),
  UPDATE_TIME            TIMESTAMP(6),
  UPDATE_USER_ID         NUMBER(11),
  CREATE_TIME            TIMESTAMP(6),
  CHECKER_USER_ID        NUMBER(11),
  FULL_PATH_DEPLOY       VARCHAR2(600),
  FULL_PATH_DEPLOY_OFFER VARCHAR2(600),
  ORIGINAL_ITEM_ID       NUMBER(11),
  LAST_STATUS            NUMBER(1),
  MERCHANT_ID            NUMBER(11),
  ITEM_SORT              NUMBER(10),
  SALES                  NUMBER(10),
  CREATE_USER_ID         NUMBER(11),
  SIM_LEVEL              NUMBER(1),
  GIFT_DESC              VARCHAR2(200),
  GIFT_IMG               VARCHAR2(600),
  GIFT_SHOW_TYPE         VARCHAR2(100),
  IMG_SIZE1              VARCHAR2(1000)
)
;
comment on table EB_ITEM
  is '商品，包含手机和号卡，通过在类目表中预置的手机类目和号卡类目来区分。裸机：手机机体，不包含任何通信服务和绑定的费用的机器，运营商不限制使用特定手机卡的手机，可根据用户的条件来选择购买。号卡：又称为移动电话SIM卡，由11位数字组成，与套餐绑定，运营商通过号卡确认客户信息，并通常提供移动通信各种服务。
TODO:';
comment on column EB_ITEM.ITEM_ID
  is '商品主键';
comment on column EB_ITEM.ITEM_NAME
  is '商品名称、号卡卡号：文档标题可用作seo相关的title字段。提供重复标题检测功能,不允许本分类添加重复的商品，可以输入特殊字符';
comment on column EB_ITEM.ITEM_NO
  is '商品编号：自动生成，不可重复，添加完成后不可修改。编号规则：一级目录数字“1”+7位数递增，裸机起始编号   10000001。7位数递增满时自动升为8位数。
编号根据EB_ITEM.CAT_TYPE获得，如实体商品为1（EB_ITEM.CAT_TYPE=1）
（删除
--实体起始编号：   10000001 虚拟起始编号：   20000001。
--注意：商品是否为手机或号卡，用其所属的类目来区分，CAT_ID为1的为手机，CAT_ID为2的为号卡。）
';
comment on column EB_ITEM.BRAND_ID
  is '商品品牌：树状菜单，单选。显示关联本分类的品牌。';
comment on column EB_ITEM.CAT_ID
  is '商品分类：树状菜单，单选，不可修改';
comment on column EB_ITEM.TAG_IMG_ID
  is '商品标签图片id';
comment on column EB_ITEM.TAG_IMG
  is '已废弃，请使用ITEM_TAG_IMG_ID指定标签图片。
标签图片：1.独家;2.推荐;3.惊爆价。可不选或单选，叠加在前台商品图片上，多用于促销';
comment on column EB_ITEM.IS_NEW
  is '0否，1是，默认1';
comment on column EB_ITEM.IS_GOOD
  is '0否，1是，默认0';
comment on column EB_ITEM.IS_HOT
  is '0否，1是，默认0';
comment on column EB_ITEM.PROMOTION
  is '促销语：用于前台显示、关键词搜索';
comment on column EB_ITEM.AUDIT_STATUS
  is '实体商品审核状态(号卡没有审核)：0：待审核；1：审核通过；2：审核未通过；';
comment on column EB_ITEM.SHOW_STATUS
  is '上下架状态：0.为上架 1.为下架';
comment on column EB_ITEM.IMGS
  is '上传图片：最多5张图片的存储地址，用分隔符分开。可增加上传图片，具备删除和设置排序功能，最多只能上传五张图片，图片上传后共保存5个尺寸（原始尺寸，缩放生成4个尺寸 50x50 、 100x100 、 150x150、300x300），各尺寸提供前台页面调用。
每张图片上传之后的图片重命名规则为：上传用户ID+日期时间（精确到秒）+6位英文数字随机码,  根据图片格式存放在不同的文件夹，方便未来扩展。
每张图片大小遵循“系统设置”对附件上传大小的限制。一期默认图片格式支持jpg、gif、png(3个格式不区分大小写)，大小不超过3MB，水印功能一期不开发，图片裁剪功能一期不开发';
comment on column EB_ITEM.KEYWORDS
  is '页面关键词';
comment on column EB_ITEM.PAGE_DESC
  is '页面描述：文本区';
comment on column EB_ITEM.ITEM_RECYCLE
  is '是否删除：0：未删除；1：已经删除；默认值：0';
comment on column EB_ITEM.ON_SALE_TIME
  is '上架时间';
comment on column EB_ITEM.FULL_PATH_DEPLOY
  is '未参加活动的商品的静态化页面的发布路径（存相对路径）';
comment on column EB_ITEM.FULL_PATH_DEPLOY_OFFER
  is '参加活动的商品的静态化页面的发布路径';
comment on column EB_ITEM.LAST_STATUS
  is '0是历史记录;1最新';
comment on column EB_ITEM.SIM_LEVEL
  is '号码靓度：单选框，1.超级靓号、2.普通靓号、3.普通号';
comment on column EB_ITEM.GIFT_DESC
  is '赠品描述';
comment on column EB_ITEM.GIFT_IMG
  is '赠品图片';
comment on column EB_ITEM.GIFT_SHOW_TYPE
  is '赠品显示类型';
alter table EB_ITEM
  add constraint PK_EB_ITEM primary key (ITEM_ID);

prompt
prompt Creating table EB_ITEM_BUSINESS_SCOPE
prompt =====================================
prompt
create table EB_ITEM_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID NUMBER(3) not null,
  ITEM_ID           NUMBER(11) not null
)
;
comment on column EB_ITEM_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '运营范围主键';
comment on column EB_ITEM_BUSINESS_SCOPE.ITEM_ID
  is '商品主键';
alter table EB_ITEM_BUSINESS_SCOPE
  add constraint EB_ITEM_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID, ITEM_ID);

prompt
prompt Creating table EB_ITEM_CLOB
prompt ===========================
prompt
create table EB_ITEM_CLOB
(
  ITEM_ID      NUMBER(11) not null,
  ITEM_DESC    CLOB,
  PACKING_LIST CLOB
)
;
comment on column EB_ITEM_CLOB.ITEM_DESC
  is '商品描述：富文本编辑器；可以输入特殊字符，需转义；无字符限制';
comment on column EB_ITEM_CLOB.PACKING_LIST
  is '包装清单';
alter table EB_ITEM_CLOB
  add constraint PK_EB_ITEM_CLOB primary key (ITEM_ID);

prompt
prompt Creating table EB_ITEM_TAG_IMG
prompt ==============================
prompt
create table EB_ITEM_TAG_IMG
(
  TAG_IMG_ID  NUMBER(11) not null,
  TAG_IMG_URL VARCHAR2(256)
)
;
comment on table EB_ITEM_TAG_IMG
  is '商品标签图片';
comment on column EB_ITEM_TAG_IMG.TAG_IMG_URL
  is '标签图URL';
alter table EB_ITEM_TAG_IMG
  add constraint PK_EB_ITEM_TAG_IMG primary key (TAG_IMG_ID);

prompt
prompt Creating table EB_JBPM_LOG
prompt ==========================
prompt
create table EB_JBPM_LOG
(
  DBID      NUMBER(19),
  ORDER_NUM VARCHAR2(80),
  OPER      VARCHAR2(100),
  OPER_TIME TIMESTAMP(6),
  OPER_USER VARCHAR2(100),
  NOTE      VARCHAR2(1000)
)
;
comment on table EB_JBPM_LOG
  is '工作流日志表';
comment on column EB_JBPM_LOG.DBID
  is '物理主键';
comment on column EB_JBPM_LOG.ORDER_NUM
  is '订单号';
comment on column EB_JBPM_LOG.OPER
  is '操作类型';
comment on column EB_JBPM_LOG.OPER_TIME
  is '操作时间';
comment on column EB_JBPM_LOG.OPER_USER
  is '操作人';
comment on column EB_JBPM_LOG.NOTE
  is '操作备注';

prompt
prompt Creating table EB_KEYWORD
prompt =========================
prompt
create table EB_KEYWORD
(
  KEYWORD_ID      NUMBER(11) not null,
  KEYWORD_NAME    VARCHAR2(100),
  REPLACE_CONTENT VARCHAR2(255),
  STATUS          NUMBER(1),
  CREATE_TIME     TIMESTAMP(6),
  CREATOR         VARCHAR2(20),
  REPLACE_TYPE    NUMBER(1),
  EXTERNAL_LINK   VARCHAR2(300)
)
;
comment on table EB_KEYWORD
  is 'PMS关键词表';
comment on column EB_KEYWORD.KEYWORD_ID
  is '关键词ID';
comment on column EB_KEYWORD.KEYWORD_NAME
  is '关键词名称';
comment on column EB_KEYWORD.REPLACE_CONTENT
  is '替换内容';
comment on column EB_KEYWORD.STATUS
  is '状态';
comment on column EB_KEYWORD.CREATE_TIME
  is '创建时间';
comment on column EB_KEYWORD.CREATOR
  is '创建者';
comment on column EB_KEYWORD.REPLACE_TYPE
  is '替换类型';
comment on column EB_KEYWORD.EXTERNAL_LINK
  is '外部链接';
alter table EB_KEYWORD
  add constraint EB_KEYWORD_PK primary key (KEYWORD_ID);

prompt
prompt Creating table EB_MAIL
prompt ======================
prompt
create table EB_MAIL
(
  MAIL_ID      NUMBER(11) not null,
  SRC_ADDR     VARCHAR2(100),
  MAIL_SERVER  VARCHAR2(100),
  USERNAME     VARCHAR2(50),
  PASSWORD     VARCHAR2(50),
  MAIL_SUBJECT VARCHAR2(100),
  SEND_NAME    VARCHAR2(100)
)
;
comment on column EB_MAIL.MAIL_ID
  is '邮件服务器主键';
comment on column EB_MAIL.SRC_ADDR
  is '源地址';
comment on column EB_MAIL.MAIL_SERVER
  is '邮件服务器';
comment on column EB_MAIL.USERNAME
  is '邮件服务器用户名';
comment on column EB_MAIL.PASSWORD
  is '邮件服务器密码';
comment on column EB_MAIL.MAIL_SUBJECT
  is '邮件主题';
comment on column EB_MAIL.SEND_NAME
  is '发送者';
alter table EB_MAIL
  add constraint PK_EB_MAIL primary key (MAIL_ID);

prompt
prompt Creating table EB_MEMBER_CONFIG
prompt ===============================
prompt
create table EB_MEMBER_CONFIG
(
  MEMBER_ID         NUMBER(1) not null,
  MEMBER_OPTION     NUMBER(1),
  MEMBER_REG_OPTION NUMBER(1),
  MEMBER_NAME_MIN   NUMBER(10),
  MEMBER_PASS_MIN   NUMBER(10),
  MEMBER_RESERVE    VARCHAR2(10),
  MEMBER_NAME_MAX   NUMBER(10),
  MEMBER_PASS_MAX   NUMBER(10)
)
;
comment on table EB_MEMBER_CONFIG
  is 'PMS会员配置表';
comment on column EB_MEMBER_CONFIG.MEMBER_ID
  is '序号';
comment on column EB_MEMBER_CONFIG.MEMBER_OPTION
  is '是否开启会员功能';
comment on column EB_MEMBER_CONFIG.MEMBER_REG_OPTION
  is '是否开启会员注册功能';
comment on column EB_MEMBER_CONFIG.MEMBER_NAME_MIN
  is '注册用户名最小长度';
comment on column EB_MEMBER_CONFIG.MEMBER_PASS_MIN
  is '注册密码最小长度';
comment on column EB_MEMBER_CONFIG.MEMBER_RESERVE
  is '用户名保留字';
comment on column EB_MEMBER_CONFIG.MEMBER_NAME_MAX
  is '注册用户名最大长度';
comment on column EB_MEMBER_CONFIG.MEMBER_PASS_MAX
  is '注册密码最小长度';
alter table EB_MEMBER_CONFIG
  add constraint PK_EB_MEMBER_CONFIG primary key (MEMBER_ID);

prompt
prompt Creating table EB_MERCHANT_CAT
prompt ==============================
prompt
create table EB_MERCHANT_CAT
(
  ID          NUMBER(11),
  CAT_ID      NUMBER(11),
  CAT_NAME    VARCHAR2(80),
  MERCHANT_ID NUMBER(11)
)
;
comment on column EB_MERCHANT_CAT.CAT_ID
  is '类目主键。商品本身并不记录自己所属的商品种类（即：是属于手机还是号卡），而是通过其所属的类目来确定。就是说，系统的类目会初始化两种顶级类目：一种是手机（CAT_ID号是1），另一种是号卡（CAT_ID号是2）。系统需要根据商品所属的类目的ID号，来判断该商品是手机还是号卡。注意，商品类目表的CAT_ID号3至99是预留给系统将来的顶级类目的，顶级类目下面的二级类目CAT_ID从100开始编号（需要修改ORACLE的SEQUENCE）。编辑商品时，在手机类目中的所添加的商品，不可以更改到号卡类目中，反之亦然。';

prompt
prompt Creating table EB_MYFAV_SKU
prompt ===========================
prompt
create table EB_MYFAV_SKU
(
  MYFAV_SKU_ID     NUMBER(11) not null,
  PTL_USER_ID      NUMBER(11) not null,
  FAV_TIME         TIMESTAMP(6),
  MYFAV_TYPE       NUMBER(1),
  FAV_URL          VARCHAR2(500),
  ITEM_ID          NUMBER(11),
  ITEM_NAME        VARCHAR2(400),
  SKU_ID           NUMBER(11),
  SKU              VARCHAR2(80),
  SKU_NAME         VARCHAR2(500),
  SKU_SPEC         VARCHAR2(1000),
  MARKET_PRICE     NUMBER(20,2),
  OFFER_GROUP_ID   NUMBER(11),
  OFFER_GROUP_NAME VARCHAR2(200),
  OFFER_ID         NUMBER(11),
  OFFER_TYPE       NUMBER(2),
  SHORT_NAME       VARCHAR2(80),
  OFFER_NAME       VARCHAR2(800),
  SHORT_NAME2      VARCHAR2(50),
  PRICE            NUMBER(20,2),
  VALID_BEGIN      TIMESTAMP(6),
  VALID_END        TIMESTAMP(6),
  CONSTR_NAME      VARCHAR2(200)
)
;
comment on table EB_MYFAV_SKU
  is '我的收藏';
comment on column EB_MYFAV_SKU.MYFAV_SKU_ID
  is '我的收藏主键';
comment on column EB_MYFAV_SKU.PTL_USER_ID
  is '前台用户ID';
comment on column EB_MYFAV_SKU.FAV_TIME
  is '收藏时间';
comment on column EB_MYFAV_SKU.MYFAV_TYPE
  is '收藏类型。1：SKU；2：促销活动';
comment on column EB_MYFAV_SKU.FAV_URL
  is '存储相对路径';
comment on column EB_MYFAV_SKU.ITEM_ID
  is '商品主键';
comment on column EB_MYFAV_SKU.ITEM_NAME
  is '商品名称';
comment on column EB_MYFAV_SKU.SKU
  is '货号';
comment on column EB_MYFAV_SKU.SKU_NAME
  is 'SKU名称';
comment on column EB_MYFAV_SKU.SKU_SPEC
  is '规格1：规格2：规格3。。。规格N，格式参见订单需求文档';
comment on column EB_MYFAV_SKU.MARKET_PRICE
  is '(以分币为单位)市场价：所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_MYFAV_SKU.OFFER_GROUP_ID
  is '促销活动ID';
comment on column EB_MYFAV_SKU.OFFER_GROUP_NAME
  is '活动名称';
comment on column EB_MYFAV_SKU.OFFER_ID
  is '活动档次ID';
comment on column EB_MYFAV_SKU.OFFER_TYPE
  is '活动类型：1：购物送礼；2：优惠购机；3：购机返话费';
comment on column EB_MYFAV_SKU.SHORT_NAME
  is '活动简称。用字母代表，如A1中的A';
comment on column EB_MYFAV_SKU.OFFER_NAME
  is '活动档次简介';
comment on column EB_MYFAV_SKU.SHORT_NAME2
  is '活动档次数字编号，如A1中的1';
comment on column EB_MYFAV_SKU.PRICE
  is '(以分币为单位)购买时价格、预存话费。';
alter table EB_MYFAV_SKU
  add constraint PK_EB_MYFAV primary key (MYFAV_SKU_ID);

prompt
prompt Creating table EB_OFFER
prompt =======================
prompt
create table EB_OFFER
(
  OFFER_ID          NUMBER(11) not null,
  OFFER_GROUP_ID    NUMBER(11),
  OFFER_NAME        VARCHAR2(800),
  OFFER_NO          VARCHAR2(120),
  SHORT_NAME        VARCHAR2(50),
  OFFER_SORT        NUMBER(5),
  OFFER_TERM        NUMBER(2),
  COMMIT_MONTHLY    NUMBER(20,2),
  PREPAID           NUMBER(20,2),
  PERIOD            NUMBER(2),
  REFUND_MONTHLY    NUMBER(20,2),
  REFUND_1ST_MONTH  NUMBER(20,2),
  REFUND_LAST_MONTH NUMBER(20,2),
  NOTES             VARCHAR2(1000),
  CREATE_TIME       TIMESTAMP(6),
  UPDATE_TIME       TIMESTAMP(6),
  CREATE_USER_ID    NUMBER(11),
  UPDATE_USER_ID    NUMBER(11),
  ORIGINAL_OFFER_ID NUMBER(11),
  LAST_STATUS       NUMBER(1),
  MERCHANT_ID       NUMBER(11),
  VALID_BEGIN       TIMESTAMP(6),
  VALID_END         TIMESTAMP(6),
  COND_ID           VARCHAR2(20),
  SCHEME_TYPE       NUMBER(2)
)
;
comment on table EB_OFFER
  is '活动档次，可根据不同的号卡品牌和不同的消费水平组合成不同的促销活动档次，客户预存一定额度话费或签约承诺使用在网时间，可享受到优惠购机价格的购机方案。';
comment on column EB_OFFER.OFFER_ID
  is '促销活动主键';
comment on column EB_OFFER.OFFER_NAME
  is '活动档次简介';
comment on column EB_OFFER.OFFER_NO
  is '活动档次编号：起始编号： 50000001';
comment on column EB_OFFER.SHORT_NAME
  is '活动档次数字编号，如A1中的1';
comment on column EB_OFFER.OFFER_SORT
  is '前台显示排序';
comment on column EB_OFFER.OFFER_TERM
  is '业务协议期：1：6个月；2：12个月；3：18个月；4：24个月';
comment on column EB_OFFER.COMMIT_MONTHLY
  is '（以分币为单位）月承诺消费金额。大于0小于10000的整数';
comment on column EB_OFFER.PREPAID
  is '（以分币为单位）预存话费金额。大于0小于10000的整数';
comment on column EB_OFFER.PERIOD
  is '返还期。1：立即到帐；2：6个月；3：12个月；4：18个月；5：24个月';
comment on column EB_OFFER.REFUND_MONTHLY
  is '（以分币为单位）月返还金额。大于0小于10000的整数';
comment on column EB_OFFER.REFUND_1ST_MONTH
  is '（以分币为单位）首月返还金额。大于0小于10000的整数';
comment on column EB_OFFER.REFUND_LAST_MONTH
  is '（以分币为单位）末月返还金额。大于0小于10000的整数';
comment on column EB_OFFER.NOTES
  is '绑定业务文字说明';
comment on column EB_OFFER.LAST_STATUS
  is '0是历史记录;1最新';
comment on column EB_OFFER.VALID_BEGIN
  is '活动档次有效时间起始日期';
comment on column EB_OFFER.VALID_END
  is '活动档次有效时间终止日期';
comment on column EB_OFFER.COND_ID
  is '活动档次编码，从crm传过来的';
comment on column EB_OFFER.SCHEME_TYPE
  is '赠送话费，1：不赠送 2：按金额赠送 3：按比率赠送 4: 赠送固定费(月租)';
alter table EB_OFFER
  add constraint PK_EB_OFFER primary key (OFFER_ID);

prompt
prompt Creating table EB_OFFER_GROUP
prompt =============================
prompt
create table EB_OFFER_GROUP
(
  OFFER_GROUP_ID          NUMBER(11) not null,
  OFFER_GROUP_NAME        VARCHAR2(200),
  OFFER_TYPE              NUMBER(2),
  VALID_BEGIN             TIMESTAMP(6),
  VALID_END               TIMESTAMP(6),
  MARK                    VARCHAR2(80),
  SHORT_NAME              VARCHAR2(80),
  OFFER_GROUP_SORT        NUMBER(5),
  KEYWORDS                VARCHAR2(200),
  DEFAULT_IMG             VARCHAR2(800),
  PAGE_DESC               VARCHAR2(640),
  WEBSITE                 VARCHAR2(240),
  OFFER_GROUP_INTRO       VARCHAR2(1000),
  CREATE_TIME             TIMESTAMP(6),
  CHECK_TIME              TIMESTAMP(6),
  UPDATE_TIME             TIMESTAMP(6),
  ON_SALE_TIME            TIMESTAMP(6),
  CREATE_USER_ID          NUMBER(11),
  CHECKER_USER_ID         NUMBER(11),
  UPDATE_USER_ID          NUMBER(11),
  AUDIT_STATUS            NUMBER(2),
  SHOW_STATUS             NUMBER(2),
  FULL_PATH_DEPLOY        VARCHAR2(600),
  ORIGINAL_OFFER_GROUP_ID NUMBER(11),
  LAST_STATUS             NUMBER(1),
  MERCHANT_ID             NUMBER(11),
  OFFER_GROUP_NO          VARCHAR2(300),
  PROMO_TYPE              NUMBER(4),
  CATALOG_ID              VARCHAR2(20)
)
;
comment on table EB_OFFER_GROUP
  is '活动（分组），ECPS v1.0只支持一级活动分组
Name	Code	Comment	Default Value	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
IS_RECYCLED	IS_RECYCLED	是否删除：0：未删除；1：已经删除；默认值：0	0	NUMBER(2)	2		FALSE	FALSE	FALSE
OFFER_GROUP_NO	OFFER_GROUP_NO	促销活动编号：系统自动生成。商品类型目录数字+7位数，递增; 促销活动起始编号： 30000001		VARCHAR2(50)	50		FALSE	FALSE	FALSE
促销活动起始编号： 50000001';
comment on column EB_OFFER_GROUP.OFFER_GROUP_NAME
  is '活动名称';
comment on column EB_OFFER_GROUP.OFFER_TYPE
  is '活动类型：1：购物送礼；2：优惠购机；3：购机返话费';
comment on column EB_OFFER_GROUP.VALID_BEGIN
  is '有效时间起始日期';
comment on column EB_OFFER_GROUP.VALID_END
  is '有效时间终止日期';
comment on column EB_OFFER_GROUP.MARK
  is '标识。该分组的唯一标识，用于分组路径和模板标识';
comment on column EB_OFFER_GROUP.SHORT_NAME
  is '活动简称。用字母代表，如A1中的A';
comment on column EB_OFFER_GROUP.OFFER_GROUP_SORT
  is '排序。';
comment on column EB_OFFER_GROUP.KEYWORDS
  is '关键词';
comment on column EB_OFFER_GROUP.DEFAULT_IMG
  is '活动默认图片';
comment on column EB_OFFER_GROUP.PAGE_DESC
  is '页面描述：文本区';
comment on column EB_OFFER_GROUP.WEBSITE
  is '活动详情地址。活动详情通过pms添加，此处填写跳转地址';
comment on column EB_OFFER_GROUP.OFFER_GROUP_INTRO
  is '活动简介。';
comment on column EB_OFFER_GROUP.AUDIT_STATUS
  is '审核状态：0：待审核；1：审核通过；2：审核未通过；';
comment on column EB_OFFER_GROUP.SHOW_STATUS
  is '上下架状态：0.为上架 1.为下架 2.待上架';
comment on column EB_OFFER_GROUP.FULL_PATH_DEPLOY
  is '静态化页面的发布路径';
comment on column EB_OFFER_GROUP.LAST_STATUS
  is '0是历史记录;1最新';
comment on column EB_OFFER_GROUP.PROMO_TYPE
  is '活动类型，用来存储从crm返回的活动类型，在营销案开通接口中使用';
comment on column EB_OFFER_GROUP.CATALOG_ID
  is '对应crm目录节点ID';
alter table EB_OFFER_GROUP
  add constraint PK_EB_OFFER_GROUP primary key (OFFER_GROUP_ID);

prompt
prompt Creating table EB_OFFER_GROUP_AREA
prompt ==================================
prompt
create table EB_OFFER_GROUP_AREA
(
  AREA_ID        NUMBER(10),
  OFFER_GROUP_ID NUMBER(11)
)
;

prompt
prompt Creating table EB_OFFER_PRODUCT
prompt ===============================
prompt
create table EB_OFFER_PRODUCT
(
  OFFER_ID     NUMBER(11) not null,
  PRODUCT_CODE VARCHAR2(20),
  PRODUCT_NAME VARCHAR2(50),
  RES_CODE     VARCHAR2(20)
)
;
comment on table EB_OFFER_PRODUCT
  is '营销案档次产品表，用于记录由CRM同步来的产品信息';
comment on column EB_OFFER_PRODUCT.OFFER_ID
  is '营销案档次ID';
comment on column EB_OFFER_PRODUCT.PRODUCT_CODE
  is '产品编码';
comment on column EB_OFFER_PRODUCT.PRODUCT_NAME
  is '产品名称';
comment on column EB_OFFER_PRODUCT.RES_CODE
  is '资源编码';

prompt
prompt Creating table EB_ORDER
prompt =======================
prompt
create table EB_ORDER
(
  ORDER_ID             NUMBER(11) not null,
  PTL_USER_ID          NUMBER(11),
  USERNAME             VARCHAR2(100),
  ORDER_NUM            VARCHAR2(80),
  PAYMENT              NUMBER(1),
  PAY_PLATFORM         NUMBER(2),
  DELIVERY             NUMBER(1),
  IS_CONFIRM           NUMBER(1),
  ORDER_SUM            NUMBER(20,2),
  SHIP_FEE             NUMBER(20,2),
  IS_PAID              NUMBER(1),
  ORDER_STATE          NUMBER(2),
  PAYMENT_CASH         NUMBER(1),
  DISTRI_ID            NUMBER(11),
  DELIVERY_METHOD      NUMBER(1),
  PAYMENT_NO           VARCHAR2(30),
  ORDER_TIME           TIMESTAMP(6),
  PAY_TIME             TIMESTAMP(6),
  DEPOSIT_TIME         TIMESTAMP(6),
  SUCCESS_TIME         TIMESTAMP(6),
  UPDATE_TIME          TIMESTAMP(6),
  SRV_TYPE             NUMBER(2),
  SELF_COLLECT_SITE    VARCHAR2(200),
  SELF_COLLECT_SITE_ID NUMBER(11),
  IS_DELETED           NUMBER(1) default 0,
  IS_DISPLAY           NUMBER(1),
  NOTES                VARCHAR2(400),
  SHIP_NAME            VARCHAR2(80),
  PROVINCE             VARCHAR2(40),
  CITY                 VARCHAR2(40),
  DISTRICT             VARCHAR2(40),
  ZIP_CODE             VARCHAR2(40),
  ADDR                 VARCHAR2(400),
  PHONE                VARCHAR2(60),
  PAYABLE              NUMBER(1),
  COMPANY              VARCHAR2(240),
  CONTENTS             NUMBER(2),
  IS_CALL              NUMBER(1) default 0,
  DELIVERY_NO          VARCHAR2(300),
  AREA_CODE            VARCHAR2(50),
  AREA_NAME            VARCHAR2(50),
  IS_PRINT             NUMBER(1) default 0,
  CRM_CALLS_TIME       TIMESTAMP(6),
  IS_OFFER_RELEASE     NUMBER(1) default 0,
  JOB_NUM              VARCHAR2(300),
  ORDER_TYPE           NUMBER(3),
  FIXED_PHONE          VARCHAR2(50),
  ATTACH_FILE          VARCHAR2(300),
  RETURN_TYPE          NUMBER(11),
  SECKILL_ID           NUMBER(11),
  ORDER_SOURCE         NUMBER(3),
  ORDER_EXT1           VARCHAR2(1000),
  ORDER_EXT2           VARCHAR2(1000),
  ORDER_EXT3           VARCHAR2(1000),
  ORDER_EXT4           VARCHAR2(1000),
  ORDER_EXT5           VARCHAR2(1000)
)
;
comment on table EB_ORDER
  is '订单。包括实体商品和虚拟商品的订单';
comment on column EB_ORDER.ORDER_ID
  is '订单主键';
comment on column EB_ORDER.PTL_USER_ID
  is '前台用户主键';
comment on column EB_ORDER.ORDER_NUM
  is '订单号：订单号规则：订单生成日期+6位数，递增. 订单起始编号：111024000001. 后六位数一旦满，则后六位数递增为七位数';
comment on column EB_ORDER.PAYMENT
  is '支付方式：1: 在线支付；2: 货到付款；3: 营业厅付款；4:邮局汇款';
comment on column EB_ORDER.PAY_PLATFORM
  is '支付平台：1: 工商银行; 2: 建设银行; 3: 招商银行';
comment on column EB_ORDER.DELIVERY
  is '送货时间：1: 只工作日送货(双休日，假日不用送); 2: 工作日、双休日、假日均可送货; 3: 只双休日、假日送货(工作日送货)';
comment on column EB_ORDER.IS_CONFIRM
  is '送货前电话确认：0: 否; 1: 是';
comment on column EB_ORDER.ORDER_SUM
  is '订单总金额：各订单项的售价之和，包括运费等。';
comment on column EB_ORDER.SHIP_FEE
  is '运费';
comment on column EB_ORDER.IS_PAID
  is '未付款(待付款)=0;已付款(付款成功)=1;待退款=2;退款成功=3;退款失败=4;撤销成功=5;撤销失败=6;关闭=7;';
comment on column EB_ORDER.ORDER_STATE
  is '订单状态。参见类EbOrderStateConstants.java';
comment on column EB_ORDER.PAYMENT_CASH
  is '货到付款方式：1: 现金；2: POS刷卡; 3: 支票';
comment on column EB_ORDER.DISTRI_ID
  is '配送商ID';
comment on column EB_ORDER.DELIVERY_METHOD
  is '送货方式：1：快递；2：营业厅自提；3：平邮';
comment on column EB_ORDER.PAYMENT_NO
  is '支付号';
comment on column EB_ORDER.ORDER_TIME
  is '下单时间';
comment on column EB_ORDER.PAY_TIME
  is '付款时间';
comment on column EB_ORDER.DEPOSIT_TIME
  is '到帐时间';
comment on column EB_ORDER.SUCCESS_TIME
  is '成功时间';
comment on column EB_ORDER.SRV_TYPE
  is '业务类型，0：无业务；1：需要写卡；2：需要办理CRM；3：需要写卡和办理CRM';
comment on column EB_ORDER.SELF_COLLECT_SITE
  is '商品自提点名称';
comment on column EB_ORDER.SELF_COLLECT_SITE_ID
  is '自提营业厅ID';
comment on column EB_ORDER.IS_DELETED
  is '前台用户删除订单标记。1：是；0：否';
comment on column EB_ORDER.IS_DISPLAY
  is '前台用户删除订单标记。1：是；0：否';
comment on column EB_ORDER.NOTES
  is '备注';
comment on column EB_ORDER.SHIP_NAME
  is '收货人姓名';
comment on column EB_ORDER.PROVINCE
  is '省份';
comment on column EB_ORDER.CITY
  is '城市';
comment on column EB_ORDER.DISTRICT
  is '地区';
comment on column EB_ORDER.ZIP_CODE
  is '邮编';
comment on column EB_ORDER.ADDR
  is '街道地址';
comment on column EB_ORDER.PHONE
  is '联系电话';
comment on column EB_ORDER.PAYABLE
  is '发票抬头：0: 不需要发票；1: 个人；2: 单位';
comment on column EB_ORDER.COMPANY
  is '单位名称';
comment on column EB_ORDER.CONTENTS
  is '发票内容：1: 明细；2: 办公用品';
comment on column EB_ORDER.IS_CALL
  is '是否外呼过。0：未外呼；1：已外呼';
comment on column EB_ORDER.DELIVERY_NO
  is '物流编号。';
comment on column EB_ORDER.AREA_CODE
  is '市区代码（冗余自EB_CITY_AREA表）';
comment on column EB_ORDER.AREA_NAME
  is '市区名称（冗余自EB_CITY_AREA表）';
comment on column EB_ORDER.IS_PRINT
  is '是否已打印发票。0-未打印；1-已打印';
comment on column EB_ORDER.CRM_CALLS_TIME
  is 'crm办理成功或失败的时间';
comment on column EB_ORDER.IS_OFFER_RELEASE
  is '是否营销案解约。0-否；1-是；';
comment on column EB_ORDER.JOB_NUM
  is '工单号，由crm接口返回';
comment on column EB_ORDER.ORDER_TYPE
  is '0、混搭；1、裸机；2、号卡；3、营销案；4、团购裸机';
comment on column EB_ORDER.FIXED_PHONE
  is '固定电话';
comment on column EB_ORDER.SECKILL_ID
  is '如果订单是秒杀时填此字段，为了在前台‘我的订单‘中能够链接到下单的秒杀页面';
comment on column EB_ORDER.ORDER_SOURCE
  is '0、未定；1、代客下单；2、套卡；3、未定；4、未定';
alter table EB_ORDER
  add constraint PK_EB_ORDER primary key (ORDER_ID);

prompt
prompt Creating table EB_ORDER_DETAIL
prompt ==============================
prompt
create table EB_ORDER_DETAIL
(
  ORDER_DETAIL_ID    NUMBER(11) not null,
  ORDER_ID           NUMBER(11),
  ITEM_ID            NUMBER(11),
  ITEM_NAME          VARCHAR2(400),
  ITEM_NO            VARCHAR2(120),
  SKU_ID             NUMBER(11),
  SKU                VARCHAR2(80),
  SKU_IMG            VARCHAR2(80),
  SKU_NAME           VARCHAR2(500),
  SKU_CAT_TYPE       NUMBER(5),
  SKU_SPEC           VARCHAR2(1000),
  MARKET_PRICE       NUMBER(20,2),
  SKU_DISCOUNT       NUMBER(20,2),
  SKU_PRICE          NUMBER(20,2),
  OFFER_GROUP_ID     NUMBER(11),
  OFFER_GROUP_NAME   VARCHAR2(200),
  OFFER_TYPE         NUMBER(2),
  SHORT_NAME         VARCHAR2(80),
  OFFER_ID           NUMBER(11),
  OFFER_NAME         VARCHAR2(800),
  OFFER_NO           VARCHAR2(120),
  SHORT_NAME2        VARCHAR2(50),
  OFFER_TERM         NUMBER(2),
  COMMIT_MONTHLY     NUMBER(20,2),
  PREPAID            NUMBER(20,2),
  PERIOD             NUMBER(2),
  REFUND_MONTHLY     NUMBER(20,2),
  REFUND_1ST_MONTH   NUMBER(20,2),
  REFUND_LAST_MONTH  NUMBER(20,2),
  ORDER_DETAIL_TYPE  NUMBER(2),
  MERCHANT_ID        NUMBER(11),
  QUANTITY           NUMBER(5),
  PRICE              NUMBER(20,2),
  SERIESCODE         VARCHAR2(3000),
  OFFER_GROUP_NO     VARCHAR2(300),
  PROMO_TYPE         NUMBER(4),
  COND_ID            VARCHAR2(20),
  PRODUCT_ID         VARCHAR2(20),
  PAYMENT_PRICE      NUMBER(20,2),
  PURCHASE_PRICE     NUMBER(20,2),
  SIMCARD_SUIT_ID    NUMBER(11),
  SIMCARD_PACKAGE_ID VARCHAR2(3000)
)
;
comment on table EB_ORDER_DETAIL
  is '3-10是商品的冗余数据
11-26是营销案的冗余数据
营销案的时候，根据SKU存多条，每条SKU的营销案信息一致
备注：
当订单中包含offer，offer里包含sku的时候，
在保存offer内的sku信息时，会冗余offer信息到该条记录中，便于订单的查询。';
comment on column EB_ORDER_DETAIL.ORDER_ID
  is '订单主键';
comment on column EB_ORDER_DETAIL.ITEM_ID
  is '商品主键';
comment on column EB_ORDER_DETAIL.ITEM_NAME
  is '商品名称';
comment on column EB_ORDER_DETAIL.ITEM_NO
  is '商品编号：自动生成，不可重复，添加完成后不可修改。编号规则：一级目录数字“1”+7位数递增，裸机起始编号   10000001。7位数递增满时自动升为8位数。
编号根据EB_ITEM.CAT_TYPE获得，如实体商品为1（EB_ITEM.CAT_TYPE=1）
（删除
--实体起始编号：   10000001 虚拟起始编号：   20000001。
--注意：商品是否为手机或号卡，用其所属的类目来区分，CAT_ID为1的为手机，CAT_ID为2的为号卡。）
';
comment on column EB_ORDER_DETAIL.SKU_ID
  is '最小销售单元主键';
comment on column EB_ORDER_DETAIL.SKU
  is '货号';
comment on column EB_ORDER_DETAIL.SKU_IMG
  is '图片存储位置，1~5';
comment on column EB_ORDER_DETAIL.SKU_NAME
  is 'SKU名称';
comment on column EB_ORDER_DETAIL.SKU_CAT_TYPE
  is '冗余EB_CAT里边的CAT_TYPE字段值，用以标示：0、不分类；1、实体；2、号卡；3、虚拟商品';
comment on column EB_ORDER_DETAIL.SKU_SPEC
  is '规格1：规格2：规格3。。。规格N，格式参见订单需求文档';
comment on column EB_ORDER_DETAIL.MARKET_PRICE
  is '(以分币为单位)市场价：所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_ORDER_DETAIL.SKU_DISCOUNT
  is '优惠额';
comment on column EB_ORDER_DETAIL.SKU_PRICE
  is 'sku销售价';
comment on column EB_ORDER_DETAIL.OFFER_GROUP_NAME
  is '活动名称';
comment on column EB_ORDER_DETAIL.OFFER_TYPE
  is '活动类型：1：购物送礼；2：优惠购机；3：购机返话费';
comment on column EB_ORDER_DETAIL.SHORT_NAME
  is '活动简称。用字母代表，如A1中的A';
comment on column EB_ORDER_DETAIL.OFFER_ID
  is '促销活动主键';
comment on column EB_ORDER_DETAIL.OFFER_NAME
  is '活动档次简介';
comment on column EB_ORDER_DETAIL.OFFER_NO
  is '活动档次编号：起始编号： 50000001';
comment on column EB_ORDER_DETAIL.SHORT_NAME2
  is '活动档次数字编号，如A1中的1';
comment on column EB_ORDER_DETAIL.OFFER_TERM
  is '业务协议期：1：6个月；2：12个月；3：18个月；4：24个月';
comment on column EB_ORDER_DETAIL.COMMIT_MONTHLY
  is '（以分币为单位）月承诺消费金额。大于0小于10000的整数';
comment on column EB_ORDER_DETAIL.PREPAID
  is '（以分币为单位）预存话费金额。大于0小于10000的整数';
comment on column EB_ORDER_DETAIL.PERIOD
  is '返还期。1：立即到帐；2：6个月；3：12个月；4：18个月；5：24个月';
comment on column EB_ORDER_DETAIL.REFUND_MONTHLY
  is '（以分币为单位）月返还金额。大于0小于10000的整数';
comment on column EB_ORDER_DETAIL.REFUND_1ST_MONTH
  is '（以分币为单位）首月返还金额。大于0小于10000的整数';
comment on column EB_ORDER_DETAIL.REFUND_LAST_MONTH
  is '（以分币为单位）末月返还金额。大于0小于10000的整数';
comment on column EB_ORDER_DETAIL.ORDER_DETAIL_TYPE
  is '0、混搭；1、裸机；2、号卡；3、营销案；4、团购裸机';
comment on column EB_ORDER_DETAIL.QUANTITY
  is '数量';
comment on column EB_ORDER_DETAIL.PRICE
  is '(以分币为单位)成交价格（即实际购买价格）。若是营销活动，则按公式sku_price+prepaid-sku_discount计算';
comment on column EB_ORDER_DETAIL.SERIESCODE
  is '串号，逗号分割';
comment on column EB_ORDER_DETAIL.OFFER_GROUP_NO
  is '活动编号，用来存储从crm过来的编号';
comment on column EB_ORDER_DETAIL.PROMO_TYPE
  is '活动类型，用来存储从crm返回的活动类型，在营销案开通接口中使用';
comment on column EB_ORDER_DETAIL.COND_ID
  is '活动档次编码，从crm传过来的';
comment on column EB_ORDER_DETAIL.SIMCARD_SUIT_ID
  is '号卡-套餐ID';
comment on column EB_ORDER_DETAIL.SIMCARD_PACKAGE_ID
  is '号卡-业务包ID';
alter table EB_ORDER_DETAIL
  add constraint PK_EB_ORDER_DETAIL primary key (ORDER_DETAIL_ID);

prompt
prompt Creating table EB_ORDER_EXECUTION
prompt =================================
prompt
create table EB_ORDER_EXECUTION
(
  ID           NUMBER(11) not null,
  ORDER_NUM    NUMBER(20),
  EXECUTION_ID NUMBER(19),
  EXECUTION    VARCHAR2(1020),
  IS_NOW       NUMBER(1)
)
;
comment on column EB_ORDER_EXECUTION.ID
  is '数据主键';
comment on column EB_ORDER_EXECUTION.ORDER_NUM
  is '订单号';
comment on column EB_ORDER_EXECUTION.EXECUTION_ID
  is '流程ID';
comment on column EB_ORDER_EXECUTION.EXECUTION
  is '流程实例';
comment on column EB_ORDER_EXECUTION.IS_NOW
  is '是否为当前实例';
alter table EB_ORDER_EXECUTION
  add constraint PK_EB_ORDER_EXECUTION primary key (ID);

prompt
prompt Creating table EB_ORDER_LOG
prompt ===========================
prompt
create table EB_ORDER_LOG
(
  ORDER_LOG_ID    NUMBER(11) not null,
  ORDER_ID        NUMBER(11),
  STATE_BEFORE_OP NUMBER(2),
  OP_TYPE         VARCHAR2(100),
  OP_TIME         TIMESTAMP(6),
  OP_USER_NAME    VARCHAR2(100),
  OP_NOTES        VARCHAR2(200)
)
;
comment on table EB_ORDER_LOG
  is '订单日志
Name	Code	Comment	Default Value	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
OP_MODULE	OP_MODULE	操作模块：1：外呼；2：写卡；3：CRM；4：备货；5：配送；6：自提；7：换货；8：退货；9：异常；10：作废		NUMBER(2)	2		FALSE	FALSE	FALSE
修改用途，做订单每次操作日志';
comment on column EB_ORDER_LOG.ORDER_LOG_ID
  is '订单日志主键';
comment on column EB_ORDER_LOG.ORDER_ID
  is '订单主键';
comment on column EB_ORDER_LOG.STATE_BEFORE_OP
  is '操作前订单状态';
comment on column EB_ORDER_LOG.OP_TYPE
  is '操作类型';
comment on column EB_ORDER_LOG.OP_TIME
  is '操作时间';
comment on column EB_ORDER_LOG.OP_USER_NAME
  is '操作人用户名';
comment on column EB_ORDER_LOG.OP_NOTES
  is '操作备注';
alter table EB_ORDER_LOG
  add constraint PK_EB_ORDER_LOG primary key (ORDER_LOG_ID);

prompt
prompt Creating table EB_ORDER_REMIND_LOG
prompt ==================================
prompt
create table EB_ORDER_REMIND_LOG
(
  ID                NUMBER(11) not null,
  REMIND_MESSAGE    VARCHAR2(200),
  REMIND_RESULT     NUMBER(3),
  REMIND_TIME       TIMESTAMP(6),
  REMIND_NODE       VARCHAR2(20),
  REMIND_PHONE      VARCHAR2(20),
  REMIND_AREA_CODE  VARCHAR2(20),
  REMIND_ORDER_TYPE NUMBER(3)
)
;
comment on table EB_ORDER_REMIND_LOG
  is '订单处理提醒日志记录';
comment on column EB_ORDER_REMIND_LOG.REMIND_MESSAGE
  is '提醒内容';
comment on column EB_ORDER_REMIND_LOG.REMIND_RESULT
  is '提醒结果返回1/0';
comment on column EB_ORDER_REMIND_LOG.REMIND_TIME
  is '发送提醒时间';
comment on column EB_ORDER_REMIND_LOG.REMIND_NODE
  is '提醒发生节点';
comment on column EB_ORDER_REMIND_LOG.REMIND_PHONE
  is '提醒手机号码';
comment on column EB_ORDER_REMIND_LOG.REMIND_AREA_CODE
  is '提醒人归属地市';
comment on column EB_ORDER_REMIND_LOG.REMIND_ORDER_TYPE
  is '提醒订单类型';
alter table EB_ORDER_REMIND_LOG
  add constraint PK_EB_ORDER_REMIND_LOG primary key (ID);

prompt
prompt Creating table EB_ORDER_REMIND_PHONE
prompt ====================================
prompt
create table EB_ORDER_REMIND_PHONE
(
  ID                NUMBER(11) not null,
  REMIND_PHONE      VARCHAR2(20),
  REMIND_AREA_CODE  VARCHAR2(20),
  REMIND_ORDER_TYPE NUMBER(3)
)
;
comment on table EB_ORDER_REMIND_PHONE
  is '订单提醒人设置表';
comment on column EB_ORDER_REMIND_PHONE.REMIND_PHONE
  is '提醒人手机号码';
comment on column EB_ORDER_REMIND_PHONE.REMIND_AREA_CODE
  is '提醒人归属地市';
comment on column EB_ORDER_REMIND_PHONE.REMIND_ORDER_TYPE
  is '提醒订单类型';
alter table EB_ORDER_REMIND_PHONE
  add constraint PK_EB_ORDER_REMIND_PHONE primary key (ID);

prompt
prompt Creating table EB_PARA_VALUE
prompt ============================
prompt
create table EB_PARA_VALUE
(
  PARA_ID    NUMBER(11) not null,
  ITEM_ID    NUMBER(11) not null,
  FEATURE_ID NUMBER(11) not null,
  PARA_VALUE VARCHAR2(100) not null
)
;
comment on table EB_PARA_VALUE
  is '参数值（与价格无关）';
comment on column EB_PARA_VALUE.PARA_ID
  is '参数值主键';
comment on column EB_PARA_VALUE.PARA_VALUE
  is '参数值';
alter table EB_PARA_VALUE
  add constraint PK_EB_PARA_VALUE primary key (PARA_ID);

prompt
prompt Creating table EB_PAYMENT_ORG
prompt =============================
prompt
create table EB_PAYMENT_ORG
(
  PO_ID        NUMBER(11) not null,
  PO_NAME      VARCHAR2(50),
  ACCOUNT_CODE VARCHAR2(200),
  ACCOUNT_KEY  VARCHAR2(200),
  IS_OLBANK    NUMBER(1),
  PO_LOGO      VARCHAR2(500),
  PO_DESC_TYPE NUMBER(1),
  PO_DESC      VARCHAR2(50),
  PO_DESC_URL  VARCHAR2(500),
  PO_SORT      NUMBER(10),
  IS_SHOW      NUMBER(2)
)
;
comment on column EB_PAYMENT_ORG.PO_ID
  is '支付机构ID';
comment on column EB_PAYMENT_ORG.PO_NAME
  is '机构名称';
comment on column EB_PAYMENT_ORG.ACCOUNT_CODE
  is '商户账号ID';
comment on column EB_PAYMENT_ORG.ACCOUNT_KEY
  is '密钥';
comment on column EB_PAYMENT_ORG.IS_OLBANK
  is '是否支持网银支付：1、是；0、否';
comment on column EB_PAYMENT_ORG.PO_LOGO
  is '工具logo：资源服务器相对地址';
comment on column EB_PAYMENT_ORG.PO_DESC_TYPE
  is '支付说明：1、文本；2、链接';
comment on column EB_PAYMENT_ORG.PO_DESC
  is '说明文字';
comment on column EB_PAYMENT_ORG.PO_DESC_URL
  is '链接地址';
comment on column EB_PAYMENT_ORG.PO_SORT
  is '排序';
comment on column EB_PAYMENT_ORG.IS_SHOW
  is '是否显示：1、前台显示；0、不显示';
alter table EB_PAYMENT_ORG
  add constraint PK_EB_PAYMENT_ORG primary key (PO_ID);

prompt
prompt Creating table EB_PAYMENT_WAY
prompt =============================
prompt
create table EB_PAYMENT_WAY
(
  PW_ID   NUMBER(11) not null,
  PW_NAME VARCHAR2(200),
  PW_TEXT VARCHAR2(100),
  PW_URL  VARCHAR2(500),
  PW_MEMO VARCHAR2(500),
  PW_CODE NUMBER(1)
)
;
comment on table EB_PAYMENT_WAY
  is '字典表';
comment on column EB_PAYMENT_WAY.PW_ID
  is '支付方式ID';
comment on column EB_PAYMENT_WAY.PW_NAME
  is '支付方式名称';
comment on column EB_PAYMENT_WAY.PW_TEXT
  is '文字内容';
comment on column EB_PAYMENT_WAY.PW_URL
  is 'URL链接地址';
comment on column EB_PAYMENT_WAY.PW_MEMO
  is '备注';
comment on column EB_PAYMENT_WAY.PW_CODE
  is '编码：终端项目只有在线支付';
alter table EB_PAYMENT_WAY
  add constraint PK_EB_PAYMENT_WAY primary key (PW_ID);

prompt
prompt Creating table EB_PAY_CHECK
prompt ===========================
prompt
create table EB_PAY_CHECK
(
  CHECK_ID     NUMBER(11) not null,
  PO_ID        NUMBER(11),
  OLBANK_CODE  VARCHAR2(200),
  CELLPHONE    VARCHAR2(30),
  ORDER_NUM    VARCHAR2(80),
  PAY_DATE     TIMESTAMP(6),
  TRADE_DATE   TIMESTAMP(6),
  TRADE_AMOUNT NUMBER(20),
  PAY_TYPE     VARCHAR2(2),
  BANK_TYPE    VARCHAR2(2),
  SETTLE_DATE  TIMESTAMP(6),
  TRADE_TYPE   VARCHAR2(2),
  TRADE_STATUS VARCHAR2(2),
  BANK_CHECK   VARCHAR2(2),
  PRODUCT_ID   VARCHAR2(100),
  REFUND_NO    VARCHAR2(100),
  TRANS_TIME   TIMESTAMP(6),
  ORDER_TIME   TIMESTAMP(6)
)
;
comment on column EB_PAY_CHECK.PO_ID
  is '支付机构ID';
comment on column EB_PAY_CHECK.OLBANK_CODE
  is '网银代码';
comment on column EB_PAY_CHECK.ORDER_NUM
  is '订单号：订单号规则：订单生成日期+6位数，递增. 订单起始编号：111024000001. 后六位数一旦满，则后六位数递增为七位数';
comment on column EB_PAY_CHECK.ORDER_TIME
  is '下单时间';
alter table EB_PAY_CHECK
  add constraint PK_EB_PAY_CHECK primary key (CHECK_ID);

prompt
prompt Creating table EB_PAY_CHECK_DIFF
prompt ================================
prompt
create table EB_PAY_CHECK_DIFF
(
  CHECK_DIFF_ID NUMBER(11) not null,
  SETTLE_DATE   TIMESTAMP(6),
  PO_ID         NUMBER(11),
  DIFF_TYPE     VARCHAR2(2),
  PAY_RECODE_ID NUMBER(11),
  CHECK_ID      NUMBER(11)
)
;
comment on column EB_PAY_CHECK_DIFF.PO_ID
  is '支付机构ID';
comment on column EB_PAY_CHECK_DIFF.DIFF_TYPE
  is '1-金额差异；2-掉单（支付机构有，ecps没有）；3-多单（支付机构没有，ecps有）；';
alter table EB_PAY_CHECK_DIFF
  add constraint PK_EB_PAY_CHECK_DIFF primary key (CHECK_DIFF_ID);

prompt
prompt Creating table EB_PAY_OLBANK
prompt ============================
prompt
create table EB_PAY_OLBANK
(
  OLBANK_ID        NUMBER(11) not null,
  PO_ID            NUMBER(11),
  OLBANK_CODE      VARCHAR2(200),
  OLBANK_NAME      VARCHAR2(50),
  OLBANK_LOGO      VARCHAR2(500),
  OLBANK_DESC_TYPE NUMBER(1),
  OLBANK_DESC      VARCHAR2(50),
  OLBANK_DESC_URL  VARCHAR2(500),
  OLBANK_SORT      NUMBER(10),
  IS_SHOW          NUMBER(2)
)
;
comment on column EB_PAY_OLBANK.OLBANK_ID
  is '支付网银ID';
comment on column EB_PAY_OLBANK.PO_ID
  is '支付机构ID';
comment on column EB_PAY_OLBANK.OLBANK_CODE
  is '网银代码';
comment on column EB_PAY_OLBANK.OLBANK_NAME
  is '网银名称';
comment on column EB_PAY_OLBANK.OLBANK_LOGO
  is '工具logo：资源服务器相对地址';
comment on column EB_PAY_OLBANK.OLBANK_DESC_TYPE
  is '支付说明：1、文本；2、链接';
comment on column EB_PAY_OLBANK.OLBANK_DESC
  is '说明文字';
comment on column EB_PAY_OLBANK.OLBANK_DESC_URL
  is '链接地址';
comment on column EB_PAY_OLBANK.OLBANK_SORT
  is '排序';
comment on column EB_PAY_OLBANK.IS_SHOW
  is '是否显示：1、前台显示；0、不显示';
alter table EB_PAY_OLBANK
  add constraint PK_EB_PAY_OLBANK primary key (OLBANK_ID);

prompt
prompt Creating table EB_PAY_RECORD
prompt ============================
prompt
create table EB_PAY_RECORD
(
  PAY_RECODE_ID    NUMBER(11) not null,
  PAY_RECODE_NUM   VARCHAR2(200),
  ORDER_ID         NUMBER(11),
  ORDER_NUM        VARCHAR2(80),
  PO_ID            NUMBER(11),
  OLBANK_ID        NUMBER(11),
  USER_ID          NUMBER(11),
  OPERATOR_NAME    VARCHAR2(100),
  PTL_USER_ID      NUMBER(11),
  TRADE_NUM        VARCHAR2(100),
  BUZI_TYPE        NUMBER(2),
  TRADE_STATUS     NUMBER(2),
  ORDER_TIME       TIMESTAMP(6),
  TRADE_CREATEDATE TIMESTAMP(6),
  TRADE_RESPDATE   TIMESTAMP(6),
  TRADE_DATE       TIMESTAMP(6),
  TRADE_CURRENCY   VARCHAR2(10),
  TRADE_AMOUNT     NUMBER(20),
  SETTLE_DATE      TIMESTAMP(6),
  RET_CODE         VARCHAR2(10),
  RET_MSG          VARCHAR2(800),
  NOTIFY_CODE      VARCHAR2(10),
  NOTIFY_MSG       VARCHAR2(800),
  PAY_NOTICE_URL   VARCHAR2(500),
  PAY_RET_URL      VARCHAR2(500),
  CELLPHONE        VARCHAR2(30),
  IP_ADDRESS       VARCHAR2(30),
  EMAIL            VARCHAR2(100),
  MEMO             VARCHAR2(1000)
)
;
comment on column EB_PAY_RECORD.ORDER_ID
  is '订单主键';
comment on column EB_PAY_RECORD.ORDER_NUM
  is '订单号：订单号规则：订单生成日期+6位数，递增. 订单起始编号：111024000001. 后六位数一旦满，则后六位数递增为七位数';
comment on column EB_PAY_RECORD.PO_ID
  is '支付机构ID';
comment on column EB_PAY_RECORD.OLBANK_ID
  is '支付网银ID';
comment on column EB_PAY_RECORD.USER_ID
  is '后台用户主键';
comment on column EB_PAY_RECORD.OPERATOR_NAME
  is '冗余：后台用户名称';
comment on column EB_PAY_RECORD.PTL_USER_ID
  is '前台用户主键';
comment on column EB_PAY_RECORD.TRADE_NUM
  is '交易号';
comment on column EB_PAY_RECORD.BUZI_TYPE
  is '1-支付；2-冲正；3-撤销；4-退款';
comment on column EB_PAY_RECORD.TRADE_STATUS
  is '1-交易创建；2-交易成功；3-交易关闭；4-交易撤销；5-交易失败；99-系统未响应';
comment on column EB_PAY_RECORD.ORDER_TIME
  is '下单时间';
comment on column EB_PAY_RECORD.TRADE_RESPDATE
  is '同步时间';
comment on column EB_PAY_RECORD.TRADE_DATE
  is '异步时间';
comment on column EB_PAY_RECORD.TRADE_CURRENCY
  is 'RMB';
comment on column EB_PAY_RECORD.RET_CODE
  is '同步信息的结果';
comment on column EB_PAY_RECORD.RET_MSG
  is '同步信息的结果';
comment on column EB_PAY_RECORD.NOTIFY_CODE
  is '异步信息的结果';
comment on column EB_PAY_RECORD.NOTIFY_MSG
  is '异步信息的结果';
comment on column EB_PAY_RECORD.MEMO
  is '记录填写冲正、退款、撤销时的原因';
alter table EB_PAY_RECORD
  add constraint PK_EB_PAY_RECORD primary key (PAY_RECODE_ID);

prompt
prompt Creating table EB_PAY_TOTAL
prompt ===========================
prompt
create table EB_PAY_TOTAL
(
  CHECK_TOTAL_ID    NUMBER(11) not null,
  PO_ID             NUMBER(11),
  CHECK_DATE        TIMESTAMP(6),
  CHECK_STATUS      VARCHAR2(2),
  RECORD_TYPE       VARCHAR2(2),
  PO_PAYTOTAL       NUMBER(20),
  PO_PAYAMOUNT      NUMBER(20),
  EC_PAYTOTAL       NUMBER(20),
  EC_PAYAMOUNT      NUMBER(20),
  PAYDIFF_AMOUNT    NUMBER(20),
  PO_REFUNDTOTAL    NUMBER(20),
  PO_REFUNDAMOUNT   NUMBER(20),
  EC_REFUNDTOTAL    NUMBER(20),
  EC_REFUNDAMOUNT   NUMBER(20),
  REFUNDDIFF_AMOUNT NUMBER(20)
)
;
comment on column EB_PAY_TOTAL.PO_ID
  is '支付机构ID';
comment on column EB_PAY_TOTAL.RECORD_TYPE
  is '1-每个机构对账统计信息；2-汇总信息';
alter table EB_PAY_TOTAL
  add constraint PK_EB_PAY_TOTAL primary key (CHECK_TOTAL_ID);

prompt
prompt Creating table EB_PERMISSION
prompt ============================
prompt
create table EB_PERMISSION
(
  PERM_ID       NUMBER(11) not null,
  PERM_UPID     NUMBER(11),
  PERM_TYPE     NUMBER(1),
  PERM_NAME     VARCHAR2(100),
  PERM_URL      VARCHAR2(100),
  DEPENDENT_URL VARCHAR2(2000),
  PERM_USE      NUMBER(1),
  PERM_ORDER    NUMBER(3),
  PERM_NOTE     VARCHAR2(100)
)
;
comment on column EB_PERMISSION.PERM_ID
  is '权限主键';
alter table EB_PERMISSION
  add constraint PK_EB_PERMISSION primary key (PERM_ID);

prompt
prompt Creating table EB_PUBLISH_STATE
prompt ===============================
prompt
create table EB_PUBLISH_STATE
(
  PS_TYPE                 VARCHAR2(2) not null,
  PS_KEY                  NUMBER(11) not null,
  PS_LASTMODIFYTIME       TIMESTAMP(6) not null,
  PS_LASTPUBLISHSTARTTIME TIMESTAMP(6),
  PS_RESULT               NUMBER(1)
)
;
comment on table EB_PUBLISH_STATE
  is '发布状态表';
comment on column EB_PUBLISH_STATE.PS_TYPE
  is '发布类型: 01-home首页, 02-channel分类, 03-content内容, 04-topic, 05-other,99-unknown';
comment on column EB_PUBLISH_STATE.PS_KEY
  is '发布业务主键';
comment on column EB_PUBLISH_STATE.PS_LASTMODIFYTIME
  is '最近一次修改时间';
comment on column EB_PUBLISH_STATE.PS_LASTPUBLISHSTARTTIME
  is '最近一次发布开始时间';
comment on column EB_PUBLISH_STATE.PS_RESULT
  is '发布结果:0-失败,1-成功';
alter table EB_PUBLISH_STATE
  add constraint PK_EB_PUBLISH_STATE primary key (PS_TYPE, PS_KEY);

prompt
prompt Creating table EB_RECOMM_ITEM
prompt =============================
prompt
create table EB_RECOMM_ITEM
(
  RECOMM_ID      NUMBER(30) not null,
  ITEM_ID        NUMBER(30),
  ITEM_HIGHLIGHT VARCHAR2(200),
  CONTR_HIGHL    VARCHAR2(200),
  NOTE           VARCHAR2(500),
  EXPAN_PARAM1   VARCHAR2(100),
  EXPAN_PARAM2   VARCHAR2(200)
)
;
alter table EB_RECOMM_ITEM
  add constraint PK_EB_RECOMM_ITEM primary key (RECOMM_ID);

prompt
prompt Creating table EB_REGION
prompt ========================
prompt
create table EB_REGION
(
  REGION_ID   NUMBER(11) not null,
  AREA_ID     NUMBER(11),
  REGION_CODE VARCHAR2(200),
  REGION_NAME VARCHAR2(200)
)
;
alter table EB_REGION
  add constraint PK_EB_REGION primary key (REGION_ID);

prompt
prompt Creating table EB_RET_EXC
prompt =========================
prompt
create table EB_RET_EXC
(
  RET_EXC_ID      NUMBER(11) not null,
  ORDER_ID        NUMBER(11) not null,
  ORDER_DETAIL_ID NUMBER(11),
  REASON          VARCHAR2(1000),
  RET_EXC_TYPE    NUMBER(1),
  STATUS          NUMBER(1),
  REQ_TIME        TIMESTAMP(6),
  WAY_TYPE        NUMBER(1),
  CONTACT         VARCHAR2(100),
  PHONE           VARCHAR2(100)
)
;
comment on table EB_RET_EXC
  is '订单的退换货记录。退换货只维护到订单一级，通过问题描述来线下维护某个订单项的退换货，系统不管理订单项的退换货。';
comment on column EB_RET_EXC.RET_EXC_ID
  is '退换货主键';
comment on column EB_RET_EXC.REASON
  is '问题描述：填写退换货的原因及对问题的描述';
comment on column EB_RET_EXC.RET_EXC_TYPE
  is '退换货类型：1: 换货；2: 退货';
comment on column EB_RET_EXC.STATUS
  is '退换货状态：1: 已提交；2: 处理中；3: 已完成';
comment on column EB_RET_EXC.REQ_TIME
  is '申请退换货时间';
comment on column EB_RET_EXC.WAY_TYPE
  is '取消方式：1：前台取消；2：后台取消';
comment on column EB_RET_EXC.CONTACT
  is '联系人';
comment on column EB_RET_EXC.PHONE
  is '联系电话';
alter table EB_RET_EXC
  add constraint PK_EB_RET_EXC primary key (RET_EXC_ID);

prompt
prompt Creating table EB_ROLEPERM
prompt ==========================
prompt
create table EB_ROLEPERM
(
  PERM_ID NUMBER(11) not null,
  ROLE_ID NUMBER(11) not null
)
;
comment on table EB_ROLEPERM
  is '角色权限';
alter table EB_ROLEPERM
  add constraint PK_EB_ROLEPERM primary key (PERM_ID, ROLE_ID);

prompt
prompt Creating table EB_ROLE_AREA
prompt ===========================
prompt
create table EB_ROLE_AREA
(
  AREA_ID         NUMBER(11),
  ROLE_ID         NUMBER(11),
  PERMISSION_TYPE NUMBER(2)
)
;
comment on column EB_ROLE_AREA.ROLE_ID
  is '角色主键';

prompt
prompt Creating table EB_ROLE_BUSINESS_SCOPE
prompt =====================================
prompt
create table EB_ROLE_BUSINESS_SCOPE
(
  BUSINESS_SCOPE_ID NUMBER(3) not null,
  ROLE_ID           NUMBER(11) not null
)
;
comment on column EB_ROLE_BUSINESS_SCOPE.BUSINESS_SCOPE_ID
  is '运营范围主键';
comment on column EB_ROLE_BUSINESS_SCOPE.ROLE_ID
  is '角色主键';
alter table EB_ROLE_BUSINESS_SCOPE
  add constraint PK_EB_ROLE_BUSINESS_SCOPE primary key (BUSINESS_SCOPE_ID, ROLE_ID);

prompt
prompt Creating table EB_ROLE_ORDER_TYPE
prompt =================================
prompt
create table EB_ROLE_ORDER_TYPE
(
  ROLE_ID    NUMBER(11) not null,
  ORDER_TYPE NUMBER(3) not null
)
;
comment on column EB_ROLE_ORDER_TYPE.ROLE_ID
  is '角色主键';
comment on column EB_ROLE_ORDER_TYPE.ORDER_TYPE
  is '对应订单表的订单类型：
0、混搭；1、裸机；2、号卡；3、营销案；4、团购裸机';
alter table EB_ROLE_ORDER_TYPE
  add constraint PK_EB_ROLE_ORDER_TYPE primary key (ROLE_ID, ORDER_TYPE);

prompt
prompt Creating table EB_SAFETY_CONFIG
prompt ===============================
prompt
create table EB_SAFETY_CONFIG
(
  SAFETY_ID                  NUMBER(2) not null,
  SAFETY_MAX_RESULT          VARCHAR2(20),
  SAFETY_SEARCH_MIN          NUMBER(5),
  SAFETY_SEARCH_MAX          NUMBER(5),
  SAFETY_SESSION_TIME        NUMBER(10),
  SAFETY_LOGIN_LOG           NUMBER(1),
  SAFETY_OPERATE_LOG         NUMBER(1),
  SAFETY_ABSTRACT_LENGTH     VARCHAR2(20),
  SAFETY_BACKUP_PATH         VARCHAR2(200),
  SAFETY_STATIC_PAGE_SUFFIX  VARCHAR2(10),
  SAFETY_DYNAMIC_PAGE_SUFFIX VARCHAR2(10)
)
;
comment on table EB_SAFETY_CONFIG
  is 'PMS安全配置表';
comment on column EB_SAFETY_CONFIG.SAFETY_ID
  is '序号';
comment on column EB_SAFETY_CONFIG.SAFETY_MAX_RESULT
  is '最大返回搜索结果数';
comment on column EB_SAFETY_CONFIG.SAFETY_SEARCH_MIN
  is '搜索关键字最小长度';
comment on column EB_SAFETY_CONFIG.SAFETY_SEARCH_MAX
  is '搜索关键字最大长度';
comment on column EB_SAFETY_CONFIG.SAFETY_SESSION_TIME
  is '后台登陆超时时间限制';
comment on column EB_SAFETY_CONFIG.SAFETY_LOGIN_LOG
  is '记录登录日志';
comment on column EB_SAFETY_CONFIG.SAFETY_OPERATE_LOG
  is '记录操作日志';
comment on column EB_SAFETY_CONFIG.SAFETY_ABSTRACT_LENGTH
  is '自动摘要长度';
comment on column EB_SAFETY_CONFIG.SAFETY_BACKUP_PATH
  is '数据备份路径';
comment on column EB_SAFETY_CONFIG.SAFETY_STATIC_PAGE_SUFFIX
  is '静态页后缀';
comment on column EB_SAFETY_CONFIG.SAFETY_DYNAMIC_PAGE_SUFFIX
  is '动态页后缀';
alter table EB_SAFETY_CONFIG
  add constraint PK_EB_SAFETY_CONFIG primary key (SAFETY_ID);

prompt
prompt Creating table EB_SECKILL
prompt =========================
prompt
create table EB_SECKILL
(
  SECKILL_ID          NUMBER(11) not null,
  ACTIVITY_TYPE       NUMBER(3),
  SECKILL_TITLE       VARCHAR2(3000),
  SECKILL_IMG         VARCHAR2(600),
  GIFT_INFO           VARCHAR2(3000),
  SECKILL_ORDER       NUMBER(10),
  NOTICE_ORDER        NUMBER(10),
  SALES               NUMBER(10),
  START_TIME          TIMESTAMP(6),
  END_TIME            TIMESTAMP(6),
  IS_RECOMMEND        NUMBER(1),
  LIMIT_SECKILL_TIMES NUMBER(10),
  LIMIT_SECKILL_COUNT NUMBER(10),
  IS_DELETE           NUMBER(1)
)
;
comment on column EB_SECKILL.ACTIVITY_TYPE
  is '1秒杀活动（根据产品的说明，该类型和团购里的不同，该类型指以后秒杀可能会存在多种秒杀类型）';
comment on column EB_SECKILL.IS_RECOMMEND
  is '0-不推荐；1-首页推荐；';
comment on column EB_SECKILL.LIMIT_SECKILL_TIMES
  is '0为不限制，大于0的整数，即秒到该商品的次数';
comment on column EB_SECKILL.LIMIT_SECKILL_COUNT
  is '0为不限制，大于0的整数，即秒杀时候填的购买数量';
alter table EB_SECKILL
  add constraint PK_EB_SECKILL primary key (SECKILL_ID);

prompt
prompt Creating table EB_SECKILL_INFO
prompt ==============================
prompt
create table EB_SECKILL_INFO
(
  SECKILL_ID NUMBER(11) not null,
  INFO       CLOB
)
;
comment on column EB_SECKILL_INFO.INFO
  is '温馨提示';
alter table EB_SECKILL_INFO
  add constraint PK_EB_SECKILL_INFO primary key (SECKILL_ID);

prompt
prompt Creating table EB_SECKILL_QUA
prompt =============================
prompt
create table EB_SECKILL_QUA
(
  SECKILL_QUA_ID NUMBER(11) not null,
  PTL_USER_ID    NUMBER(11),
  SECKILL_ID     NUMBER(11),
  SKU_ID         NUMBER(11),
  SECKILL_TIME   TIMESTAMP(6),
  QUANTITY       NUMBER(5),
  ORDER_ID       NUMBER(11),
  IS_EXPIRED     NUMBER(1)
)
;
comment on column EB_SECKILL_QUA.PTL_USER_ID
  is '前台用户主键';
comment on column EB_SECKILL_QUA.SKU_ID
  is '最小销售单元主键';
comment on column EB_SECKILL_QUA.SECKILL_TIME
  is '秒杀到商品时的时间，用于和定时器做时间比较';
comment on column EB_SECKILL_QUA.QUANTITY
  is '本次购买的数量，用于当资格作废时偿还秒杀库存和商品库存';
comment on column EB_SECKILL_QUA.ORDER_ID
  is '当获取秒杀资格时为空，当成功下单后回填该字段，用于秒杀和订单的绑定';
comment on column EB_SECKILL_QUA.IS_EXPIRED
  is '是否失效：1为失效';
alter table EB_SECKILL_QUA
  add constraint PK_EB_SECKILL_QUA primary key (SECKILL_QUA_ID);

prompt
prompt Creating table EB_SECKILL_SKU
prompt =============================
prompt
create table EB_SECKILL_SKU
(
  SECKILL_ID    NUMBER(11) not null,
  SKU_ID        NUMBER(11) not null,
  SECKILL_COUNT NUMBER(10),
  SECKILL_PRICE NUMBER(20,2),
  ORDER_NO      NUMBER(10)
)
;
comment on column EB_SECKILL_SKU.SKU_ID
  is '最小销售单元主键';
comment on column EB_SECKILL_SKU.SECKILL_COUNT
  is '可以秒杀的商品数量，必须小于商品库存量';
alter table EB_SECKILL_SKU
  add constraint PK_EB_SECKILL_SKU primary key (SECKILL_ID, SKU_ID);

prompt
prompt Creating table EB_SENSITIVE_WORD
prompt ================================
prompt
create table EB_SENSITIVE_WORD
(
  SENSITIVE_WORD_ID   NUMBER(11) not null,
  SENSITIVE_WORD_NAME VARCHAR2(60),
  STATUS              NUMBER(1),
  CREATE_TIME         TIMESTAMP(6),
  CREATOR             VARCHAR2(20),
  EFFECT_MODULE       VARCHAR2(200)
)
;
comment on table EB_SENSITIVE_WORD
  is '敏感词';
comment on column EB_SENSITIVE_WORD.SENSITIVE_WORD_ID
  is '敏感词ID';
comment on column EB_SENSITIVE_WORD.SENSITIVE_WORD_NAME
  is '敏感词名称';
comment on column EB_SENSITIVE_WORD.STATUS
  is '状态';
comment on column EB_SENSITIVE_WORD.CREATE_TIME
  is '创建时间';
comment on column EB_SENSITIVE_WORD.CREATOR
  is '创建者';
comment on column EB_SENSITIVE_WORD.EFFECT_MODULE
  is '生效模型';
alter table EB_SENSITIVE_WORD
  add constraint EB_SENSITIVE_WORD_PK primary key (SENSITIVE_WORD_ID);

prompt
prompt Creating table EB_SHIP_ADDR
prompt ===========================
prompt
create table EB_SHIP_ADDR
(
  SHIP_ADDR_ID NUMBER(11) not null,
  PTL_USER_ID  NUMBER(11),
  SHIP_NAME    VARCHAR2(80) not null,
  PROVINCE     VARCHAR2(40) not null,
  CITY         VARCHAR2(40) not null,
  DISTRICT     VARCHAR2(40) not null,
  ZIP_CODE     VARCHAR2(40),
  ADDR         VARCHAR2(400) not null,
  PHONE        VARCHAR2(60),
  DEFAULT_ADDR NUMBER(1) default 0 not null,
  FIXED_PHONE  VARCHAR2(50)
)
;
comment on table EB_SHIP_ADDR
  is '收货地址';
comment on column EB_SHIP_ADDR.SHIP_ADDR_ID
  is '收货人地址主键';
comment on column EB_SHIP_ADDR.PTL_USER_ID
  is '前台用户ID';
comment on column EB_SHIP_ADDR.SHIP_NAME
  is '收货人姓名';
comment on column EB_SHIP_ADDR.PROVINCE
  is '省份';
comment on column EB_SHIP_ADDR.CITY
  is '城市';
comment on column EB_SHIP_ADDR.DISTRICT
  is '地区';
comment on column EB_SHIP_ADDR.ZIP_CODE
  is '邮编';
comment on column EB_SHIP_ADDR.ADDR
  is '街道地址';
comment on column EB_SHIP_ADDR.PHONE
  is '联系电话';
comment on column EB_SHIP_ADDR.DEFAULT_ADDR
  is '默认收货地址：若为默认收货地址则为1。';
comment on column EB_SHIP_ADDR.FIXED_PHONE
  is '固定电话';
alter table EB_SHIP_ADDR
  add constraint PK_EB_SHIP_ADDR primary key (SHIP_ADDR_ID);

prompt
prompt Creating table EB_SIMCARD
prompt =========================
prompt
create table EB_SIMCARD
(
  SIMCARD_ID       NUMBER(11) not null,
  SIMCARD_BRAND_ID NUMBER(11),
  SIMCARD_SUIT_ID  NUMBER(11),
  SIMCARD_BRAND    VARCHAR2(200),
  SIMCARD_NUM      VARCHAR2(20),
  SIMCARD_RANGE    VARCHAR2(11),
  SIMCARD_LOCALE   VARCHAR2(50),
  SHOW_STATUS      NUMBER(2),
  SALE_STATUS      NUMBER(2),
  LOCK_STATUS      NUMBER(2),
  LOCKED_TIME      TIMESTAMP(6),
  LOCKED_USERID    NUMBER(11),
  PREPAID          NUMBER(20),
  SIMCARD_NO       VARCHAR2(200),
  AREA_ID          NUMBER(11),
  IS_DELETED       NUMBER(2),
  FEE_OFFER_ID     VARCHAR2(20),
  FEE_OFFER_NAME   VARCHAR2(50)
)
;
comment on column EB_SIMCARD.SIMCARD_BRAND
  is '数字形式分割';
comment on column EB_SIMCARD.SIMCARD_LOCALE
  is '存在问题，待确认';
comment on column EB_SIMCARD.SHOW_STATUS
  is '0下架；1上架';
comment on column EB_SIMCARD.SALE_STATUS
  is '1、可售；2、预占；3、已售';
comment on column EB_SIMCARD.LOCK_STATUS
  is '0未锁；1锁定';
comment on column EB_SIMCARD.SIMCARD_NO
  is '从CRM中获取';
comment on column EB_SIMCARD.AREA_ID
  is '该字段和EB_CITY_AREA关联';
comment on column EB_SIMCARD.IS_DELETED
  is '删除标志位，0-删除 1-未删除';
comment on column EB_SIMCARD.FEE_OFFER_ID
  is '保底策划编码';
comment on column EB_SIMCARD.FEE_OFFER_NAME
  is '保底策划名称';
alter table EB_SIMCARD
  add constraint PK_EB_SIMCARD primary key (SIMCARD_ID);

prompt
prompt Creating table EB_SIMCARD_BRAND
prompt ===============================
prompt
create table EB_SIMCARD_BRAND
(
  SIMCARD_BRAND_ID        NUMBER(11) not null,
  SIMCARD_BRAND_NO        VARCHAR2(20),
  SIMCARD_BRAND_NAME      VARCHAR2(100),
  SIMCARD_BRAND_DESC      VARCHAR2(4000),
  SIMCARD_BRAND_AGREEMENT CLOB
)
;
alter table EB_SIMCARD_BRAND
  add constraint PK_EB_SIMCARD_BRAND primary key (SIMCARD_BRAND_ID);

prompt
prompt Creating table EB_SIMCARD_LABEL
prompt ===============================
prompt
create table EB_SIMCARD_LABEL
(
  LABEL_ID   NUMBER(11) not null,
  LABEL_NAME VARCHAR2(200),
  LABEL_NUM  VARCHAR2(50),
  LABEL_DESC VARCHAR2(4000),
  STATUS     NUMBER(2)
)
;
comment on column EB_SIMCARD_LABEL.LABEL_NUM
  is '暂时不用';
comment on column EB_SIMCARD_LABEL.STATUS
  is '启用状态：0: 停用; 1: 启用';
alter table EB_SIMCARD_LABEL
  add constraint PK_EB_SIMCARD_LABEL primary key (LABEL_ID);

prompt
prompt Creating table EB_SIMCARD_LABEL_REL
prompt ===================================
prompt
create table EB_SIMCARD_LABEL_REL
(
  SIMCARD_LABEL_REL_ID NUMBER(11) not null,
  SIMCARD_ID           NUMBER(11),
  SIMCARDLABEL_ID      NUMBER(11)
)
;
alter table EB_SIMCARD_LABEL_REL
  add constraint PK_EB_SIMCARD_LABEL_REL primary key (SIMCARD_LABEL_REL_ID);

prompt
prompt Creating table EB_SIMCARD_PROCESS_LOG
prompt =====================================
prompt
create table EB_SIMCARD_PROCESS_LOG
(
  LOG_ID           NUMBER(11) not null,
  LOG_MSG          VARCHAR2(2000),
  LOG_ORDER_NUMBER VARCHAR2(50),
  LOG_FILE_PATH    VARCHAR2(200),
  LOG_TIME         TIMESTAMP(6),
  LOG_EXT1         VARCHAR2(200),
  LOG_EXT2         VARCHAR2(200)
)
;
comment on column EB_SIMCARD_PROCESS_LOG.LOG_ID
  is '日志主见';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_MSG
  is '错误信息';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_ORDER_NUMBER
  is '处理错误对应行的订单编号';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_FILE_PATH
  is '错误日志文件路径';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_TIME
  is '处理时间';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_EXT1
  is '扩展字段1';
comment on column EB_SIMCARD_PROCESS_LOG.LOG_EXT2
  is '扩展字段2';

prompt
prompt Creating table EB_SIMCARD_SUIT
prompt ==============================
prompt
create table EB_SIMCARD_SUIT
(
  SIMCARD_SUIT_ID         NUMBER(11) not null,
  SIMCARD_BRAND_ID        NUMBER(11),
  SIMCARD_SUIT_NAME       VARCHAR2(200),
  SIMCARD_SUIT_IDENTIFIER VARCHAR2(200),
  SIMCARD_SUIT_DESC       VARCHAR2(4000),
  SIMCARD_SUIT_SORT       NUMBER(10),
  AREA_ID                 NUMBER(11),
  PREPAID                 NUMBER(20),
  CASH_PLEDGE             NUMBER(20),
  SIMCARD_PRICE           NUMBER(20),
  SUIT_LOCALE             VARCHAR2(50),
  IS_DELETED              NUMBER(2)
)
;
comment on column EB_SIMCARD_SUIT.SIMCARD_SUIT_IDENTIFIER
  is 'CRM ID';
comment on column EB_SIMCARD_SUIT.IS_DELETED
  is '删除标志位，0-删除 1-未删除';
alter table EB_SIMCARD_SUIT
  add constraint PK_EB_SIMCARD_SUIT primary key (SIMCARD_SUIT_ID);

prompt
prompt Creating table EB_SIM_IDCARD
prompt ============================
prompt
create table EB_SIM_IDCARD
(
  SIM_IDCARD_ID   NUMBER(11) not null,
  SUBSCRIBER_NAME VARCHAR2(80),
  IDCARD_TYPE     NUMBER(2),
  ID_NUM          VARCHAR2(40),
  ID_ADDR         VARCHAR2(400),
  ID_VALID_TO     TIMESTAMP(6),
  PHONE           VARCHAR2(50),
  PTL_USER_ID     NUMBER(11),
  ORDER_DETAIL_ID NUMBER(11)
)
;
comment on table EB_SIM_IDCARD
  is '号卡绑定身份证';
comment on column EB_SIM_IDCARD.SUBSCRIBER_NAME
  is '机主姓名';
comment on column EB_SIM_IDCARD.IDCARD_TYPE
  is '证件类型。1：身份证；2：军官证';
comment on column EB_SIM_IDCARD.ID_NUM
  is '证件号码。';
comment on column EB_SIM_IDCARD.ID_ADDR
  is '证件地址。';
comment on column EB_SIM_IDCARD.ID_VALID_TO
  is '证件到期时间';
comment on column EB_SIM_IDCARD.PHONE
  is '联系电话';
comment on column EB_SIM_IDCARD.PTL_USER_ID
  is '某个号卡信息属于某个用户购买';
alter table EB_SIM_IDCARD
  add constraint PK_EB_SIM_IDCARD primary key (SIM_IDCARD_ID);

prompt
prompt Creating table EB_SITE_CONFIG
prompt =============================
prompt
create table EB_SITE_CONFIG
(
  SITE_ID                NUMBER(2) not null,
  SITE_BASIC_DOMAIN      VARCHAR2(100),
  SITE_BASIC_PATH        VARCHAR2(200),
  SITE_BASIC_OPTION      NUMBER(1),
  SITE_SEO_TITLE         VARCHAR2(100),
  SITE_SEO_KEYWORD       VARCHAR2(300),
  SITE_SEO_DESCRIPTION   VARCHAR2(500),
  SITE_PATH_HTML         VARCHAR2(100),
  SITE_PATH_RESOURCE     VARCHAR2(100),
  SITE_RECYCLE_MODE      NUMBER(1),
  SITE_FTP_HOST          VARCHAR2(50),
  SITE_FTP_PORT          NUMBER(16),
  SITE_BASIC_PREADDRESS  VARCHAR2(50),
  SITE_BASIC_MAILADDRESS VARCHAR2(50),
  SITE_BASIC_PHONE       VARCHAR2(30),
  SITE_ANNOUNCE          VARCHAR2(200),
  SITE_ECPS_CHECK        VARCHAR2(300),
  SITE_SECKILL_TIMEOUT   NUMBER(16)
)
;
comment on table EB_SITE_CONFIG
  is '系统设置表-源自PMS v4.0
将要增加字段：';
comment on column EB_SITE_CONFIG.SITE_ID
  is '序号';
comment on column EB_SITE_CONFIG.SITE_BASIC_DOMAIN
  is '站点域名';
comment on column EB_SITE_CONFIG.SITE_BASIC_PATH
  is '路径';
comment on column EB_SITE_CONFIG.SITE_BASIC_OPTION
  is '是否相对路径';
comment on column EB_SITE_CONFIG.SITE_SEO_TITLE
  is '站点标题';
comment on column EB_SITE_CONFIG.SITE_SEO_KEYWORD
  is '站点关键字';
comment on column EB_SITE_CONFIG.SITE_SEO_DESCRIPTION
  is '站点描述';
comment on column EB_SITE_CONFIG.SITE_PATH_HTML
  is '文档HTML保存路径';
comment on column EB_SITE_CONFIG.SITE_PATH_RESOURCE
  is '图片、附件保存路径';
comment on column EB_SITE_CONFIG.SITE_RECYCLE_MODE
  is '是否开启回收站';
comment on column EB_SITE_CONFIG.SITE_FTP_HOST
  is 'FTP服务器地址';
comment on column EB_SITE_CONFIG.SITE_FTP_PORT
  is 'FTP端口';
comment on column EB_SITE_CONFIG.SITE_BASIC_PREADDRESS
  is '预发布测试地址';
comment on column EB_SITE_CONFIG.SITE_BASIC_MAILADDRESS
  is '管理员邮箱';
comment on column EB_SITE_CONFIG.SITE_BASIC_PHONE
  is '管理员电话';
comment on column EB_SITE_CONFIG.SITE_ANNOUNCE
  is '商城公告';
comment on column EB_SITE_CONFIG.SITE_SECKILL_TIMEOUT
  is '秒杀支付超时时间,单位‘秒’, 注：如用户获取秒杀资格后超过该字段设置的值未支付，则订单作废并还回秒杀库存)。';
alter table EB_SITE_CONFIG
  add constraint PK_EB_SITE_CONFIG primary key (SITE_ID);

prompt
prompt Creating table EB_SKU
prompt =====================
prompt
create table EB_SKU
(
  SKU_ID          NUMBER(11) not null,
  ITEM_ID         NUMBER(11) not null,
  SKU             VARCHAR2(80),
  SKU_PRICE       NUMBER(20,2) not null,
  SHOW_STATUS     NUMBER(2),
  STOCK_INVENTORY NUMBER(5) not null,
  SKU_UPPER_LIMIT NUMBER(5),
  LOCATION        VARCHAR2(80),
  SKU_IMG         VARCHAR2(80),
  SKU_SORT        NUMBER(5),
  SKU_NAME        VARCHAR2(500),
  MARKET_PRICE    NUMBER(20,2),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6),
  CREATE_USER_ID  NUMBER(11),
  UPDATE_USER_ID  NUMBER(11),
  ORIGINAL_SKU_ID NUMBER(11),
  LAST_STATUS     NUMBER(1),
  MERCHANT_ID     NUMBER(11),
  SKU_TYPE        NUMBER(1),
  SALES           NUMBER(10),
  RES_CODE        VARCHAR2(300),
  PACK_ID         NUMBER(8)
)
;
comment on table EB_SKU
  is '最小销售单元，包括实体商品、虚拟商品（如号卡、套卡、话费等）
将要增加的字段：
STOCK_INVENTORY_TYPE	，库存类型：1：唯一；2：不限。用于虚拟商品？？库存。两个单选项 唯一和不限，库存唯一针对的是手机号码，库存不限针对的是流量业务包等等，此处请保留未来扩展性。
TODO:';
comment on column EB_SKU.SKU_ID
  is '最小销售单元主键';
comment on column EB_SKU.SKU
  is '货号';
comment on column EB_SKU.SKU_PRICE
  is '(以分币为单位)售价、号卡预存话费：所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；
若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_SKU.SHOW_STATUS
  is '上下架状态：0.为上架；1.为下架';
comment on column EB_SKU.STOCK_INVENTORY
  is '库存';
comment on column EB_SKU.SKU_UPPER_LIMIT
  is '购买上限';
comment on column EB_SKU.LOCATION
  is '货位：可以输入特殊字符，需转义';
comment on column EB_SKU.SKU_IMG
  is '图片存储位置，1~5';
comment on column EB_SKU.SKU_SORT
  is '前台显示排序';
comment on column EB_SKU.SKU_NAME
  is 'SKU名称';
comment on column EB_SKU.MARKET_PRICE
  is '(以分币为单位)市场价：所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_SKU.LAST_STATUS
  is '0是历史记录;1最新';
comment on column EB_SKU.SKU_TYPE
  is '0为赠品；1为普通SKU';
comment on column EB_SKU.RES_CODE
  is 'crm返回参数，给crm开通的终端类别';
comment on column EB_SKU.PACK_ID
  is 'crm导入，资源包id';
alter table EB_SKU
  add constraint PK_EB_SKU primary key (SKU_ID);

prompt
prompt Creating table EB_SKU_OFFER
prompt ===========================
prompt
create table EB_SKU_OFFER
(
  SKU_OFFER_ID   NUMBER(11) not null,
  OFFER_ID       NUMBER(11),
  SKU_ID         NUMBER(11),
  SKU_DISCOUNT   NUMBER(20,2),
  PURCHASE_PRICE NUMBER(20,2),
  PAYMENT_PRICE  NUMBER(20,2),
  PRODUCT_ID     VARCHAR2(20)
)
;
comment on table EB_SKU_OFFER
  is '活动档次中选定的SKU';
comment on column EB_SKU_OFFER.OFFER_ID
  is '促销活动主键';
comment on column EB_SKU_OFFER.SKU_ID
  is '最小销售单元主键';
comment on column EB_SKU_OFFER.SKU_DISCOUNT
  is '优惠额。内部以分为单位。所有价格相关的字段限定为9位有效数字以内（即1234567.89，相当于千万元以内），给前端用户显示时，小数永远保持2位，即整数价格后面显示为.00；若小数价格多于2位小数，则直接截掉2位小数右边的小数（不用四舍五入）；若小数为1位，如1元9角，则显示1.90';
comment on column EB_SKU_OFFER.PURCHASE_PRICE
  is '购机价';
comment on column EB_SKU_OFFER.PAYMENT_PRICE
  is '实付价';
alter table EB_SKU_OFFER
  add constraint PK_EB_SKU_OFFER primary key (SKU_OFFER_ID);

prompt
prompt Creating table EB_SLOT
prompt ======================
prompt
create table EB_SLOT
(
  SLOT_ID      NUMBER(11) not null,
  SLOT_NAME    VARCHAR2(80),
  SLOT_BELONG  NUMBER(11),
  SLOT_TYPE    NUMBER(2),
  SKU_QUANTITY NUMBER(2),
  SKU_PIC_SIZE VARCHAR2(40),
  AREA_ID      VARCHAR2(20 BYTE)
)
;
comment on column EB_SLOT.SLOT_ID
  is 'SOLT主键';
comment on column EB_SLOT.SLOT_NAME
  is '版位名称';
comment on column EB_SLOT.SLOT_BELONG
  is '版位所属页面：1：首页；2：手机通讯频道页；3：定制终端频道页；4：配件中心频道页；5：单品页（该字段将来会扩展为外键以关联页面表）';
comment on column EB_SLOT.SLOT_TYPE
  is '版位类型：1：推荐区；2：货架；';
comment on column EB_SLOT.SKU_QUANTITY
  is '可显示的商品SKU数量';
comment on column EB_SLOT.SKU_PIC_SIZE
  is 'SKU图片规格，如215×235';
comment on column EB_SLOT.AREA_ID
  is 'SLOT所属地势';
alter table EB_SLOT
  add constraint PK_EB_SLOT primary key (SLOT_ID);

prompt
prompt Creating table EB_SLOT_SKU
prompt ==========================
prompt
create table EB_SLOT_SKU
(
  SLOT_SKU_ID NUMBER(11) not null,
  SLOT_ID     NUMBER(11),
  SKU_ID      NUMBER(11),
  ITEM_ID     NUMBER(11),
  SKU_SORT    NUMBER(6),
  SALE_SKU    VARCHAR2(100)
)
;
comment on table EB_SLOT_SKU
  is '版位？？SKU关联表';
comment on column EB_SLOT_SKU.SLOT_SKU_ID
  is '版位SKU关联表主键,暂不考虑版位与SKU之间的关联关系，此关联仅用于扩展，以支持未来前端静态页面以单一规格SKU为展示形式';
comment on column EB_SLOT_SKU.SLOT_ID
  is '版位SKU关联表主键';
comment on column EB_SLOT_SKU.SKU_ID
  is '最小销售单元主键';
comment on column EB_SLOT_SKU.ITEM_ID
  is '商品主键';
comment on column EB_SLOT_SKU.SKU_SORT
  is 'SKU在版位中的排序';
comment on column EB_SLOT_SKU.SALE_SKU
  is '促销规格：支持批量输入，多个规格值之间以英文字符“,”分隔，最多允许添加3个规格值，每个规格限制在22个字符内';
alter table EB_SLOT_SKU
  add constraint PK_EB_SLOT_SKU primary key (SLOT_SKU_ID);

prompt
prompt Creating table EB_SMS_GROUP
prompt ===========================
prompt
create table EB_SMS_GROUP
(
  SERIAL_NO NUMBER(11) not null,
  GROUP_ID  NUMBER(3),
  PHONE     VARCHAR2(20)
)
;
comment on column EB_SMS_GROUP.GROUP_ID
  is '0-订单未处理收短信；';
comment on column EB_SMS_GROUP.PHONE
  is '接收短信的手机号码';
alter table EB_SMS_GROUP
  add constraint PK_EB_SMS_GROUP primary key (SERIAL_NO);

prompt
prompt Creating table EB_SPEC_VALUE
prompt ============================
prompt
create table EB_SPEC_VALUE
(
  SPEC_ID    NUMBER(11) not null,
  SKU_ID     NUMBER(11) not null,
  FEATURE_ID NUMBER(11) not null,
  SPEC_VALUE VARCHAR2(100) not null
)
;
comment on table EB_SPEC_VALUE
  is '规格值（与价格有关）';
comment on column EB_SPEC_VALUE.SPEC_ID
  is '规格值主键';
comment on column EB_SPEC_VALUE.SPEC_VALUE
  is '规格值';
alter table EB_SPEC_VALUE
  add constraint PK_EB_SPEC_VALUE primary key (SPEC_ID);

prompt
prompt Creating table EB_SUIT_ITEM
prompt ===========================
prompt
create table EB_SUIT_ITEM
(
  EB_SUIT_ITEM_ID   NUMBER(11) not null,
  EB_SUIT_ITEM_NAME VARCHAR2(200),
  EB_SUIT_ITEM_DESC VARCHAR2(4000),
  EB_SUIT_ITEM_SORT NUMBER(11),
  EB_SUIT_ITEM_TYPE NUMBER(2),
  GROUP_ID          NUMBER(11),
  GROUP_NAME        VARCHAR2(200),
  PRODUCT_CODE      VARCHAR2(200),
  IS_DELETED        NUMBER(2)
)
;
comment on column EB_SUIT_ITEM.EB_SUIT_ITEM_TYPE
  is '业务类型：0: 必选; 1: 默认选中; 2:默认不选中';
comment on column EB_SUIT_ITEM.IS_DELETED
  is '删除标志位，0-删除 1-未删除';
alter table EB_SUIT_ITEM
  add constraint PK_EB_SUIT_ITEM primary key (EB_SUIT_ITEM_ID);

prompt
prompt Creating table EB_SUIT_ITEM_REL
prompt ===============================
prompt
create table EB_SUIT_ITEM_REL
(
  SIMCARD_SUIT_ID NUMBER(11),
  EB_SUIT_ITEM_ID NUMBER(11)
)
;

prompt
prompt Creating table EB_SUIT_VAS
prompt ==========================
prompt
create table EB_SUIT_VAS
(
  EB_SUIT_VAS_ID   NUMBER(11) not null,
  EB_SUIT_VAS_NAME VARCHAR2(200),
  EB_SUIT_VAS_TYPE NUMBER(2),
  EB_SUIT_VAS_DESC VARCHAR2(4000),
  EB_SUIT_VAS_SORT NUMBER(10),
  GROUP_ID         NUMBER(11),
  GROUP_NAME       VARCHAR2(200),
  OFFER_CODE       VARCHAR2(200),
  IS_DELETED       NUMBER(2)
)
;
comment on column EB_SUIT_VAS.EB_SUIT_VAS_TYPE
  is '业务类型：0: 必选; 1: 默认选中; 2:默认不选中';
comment on column EB_SUIT_VAS.IS_DELETED
  is '删除标志位，0-删除 1-未删除';
alter table EB_SUIT_VAS
  add constraint PK_EB_SUIT_VAS primary key (EB_SUIT_VAS_ID);

prompt
prompt Creating table EB_SUIT_VAS_REL
prompt ==============================
prompt
create table EB_SUIT_VAS_REL
(
  SIMCARD_SUIT_ID NUMBER(11),
  EB_SUIT_VAS_ID  NUMBER(11)
)
;

prompt
prompt Creating table EB_SUPPLIER
prompt ==========================
prompt
create table EB_SUPPLIER
(
  SUPPLIER_ID    NUMBER(11) not null,
  USER_ID        NUMBER(11),
  SUPPLIER_NAME  VARCHAR2(80),
  FKA            VARCHAR2(80),
  LEGAL_REP      VARCHAR2(80),
  REG_CAP        VARCHAR2(40),
  CORP_TYPE      NUMBER(2),
  BIZ_SCOPE      VARCHAR2(400),
  LICENSE_NO     VARCHAR2(120),
  ESTABLISH_DATE VARCHAR2(20),
  CONTACT        VARCHAR2(80),
  MOBILE         VARCHAR2(50),
  FIXED_PHONE    VARCHAR2(80),
  FAX            VARCHAR2(80),
  EMAIL          VARCHAR2(120),
  WEBSITE        VARCHAR2(120),
  ADDRESS        VARCHAR2(80),
  ZIP            VARCHAR2(40),
  BANK_NAME      VARCHAR2(40),
  BANK_NO        VARCHAR2(60),
  BANK_ACCOUNT   VARCHAR2(80),
  TAX_NO         VARCHAR2(80),
  SUPPLY_TYPE    NUMBER(2),
  ATTACHMENT     VARCHAR2(400),
  IS_RECYCLED    NUMBER(1) default 0,
  CREATED_TIME   TIMESTAMP(6)
)
;
comment on table EB_SUPPLIER
  is '供货商';
comment on column EB_SUPPLIER.SUPPLIER_ID
  is '供应商主键';
comment on column EB_SUPPLIER.USER_ID
  is '后台用户主键，用于在创建供应商时为其创建一个后台用户账号，并设置上供应商角色';
comment on column EB_SUPPLIER.SUPPLIER_NAME
  is '供应商名称';
comment on column EB_SUPPLIER.FKA
  is '曾用名，Formerly Known As';
comment on column EB_SUPPLIER.LEGAL_REP
  is '法人代表';
comment on column EB_SUPPLIER.REG_CAP
  is '注册资本，中文表示10个字符以内';
comment on column EB_SUPPLIER.CORP_TYPE
  is '企业类型，1国有企业, 2集体企业, 3私营企业, 4联营企业, 5有限责任公司, 6股份有限公司, 7股份合作企业, 8其他企业, 9港、澳、台商投资企业, 10 外商投资企业';
comment on column EB_SUPPLIER.BIZ_SCOPE
  is '经营范围';
comment on column EB_SUPPLIER.LICENSE_NO
  is '营业执照号';
comment on column EB_SUPPLIER.ESTABLISH_DATE
  is '创立日期';
comment on column EB_SUPPLIER.CONTACT
  is '联系人';
comment on column EB_SUPPLIER.MOBILE
  is '移动电话，11位数字';
comment on column EB_SUPPLIER.FIXED_PHONE
  is '固定电话号码';
comment on column EB_SUPPLIER.FAX
  is '传真号码';
comment on column EB_SUPPLIER.EMAIL
  is '电子邮件';
comment on column EB_SUPPLIER.WEBSITE
  is '网址';
comment on column EB_SUPPLIER.ADDRESS
  is '地址';
comment on column EB_SUPPLIER.ZIP
  is '邮编';
comment on column EB_SUPPLIER.BANK_NAME
  is '开户银行';
comment on column EB_SUPPLIER.BANK_NO
  is '开户银行编号';
comment on column EB_SUPPLIER.BANK_ACCOUNT
  is '银行账号';
comment on column EB_SUPPLIER.TAX_NO
  is '纳税号';
comment on column EB_SUPPLIER.SUPPLY_TYPE
  is '供货类型，可提供的货品的种类：1：裸机；2：号卡';
comment on column EB_SUPPLIER.ATTACHMENT
  is '上传文件存储位置，格式：Word、pdf、zip、rar、压缩包';
comment on column EB_SUPPLIER.IS_RECYCLED
  is '是否进入回收站。0：否；1：是';
comment on column EB_SUPPLIER.CREATED_TIME
  is '记录创建时间';
alter table EB_SUPPLIER
  add constraint PK_EB_SUPPLIER primary key (SUPPLIER_ID);

prompt
prompt Creating table EB_TAG
prompt =====================
prompt
create table EB_TAG
(
  TAG_ID        NUMBER(11) not null,
  TAG_NAME      VARCHAR2(60),
  REF_COUNTER   NUMBER(11),
  TOPIC_COUNTER NUMBER(11),
  STATUS        NUMBER(1),
  CREATE_TIME   TIMESTAMP(6),
  CREATOR       VARCHAR2(20)
)
;
comment on table EB_TAG
  is 'PMS标签表';
comment on column EB_TAG.TAG_ID
  is '标签主键';
comment on column EB_TAG.TAG_NAME
  is '标签名称';
comment on column EB_TAG.REF_COUNTER
  is '内容数量';
comment on column EB_TAG.TOPIC_COUNTER
  is '专题数量';
comment on column EB_TAG.STATUS
  is '状态';
comment on column EB_TAG.CREATE_TIME
  is '创建时间';
comment on column EB_TAG.CREATOR
  is '创建者';
alter table EB_TAG
  add constraint PK_EB_TAG primary key (TAG_ID);

prompt
prompt Creating table EB_TPLCAT
prompt ========================
prompt
create table EB_TPLCAT
(
  SERIAL_NO NUMBER(11) not null,
  CAT_ID    NUMBER(11) not null,
  SUIT_ID   NUMBER(11) not null,
  TPL_ID    NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
comment on column EB_TPLCAT.SERIAL_NO
  is '主键';
comment on column EB_TPLCAT.CAT_ID
  is '类目ID';
comment on column EB_TPLCAT.SUIT_ID
  is '套装ID';
comment on column EB_TPLCAT.TPL_ID
  is '表PMS_TEMPLATE的主键';
comment on column EB_TPLCAT.TPL_TYPE
  is '模板类型。1：类目（即栏目）模板；2：商品（即内容）模板';
alter table EB_TPLCAT
  add constraint PK_EBIZ_TPLCAT primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPLOFFERGROUP
prompt ===============================
prompt
create table EB_TPLOFFERGROUP
(
  SERIAL_NO      NUMBER(11) not null,
  OFFER_GROUP_ID NUMBER(11) not null,
  SUIT_ID        NUMBER(11) not null,
  TPL_ID         NUMBER(11),
  TPL_TYPE       VARCHAR2(1)
)
;
comment on table EB_TPLOFFERGROUP
  is 'PMS模板与促销活动（专题）的关联表。';
comment on column EB_TPLOFFERGROUP.TPL_TYPE
  is '模板类型。3：促销活动（即专题）模板';
alter table EB_TPLOFFERGROUP
  add constraint PK_EBIZ_TPLOFFERGROUP primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPLSLOT
prompt =========================
prompt
create table EB_TPLSLOT
(
  SERIAL_NO NUMBER(11) not null,
  SLOT_ID   NUMBER(11) not null,
  SUIT_ID   NUMBER(11) not null,
  DEPOLY_ID NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
comment on column EB_TPLSLOT.SERIAL_NO
  is '主键';
comment on column EB_TPLSLOT.SLOT_ID
  is '版位ID';
comment on column EB_TPLSLOT.SUIT_ID
  is '套装ID';
comment on column EB_TPLSLOT.DEPOLY_ID
  is '表PMS_TEMPLATE的主键';
comment on column EB_TPLSLOT.TPL_TYPE
  is '模板类型。1：类目（即栏目）模板；2：商品（即内容）模板';
alter table EB_TPLSLOT
  add constraint PK_EB_TPLSLOT primary key (SERIAL_NO);

prompt
prompt Creating table EB_TPL_ADLOCATION
prompt ================================
prompt
create table EB_TPL_ADLOCATION
(
  SERIAL_NO      NUMBER(11) not null,
  AD_LOCATION_ID NUMBER(11) not null,
  SUIT_ID        NUMBER(11) not null,
  TPL_ID         NUMBER(11),
  TPL_TYPE       VARCHAR2(1)
)
;
comment on column EB_TPL_ADLOCATION.SERIAL_NO
  is '主键';
comment on column EB_TPL_ADLOCATION.AD_LOCATION_ID
  is '版位ID';
comment on column EB_TPL_ADLOCATION.SUIT_ID
  is '套装ID';
comment on column EB_TPL_ADLOCATION.TPL_ID
  is '表PMS_TEMPLATE的主键';
comment on column EB_TPL_ADLOCATION.TPL_TYPE
  is '模板类型。1：类目（即栏目）模板；2：商品（即内容）模板';
alter table EB_TPL_ADLOCATION
  add constraint PK_EB_TPL_ADLOCATION primary key (SERIAL_NO);

prompt
prompt Creating table EB_VIEW_LIST
prompt ===========================
prompt
create table EB_VIEW_LIST
(
  ID             NUMBER(11),
  CAT_ID         NUMBER(11),
  CAT_INFO       VARCHAR2(1000),
  REL_ID         NUMBER(11),
  REL_INFO       NUMBER(11),
  VIEW_LIST_TYPE NUMBER(2)
)
;

prompt
prompt Creating table EB_VIEW_SKUVIEW
prompt ==============================
prompt
create table EB_VIEW_SKUVIEW
(
  ID       NUMBER(11),
  SKU_ID   NUMBER(11),
  SKU_INFO VARCHAR2(1000),
  ITEM_ID  NUMBER(11),
  CAT_ID   NUMBER(11),
  OFFER_ID NUMBER(11),
  BRAND_ID NUMBER(11)
)
;

prompt
prompt Creating table JBPM4_DEPLOYMENT
prompt ===============================
prompt
create table JBPM4_DEPLOYMENT
(
  DBID_      NUMBER(19) not null,
  NAME_      CLOB,
  TIMESTAMP_ NUMBER(19),
  STATE_     VARCHAR2(255)
)
;
alter table JBPM4_DEPLOYMENT
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_DEPLOYPROP
prompt ===============================
prompt
create table JBPM4_DEPLOYPROP
(
  DBID_       NUMBER(19) not null,
  DEPLOYMENT_ NUMBER(19),
  OBJNAME_    VARCHAR2(255),
  KEY_        VARCHAR2(255),
  STRINGVAL_  VARCHAR2(255),
  LONGVAL_    NUMBER(19)
)
;
alter table JBPM4_DEPLOYPROP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_EXECUTION
prompt ==============================
prompt
create table JBPM4_EXECUTION
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255) not null,
  DBVERSION_     NUMBER(10) not null,
  ACTIVITYNAME_  VARCHAR2(255),
  PROCDEFID_     VARCHAR2(255),
  HASVARS_       NUMBER(1),
  NAME_          VARCHAR2(255),
  KEY_           VARCHAR2(255),
  ID_            VARCHAR2(255),
  STATE_         VARCHAR2(255),
  SUSPHISTSTATE_ VARCHAR2(255),
  PRIORITY_      NUMBER(10),
  HISACTINST_    NUMBER(19),
  PARENT_        NUMBER(19),
  INSTANCE_      NUMBER(19),
  SUPEREXEC_     NUMBER(19),
  SUBPROCINST_   NUMBER(19),
  PARENT_IDX_    NUMBER(10)
)
;
alter table JBPM4_EXECUTION
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_ACTINST
prompt =================================
prompt
create table JBPM4_HIST_ACTINST
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255) not null,
  DBVERSION_     NUMBER(10) not null,
  HPROCI_        NUMBER(19),
  TYPE_          VARCHAR2(255),
  EXECUTION_     VARCHAR2(255),
  ACTIVITY_NAME_ VARCHAR2(255),
  START_         TIMESTAMP(6),
  END_           TIMESTAMP(6),
  DURATION_      NUMBER(19),
  TRANSITION_    VARCHAR2(255),
  NEXTIDX_       NUMBER(10),
  HTASK_         NUMBER(19)
)
;
alter table JBPM4_HIST_ACTINST
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_DETAIL
prompt ================================
prompt
create table JBPM4_HIST_DETAIL
(
  DBID_       NUMBER(19) not null,
  CLASS_      VARCHAR2(255) not null,
  DBVERSION_  NUMBER(10) not null,
  USERID_     VARCHAR2(255),
  TIME_       TIMESTAMP(6),
  HPROCI_     NUMBER(19),
  HPROCIIDX_  NUMBER(10),
  HACTI_      NUMBER(19),
  HACTIIDX_   NUMBER(10),
  HTASK_      NUMBER(19),
  HTASKIDX_   NUMBER(10),
  HVAR_       NUMBER(19),
  HVARIDX_    NUMBER(10),
  MESSAGE_    CLOB,
  OLD_STR_    VARCHAR2(255),
  NEW_STR_    VARCHAR2(255),
  OLD_INT_    NUMBER(10),
  NEW_INT_    NUMBER(10),
  OLD_TIME_   TIMESTAMP(6),
  NEW_TIME_   TIMESTAMP(6),
  PARENT_     NUMBER(19),
  PARENT_IDX_ NUMBER(10)
)
;
alter table JBPM4_HIST_DETAIL
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_PROCINST
prompt ==================================
prompt
create table JBPM4_HIST_PROCINST
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  ID_          VARCHAR2(255),
  PROCDEFID_   VARCHAR2(255),
  KEY_         VARCHAR2(255),
  START_       TIMESTAMP(6),
  END_         TIMESTAMP(6),
  DURATION_    NUMBER(19),
  STATE_       VARCHAR2(255),
  ENDACTIVITY_ VARCHAR2(255),
  NEXTIDX_     NUMBER(10)
)
;
alter table JBPM4_HIST_PROCINST
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_TASK
prompt ==============================
prompt
create table JBPM4_HIST_TASK
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  EXECUTION_ VARCHAR2(255),
  OUTCOME_   VARCHAR2(255),
  ASSIGNEE_  VARCHAR2(255),
  PRIORITY_  NUMBER(10),
  STATE_     VARCHAR2(255),
  CREATE_    TIMESTAMP(6),
  END_       TIMESTAMP(6),
  DURATION_  NUMBER(19),
  NEXTIDX_   NUMBER(10),
  SUPERTASK_ NUMBER(19)
)
;
alter table JBPM4_HIST_TASK
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_HIST_VAR
prompt =============================
prompt
create table JBPM4_HIST_VAR
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  PROCINSTID_  VARCHAR2(255),
  EXECUTIONID_ VARCHAR2(255),
  VARNAME_     VARCHAR2(255),
  VALUE_       VARCHAR2(255),
  HPROCI_      NUMBER(19),
  HTASK_       NUMBER(19)
)
;
alter table JBPM4_HIST_VAR
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_GROUP
prompt =============================
prompt
create table JBPM4_ID_GROUP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  ID_        VARCHAR2(255),
  NAME_      VARCHAR2(255),
  TYPE_      VARCHAR2(255),
  PARENT_    NUMBER(19)
)
;
alter table JBPM4_ID_GROUP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_MEMBERSHIP
prompt ==================================
prompt
create table JBPM4_ID_MEMBERSHIP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  USER_      NUMBER(19),
  GROUP_     NUMBER(19),
  NAME_      VARCHAR2(255)
)
;
alter table JBPM4_ID_MEMBERSHIP
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_ID_USER
prompt ============================
prompt
create table JBPM4_ID_USER
(
  DBID_          NUMBER(19) not null,
  DBVERSION_     NUMBER(10) not null,
  ID_            VARCHAR2(255),
  PASSWORD_      VARCHAR2(255),
  GIVENNAME_     VARCHAR2(255),
  FAMILYNAME_    VARCHAR2(255),
  BUSINESSEMAIL_ VARCHAR2(255)
)
;
alter table JBPM4_ID_USER
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_JOB
prompt ========================
prompt
create table JBPM4_JOB
(
  DBID_            NUMBER(19) not null,
  CLASS_           VARCHAR2(255) not null,
  DBVERSION_       NUMBER(10) not null,
  DUEDATE_         TIMESTAMP(6),
  STATE_           VARCHAR2(255),
  ISEXCLUSIVE_     NUMBER(1),
  LOCKOWNER_       VARCHAR2(255),
  LOCKEXPTIME_     TIMESTAMP(6),
  EXCEPTION_       CLOB,
  RETRIES_         NUMBER(10),
  PROCESSINSTANCE_ NUMBER(19),
  EXECUTION_       NUMBER(19),
  CFG_             NUMBER(19),
  SIGNAL_          VARCHAR2(255),
  EVENT_           VARCHAR2(255),
  REPEAT_          VARCHAR2(255)
)
;
alter table JBPM4_JOB
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_LOB
prompt ========================
prompt
create table JBPM4_LOB
(
  DBID_       NUMBER(19) not null,
  DBVERSION_  NUMBER(10) not null,
  BLOB_VALUE_ BLOB,
  DEPLOYMENT_ NUMBER(19),
  NAME_       CLOB
)
;
alter table JBPM4_LOB
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_PARTICIPATION
prompt ==================================
prompt
create table JBPM4_PARTICIPATION
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  GROUPID_   VARCHAR2(255),
  USERID_    VARCHAR2(255),
  TYPE_      VARCHAR2(255),
  TASK_      NUMBER(19),
  SWIMLANE_  NUMBER(19)
)
;
alter table JBPM4_PARTICIPATION
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_PROPERTY
prompt =============================
prompt
create table JBPM4_PROPERTY
(
  KEY_     VARCHAR2(255) not null,
  VERSION_ NUMBER(10) not null,
  VALUE_   VARCHAR2(255)
)
;
alter table JBPM4_PROPERTY
  add primary key (KEY_);

prompt
prompt Creating table JBPM4_SWIMLANE
prompt =============================
prompt
create table JBPM4_SWIMLANE
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  NAME_      VARCHAR2(255),
  ASSIGNEE_  VARCHAR2(255),
  EXECUTION_ NUMBER(19)
)
;
alter table JBPM4_SWIMLANE
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_TASK
prompt =========================
prompt
create table JBPM4_TASK
(
  DBID_          NUMBER(19) not null,
  CLASS_         CHAR(1) not null,
  DBVERSION_     NUMBER(10) not null,
  NAME_          VARCHAR2(255),
  DESCR_         CLOB,
  STATE_         VARCHAR2(255),
  SUSPHISTSTATE_ VARCHAR2(255),
  ASSIGNEE_      VARCHAR2(255),
  FORM_          VARCHAR2(255),
  PRIORITY_      NUMBER(10),
  CREATE_        TIMESTAMP(6),
  DUEDATE_       TIMESTAMP(6),
  PROGRESS_      NUMBER(10),
  SIGNALLING_    NUMBER(1),
  EXECUTION_ID_  VARCHAR2(255),
  ACTIVITY_NAME_ VARCHAR2(255),
  HASVARS_       NUMBER(1),
  SUPERTASK_     NUMBER(19),
  EXECUTION_     NUMBER(19),
  PROCINST_      NUMBER(19),
  SWIMLANE_      NUMBER(19),
  TASKDEFNAME_   VARCHAR2(255)
)
;
alter table JBPM4_TASK
  add primary key (DBID_);

prompt
prompt Creating table JBPM4_VARIABLE
prompt =============================
prompt
create table JBPM4_VARIABLE
(
  DBID_         NUMBER(19) not null,
  CLASS_        VARCHAR2(255) not null,
  DBVERSION_    NUMBER(10) not null,
  KEY_          VARCHAR2(255),
  CONVERTER_    VARCHAR2(255),
  HIST_         NUMBER(1),
  EXECUTION_    NUMBER(19),
  TASK_         NUMBER(19),
  LOB_          NUMBER(19),
  DATE_VALUE_   TIMESTAMP(6),
  DOUBLE_VALUE_ FLOAT,
  CLASSNAME_    VARCHAR2(255),
  LONG_VALUE_   NUMBER(19),
  STRING_VALUE_ VARCHAR2(255),
  TEXT_VALUE_   CLOB,
  EXESYS_       NUMBER(19)
)
;
alter table JBPM4_VARIABLE
  add primary key (DBID_);

prompt
prompt Creating table JBPM_ROLE
prompt ========================
prompt
create table JBPM_ROLE
(
  ROLE_ID   NUMBER(10) not null,
  PERM_ID   NUMBER(11),
  ROLE_NAME VARCHAR2(50),
  MEMO      VARCHAR2(100)
)
;
alter table JBPM_ROLE
  add constraint PK_JBPM_ROLE primary key (ROLE_ID);

prompt
prompt Creating table PMS_ADVERTISEMENT
prompt ================================
prompt
create table PMS_ADVERTISEMENT
(
  AD_ID           NUMBER(11) not null,
  AD_NAME         VARCHAR2(80),
  AD_DESCRIPTION  VARCHAR2(1000),
  AD_TYPE         NUMBER(1),
  AD_WORDS        VARCHAR2(1000),
  AD_IMG          VARCHAR2(500),
  AD_PICTURES     VARCHAR2(2000),
  AD_FLASH        VARCHAR2(2000),
  AD_CAROUSELTIME NUMBER(5),
  AD_STATUS       NUMBER(1),
  AD_LINK         VARCHAR2(200),
  CREATOR         NUMBER(11),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6)
)
;
alter table PMS_ADVERTISEMENT
  add constraint PK_PMS_ADVERTISEMENT primary key (AD_ID);

prompt
prompt Creating table PMS_AD_LOCATION
prompt ==============================
prompt
create table PMS_AD_LOCATION
(
  LOCATION_ID           NUMBER(11) not null,
  LOCATION_NAME         VARCHAR2(80),
  LOCATION_DESCRIPTIONS VARCHAR2(1000),
  LOCATION_WIDTH        NUMBER(5),
  LOCATION_HIGH         NUMBER(5),
  LOCATION_CODE         VARCHAR2(3000),
  CREATOR               NUMBER(11),
  CREATE_TIME           TIMESTAMP(6),
  UPDATE_TIME           TIMESTAMP(6)
)
;
alter table PMS_AD_LOCATION
  add constraint PK_PMS_AD_LOCATION primary key (LOCATION_ID);

prompt
prompt Creating table PMS_AD_LOCATION_LINK
prompt ===================================
prompt
create table PMS_AD_LOCATION_LINK
(
  AD_ID       NUMBER(11) not null,
  LOCATION_ID NUMBER(11) not null,
  STATUS      NUMBER(1)
)
;
alter table PMS_AD_LOCATION_LINK
  add constraint PK_PMS_AD_LOCATION_LINK primary key (AD_ID, LOCATION_ID);

prompt
prompt Creating table PMS_ATTACHMENT_CONFIG
prompt ====================================
prompt
create table PMS_ATTACHMENT_CONFIG
(
  FILE_ID                  NUMBER(1) not null,
  FILE_SIZE                NUMBER(10),
  FILE_TYPE                VARCHAR2(200),
  FILE_MARK_PIC_MODE       NUMBER(1),
  FILE_MARK_CHAR_MODE      NUMBER(1),
  FILE_MARK_PIC_PATH       VARCHAR2(100),
  FILE_MARK_PIC_QUALITY    NUMBER(10),
  FILE_MARK_PIC_ALPHA      NUMBER(10),
  FILE_MARK_PIC_SIZE_WIDTH NUMBER(10),
  FILE_MARK_PIC_SIZE_HEIGH NUMBER(10),
  FILE_MARK_CHAR_CONTENT   VARCHAR2(20),
  FILE_MARK_CHAR_SIZE      NUMBER(10),
  FILE_MARK_CHAR_COLOR     VARCHAR2(10),
  FILE_MARK_POSITION       NUMBER(2),
  FILE_CUT_PIC_MIN_WIDTH   NUMBER(10),
  FILE_CUT_PIC_MIN_HEIGH   NUMBER(10)
)
;
alter table PMS_ATTACHMENT_CONFIG
  add constraint PK_PMS_ATTACHMENT_CONFIG primary key (FILE_ID);

prompt
prompt Creating table PMS_BACKLANDLOG
prompt ==============================
prompt
create table PMS_BACKLANDLOG
(
  LANDLOG_ID         NUMBER(11) not null,
  LANDLOG_USER_NAME  VARCHAR2(40),
  LANDLOG_TIME       TIMESTAMP(6),
  LANDLOG_IP_ADDRESS VARCHAR2(50)
)
;
alter table PMS_BACKLANDLOG
  add constraint PK_PMS_BACKLANDLOG primary key (LANDLOG_ID);

prompt
prompt Creating table PMS_BACKLOG
prompt ==========================
prompt
create table PMS_BACKLOG
(
  LOG_ID            NUMBER(11) not null,
  LOG_FUNCTION_NAME VARCHAR2(40),
  LOG_OPERATE_NAME  VARCHAR2(40),
  LOG_OPERATE_TIME  TIMESTAMP(6),
  LOG_USER_NAME     VARCHAR2(40),
  LOG_IP_ADDRESS    VARCHAR2(50),
  LOG_MEMO          VARCHAR2(100),
  LOG_DETAILS       VARCHAR2(4000)
)
;
alter table PMS_BACKLOG
  add constraint PK_PMS_BACKLOG primary key (LOG_ID);

prompt
prompt Creating table PMS_CHANNEL
prompt ==========================
prompt
create table PMS_CHANNEL
(
  CHANNEL_ID   NUMBER(11) not null,
  UPCHANNEL_ID NUMBER(11),
  PID          VARCHAR2(100),
  CHANNEL_NAME VARCHAR2(100),
  MODEL_ID     NUMBER(11),
  CHANNEL_PATH VARCHAR2(30),
  PRIORITY     NUMBER(5),
  TITLE_IMG    VARCHAR2(300),
  CONTENT_IMG  VARCHAR2(300),
  DESCRIPTION  CLOB,
  META_TITLE   VARCHAR2(120),
  META_KEYWORD VARCHAR2(200),
  META_NOTE    VARCHAR2(400),
  OPEN_TYPE    NUMBER(1),
  ADDR_LINK    VARCHAR2(200),
  STATUS       NUMBER(1),
  DEL_YN       NUMBER(1),
  CREATOR      NUMBER(11),
  CREATETIME   TIMESTAMP(6),
  UPDATETIME   TIMESTAMP(6)
)
;
alter table PMS_CHANNEL
  add constraint PK_PMS_CHANNEL primary key (CHANNEL_ID);

prompt
prompt Creating table PMS_CONTENT
prompt ==========================
prompt
create table PMS_CONTENT
(
  CONTENT_ID    NUMBER(11) not null,
  CHANNEL_ID    NUMBER(11),
  MODEL_ID      NUMBER(11),
  TITLE         VARCHAR2(200),
  SHORT_TITLE   VARCHAR2(200),
  TITLE_IMG     VARCHAR2(300),
  CONTENT_IMG   VARCHAR2(300),
  TYPE_IMG      VARCHAR2(300),
  ABSTRACT_INFO VARCHAR2(800),
  AUTHOR        VARCHAR2(100),
  RES_NAME      VARCHAR2(100),
  RES_ADDR      VARCHAR2(300),
  TYPE_ID       NUMBER(11),
  CONTENT       CLOB,
  IS_KEYWORDS   NUMBER(1),
  UP_LEVEL      NUMBER(2),
  RECOMMEND     NUMBER(1),
  CONTENTNEW    NUMBER(1),
  PICTURES      VARCHAR2(3000),
  ATTACHMENT    VARCHAR2(3000),
  MEDIA         VARCHAR2(3000),
  MARK_YN       NUMBER(1),
  STATUS        NUMBER(1),
  CHECK_REASON  VARCHAR2(100),
  CHECKER_ID    NUMBER(11),
  CHECKTIME     TIMESTAMP(6),
  DEL_YN        NUMBER(1),
  DEL_MAN       NUMBER(11),
  DEL_TIME      TIMESTAMP(6),
  CREATOR       NUMBER(11),
  CREATETIME    TIMESTAMP(6),
  UPDATETIME    TIMESTAMP(6)
)
;
alter table PMS_CONTENT
  add constraint PK_PMS_CONTENT primary key (CONTENT_ID);

prompt
prompt Creating table PMS_CONTENTBAK
prompt =============================
prompt
create table PMS_CONTENTBAK
(
  CONTENT_HIS_ID NUMBER(11) not null,
  CONTENT_ID     NUMBER(11),
  CHANNEL_ID     NUMBER(11),
  MODEL_ID       NUMBER(11),
  TITLE          VARCHAR2(200),
  SHORT_TITLE    VARCHAR2(200),
  TITLE_IMG      VARCHAR2(300),
  CONTENT_IMG    VARCHAR2(300),
  TYPE_IMG       VARCHAR2(300),
  ABSTRACT_INFO  VARCHAR2(800),
  AUTHOR         VARCHAR2(100),
  RES_NAME       VARCHAR2(100),
  RES_ADDR       VARCHAR2(300),
  TYPE_ID        NUMBER(11),
  CONTENT        CLOB,
  IS_KEYWORDS    NUMBER(1),
  UP_LEVEL       NUMBER(2),
  RECOMMEND      NUMBER(1),
  CONTENTNEW     NUMBER(1),
  PICTURES       VARCHAR2(3000),
  ATTACHMENT     VARCHAR2(3000),
  MEDIA          VARCHAR2(3000),
  MARK_YN        NUMBER(1),
  STATUS         NUMBER(1),
  CHECKTIME      TIMESTAMP(6),
  CHECKER_ID     NUMBER(11),
  DEL_YN         NUMBER(1),
  APPLY_YN       NUMBER(1),
  NEW_YN         NUMBER(1),
  APPLYTIME      TIMESTAMP(6),
  CREATOR        NUMBER(11),
  CREATETIME     TIMESTAMP(6),
  UPDATETIME     TIMESTAMP(6)
)
;
alter table PMS_CONTENTBAK
  add constraint PK_PMS_CONTENTBAK primary key (CONTENT_HIS_ID);

prompt
prompt Creating table PMS_CONTENT_SHARE
prompt ================================
prompt
create table PMS_CONTENT_SHARE
(
  SERAIL_NO  NUMBER(11) not null,
  SHARE_NAME VARCHAR2(20),
  SHARE_URL  VARCHAR2(1000),
  PIC_URL    VARCHAR2(300),
  PRIORITY   NUMBER(5),
  STATUS     NUMBER(1),
  CREATETIME TIMESTAMP(6)
)
;
alter table PMS_CONTENT_SHARE
  add constraint PK_PMS_CONTENT_SHARE primary key (SERAIL_NO);

prompt
prompt Creating table PMS_CONTENT_TAG
prompt ==============================
prompt
create table PMS_CONTENT_TAG
(
  SERIAL_NO  NUMBER(11) not null,
  TAG_ID     NUMBER(11),
  CONTENT_ID NUMBER(11)
)
;
alter table PMS_CONTENT_TAG
  add constraint PK_PMS_CONTENT_TAG primary key (SERIAL_NO);

prompt
prompt Creating table PMS_CONTENT_TYPE
prompt ===============================
prompt
create table PMS_CONTENT_TYPE
(
  TYPE_ID    NUMBER(11) not null,
  TYPE_NAME  VARCHAR2(60),
  IMG_WIDTH  NUMBER(11),
  IMG_HEIGHT NUMBER(11),
  HAS_IMAGE  NUMBER(1),
  STATUS     NUMBER(1)
)
;
alter table PMS_CONTENT_TYPE
  add constraint PK_PMS_CONTENT_TYPE primary key (TYPE_ID);

prompt
prompt Creating table PMS_HELPTIP
prompt ==========================
prompt
create table PMS_HELPTIP
(
  HELPTIP_ID   NUMBER(11) not null,
  USER_ID      NUMBER(11),
  MODULE_NAME  VARCHAR2(80),
  MODULE_AILAS VARCHAR2(80),
  STATUS       NUMBER(1)
)
;
alter table PMS_HELPTIP
  add constraint PK_PMS_HELPTIP primary key (HELPTIP_ID);

prompt
prompt Creating table PMS_KEYWORD
prompt ==========================
prompt
create table PMS_KEYWORD
(
  KEYWORD_ID      NUMBER(11) not null,
  KEYWORD_NAME    VARCHAR2(100),
  REPLACE_CONTENT VARCHAR2(255),
  STATUS          NUMBER(1),
  CREATE_TIME     TIMESTAMP(6),
  CREATOR         VARCHAR2(20),
  REPLACE_TYPE    NUMBER(1),
  EXTERNAL_LINK   VARCHAR2(300)
)
;
alter table PMS_KEYWORD
  add constraint PK_PMS_KEYWORD primary key (KEYWORD_ID);

prompt
prompt Creating table PMS_MAIL
prompt =======================
prompt
create table PMS_MAIL
(
  ID             NUMBER(1) not null,
  SOURCE_ADDRESS VARCHAR2(100),
  MAIL_SERVER    VARCHAR2(100),
  USERNAME       VARCHAR2(50),
  PASSWORD       VARCHAR2(50),
  MAIL_SUBJECT   VARCHAR2(100),
  SEND_NAME      VARCHAR2(100)
)
;
alter table PMS_MAIL
  add constraint PK_PMS_MAIL primary key (ID);

prompt
prompt Creating table PMS_MEMBER
prompt =========================
prompt
create table PMS_MEMBER
(
  MEMBER_ID     NUMBER(11) not null,
  MEMBER_NAME   VARCHAR2(60),
  EMAIL         VARCHAR2(100),
  PASSWORD      VARCHAR2(100),
  GROUP_ID      NUMBER(11),
  REAL_NAME     VARCHAR2(60),
  GENDER        NUMBER(1),
  BIRTHDAY      VARCHAR2(20),
  ADDRESS       VARCHAR2(300),
  QQ_NUM        VARCHAR2(20),
  MSN_NUM       VARCHAR2(50),
  PHONE         VARCHAR2(20),
  CELLPHONE     VARCHAR2(20),
  INTRO_INFO    VARCHAR2(1500),
  STATUS        NUMBER(1),
  LOGIN_COUNT   NUMBER(11),
  REGISTER_TIME TIMESTAMP(6),
  LOGIN_TIME    TIMESTAMP(6)
)
;
alter table PMS_MEMBER
  add constraint PK_PMS_MEMBER primary key (MEMBER_ID);

prompt
prompt Creating table PMS_MEMBER_CONFIG
prompt ================================
prompt
create table PMS_MEMBER_CONFIG
(
  MEMBER_ID         NUMBER(1) not null,
  MEMBER_OPTION     NUMBER(1),
  MEMBER_REG_OPTION NUMBER(1),
  MEMBER_NAME_MIN   NUMBER(10),
  MEMBER_PASS_MIN   NUMBER(10),
  MEMBER_RESERVE    VARCHAR2(60),
  MEMBER_NAME_MAX   NUMBER(10),
  MEMBER_PASS_MAX   NUMBER(10)
)
;
alter table PMS_MEMBER_CONFIG
  add constraint PK_PMS_MEMBER_CONFIG primary key (MEMBER_ID);

prompt
prompt Creating table PMS_MEMBER_GROUP
prompt ===============================
prompt
create table PMS_MEMBER_GROUP
(
  GROUP_ID      NUMBER(11) not null,
  GROUP_NAME    VARCHAR2(60),
  PRIORITY      NUMBER(5),
  DEFAULT_GROUP NUMBER(1),
  INIT_GROUP    NUMBER(1)
)
;
alter table PMS_MEMBER_GROUP
  add constraint PK_PMS_MEMBER_GROUP primary key (GROUP_ID);

prompt
prompt Creating table PMS_MESSAGE
prompt ==========================
prompt
create table PMS_MESSAGE
(
  MESSAGE_ID       NUMBER(11) not null,
  MESSAGE_TITLE    VARCHAR2(200),
  MESSAGE_TYPE     NUMBER(11),
  MESSAGE_CONTENT  VARCHAR2(2000),
  REVERT_CONTENT   VARCHAR2(2000),
  REVERT_TIME      TIMESTAMP(6),
  STATUS           NUMBER(1),
  CHECK_REASON     VARCHAR2(100),
  DEL_YN           NUMBER(1),
  MESSAGE_MAN_ID   NUMBER(11),
  MESSAGE_MAN_NAME VARCHAR2(60),
  MESSAGE_TIME     TIMESTAMP(6)
)
;
alter table PMS_MESSAGE
  add constraint PK_PMS_MESSAGE primary key (MESSAGE_ID);

prompt
prompt Creating table PMS_MESSAGE_TYPE
prompt ===============================
prompt
create table PMS_MESSAGE_TYPE
(
  MESSAGE_TYPE_ID   NUMBER(11) not null,
  MESSAGE_TYPE_NAME VARCHAR2(100),
  PRIORITY          NUMBER(5),
  DEFAULT_YN        NUMBER(1),
  MESSAGE_NOTE      VARCHAR2(500)
)
;
alter table PMS_MESSAGE_TYPE
  add constraint PK_PMS_MESSAGE_TYPE primary key (MESSAGE_TYPE_ID);

prompt
prompt Creating table PMS_MODEL
prompt ========================
prompt
create table PMS_MODEL
(
  MODEL_ID    NUMBER(6) not null,
  MODEL_NAME  VARCHAR2(100),
  MODEL_TYPE  VARCHAR2(1),
  PRIORITY    NUMBER(5),
  HAS_CONTENT NUMBER(1),
  STATUS      NUMBER(1)
)
;
alter table PMS_MODEL
  add constraint PK_PMS_MODEL primary key (MODEL_ID);

prompt
prompt Creating table PMS_MODELITEM
prompt ============================
prompt
create table PMS_MODELITEM
(
  MODELITEM_ID   NUMBER(11) not null,
  MODEL_ID       NUMBER(11),
  FIELD          VARCHAR2(50),
  ITEM_LABEL     VARCHAR2(100),
  DATA_TYPE      NUMBER(2),
  DATA_LENGTH    VARCHAR2(30),
  PRIORITY       NUMBER(5),
  STATUS         NUMBER(1),
  DEF_VALUE      VARCHAR2(300),
  OPT_VALUE      VARCHAR2(300),
  TEXT_WIDTH     NUMBER(3),
  AREA_ROWS      NUMBER(3),
  AREA_COLS      NUMBER(3),
  HELP_INFO      VARCHAR2(300),
  CHECK_RULE     VARCHAR2(2),
  CHECK_EXP      VARCHAR2(500),
  ERROR_INFO     VARCHAR2(200),
  SELECT_TAB     VARCHAR2(2),
  MODELITEM_TYPE NUMBER(1),
  IS_SELFDEFINE  NUMBER(1),
  IS_REQUIRED    NUMBER(1)
)
;
alter table PMS_MODELITEM
  add constraint PK_JC_MODEL_ITEM primary key (MODELITEM_ID);

prompt
prompt Creating table PMS_PERMISSION
prompt =============================
prompt
create table PMS_PERMISSION
(
  PERM_ID    NUMBER(11) not null,
  PERM_UPID  NUMBER(11),
  PERM_TYPE  NUMBER(1),
  PERM_NAME  VARCHAR2(100),
  PERM_URL   VARCHAR2(100),
  PERM_USE   NUMBER(1),
  PERM_ORDER NUMBER(3),
  PERM_NOTE  VARCHAR2(100)
)
;
alter table PMS_PERMISSION
  add constraint PK_PMS_PERMISSION primary key (PERM_ID);

prompt
prompt Creating table PMS_PREDEPLOY
prompt ============================
prompt
create table PMS_PREDEPLOY
(
  SERIAL_NO NUMBER(11) not null,
  STATUS    NUMBER(1),
  STARTTIME TIMESTAMP(6),
  ENDTIME   TIMESTAMP(6),
  DEPLOY_ID NUMBER(11)
)
;
alter table PMS_PREDEPLOY
  add constraint PK_PMS_PREDEPLOY primary key (SERIAL_NO);

prompt
prompt Creating table PMS_RESOURCE
prompt ===========================
prompt
create table PMS_RESOURCE
(
  RESOURCE_ID      NUMBER(11) not null,
  RESOURCE_NAME    VARCHAR2(100),
  UPRESOURCE_ID    NUMBER(11),
  RESOURCE_TYPE    NUMBER(1),
  RESOURCE_POSTFIX VARCHAR2(200),
  RESOURCE_SIZE    NUMBER(8),
  RESOURCE_PATH    VARCHAR2(200),
  RESOURCE_NOTE    VARCHAR2(500),
  CREATOR          NUMBER(11),
  CREATETIME       TIMESTAMP(6),
  MODIFIER         NUMBER(11),
  MODIFYTIME       TIMESTAMP(6)
)
;
alter table PMS_RESOURCE
  add constraint PK_PMS_RESOURCE primary key (RESOURCE_ID);

prompt
prompt Creating table PMS_ROLEPERM
prompt ===========================
prompt
create table PMS_ROLEPERM
(
  SERIAL_NO NUMBER(11) not null,
  PERM_ID   NUMBER(11),
  ROLE_ID   NUMBER(11),
  T_TYPE    NUMBER(1)
)
;
alter table PMS_ROLEPERM
  add constraint PK_PMS_ROLEPERM primary key (SERIAL_NO);

prompt
prompt Creating table PMS_SAFETY_CONFIG
prompt ================================
prompt
create table PMS_SAFETY_CONFIG
(
  SAFETY_ID                  NUMBER(2) not null,
  SAFETY_MAX_RESULT          VARCHAR2(20),
  SAFETY_SEARCH_MIN          NUMBER(5),
  SAFETY_SEARCH_MAX          NUMBER(5),
  SAFETY_SESSION_TIME        NUMBER(10),
  SAFETY_LOGIN_LOG           NUMBER(1),
  SAFETY_OPERATE_LOG         NUMBER(1),
  SAFETY_ABSTRACT_LENGTH     VARCHAR2(20),
  SAFETY_BACKUP_PATH         VARCHAR2(200),
  SAFETY_STATIC_PAGE_SUFFIX  VARCHAR2(10),
  SAFETY_DYNAMIC_PAGE_SUFFIX VARCHAR2(10)
)
;
alter table PMS_SAFETY_CONFIG
  add constraint PK_PMS_SAFETY_CONFIG primary key (SAFETY_ID);

prompt
prompt Creating table PMS_SENSITIVE_WORD
prompt =================================
prompt
create table PMS_SENSITIVE_WORD
(
  SENSITIVE_WORD_ID   NUMBER(11) not null,
  SENSITIVE_WORD_NAME VARCHAR2(60),
  STATUS              NUMBER(1),
  CREATE_TIME         TIMESTAMP(6),
  CREATOR             VARCHAR2(20),
  EFFECT_MODULE       VARCHAR2(200)
)
;
alter table PMS_SENSITIVE_WORD
  add constraint PK_PMS_SENSITIVE_WORD primary key (SENSITIVE_WORD_ID);

prompt
prompt Creating table PMS_SITE_CONFIG
prompt ==============================
prompt
create table PMS_SITE_CONFIG
(
  SITE_ID                NUMBER(2) not null,
  SITE_BASIC_DOMAIN      VARCHAR2(100),
  SITE_BASIC_PATH        VARCHAR2(200),
  SITE_BASIC_OPTION      NUMBER(1),
  SITE_SEO_TITLE         VARCHAR2(200),
  SITE_SEO_KEYWORD       VARCHAR2(300),
  SITE_SEO_DESCRIPTION   VARCHAR2(500),
  SITE_PATH_HTML         VARCHAR2(100),
  SITE_PATH_RESOURCE     VARCHAR2(100),
  SITE_RECYCLE_MODE      NUMBER(1),
  SITE_FTP_HOST          VARCHAR2(50),
  SITE_FTP_PORT          NUMBER(16),
  SITE_BASIC_PREADDRESS  VARCHAR2(100),
  SITE_BASIC_MAILADDRESS VARCHAR2(100),
  SITE_BASIC_PHONE       VARCHAR2(50)
)
;
alter table PMS_SITE_CONFIG
  add constraint PK_PMS_SITE_CONFIG primary key (SITE_ID);

prompt
prompt Creating table PMS_STATIC
prompt =========================
prompt
create table PMS_STATIC
(
  SERIAL_NO     NUMBER(11) not null,
  DEPLOY_TYPE   NUMBER(2),
  DEPLOY_RULE   VARCHAR2(200),
  STATUS        NUMBER(1),
  DEPLOY_STATUS NUMBER(1)
)
;
alter table PMS_STATIC
  add constraint PK_PMS_STATIC primary key (SERIAL_NO);

prompt
prompt Creating table PMS_SUIT
prompt =======================
prompt
create table PMS_SUIT
(
  SUIT_ID    NUMBER(11) not null,
  SUIT_NAME  VARCHAR2(100),
  SUIT_STAT  NUMBER(1),
  SUIT_NOTE  VARCHAR2(500),
  CREATETIME TIMESTAMP(6)
)
;
comment on table PMS_SUIT
  is '模板套装';
comment on column PMS_SUIT.SUIT_STAT
  is '状态：是否为默认套装';
alter table PMS_SUIT
  add constraint PK_PMS_SUIT primary key (SUIT_ID);

prompt
prompt Creating table PMS_TAG
prompt ======================
prompt
create table PMS_TAG
(
  TAG_ID        NUMBER(11) not null,
  TAG_NAME      VARCHAR2(60),
  REF_COUNTER   NUMBER(11),
  TOPIC_COUNTER NUMBER(11),
  STATUS        NUMBER(1),
  CREATE_TIME   TIMESTAMP(6),
  CREATOR       VARCHAR2(20)
)
;
alter table PMS_TAG
  add constraint PK_PMS_TAG primary key (TAG_ID);

prompt
prompt Creating table PMS_TEMPLATE
prompt ===========================
prompt
create table PMS_TEMPLATE
(
  TPL_ID   NUMBER(11) not null,
  TPL_NAME VARCHAR2(100),
  SRC_TYPE NUMBER(11),
  MODEL_ID NUMBER(11),
  UPTPL_ID NUMBER(11),
  SUIT_ID  NUMBER(11),
  TPL_SIZE NUMBER(8),
  TPL_PATH VARCHAR2(200),
  TPL_NOTE VARCHAR2(500),
  TPL_TIME TIMESTAMP(6)
)
;
comment on table PMS_TEMPLATE
  is '模板';
comment on column PMS_TEMPLATE.TPL_NAME
  is '模板名称';
comment on column PMS_TEMPLATE.SRC_TYPE
  is '类型：1：模板';
comment on column PMS_TEMPLATE.MODEL_ID
  is '模型';
comment on column PMS_TEMPLATE.UPTPL_ID
  is '上级模板ID，用来记录该模板所属的文件夹ID';
comment on column PMS_TEMPLATE.SUIT_ID
  is '模板套装';
comment on column PMS_TEMPLATE.TPL_SIZE
  is '模板大小';
comment on column PMS_TEMPLATE.TPL_PATH
  is '模板路径';
comment on column PMS_TEMPLATE.TPL_NOTE
  is '模板描述';
comment on column PMS_TEMPLATE.TPL_TIME
  is '创建时间';
alter table PMS_TEMPLATE
  add constraint PK_PMS_TEMPLATE primary key (TPL_ID);

prompt
prompt Creating table PMS_TOPIC
prompt ========================
prompt
create table PMS_TOPIC
(
  TOPIC_ID     NUMBER(11) not null,
  MODEL_ID     NUMBER(11),
  TOPIC_NAME   VARCHAR2(200),
  SHORT_NAME   VARCHAR2(200),
  TOPIC_PATH   VARCHAR2(50),
  DESCRIPTION  VARCHAR2(500),
  TITLE_IMG    VARCHAR2(300),
  CONTENT_IMG  VARCHAR2(300),
  PRIORITY     NUMBER(5),
  IS_RECOMMEND NUMBER(1),
  DEL_YN       NUMBER(1),
  LINKURL      VARCHAR2(200),
  CHECK_STATUS NUMBER(1),
  CHECK_REASON VARCHAR2(100),
  CHECKTIME    TIMESTAMP(6),
  CHECKER_ID   NUMBER(11),
  CREATOR      NUMBER(11),
  CREATOR_NAME VARCHAR2(100),
  CREATETIME   TIMESTAMP(6),
  UPDATETIME   TIMESTAMP(6),
  PICTURES     VARCHAR2(3000),
  ATTACHMENT   VARCHAR2(3000),
  MEDIA        VARCHAR2(300),
  CONTENT      CLOB
)
;
alter table PMS_TOPIC
  add constraint PK_JC_TOPIC primary key (TOPIC_ID);

prompt
prompt Creating table PMS_TOPIC_CONTENT
prompt ================================
prompt
create table PMS_TOPIC_CONTENT
(
  SERIAL_NO  NUMBER(11) not null,
  TOPIC_ID   NUMBER(11),
  CONTENT_ID NUMBER(11),
  PRIORITY   NUMBER(5),
  AREA_IDS   VARCHAR2(100)
)
;
alter table PMS_TOPIC_CONTENT
  add constraint PK_PMS_TOPIC_CONTENT primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TOPIC_TAG
prompt ============================
prompt
create table PMS_TOPIC_TAG
(
  SERIAL_NO NUMBER(11) not null,
  TAG_ID    NUMBER(11),
  TOPIC_ID  NUMBER(11)
)
;
alter table PMS_TOPIC_TAG
  add constraint PK_PMS_TOPIC_TAG primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPLCHL
prompt =========================
prompt
create table PMS_TPLCHL
(
  SERIAL_NO  NUMBER(11) not null,
  CHANNEL_ID NUMBER(11),
  SUIT_ID    NUMBER(11),
  TPL_ID     NUMBER(11),
  TPL_TYPE   VARCHAR2(1)
)
;
alter table PMS_TPLCHL
  add constraint PK_PMS_TPLCHL primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPLTOPIC
prompt ===========================
prompt
create table PMS_TPLTOPIC
(
  SERIAL_NO NUMBER(11) not null,
  TOPIC_ID  NUMBER(11),
  SUIT_ID   NUMBER(11),
  TPL_ID    NUMBER(11),
  TPL_TYPE  VARCHAR2(1)
)
;
alter table PMS_TPLTOPIC
  add constraint PK_PMS_TPLTOPIC primary key (SERIAL_NO);

prompt
prompt Creating table PMS_TPL_DEPLOY
prompt =============================
prompt
create table PMS_TPL_DEPLOY
(
  SERIAL_NO      NUMBER(11) not null,
  SUIT_ID        NUMBER(11),
  TPL_ID         NUMBER(11),
  PAGE_ID        NUMBER(11),
  PAGE_NAME      VARCHAR2(200),
  HTML_PAGE_NAME VARCHAR2(200)
)
;
comment on table PMS_TPL_DEPLOY
  is '模板发布';
comment on column PMS_TPL_DEPLOY.SERIAL_NO
  is '序号';
comment on column PMS_TPL_DEPLOY.SUIT_ID
  is '套装ID';
comment on column PMS_TPL_DEPLOY.TPL_ID
  is '模板ID';
comment on column PMS_TPL_DEPLOY.PAGE_ID
  is '类型ID：1：首页';
comment on column PMS_TPL_DEPLOY.PAGE_NAME
  is '页面url名称';
comment on column PMS_TPL_DEPLOY.HTML_PAGE_NAME
  is '页面名称';
alter table PMS_TPL_DEPLOY
  add constraint PK_PMS_TPL_DEPLOY primary key (SERIAL_NO);

prompt
prompt Creating table TEMP_RES_CODE_DEF
prompt ================================
prompt
create table TEMP_RES_CODE_DEF
(
  RES_CODE        NUMBER(6) not null,
  RES_NAME        VARCHAR2(64) not null,
  RES_TYPE        NUMBER(2) not null,
  USER_TYPE       NUMBER(4),
  RES_DESC        VARCHAR2(64),
  FEATURE_DES     VARCHAR2(64),
  VALID_DATE      DATE not null,
  EXPIRE_DATE     DATE not null,
  IS_DETAIL       NUMBER(1),
  VALID_DAYS      NUMBER(4) not null,
  FEE_ITEM        NUMBER(9),
  OPERATION_ID    NUMBER(10),
  RES_ADSCRIPTION NUMBER(2),
  EXT_HOLDS       NUMBER(2),
  EXT_HOLDS1      VARCHAR2(20),
  EXT_HOLDS2      VARCHAR2(20),
  EXT_HOLDS3      VARCHAR2(64),
  EQUIP_TYPE      NUMBER(6) default 0,
  REGION_CODE     NUMBER(4) default 0,
  COUNTY_CODE     NUMBER(4),
  ORG_ID          NUMBER(8),
  IS_SPECIAL      NUMBER(1),
  UNIT            VARCHAR2(20),
  EXT_HOLDS4      VARCHAR2(512),
  EXT_HOLDS5      VARCHAR2(512),
  EXT_HOLDS6      VARCHAR2(512)
)
;

prompt
prompt Creating table TS_DISTRICT
prompt ==========================
prompt
create table TS_DISTRICT
(
  DISTRICT_ID     NUMBER(11) not null,
  TS_DISTRICT_ID  NUMBER(11),
  DISTRICT_CODE   VARCHAR2(18) not null,
  DISTRICT_NAME   VARCHAR2(200),
  DISTRICT_LETTER VARCHAR2(10),
  AREA            NUMBER(2)
)
;
comment on column TS_DISTRICT.DISTRICT_ID
  is '地域ID';
comment on column TS_DISTRICT.TS_DISTRICT_ID
  is '地域ID';
comment on column TS_DISTRICT.DISTRICT_CODE
  is '地域编码：6位，参考国标GB2206-2007';
comment on column TS_DISTRICT.DISTRICT_NAME
  is '地域名称';
comment on column TS_DISTRICT.DISTRICT_LETTER
  is '字母码';
comment on column TS_DISTRICT.AREA
  is '所属区域：1、华北地区；2、华东地区；3、华南地区；4、华中地区；5、东北地区；6、西北地区；7、西南地区；';
alter table TS_DISTRICT
  add constraint PK_TS_DISTRICT primary key (DISTRICT_ID);

prompt
prompt Creating table TS_PTL_USER
prompt ==========================
prompt
create table TS_PTL_USER
(
  PTL_USER_ID      NUMBER(11) not null,
  USERNAME         VARCHAR2(100),
  GENDER           NUMBER(1),
  PASSWORD         VARCHAR2(40),
  NICKNAME         VARCHAR2(80),
  REAL_NAME        VARCHAR2(80),
  PHONE            VARCHAR2(100),
  RESI_PROV        VARCHAR2(40),
  RESI_CITY        VARCHAR2(40),
  RESI_DIST        VARCHAR2(40),
  ADDR             VARCHAR2(400),
  ZIP_CODE         NUMBER(6),
  LOGIN_TIME       TIMESTAMP(6),
  STATUS           NUMBER(1),
  EMAIL            VARCHAR2(100),
  GROUP_ID         NUMBER(11),
  BIRTHDAY         VARCHAR2(20),
  QQ_NUM           VARCHAR2(20),
  MSN_NUM          VARCHAR2(50),
  CELLPHONE        VARCHAR2(20),
  INTRO_INFO       VARCHAR2(1500),
  LOGIN_COUNT      NUMBER(11),
  REGISTER_TIME    TIMESTAMP(6),
  IS_MOBILE_CLIENT NUMBER(1)
)
;
alter table TS_PTL_USER
  add constraint PK_TS_PTL_USER primary key (PTL_USER_ID);

prompt
prompt Creating table TS_ROLE
prompt ======================
prompt
create table TS_ROLE
(
  ROLE_ID   NUMBER(11) not null,
  ROLE_NAME VARCHAR2(100),
  PRIORITY  NUMBER(11),
  IS_SUPER  VARCHAR2(1),
  ROLE_NOTE VARCHAR2(200),
  STATUS    NUMBER(1)
)
;
alter table TS_ROLE
  add constraint PK_TS_ROLE primary key (ROLE_ID);

prompt
prompt Creating table TS_USER
prompt ======================
prompt
create table TS_USER
(
  USER_ID         NUMBER(11) not null,
  USERNAME        VARCHAR2(100),
  PASSWORD        VARCHAR2(100),
  FULLNAME        VARCHAR2(100),
  GENDER          NUMBER(1),
  EMAIL           VARCHAR2(100),
  STATUS          NUMBER(1),
  REGISTER_TIME   TIMESTAMP(6),
  REGISTER_IP     VARCHAR2(50),
  LAST_LOGIN_TIME TIMESTAMP(6),
  LAST_LOGIN_IP   VARCHAR2(50),
  LOGIN_COUNT     NUMBER(11),
  IS_ADMIN        NUMBER(1)
)
;
alter table TS_USER
  add constraint PK_TS_USER primary key (USER_ID);

prompt
prompt Creating table TS_USERROLE
prompt ==========================
prompt
create table TS_USERROLE
(
  USER_ID NUMBER(11) not null,
  ROLE_ID NUMBER(11) not null
)
;
alter table TS_USERROLE
  add constraint PK_TS_USERROLE primary key (USER_ID, ROLE_ID);

prompt
prompt Creating sequence SEQADLOCATIONID
prompt =================================
prompt
create sequence SEQADLOCATIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQADVERTISEMENTID
prompt ====================================
prompt
create sequence SEQADVERTISEMENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBACKLANDLOGID
prompt ==================================
prompt
create sequence SEQBACKLANDLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3220
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBACKLOGID
prompt ==============================
prompt
create sequence SEQBACKLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQBRANDID
prompt ============================
prompt
create sequence SEQBRANDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCARTSKUID
prompt ==============================
prompt
create sequence SEQCARTSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCATID
prompt ==========================
prompt
create sequence SEQCATID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCHANNELID
prompt ==============================
prompt
create sequence SEQCHANNELID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONSOLELOGID
prompt =================================
prompt
create sequence SEQCONSOLELOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3240
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONSTRID
prompt =============================
prompt
create sequence SEQCONSTRID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTHISID
prompt =================================
prompt
create sequence SEQCONTENTHISID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTID
prompt ==============================
prompt
create sequence SEQCONTENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTSHAREID
prompt ===================================
prompt
create sequence SEQCONTENTSHAREID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTTAGID
prompt =================================
prompt
create sequence SEQCONTENTTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCONTENTTYPEID
prompt ==================================
prompt
create sequence SEQCONTENTTYPEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCRMITFLOGID
prompt ================================
prompt
create sequence SEQCRMITFLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQCSID
prompt =========================
prompt
create sequence SEQCSID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQDISCOUNTID
prompt ===============================
prompt
create sequence SEQDISCOUNTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQDISTRIID
prompt =============================
prompt
create sequence SEQDISTRIID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBADLOCATIONID
prompt ===================================
prompt
create sequence SEQEBADLOCATIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBADVERTISEMENTID
prompt ======================================
prompt
create sequence SEQEBADVERTISEMENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBCITYGROUPON
prompt ==================================
prompt
create sequence SEQEBCITYGROUPON
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBRECOMMITEMID
prompt ===================================
prompt
create sequence SEQEBRECOMMITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQEBSIMCARDPROCESSLOGID
prompt ==========================================
prompt
create sequence SEQEBSIMCARDPROCESSLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQFEATUREID
prompt ==============================
prompt
create sequence SEQFEATUREID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQGROUPONID
prompt ==============================
prompt
create sequence SEQGROUPONID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQHELPTIPID
prompt ==============================
prompt
create sequence SEQHELPTIPID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQINVOICEID
prompt ==============================
prompt
create sequence SEQINVOICEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQITEMID
prompt ===========================
prompt
create sequence SEQITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQITEMNO
prompt ===========================
prompt
create sequence SEQITEMNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQKEYWORDSID
prompt ===============================
prompt
create sequence SEQKEYWORDSID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMAILID
prompt ===========================
prompt
create sequence SEQMAILID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMEMBERGROUPID
prompt ==================================
prompt
create sequence SEQMEMBERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMEMBERID
prompt =============================
prompt
create sequence SEQMEMBERID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMESSAGEID
prompt ==============================
prompt
create sequence SEQMESSAGEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMESSAGETYPEID
prompt ==================================
prompt
create sequence SEQMESSAGETYPEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMODELID
prompt ============================
prompt
create sequence SEQMODELID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMODELITEMID
prompt ================================
prompt
create sequence SEQMODELITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 400
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMYFAVID
prompt ============================
prompt
create sequence SEQMYFAVID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQMYFAVSKUID
prompt ===============================
prompt
create sequence SEQMYFAVSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERGROUPID
prompt =================================
prompt
create sequence SEQOFFERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERID
prompt ============================
prompt
create sequence SEQOFFERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOFFERNO
prompt ============================
prompt
create sequence SEQOFFERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQOLBANKID
prompt =============================
prompt
create sequence SEQOLBANKID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERDETAILID
prompt ==================================
prompt
create sequence SEQORDERDETAILID
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDEREXEC
prompt ==============================
prompt
create sequence SEQORDEREXEC
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERID
prompt ============================
prompt
create sequence SEQORDERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERITEMID
prompt ================================
prompt
create sequence SEQORDERITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERLOGID
prompt ===============================
prompt
create sequence SEQORDERLOGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERNO
prompt ============================
prompt
create sequence SEQORDERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 3100
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERREMINDLOG
prompt ===================================
prompt
create sequence SEQORDERREMINDLOG
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERREMINDPHONE
prompt =====================================
prompt
create sequence SEQORDERREMINDPHONE
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQORDERSHIPADDRID
prompt ====================================
prompt
create sequence SEQORDERSHIPADDRID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPARAVALUEID
prompt ================================
prompt
create sequence SEQPARAVALUEID
minvalue 1
maxvalue 999999999999999999999999999
start with 6080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKDIFFID
prompt ===================================
prompt
create sequence SEQPAYCHECKDIFFID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKID
prompt ===============================
prompt
create sequence SEQPAYCHECKID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYCHECKTOTALID
prompt ====================================
prompt
create sequence SEQPAYCHECKTOTALID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPAYRECORDID
prompt ================================
prompt
create sequence SEQPAYRECORDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3120
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPEMISSIONID
prompt ================================
prompt
create sequence SEQPEMISSIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 200
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPERMID
prompt ===========================
prompt
create sequence SEQPERMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPOID
prompt =========================
prompt
create sequence SEQPOID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPREDEPLOYID
prompt ================================
prompt
create sequence SEQPREDEPLOYID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPTLUSERID
prompt ==============================
prompt
create sequence SEQPTLUSERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3120
increment by 1
cache 20;

prompt
prompt Creating sequence SEQPWID
prompt =========================
prompt
create sequence SEQPWID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQREGIONID
prompt =============================
prompt
create sequence SEQREGIONID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQRESOURCEID
prompt ===============================
prompt
create sequence SEQRESOURCEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQRETEXCID
prompt =============================
prompt
create sequence SEQRETEXCID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQROLEID
prompt ===========================
prompt
create sequence SEQROLEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSECKILLID
prompt ==============================
prompt
create sequence SEQSECKILLID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSECKILLQUAID
prompt =================================
prompt
create sequence SEQSECKILLQUAID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSENSITIVEID
prompt ================================
prompt
create sequence SEQSENSITIVEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSHIPADDRID
prompt ===============================
prompt
create sequence SEQSHIPADDRID
minvalue 1
maxvalue 999999999999999999999999999
start with 20080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDBRANDID
prompt ===================================
prompt
create sequence SEQSIMCARDBRANDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDBRANDPACKAGERELID
prompt =============================================
prompt
create sequence SEQSIMCARDBRANDPACKAGERELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDDESCID
prompt ==================================
prompt
create sequence SEQSIMCARDDESCID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDID
prompt ==============================
prompt
create sequence SEQSIMCARDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDLABELID
prompt ===================================
prompt
create sequence SEQSIMCARDLABELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDLABELRELID
prompt ======================================
prompt
create sequence SEQSIMCARDLABELRELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDPACKAGEID
prompt =====================================
prompt
create sequence SEQSIMCARDPACKAGEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDPACKAGERELID
prompt ========================================
prompt
create sequence SEQSIMCARDPACKAGERELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDSUITID
prompt ==================================
prompt
create sequence SEQSIMCARDSUITID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMCARDSUITRELID
prompt =====================================
prompt
create sequence SEQSIMCARDSUITRELID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMIDCARD
prompt ==============================
prompt
create sequence SEQSIMIDCARD
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSIMIDCARDID
prompt ================================
prompt
create sequence SEQSIMIDCARDID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUFREEID
prompt ==============================
prompt
create sequence SEQSKUFREEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUID
prompt ==========================
prompt
create sequence SEQSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSKUOFFERID
prompt ===============================
prompt
create sequence SEQSKUOFFERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSLOTID
prompt ===========================
prompt
create sequence SEQSLOTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSLOTSKUID
prompt ==============================
prompt
create sequence SEQSLOTSKUID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSPECVALUEID
prompt ================================
prompt
create sequence SEQSPECVALUEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3080
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITID
prompt ===========================
prompt
create sequence SEQSUITID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITITEMID
prompt ===============================
prompt
create sequence SEQSUITITEMID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUITVASID
prompt ==============================
prompt
create sequence SEQSUITVASID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQSUPPLIERID
prompt ===============================
prompt
create sequence SEQSUPPLIERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTAGID
prompt ==========================
prompt
create sequence SEQTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTAGIMGID
prompt =============================
prompt
create sequence SEQTAGIMGID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICCONTENTID
prompt ===================================
prompt
create sequence SEQTOPICCONTENTID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICID
prompt ============================
prompt
create sequence SEQTOPICID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTOPICTAGID
prompt ===============================
prompt
create sequence SEQTOPICTAGID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLCATID
prompt =============================
prompt
create sequence SEQTPLCATID
minvalue 1
maxvalue 999999999999999999999999999
start with 3020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLCHLSERIAL
prompt =================================
prompt
create sequence SEQTPLCHLSERIAL
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLDEPLOY
prompt ==============================
prompt
create sequence SEQTPLDEPLOY
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLID
prompt ==========================
prompt
create sequence SEQTPLID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLOFFERGROUPID
prompt ====================================
prompt
create sequence SEQTPLOFFERGROUPID
minvalue 1
maxvalue 999999999999999999999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQTPLTOPICID
prompt ===============================
prompt
create sequence SEQTPLTOPICID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQUSERID
prompt ===========================
prompt
create sequence SEQUSERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTID
prompt ===============================
prompt
create sequence SEQ_PRODUCTID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLEID
prompt ============================
prompt
create sequence SEQ_ROLEID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERID
prompt ============================
prompt
create sequence SEQ_USERID
minvalue 1
maxvalue 999999999999999999999999999
start with 3000
increment by 1
cache 20;

prompt
prompt Creating view EB_V_ITEMPRICEVIEW
prompt ================================
prompt
create or replace view eb_v_itempriceview as
select item_id,min(sku_price) as minSkuPrice,max(sku_price) as maxSkuPrice,min(market_price) as minMarketPrice,max(market_price) as maxMarketPrice from eb_sku
where show_status=0 and sku_type=1
group by item_id
/

prompt
prompt Creating function SQUIRREL_GET_ERROR_OFFSET
prompt ===========================================
prompt
create or replace function SQUIRREL_GET_ERROR_OFFSET (query IN varchar2) return number authid current_user is      l_theCursor     integer default dbms_sql.open_cursor;      l_status        integer; begin          begin          dbms_sql.parse(  l_theCursor, query, dbms_sql.native );          exception                  when others then l_status := dbms_sql.last_error_position;          end;          dbms_sql.close_cursor( l_theCursor );          return l_status; end;
/

prompt
prompt Creating trigger EB_JBPM_EXECTION_TRIGGER
prompt =========================================
prompt
create or replace trigger eb_jbpm_exection_trigger
after insert  on jbpm4_execution
for each row
declare
a varchar2(200);
b number;
c number;
d number;
begin
if :new.superexec_ is null
then update Eb_Order_Execution e11 set e11.execution =:new.id_ , e11.is_now =1 where e11.execution_id =:new.dbid_;
else
/*
如果是第一次进入子流程，这insert，第二次则update
*/
select max(order_num) into a from eb_order_execution  where execution_id=:new.superexec_;
select count(1) into b from eb_order_execution  where substr(execution,1,instr(execution,'.')) = substr(:new.id_,1,instr(:new.id_,'.')) and execution_id =:new.superexec_;
select SEQORDEREXEC.NEXTVAL into c from dual;
if b=0
then
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =:new.superexec_;
insert into Eb_Order_Execution values(c,a,:new.superexec_,:new.id_,1);
else
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =:new.superexec_;
update Eb_Order_Execution  set execution=:new.id_,IS_NOW =1
where substr(execution,1,instr(execution,'.')) = substr(:new.id_,1,instr(:new.id_,'.'))
     and execution_id =:new.superexec_;
end if;
end if;
end;
/

prompt
prompt Creating trigger EB_JBPM_TASK_TRIGGER
prompt =====================================
prompt
create or replace trigger eb_jbpm_task_trigger
after insert  on jbpm4_task
for each row
declare
a varchar2(200);
d number;
begin
select   substr(:new.execution_id_ ,1,instr(:new.execution_id_,'.')) into a from dual;
if a ='ailk.'
then
select e.execution_id into d from Eb_Order_Execution e where e.execution = :new.execution_id_;
update Eb_Order_Execution e11 set e11.is_now =0 where e11.execution_id =d;
update Eb_Order_Execution e11 set e11.is_now =1 where e11.execution = :new.execution_id_;
end if;
end;
/


spool off
