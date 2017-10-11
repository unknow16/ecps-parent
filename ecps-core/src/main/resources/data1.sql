insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (3004, '1', null, '/upload/ecps/resource/1369725378114129798088.jpg', null, 1);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1000, '波导', null, '/upload/ecps/resource/1351478761609141540735.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1001, '华为', null, '/upload/ecps/resource/1351478918676104978608.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1002, '联想', null, '/upload/ecps/resource/1351479001579109452339.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1003, '三星', null, '/upload/ecps/resource/1351479108778166100728.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1004, '中兴', null, '/upload/ecps/resource/1351479208124190223249.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1005, '天语', null, '/upload/ecps/resource/1351479330326136850862.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1006, '天迈', null, '/upload/ecps/resource/1351479515808106398938.JPG', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1007, '酷派', null, '/upload/ecps/resource/1351479601015179106601.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1008, '海信', null, '/upload/ecps/resource/1351479849306158394130.JPG', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1009, '金立', null, '/upload/ecps/resource/1351479925467102309116.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1010, '摩托罗拉', null, '/upload/ecps/resource/1351480012446191380436.jpg', null, null);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1041, '步步高', null, '/upload/ecps/resource/1365321997034103071485.jpg', null, 1);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1042, '诺基亚', null, '/upload/ecps/resource/1365322032346400053300226.jpg', null, 1);
insert into EB_BRAND (BRAND_ID, BRAND_NAME, BRAND_DESC, IMGS, WEBSITE, BRAND_SORT)
values (1043, 'HTC', null, '/upload/ecps/resource/1369885015046118179024.jpg', null, null);


insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1000);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1001);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1002);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1003);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1004);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1005);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1006);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1007);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1008);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1009);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1010);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1041);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1042);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (1, 1043);
insert into EB_CATBRAND (CAT_ID, BRAND_ID)
values (3000, 1043);

insert into EB_CAT (CAT_ID, CAT_NAME, CAT_DESC, PARENT_ID, CAT_SORT, KEYWORDS, PATH, MARK, ISDISPLAY, FULL_PATH, CAT_TYPE)
values (3000, '手机通讯子类', '手机通讯描述', 1, 3, '手机通讯关键词', '3', '3', 1, '/1/3000/', 1);
insert into EB_CAT (CAT_ID, CAT_NAME, CAT_DESC, PARENT_ID, CAT_SORT, KEYWORDS, PATH, MARK, ISDISPLAY, FULL_PATH, CAT_TYPE)
values (1, '手机通讯', '是', 0, 2, '啊', 'SJTX', 'SJTX', 1, '/1/', 1);

insert into EB_ITEM (item_id, item_name, item_no, brand_id, cat_id, tag_img_id, tag_img, is_new, is_good, is_hot, promotion, audit_status, show_status, imgs, keywords, page_desc, item_recycle, on_sale_time, check_time, update_time, update_user_id, create_time, checker_user_id, full_path_deploy, full_path_deploy_offer, original_item_id, last_status, merchant_id, item_sort, sales, create_user_id, sim_level, gift_desc, gift_img, gift_show_type, img_size1)
values (4239, '小米3', '20150308153242174', 3819, 1, null, null, 1, 1, 1, '配置非常非常高', 1, 0, '/image/20150308153050009097.jpg', '配置非常非常高', '配置非常非常高', null, null, null, to_timestamp('08-03-2015 15:32:53.738000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, to_timestamp('08-03-2015 15:32:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, 0, null, null, null, null, null, null);

insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7770, 4239, 2020, 'Android4.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7771, 4239, 2044, '32GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7772, 4239, 2045, '768MB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7773, 4239, 2060, '可支持32GB以上');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7774, 4239, 2061, '5英寸');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7775, 4239, 2080, '480×854像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7776, 4239, 2142, 'HD Super AMOLED ');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7777, 4239, 2143, '单卡双模');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7778, 4239, 2040, '直板');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7779, 4239, 2041, '标准键盘');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7780, 4239, 2063, '1600万色');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7781, 4239, 2081, '高通骁龙S4');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7782, 4239, 2100, '锂电池（1650mAh）');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7783, 4239, 2101, '2013年');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7784, 4239, 2140, '3G手机,智能手机,商务手机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7785, 4239, 2141, '电容屏,多点触控 ');

insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4228, 4239, null, 2299, 0, 18, null, null, null, null, null, 2500, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4229, 4239, null, 2899, 0, 100, null, null, null, null, null, 3000, null, null, null, null, null, null, null, 1, null, null, null);

insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4252, 4228, 3061, '32G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4253, 4228, 3080, '白色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4254, 4229, 3061, '64G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4255, 4229, 3080, '白色');

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