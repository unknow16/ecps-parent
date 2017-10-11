-- 创建数据表空间
create tablespace gx1110 
logging
datafile 'C:\oraclexe\app\oracle\oradata\XE\gx1020.dbf'
size 32m
autoextend on 
next 32m maxsize 2048m
extend management local;

-- 创建用户表空间
--1.创建临时表空间


-- drop tablespace bhz_temp including contents and datafiles;

--2.创建表空间
create tablespace bhz 
datafile '/opt/oracle/oradata/orcl/bhz_01_20170910.dbf'
size 200m autoextend on next 100m maxsize 400m; 

-- drop tablespace bhz including contents and datafiles;
-- alter tablespace bhz add datafile '/opt/oracle/oradata/orcl/bhz_02_20170910.dbf' size 200m autoextend on;

--3.创建用户并指定表空间
create user bhz identified by bhz default tablespace bhz temporary tablespace bhz_temp;

--4.赋权
grant dba to bhz;


-- 品牌表
CREATE TABLE `eb_brand` (
  `brand_id` decimal(20,0) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_desc` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `brand_sort` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 品牌表
-- 类目表
CREATE TABLE EB_CAT (
	CAT_ID INTEGER (11) NOT NULL,
	CAT_NAME VARCHAR (80) NOT NULL,
	CAT_DESC VARCHAR (80),
	PARENT_ID INTEGER (11) DEFAULT 0,
	CAT_SORT INTEGER (5),
	KEYWORDS VARCHAR (80),
	PATH VARCHAR (200),
	MARK VARCHAR (80),
	ISDISPLAY INTEGER (5),
	FULL_PATH VARCHAR (200),
	CAT_TYPE INTEGER (5)
);

ALTER TABLE EB_CAT ADD CONSTRAINT PK_EB_CAT PRIMARY KEY (CAT_ID);

-- 类目品牌表
CREATE TABLE EB_CATBRAND (
	CAT_ID INTEGER (11) NOT NULL,
	BRAND_ID INTEGER (11) NOT NULL
);

ALTER TABLE EB_CATBRAND ADD CONSTRAINT PK_EB_CATBRAND PRIMARY KEY (CAT_ID, BRAND_ID);

-- 商品表
CREATE TABLE EB_ITEM (
	ITEM_ID INTEGER (11) NOT NULL,
	ITEM_NAME VARCHAR (400) NOT NULL,
	ITEM_NO VARCHAR (120) NOT NULL,
	BRAND_ID INTEGER (11),
	CAT_ID INTEGER (11) NOT NULL,
	TAG_IMG_ID INTEGER (11),
	TAG_IMG INTEGER (1),
	IS_NEW INTEGER (1),
	IS_GOOD INTEGER (1),
	IS_HOT INTEGER (1),
	PROMOTION VARCHAR (200),
	AUDIT_STATUS INTEGER (2),
	SHOW_STATUS INTEGER (2),
	IMGS VARCHAR (3000),
	KEYWORDS VARCHAR (120),
	PAGE_DESC VARCHAR (640),
	ITEM_RECYCLE INTEGER (2) DEFAULT 0,
	ON_SALE_TIME TIMESTAMP (6),
	CHECK_TIME TIMESTAMP (6),
	UPDATE_TIME TIMESTAMP (6),
	UPDATE_USER_ID INTEGER (11),
	CREATE_TIME TIMESTAMP (6),
	CHECKER_USER_ID INTEGER (11),
	FULL_PATH_DEPLOY VARCHAR (600),
	FULL_PATH_DEPLOY_OFFER VARCHAR (600),
	ORIGINAL_ITEM_ID INTEGER (11),
	LAST_STATUS INTEGER (1),
	MERCHANT_ID INTEGER (11),
	ITEM_SORT INTEGER (10),
	SALES INTEGER (10),
	CREATE_USER_ID INTEGER (11),
	SIM_LEVEL INTEGER (1),
	GIFT_DESC VARCHAR (200),
	GIFT_IMG VARCHAR (600),
	GIFT_SHOW_TYPE VARCHAR (100),
	IMG_SIZE1 VARCHAR (1000)
);

ALTER TABLE EB_ITEM ADD CONSTRAINT PK_EB_ITEM PRIMARY KEY (ITEM_ID);

-- 类目属性表
CREATE TABLE EB_FEATURE (
	FEATURE_ID INTEGER (11) NOT NULL,
	CAT_ID INTEGER (11),
	FEATURE_NAME VARCHAR (80) NOT NULL,
	IS_SPEC INTEGER (1),
	IS_SELECT INTEGER (1),
	IS_SHOW INTEGER (1),
	SELECT_VALUES VARCHAR (800),
	INPUT_TYPE INTEGER (2),
	FEATURE_SORT INTEGER (5)
);

ALTER TABLE EB_FEATURE ADD CONSTRAINT PK_EB_FEATURE PRIMARY KEY (FEATURE_ID);

-- COMMENT ON TABLE EB_FEATURE IS '商品属性
-- 预置的手机参数（请将预置可选值补充完整）
-- 1.      型号                   字符串
-- 2.      外观                   下拉列表；预置可选值：直板、翻盖、滑盖、旋盖
-- 3.      操作系统                   下拉列表；预置可选值：Symbian、WindowsMobile、Android, iOS、其他智能系统、非智能系统
-- 4.      操作方式                   下拉列表；预置可选值：电容触屏、电阻触屏、全键盘、标准键盘
-- 5.      内存                   字符串
-- 6.      储存卡              字符串
-- 7.      屏幕分辨率              字符串
-- 8.      摄像头              字符串
-- 9.      连接方式                   复选框；预置可选值： WIFI、蓝牙、红外，默认都不勾选
-- 10.   机身尺寸                   字符串
-- 11.   重量                   字符串     默认以KG为单位
-- 12.   特性                   字符串
-- 预置的手机规格（请将预置可选值补充完整）
-- 1.      颜色                   下拉列表；预置可选值：白色、黑色
-- 2.      存储量              下拉列表；预置可选值：16G、32G
-- 预置的号卡参数
-- 1. 号段
-- 2. 号码规律，可选值：AAAA、ABCDE、AAA、ABCD、ABCABC、ABABAB、AABB
-- 3. 其他条件，可选值：含一个8、含两个8、不含4、含1314、含520、含00
-- ';
-- COMMENT ON COLUMN EB_FEATURE.FEATURE_ID IS '商品属性主键';
-- COMMENT ON COLUMN EB_FEATURE.FEATURE_NAME IS '属性名称';
-- COMMENT ON COLUMN EB_FEATURE.IS_SPEC IS '是否为规格：0.为否 1.为是';
-- COMMENT ON COLUMN EB_FEATURE.IS_SELECT IS '是否为筛选：0为否 1为是';
-- COMMENT ON COLUMN EB_FEATURE.IS_SHOW IS '是否前台显示：0.为否 1.为是';
-- COMMENT ON COLUMN EB_FEATURE.SELECT_VALUES IS '属性可选值：用英文逗号分割的可选值，可选值里不许有逗号';
-- COMMENT ON COLUMN EB_FEATURE.INPUT_TYPE IS '录入方式：1.树状菜单，2.单选，3.复选，4.文本框';
-- COMMENT ON COLUMN EB_FEATURE.FEATURE_SORT IS '前台显示排序';


-- 商品属性值表
CREATE TABLE EB_PARA_VALUE (
	PARA_ID INTEGER (11) NOT NULL,
	ITEM_ID INTEGER (11) NOT NULL,
	FEATURE_ID INTEGER (11) NOT NULL,
	PARA_VALUE VARCHAR (100) NOT NULL
);

-- COMMENT ON TABLE EB_PARA_VALUE IS '参数值（与价格无关）';
-- COMMENT ON COLUMN EB_PARA_VALUE.PARA_ID IS '参数值主键';
-- COMMENT ON COLUMN EB_PARA_VALUE.PARA_VALUE IS '参数值';

ALTER TABLE EB_PARA_VALUE ADD CONSTRAINT PK_EB_PARA_VALUE PRIMARY KEY (PARA_ID);

-- 最小销售单位表
create table EB_SKU
(
  SKU_ID          INTEGER(11) not null,
  ITEM_ID         INTEGER(11) not null,
  SKU             VARCHAR(80),
  SKU_PRICE       DOUBLE(20,2) not null,
  SHOW_STATUS     INTEGER(2),
  STOCK_INVENTORY INTEGER(5) not null,
  SKU_UPPER_LIMIT INTEGER(5),
  LOCATION        VARCHAR(80),
  SKU_IMG         VARCHAR(80),
  SKU_SORT        INTEGER(5),
  SKU_NAME        VARCHAR(500),
  MARKET_PRICE    DOUBLE(20,2),
  CREATE_TIME     TIMESTAMP(6),
  UPDATE_TIME     TIMESTAMP(6),
  CREATE_USER_ID  INTEGER(11),
  UPDATE_USER_ID  INTEGER(11),
  ORIGINAL_SKU_ID INTEGER(11),
  LAST_STATUS     INTEGER(1),
  MERCHANT_ID     INTEGER(11),
  SKU_TYPE        INTEGER(1),
  SALES           INTEGER(10),
  RES_CODE        VARCHAR(300),
  PACK_ID         INTEGER(8)
)
;
alter table EB_SKU add constraint PK_EB_SKU primary key (SKU_ID);

-- sku规格参数值
create table EB_SPEC_VALUE
(
  SPEC_ID    INTEGER(11) not null,
  SKU_ID     INTEGER(11) not null,
  FEATURE_ID INTEGER(11) not null,
  SPEC_VALUE VARCHAR(100) not null
)
;
alter table EB_SPEC_VALUE add constraint PK_EB_SPEC_VALUE primary key (SPEC_ID);
