create table EB_FEATURE
(
  feature_id    NUMBER(11) not null,
  cat_id        NUMBER(11),
  feature_name  VARCHAR2(80) not null,
  is_spec       NUMBER(1),
  is_select     NUMBER(1),
  is_show       NUMBER(1),
  select_values VARCHAR2(800),
  input_type    NUMBER(2),
  feature_sort  NUMBER(5)
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
comment on column EB_FEATURE.feature_id
  is '商品属性主键';
comment on column EB_FEATURE.feature_name
  is '属性名称';
comment on column EB_FEATURE.is_spec
  is '是否为规格：0.为否 1.为是';
comment on column EB_FEATURE.is_select
  is '是否为筛选：0为否 1为是';
comment on column EB_FEATURE.is_show
  is '是否前台显示：0.为否 1.为是';
comment on column EB_FEATURE.select_values
  is '属性可选值：用英文逗号分割的可选值，可选值里不许有逗号';
comment on column EB_FEATURE.input_type
  is '录入方式：1.树状菜单，2.单选，3.复选，4.文本框';
comment on column EB_FEATURE.feature_sort
  is '前台显示排序';
alter table EB_FEATURE
  add constraint PK_EB_FEATURE primary key (FEATURE_ID);

prompt Loading EB_FEATURE...
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3061, 1, '内存', 1, 0, 1, '16G,32G,64G', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3080, 1, '颜色', 1, 0, 1, '黑色,白色,土豪金', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3121, 1, '手机颜色', 0, 1, 1, '蓝色,绿色', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3101, 1, '像素', 0, 1, 1, '1024,768,1380', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2145, 1, '手机尺寸', 0, 0, 1, '151.1x80.5x9.4mm', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2146, 1, '手机重量', 0, 0, 1, '180g ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2147, 1, '其他特性', 0, 0, 1, '大容量电池,NFC功能', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2148, 1, '用户界面', 0, 0, 1, 'Touch Wiz 5.0', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2149, 1, 'CPU频率', 0, 0, 1, '1638MHz ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2150, 1, 'SIM卡类型', 0, 0, 1, 'Micro SIM卡', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2151, 1, '电池类型', 0, 0, 1, '可拆卸式电池', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2152, 1, '输入法', 0, 0, 1, '中文输入法,英文输入法,第三方输入法', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2153, 1, '输入方式', 0, 0, 1, '手写', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2154, 1, '通话记录', 0, 0, 1, '已接+已拨+未接电话', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2020, 1, '操作系统', 0, 1, 1, 'Windows8,Android2.3,Android4.0,Android4.1,Android2.3.5,Android,IOS,Windows Mobile,Symbian,其他', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2160, 1, 'GPS导航', 0, 0, 1, '内置GPS,支持A-GPS', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2161, 1, '感应器类型', 0, 0, 1, '重力感应器,加速传感器,光线传感器,距离传感器', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2162, 1, '摄像头类型', 0, 0, 1, '双摄像头(前后)', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2163, 1, '前置摄像头像素', 0, 0, 1, '190万像素', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2164, 1, '后置摄像头像素', 0, 0, 1, '800万像素', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2165, 1, '闪光灯', 0, 0, 1, 'LED补光灯', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2166, 1, '自动对焦', 0, 0, 1, '支持', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2167, 1, '通讯录', 0, 0, 1, '名片式存储', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2168, 1, '地图软件', 0, 0, 1, '支持3D地图', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2169, 1, '电子罗盘', 0, 0, 1, '支持数字罗盘', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2170, 1, '摄像头', 0, 0, 1, '内置', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2171, 1, '传感器类型', 0, 0, 1, 'CMOS', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2172, 1, '图像尺寸', 0, 0, 1, '最大支持3264×2448像素照片拍摄', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2173, 1, '视频拍摄', 0, 0, 1, '1080p视频录制(1920×1080,30帧/秒)', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2174, 1, '视频播放', 0, 0, 1, '3GP,MP4,WMV,ASF,AVI,FLV,MKV,WebM', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2175, 1, '音频播放', 0, 0, 1, 'MP3,OGG,WMA,AAC,ACC+,eAAC+,AMR(NB,WB),MIDI,WAV,AC-3,Flac', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2176, 1, '图形格式', 0, 0, 1, '支持JPEG等格式', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2177, 1, '收音机', 0, 0, 1, '支持RDS功能的FM收音机', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2178, 1, '游戏', 0, 0, 1, '内置游戏,支持下载', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2179, 1, '社交应用', 0, 0, 1, '内置QQ,MSN,人人网,开心网,新浪微博,QQ空间', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2180, 1, '应用特点', 0, 0, 1, 'WikiAR,淘宝,腾讯新闻', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2181, 1, '服务特色', 0, 0, 1, '社交圈,影视圈,悦读圈,音乐圈,S Pen程序,S Planner,S Memo ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2182, 1, '蓝牙传输', 0, 0, 1, '支持蓝牙4.0+EDR+A2DP ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2183, 1, 'WLAN功能', 0, 0, 1, 'WIFI,IEEE 802.11 a/n/b/g', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2184, 1, '数据接口', 0, 0, 1, 'USB v2.0,支持USB OTG功能,TV-OUT ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2185, 1, '耳机插孔', 0, 0, 1, '3.5mm', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2042, 1, 'CPU核心数', 0, 1, 1, '单核,双核,四核', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2043, 1, '网络支持', 0, 0, 1, 'WCDMA,TD-HSDPA,GSM,TD-SCDMA,GPRS,EDGE', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2044, 1, '机身内存ROM', 0, 0, 1, '32GB,8GB,53.9MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB,16G', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2045, 1, '运行内存RAM', 0, 1, 1, '768MB,2471KB,256MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2060, 1, '存储扩展', 0, 0, 1, '可支持32GB以上,无,最高可支持64GB mircoSD,最大支持32GB MicroSD扩展卡,支持,最大支持16GB MicroSD扩展卡', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2061, 1, '屏幕尺寸', 0, 1, 1, '4.65英寸,5英寸,5.5英寸,4.8英寸,4.5英寸,4.3英寸,4.0英寸,3.7英寸,3.75英寸,3.5英寸,3.14英寸,2.8英寸,2.4英寸,2.2英寸,1.8英寸', 1, 3);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2062, 1, '网络频率', 0, 0, 1, 'TD-HSPA 1880-1920,TD-HSPA 2010-2025,WCDMA,GPRS 900/1800/1900,TD-HSDPA 1880/2010,EDGE 850/900/1900,GSM 850/900/1900,TD-SCDMA1900/2100,TDSCDMA 1900/2000MHz,HSDPA 1900/2000MHz,HSUPA 1900/2000MHz,2G 900/1800/1900MHz,WCDMA (900/2100MHz) ,EDGE900/1800/1900MHz,TD 1880/2010,2100MHz,GSM 900/1800/1900,TD-SCDMA 2010-2025,GSM 900/1800,GSM900/1800MHZ,TD-SCDMA 1880-1920', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2080, 1, '主屏分辨率', 0, 0, 1, '720×1200,940x540像素,480×854像素,1280×720像素,960×540像素,480×800像素,176×220像素,128×160像素,240×320像素,320×480像素', 1, 2);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2142, 1, '主屏材质', 0, 0, 1, 'HD Super AMOLED ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2143, 1, '网络类型', 0, 0, 1, '单卡双模', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2144, 1, '理论速率', 0, 0, 1, 'HSDPA：21Mbps,HSUPA：5.76Mbps ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2040, 1, '外观设计', 0, 1, 1, '直板,翻盖,滑盖,侧滑盖', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2041, 1, '操作方式', 0, 0, 1, '标准键盘,触摸屏,全键盘', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2063, 1, '屏幕色彩', 0, 1, 1, '1600万色,26万色,65536色', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2081, 1, 'CPU型号', 0, 0, 1, '高通骁龙S4,双核Tiger ,MTK MT6517A,联发科 MT6589,联发科 MT6517,展讯SC8810T 1GHz,Exynos 4412,高通MSM7627T,88PM8607,MARVELL 920H,88CP920,Marvell920,PXA920,ST-Ericsson 9500,MSM 7627T', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2100, 1, '电池容量', 0, 0, 1, '锂电池（1300mAh）,锂电池（1730mAh）,锂电池（1650mAh）,锂电池（1600mAh）,锂电池（1800mAh）,锂电池（2000mAh）,锂电池（1700mAh）,锂电池（1500mAh）,锂电池（2100mAh）,锂电池（3100mAh）,锂离子电池,锂电池（800mAh）,锂电池', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2101, 1, '上市时间', 0, 1, 1, '2010年,2011年01月,2011年12月,2011年,2012年,2013年', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2140, 1, '手机类型', 0, 0, 1, '无,3G手机,智能手机,商务手机,拍照手机,平板手机', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2141, 1, '触摸屏', 0, 1, 1, '电容屏,多点触控 ', 3, 1);
commit;