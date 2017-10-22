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


-- 品牌表  eb_brand
-- 类目表  eb_cat
-- 类目品牌表 eb_catbrand

-- 后台操作记录表 eb_console_log

-- 商品表 eb_item
-- 最小销售单位表 eb_sku  

-- 商品属性值表  eb_para_value  (添加商品时，保存商品规格参数，与价格无关)
-- sku规格参数值 eb_spec_value (添加商品sku时，保存商品sku的规格参数，与价格有关)
-- 类目属性表  eb_feature （根据类目（分类）后台添加的，添加商品时提供选择商品的属性）

-- 商品属性 eb_feature
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
-- 10.     机身尺寸                   字符串
-- 11.     重量                   字符串     默认以KG为单位
-- 12.     特性                   字符串
-- 预置的手机规格（请将预置可选值补充完整）
-- 1.      颜色                   下拉列表；预置可选值：白色、黑色
-- 2.      存储量              下拉列表；预置可选值：16G、32G

-- COMMENT ON COLUMN EB_FEATURE.FEATURE_ID IS '商品属性主键';
-- COMMENT ON COLUMN EB_FEATURE.FEATURE_NAME IS '属性名称';
-- COMMENT ON COLUMN EB_FEATURE.IS_SPEC IS '是否为规格：0.为否 1.为是';
-- COMMENT ON COLUMN EB_FEATURE.IS_SELECT IS '是否为筛选：0为否 1为是';
-- COMMENT ON COLUMN EB_FEATURE.IS_SHOW IS '是否前台显示：0.为否 1.为是';
-- COMMENT ON COLUMN EB_FEATURE.SELECT_VALUES IS '属性可选值：用英文逗号分割的可选值，可选值里不许有逗号';
-- COMMENT ON COLUMN EB_FEATURE.INPUT_TYPE IS '录入方式：1.树状菜单，2.单选，3.复选，4.文本框';
-- COMMENT ON COLUMN EB_FEATURE.FEATURE_SORT IS '前台显示排序';


